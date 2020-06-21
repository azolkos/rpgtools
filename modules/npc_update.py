from modules.db import query_db
from modules.npc_compute import compute_stats, compute_armorsp

def update_npcs(keys, form):
    npc_sheets = {}
    npc_ids = list(set([int(x[0]) for x in keys if x[0] != '0']))

    for npc in npc_ids:
        level = form[f'{npc}_level']
        handle = form[f'{npc}_handle']
        role = form[f'{npc}_role']

        stat_vals = {}
        for stat in [x for x in keys if int(x[0]) == npc and x[1] == 'stats']:
            stat_vals[stat[2]] = int(form['_'.join(stat)])
        stat_sum = sum([int(x) for x in stat_vals.values()])

        skill_vals = {}
        for skill in [x for x in keys if int(x[0]) == npc and x[1] == 'skills']:
            skill_stat = query_db(f'select stat_id from skills where id="{skill[2]}"')[0]
            skill_vals[skill[2]] = [form['_'.join(skill)], skill_stat[0]]

        weapon_vals = []
        for weapon in [x for x in keys if int(x[0]) == npc and x[1] == 'weapon']:
            w = form['_'.join(weapon)].replace('"','""')
            w_db = query_db(f'select * from weapons where name="{w}"')
            for r in w_db:
                if r != []:
                    weapon_vals.append(r)

        armor_vals_1 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_helmet"]}"')
        armor_vals_2 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_jacket"]}"')
        armor_vals_3 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_vest"]}"')
        armor_vals_4 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_pants"]}"')
        armor_vals_1 = armor_vals_1[0] if armor_vals_1 != [] else {'material': None, 'type': None}
        armor_vals_2 = armor_vals_2[0] if armor_vals_2 != [] else {'material': None, 'type': None}
        armor_vals_3 = armor_vals_3[0] if armor_vals_3 != [] else {'material': None, 'type': None}
        armor_vals_4 = armor_vals_4[0] if armor_vals_4 != [] else {'material': None, 'type': None}

        armor_sp = compute_armorsp(armor_vals_1, armor_vals_2, armor_vals_3, armor_vals_4)

        cstat_vals = compute_stats(stat_vals)

        npc_sheets[npc] = {
                'level': level,
                'handle': handle,
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