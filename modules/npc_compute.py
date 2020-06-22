def compute_stats(stat_vals, DB):
    cstat_db = DB['COMP_STATS']
    cstat_rows = max([cstat['idx'] for cstat in cstat_db])
    cstat_cols = max([cstat['idy'] for cstat in cstat_db])
    cstat_vals = []
    for i in range(cstat_rows):
        sub = []
        for j in range(cstat_cols):
            item = [x for x in cstat_db if x['idx'] == i+1 and x['idy'] == j+1]
            if item == []:
                sub.append(None)
            else:
                if item[0]['type'] != None and item[0]['multiplier'] != None:
                    sub.append([item[0]['id'], item[0]['multiplier'] * stat_vals[item[0]['type']]])
                elif item[0]['id'] == 'BTM':
                    body_type = [x for x in DB['BODY_TYPES'] if x['pts_from'] <= stat_vals['BODY'] and (x['pts_to'] or 99) >= stat_vals['BODY']][0]
                    sub.append([item[0]['id'], body_type['bt_modifier']])
                else:
                    sub.append([item[0]['id'], 0])
        cstat_vals.append(sub)
    return cstat_vals

def compute_armorsp(armor_vals, DB):
    armor_parts = ['helmet','jacket','vest','pants']
    armor_db = []
    for a, v in zip(armor_parts, armor_vals):
        armor = [[x['sp_head'],x['sp_torso'],x['sp_larm'],x['sp_rarm'],x['sp_lleg'],x['sp_rleg']] for x in DB[f'ARMOR_{a.upper()}'] if x['material'] == v['material'] and x['type'] == v['type']]
        if armor != []:
            armor_db.append(armor[0])
    
    armor_sp = ['sp_head','sp_torso','sp_larm','sp_rarm','sp_lleg','sp_rleg']
    ret = {}
    for sp, val in zip(armor_sp, [sum(x) for x in zip(*armor_db)]):
        ret[sp] = val
    
    if ret == {}:
        return {'sp_head':0,'sp_torso':0,'sp_larm':0,'sp_rarm':0,'sp_lleg':0,'sp_rleg':0}
    return ret
