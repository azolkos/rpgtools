from .npc_compute import compute_stats, compute_armorsp

def update_npcs(keys, form, data):
    npc_sheets = {}
    npc_ids = list({int(x[0]) for x in keys if x[0] != '0' and len(x) != 1})

    for npc in npc_ids:
        level = form[f'{npc}_level']
        handle = form[f'{npc}_handle']
        role = form[f'{npc}_role']
        possessions = form[f'{npc}_possessions']

        stat_vals = {}
        for stat in [x for x in keys if len(x) != 1 and int(x[0]) == npc and x[1] == 'stats']:
            stat_vals[stat[2]] = int(form['_'.join(stat)])
        stat_sum = sum([int(x) for x in stat_vals.values()])

        skill_vals = {}
        for skill in [x for x in keys if len(x) != 1 and int(x[0]) == npc and x[1] == 'skills']:
            skill_stat = data['SKILLS'].filter(id__exact=skill[2]).first().stat_id
            skill_info = data['SKILLS'].filter(id__exact=skill[2]).first().info
            skill_vals[skill[2]] = [form['_'.join(skill)], skill_stat, skill_info]

        weapon_vals = []
        for weapon in [x for x in keys if len(x) != 1 and int(x[0]) == npc and x[1] == 'weapon']:
            w_id = form['_'.join(weapon)]
            w_db = [x for x in data['WEAPONS'] if x.id == w_id]
            for row in w_db:
                if row != []:
                    weapon_vals.append(row)

        tinfoilware_vals = []
        for tinfoil in [x for x in keys if len(x) != 1 and int(x[0]) == npc and x[1] == 'tinfoil']:
            t_id = form['_'.join(tinfoil)]
            t_db = [x for x in data['TINFOILWARE'] if x.id == t_id]
            for row in t_db:
                if row != []:
                    tinfoilware_vals.append(row)

        armor_parts = ['helmet', 'jacket', 'vest', 'pants']
        armor_vals = []
        for armor in armor_parts:
            armor_mat = form[str(npc)+f'_armor_{armor}'].split(' ')
            armor_db = [x for x in data[f'ARMOR_{armor.upper()}'] if x.material_id == ' '.join(armor_mat[:-1])]
            armor_vals.append(armor_db[0] if armor_db != [] else None)

        armor_sp = compute_armorsp(armor_vals)

        cstat_vals = compute_stats(stat_vals, data)

        npc_sheets[npc] = {
            'level': level,
            'handle': handle,
            'role': role,
            'possessions': possessions,
            'stat_vals': stat_vals,
            'stat_sum': stat_sum,
            'skill_vals': skill_vals,
            'weapon_vals': weapon_vals,
            'tinfoilware_vals': tinfoilware_vals,
            'armor_vals': armor_vals,
            'armor_sp': armor_sp,
            'cstat_vals': cstat_vals
        }

    return npc_sheets
