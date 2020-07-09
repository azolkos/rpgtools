import random
import math
from .npc_compute import compute_stats, compute_armorsp
from tinfoilpunk.models import Npc, NpcStat, NpcSkill, NpcWeapon, NpcArmor, NpcTinfoilware

def generate_npc(level, role, race, npc_id, npc_sheets, data):

    # Create new NPC
    npc = Npc(handle='New NPC', level=level, race=race, role=role)

    # Generate primary stats
    npc_stats = []
    for stat in data['STATS']:
        value = 0 # tutaj wylosować wartość początkową dla atrybutu
        bonus = data['RACEBONUS'].filter(race_id__exact=race, stat_id=stat).first()
        value += (bonus.modifier if bonus else 0)
        npc_stats.append(NpcStat(npc=npc, stat=stat, value=value))

    # Generate skills
    npc_skills = []
    career_skills = data['CAREER_SKILLS'].filter(role_id__exact=role)
    norm_skills = career_skills.filter(alt__isnull=True)
    alt_skills = career_skills.filter(alt__isnull=False)
    if alt_skills:
        alt_skills = alt_skills.order_by('?')[:alt_skills.first().alt_no]
    career_skills = norm_skills | alt_skills
    for career_skill in career_skills:
        value = 0 # tutaj wylosować wartość początkową dla umiejętności
        npc_skills.append(NpcSkill(npc=npc, skill=career_skill.skill, value=value))

    # Generate weapons
    npc_weapons = []
    for _ in range(3):
        # tutaj wylosować ile chcemy broni i jakie
        weapon = data['WEAPONS'].order_by('?').first() # to losuje jedną dowolną broń
        npc_weapons.append(NpcWeapon(npc=npc, weapon=weapon))

    # Generate armor
    npc_armor = []
    for armor_part in data['ARMOR_PARTS']:
        armor = data['ARMOR'].filter(part_id=armor_part).order_by('?').first() # tutaj wylosowac jakiś materiał dla elementu zbroi lub nic nie dodawać jeśli nie chcemy
        npc_armor.append(NpcArmor(npc=npc, armor=armor))


    # Generate tinfoilware
    npc_tinfoilware = []
    for _ in range(1):
        # tutaj wylosować ile chcemy folii i jakie
        tinfoilware = data['TINFOILWARE'].order_by('?').first()
        npc_tinfoilware.append(NpcTinfoilware(npc=npc, tinfoilware=tinfoilware))

    ### OLD ###

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
