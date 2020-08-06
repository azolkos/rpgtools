from collections import Counter
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
                    body_type = [x for x in data['BODY_TYPES'] if x.pts_from <= npc_stat <= (x.pts_to or 99)][0]
                    if item.id == 'BTM':
                        sub.append([item.id, body_type.bt_modifier])
                    elif item.id == 'DMG':
                        sub.append([item.id, body_type.dmg_modifier])
                else:
                    sub.append([item.id, 0])
        cstat_vals.append(sub)
    return cstat_vals

def compute_armorsp(npc_armor, data):
    ar_head = [armor.armor.sp_head for armor in npc_armor if armor.armor.sp_head != 0]
    ar_torso = [armor.armor.sp_torso for armor in npc_armor if armor.armor.sp_torso != 0]
    ar_larm = [armor.armor.sp_larm for armor in npc_armor if armor.armor.sp_larm != 0]
    ar_rarm = [armor.armor.sp_rarm for armor in npc_armor if armor.armor.sp_rarm != 0]
    ar_lleg = [armor.armor.sp_lleg for armor in npc_armor if armor.armor.sp_lleg != 0]
    ar_rleg = [armor.armor.sp_rleg for armor in npc_armor if armor.armor.sp_rleg != 0]

    def stacking_sp(sp_list):
        if not sp_list:
            return 0
        if len(sp_list) == 1:
            return sp_list[0]
        sp_list.sort(reverse=True)
        for i in range(len(sp_list)-1):
            diff = sp_list[i] - sp_list[i+1]
            bonus = [bonus.id for bonus in data['ARMOR_BONUS'] if bonus.pts_from <= diff <= (bonus.pts_to or 99)][0]
            sp_list[i+1] = sp_list[i] + bonus
        return sp_list[-1]

    ev_base = -sum([armor.armor.ev for armor in npc_armor])
    for val in Counter([armor.armor.part.category for armor in npc_armor]).values():
        if val == 2:
            ev_base -= 1
        if val >= 3:
            ev_base -= 2

    return {
        'sp_head': stacking_sp(ar_head),
        'sp_torso': stacking_sp(ar_torso),
        'sp_larm': stacking_sp(ar_larm),
        'sp_rarm': stacking_sp(ar_rarm),
        'sp_lleg': stacking_sp(ar_lleg),
        'sp_rleg': stacking_sp(ar_rleg),
        'ev': ev_base
    }
