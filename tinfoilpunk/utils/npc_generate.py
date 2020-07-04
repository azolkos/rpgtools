import random
import math
from .npc_compute import compute_stats, compute_armorsp

def generate_npc(level, role, race, npc_id, npc_sheets, data):

    # Generate primary stats
    stat_db = data['STATS']
    stat_vals = {}
    for stat in stat_db:
        d6_1 = random.randint(1, 6)
        d6_2 = random.randint(1, 6)
        while d6_1 + d6_2 >= 11:
            d6_1 = random.randint(1, 6)
            d6_2 = random.randint(1, 6)
        bonus = data['RACEBONUS'].filter(race_id__exact=race, stat_id__exact=stat.id).first()
        stat_vals[stat.id] = d6_1+d6_2 + (bonus.modifier if bonus else 0)
    stat_sum = sum(stat_vals.values())

    # Generate skills
    skill_db = data['CAREER_SKILLS'].filter(role_id__exact=role)
    norm_skills = skill_db.filter(alt__isnull=True)
    alt_skills = skill_db.filter(alt__isnull=False)
    if alt_skills:
        alt_skills = alt_skills.order_by('?')[:alt_skills.first().alt_no]
    skill_db = norm_skills | alt_skills
    skill_vals = {}
    for skill in skill_db:
        skill_vals[skill.skill_id] = random.randint(1, 100)
    count = sum(skill_vals.values())
    for skill, val in skill_vals.items():
        skill_vals[skill] = math.ceil(val / count * 40)
    for skill in skill_db:
        skill_vals[skill.skill_id] = [skill_vals[skill.skill_id], skill.skill.stat_id, skill.skill.info]

    # Generate Weapons
    weapon_db = data['WEAPONS']
    weapon_vals = weapon_db.order_by('?')[:2]

    # Generate Armor
    armor_db_1 = data['ARMOR_HELMET']
    armor_db_2 = data['ARMOR_JACKET']
    armor_db_3 = data['ARMOR_VEST']
    armor_db_4 = data['ARMOR_PANTS']
    armor_vals_1 = armor_db_1.order_by('?').first()
    armor_vals_2 = armor_db_2.order_by('?').first()
    armor_vals_3 = armor_db_3.order_by('?').first()
    armor_vals_4 = armor_db_4.order_by('?').first()

    # Generate tinfoilware
    tinfoilware_vals = data['TINFOILWARE'].order_by('?')[:1]

    # Compute armor sp
    armor_sp = compute_armorsp([armor_vals_1, armor_vals_2, armor_vals_3, armor_vals_4])

    # Generate computed stats
    cstat_vals = compute_stats(stat_vals, data)

    npc_sheets[npc_id] = {
        'level': level,
        'handle': '',
        'role': role,
        'race': race,
        'possessions': '',
        'stat_vals': stat_vals,
        'stat_sum': stat_sum,
        'skill_vals': skill_vals,
        'weapon_vals': weapon_vals,
        'armor_vals': [armor_vals_1, armor_vals_2, armor_vals_3, armor_vals_4],
        'tinfoilware_vals': tinfoilware_vals,
        'armor_sp': armor_sp,
        'cstat_vals': cstat_vals
    }

    return npc_sheets
