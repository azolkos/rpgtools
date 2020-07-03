def compute_stats(stat_vals, data):
    cstat_db = data['COMP_STATS']
    cstat_rows = max([cstat.idx for cstat in cstat_db])
    cstat_cols = max([cstat.idy for cstat in cstat_db])
    cstat_vals = []
    for i in range(cstat_rows):
        sub = []
        for j in range(cstat_cols):
            item = [x for x in cstat_db if x.idx == i+1 and x.idy == j+1]
            if item == []:
                sub.append(None)
            else:
                if item[0].category is not None and item[0].multiplier is not None:
                    sub.append([item[0].id, item[0].multiplier * stat_vals[item[0].category]])
                elif item[0].id == 'BTM':
                    body_type = [x for x in data['BODY_TYPES'] if x.pts_from <= stat_vals['BODY'] and (x.pts_to or 99) >= stat_vals['BODY']][0]
                    sub.append([item[0].id, body_type.bt_modifier])
                elif item[0].id == 'DMG':
                    body_type = [x for x in data['BODY_TYPES'] if x.pts_from <= stat_vals['BODY'] and (x.pts_to or 99) >= stat_vals['BODY']][0]
                    sub.append([item[0].id, body_type.dmg_modifier])
                else:
                    sub.append([item[0].id, 0])
        cstat_vals.append(sub)
    return cstat_vals

def compute_armorsp(armor_vals):
    return {
        'sp_head': armor_vals[0].sp_head if armor_vals[0] is not None else 0,
        'sp_torso': (armor_vals[1].sp_torso if armor_vals[1] is not None else 0) + (armor_vals[2].sp_torso if armor_vals[2] is not None else 0),
        'sp_larm': (armor_vals[1].sp_larm if armor_vals[1] is not None else 0) + (armor_vals[2].sp_larm if armor_vals[2] is not None else 0),
        'sp_rarm': (armor_vals[1].sp_rarm if armor_vals[1] is not None else 0) + (armor_vals[2].sp_rarm if armor_vals[2] is not None else 0),
        'sp_lleg': armor_vals[3].sp_lleg if armor_vals[3] is not None else 0,
        'sp_rleg': armor_vals[3].sp_rleg if armor_vals[3] is not None else 0
    }
