from modules.db import query_db

def compute_stats(stat_vals):
    cstat_db = query_db('select * from stats where type != "primary" or type is null order by idx, idy')
    cstat_rows = max([cstat['idx'] for cstat in cstat_db])
    cstat_cols = max([cstat['idy'] for cstat in cstat_db])
    cstat_vals = []
    for i in range(cstat_rows):
        sub = []
        for j in range(cstat_cols):
            item = list(filter(lambda x: x['idx'] == i+1 and x['idy'] == j+1, cstat_db))
            if item == []:
                sub.append(None)
            else:
                if item[0]['type'] != None and item[0]['multiplier'] != None:
                    sub.append([item[0]['stat'], item[0]['multiplier'] * stat_vals[item[0]['type']]])
                elif item[0]['stat'] == 'BTM':
                    body_type = query_db(f'select * from body_types where pts_from <= {stat_vals["BODY"]} and coalesce(pts_to,"9999") >= {stat_vals["BODY"]}')[0]
                    sub.append([item[0]['stat'], body_type['modifier']])
                else:
                    sub.append([item[0]['stat'], 0])
        cstat_vals.append(sub)
    return cstat_vals

def compute_armorsp(armor_vals_1, armor_vals_2, armor_vals_3, armor_vals_4):
    ret = query_db(f'''
        select sum(sp_head) sp_head, sum(sp_torso) sp_torso, sum(sp_larm) sp_larm, sum(sp_rarm) sp_rarm, sum(sp_lleg) sp_lleg, sum(sp_rleg) sp_rleg
        from armor
        where material || ' ' || type in (
            '{armor_vals_1['material']} {armor_vals_1['type']}',
            '{armor_vals_2['material']} {armor_vals_2['type']}',
            '{armor_vals_3['material']} {armor_vals_3['type']}',
            '{armor_vals_4['material']} {armor_vals_4['type']}'
        )
    ''')[0]
    if not any(ret[:]):
        return {'sp_head':0,'sp_torso':0,'sp_larm':0,'sp_rarm':0,'sp_lleg':0,'sp_rleg':0}
    return ret
