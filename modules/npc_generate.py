import random, math
from modules.db import query_db
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
    skill_db = query_db(f'select cs.role_id, cs.skill_id, s.stat_id from career_skills cs join skills s on s.skill = cs.skill_id where role_id="{role}"')
    skill_vals = {}
    for skill in skill_db:
        skill_vals[skill['skill_id']] = random.randint(1,100)
    s = sum(skill_vals.values())
    for k, v in skill_vals.items():
        skill_vals[k] = math.ceil(v / s * 40)
    for skill in skill_db:
        skill_vals[skill['skill_id']] = [skill_vals[skill['skill_id']], skill['stat_id']]

    # Generate Weapons
    # weapon_pts = random.randint(1,10)
    # weapon_roll_db = query_db(f'select weapon_type, weapon_subtype from npc_weapon_roll where pts_from <= {weapon_pts} and coalesce(pts_to,99) >= {weapon_pts}')[0]
    # weapon_db = query_db(f'select * from weapons where type="{weapon_roll_db["weapon_type"]}" and subtype="{weapon_roll_db["weapon_subtype"]}"')
    weapon_db = DB['WEAPONS']
    weapon_vals = random.choices(weapon_db, k=2)

    # Generate Armor
    # armor_pts = random.randint(1,10)
    # armor_roll_db = query_db(f'select material from npc_armor_roll where pts_from <= {armor_pts} and coalesce(pts_to,99) >= {armor_pts}')[0]
    # armor_db = query_db(f'select * from armor where material="{armor_roll_db["material"]}"')
    armor_db_1 = DB['ARMOR_HELMET']
    armor_db_2 = DB['ARMOR_JACKET']
    armor_db_3 = DB['ARMOR_VEST']
    armor_db_4 = DB['ARMOR_PANTS']
    armor_vals_1 = random.choice(armor_db_1)
    armor_vals_2 = random.choice(armor_db_2)
    armor_vals_3 = random.choice(armor_db_3)
    armor_vals_4 = random.choice(armor_db_4)

    # Generate computed armor sp
    armor_sp = compute_armorsp(armor_vals_1, armor_vals_2, armor_vals_3, armor_vals_4)

    # Generate computed stats
    cstat_vals = compute_stats(stat_vals)

    npc_sheets[npc_id] = {
            'level': level,
            'handle': '',
            'role': role,
            'stat_vals': stat_vals,
            'stat_sum': stat_sum,
            'skill_vals': skill_vals,
            'weapon_vals': weapon_vals,
            'armor_vals': [armor_vals_1,armor_vals_2,armor_vals_3,armor_vals_4],
            'armor_sp': armor_sp,
            'cstat_vals': cstat_vals
    }

    return npc_sheets