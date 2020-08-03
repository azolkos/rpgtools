import math

def compute_stats(npc_stats, data):
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
                item = item[0]
                if item.category is not None and item.multiplier is not None:
                    npc_stat = [x.value for x in npc_stats if x.stat.id == item.category][0]
                    sub.append([item.id, math.floor(item.multiplier * npc_stat)])
                elif item.id == 'BTM' or item.id == 'DMG':
                    npc_stat = [x.value for x in npc_stats if x.stat.id == 'BODY'][0]
                    body_type = [x for x in data['BODY_TYPES'] if x.pts_from <= npc_stat and (x.pts_to or 99) >= npc_stat][0]
                    if item.id == 'BTM':
                        sub.append([item.id, body_type.bt_modifier])
                    elif item.id == 'DMG':
                        sub.append([item.id, body_type.dmg_modifier])
                else:
                    sub.append([item.id, 0])
        cstat_vals.append(sub)
    return cstat_vals

def compute_armorsp(npc_armor):
    return {
        'sp_head': max([armor.armor.sp_head for armor in npc_armor]),
        'sp_torso': max([armor.armor.sp_torso for armor in npc_armor]),
        'sp_larm': max([armor.armor.sp_larm for armor in npc_armor]),
        'sp_rarm': max([armor.armor.sp_rarm for armor in npc_armor]),
        'sp_lleg': max([armor.armor.sp_lleg for armor in npc_armor]),
        'sp_rleg': max([armor.armor.sp_rleg for armor in npc_armor])
    }
