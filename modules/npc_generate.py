import random, math
from modules.npc_compute import compute_stats, compute_armorsp

def generate_npc(level, role, npc_id, npc_sheets, DB):

    # Generate primary stats
    stat_db = DB['STATS']
    stat_vals = {}
    for stat in stat_db:
        d6_1 = random.randint(1,6)
        d6_2 = random.randint(1,6)
        while d6_1 + d6_2 >= 11:
            d6_1 = random.randint(1,6)
            d6_2 = random.randint(1,6)
        stat_vals[stat[0]] = d6_1+d6_2
    stat_sum = sum(stat_vals.values())

    # Generate skills
    skill_db = [x for x in DB['CAREER_SKILLS'] if x['role_id'] == role]
    norm_skills = [x for x in skill_db if x['alt'] == None]
    alt_skills = [x for x in skill_db if x['alt'] != None]
    if alt_skills != []:
        alt_skills = random.choices(alt_skills, k=alt_skills[0]['alt_no'])
    skill_db = norm_skills + alt_skills
    skill_vals = {}
    for skill in skill_db:
        skill_vals[skill['skill_id']] = random.randint(1,100)
    s = sum(skill_vals.values())
    for k, v in skill_vals.items():
        skill_vals[k] = math.ceil(v / s * 40)
    for skill in skill_db:
        skill_vals[skill['skill_id']] = [skill_vals[skill['skill_id']], skill['stat_id']]

    # Generate Weapons
    weapon_db = DB['WEAPONS']
    weapon_vals = random.choices(weapon_db, k=2)

    # Generate Armor
    armor_db_1 = DB['ARMOR_HELMET']
    armor_db_2 = DB['ARMOR_JACKET']
    armor_db_3 = DB['ARMOR_VEST']
    armor_db_4 = DB['ARMOR_PANTS']
    armor_vals_1 = random.choice(armor_db_1)
    armor_vals_2 = random.choice(armor_db_2)
    armor_vals_3 = random.choice(armor_db_3)
    armor_vals_4 = random.choice(armor_db_4)

    # Generate computed armor sp
    armor_sp = compute_armorsp([armor_vals_1, armor_vals_2, armor_vals_3, armor_vals_4], DB)

    # Generate computed stats
    cstat_vals = compute_stats(stat_vals, DB)

    npc_sheets[npc_id] = {
            'level': level,
            'handle': '',
            'role': role,
            'possessions': '',
            'stat_vals': stat_vals,
            'stat_sum': stat_sum,
            'skill_vals': skill_vals,
            'weapon_vals': weapon_vals,
            'armor_vals': [armor_vals_1,armor_vals_2,armor_vals_3,armor_vals_4],
            'armor_sp': armor_sp,
            'cstat_vals': cstat_vals
    }

    return npc_sheets