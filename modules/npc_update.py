from modules.npc_compute import compute_stats, compute_armorsp

def update_npcs(keys, form, DB):
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
            skill_stat = [x['stat_id'] for x in DB['SKILLS'] if x['id'] == skill[2]]
            skill_vals[skill[2]] = [form['_'.join(skill)], skill_stat[0]]

        weapon_vals = []
        for weapon in [x for x in keys if int(x[0]) == npc and x[1] == 'weapon']:
            w = form['_'.join(weapon)].replace('"','""')
            w_db = [x for x in DB['WEAPONS'] if x['name'] == w]
            for r in w_db:
                if r != []:
                    weapon_vals.append(r)

        armor_parts = ['helmet','jacket','vest','pants']
        armor_vals = []
        for a in armor_parts:
            armor_mat = form[str(npc)+f'_armor_{a}'].split(' ')
            armor_db = [x for x in DB[f'ARMOR_{a.upper()}'] if x['material'] == ' '.join(armor_mat[:-1])]
            armor_vals.append(armor_db[0] if armor_db != [] else {'material': None, 'type': None})

        armor_sp = compute_armorsp(armor_vals, DB)

        cstat_vals = compute_stats(stat_vals, DB)

        npc_sheets[npc] = {
                'level': level,
                'handle': handle,
                'role': role,
                'stat_vals': stat_vals,
                'stat_sum': stat_sum,
                'skill_vals': skill_vals,
                'weapon_vals': weapon_vals,
                'armor_vals': armor_vals,
                'armor_sp': armor_sp,
                'cstat_vals': cstat_vals
        }

    return npc_sheets