from tinfoilpunk.models import Npc, NpcStat, NpcSkill, NpcWeapon, NpcArmor, NpcTinfoilware
from .npc_compute import compute_stats, compute_armorsp

def update_npcs(keys, form, data):
    npc_sheets = {}
    npc_ids = list({int(x[0]) for x in keys if x[0] != '0' and len(x) != 1})

    for npc_id in npc_ids:
        db_id = form[f'{npc_id}_id']
        handle = form[f'{npc_id}_handle']
        level = data['LEVELS'].filter(id__exact=form[f'{npc_id}_level']).first()
        role = data['ROLES'].filter(id__exact=form[f'{npc_id}_role']).first()
        race = data['RACES'].filter(id__exact=form[f'{npc_id}_race']).first()
        possessions = form[f'{npc_id}_possessions']

        npc = Npc(id=db_id, handle=handle, level=level, race=race, role=role, possessions=possessions)

        npc_stats = []
        for stat in [x for x in keys if len(x) != 1 and int(x[0]) == npc_id and x[1] == 'stats']:
            npc_stats.append(NpcStat(npc=npc, stat=data['STATS'].filter(id__exact=stat[2]).first(), value=int(form['_'.join(stat)])))
        npc_stat_sum = sum([x.value for x in npc_stats])

        npc_skills = []
        for skill in [x for x in keys if len(x) != 1 and int(x[0]) == npc_id and x[1] == 'skills']:
            npc_skills.append(NpcSkill(npc=npc, skill=data['SKILLS'].filter(id__exact=skill[2]).first(), value=form['_'.join(skill)]))
        for skill in [x for x in keys if len(x) != 1 and int(x[0]) == npc_id and x[1] == 'skill']:
            if form['_'.join(skill)] != 'None':
                npc_skills.append(NpcSkill(npc=npc, skill=data['SKILLS'].filter(id__exact=form['_'.join(skill)]).first(), value=0))

        npc_weapons = []
        for weapon in [x for x in keys if len(x) != 1 and int(x[0]) == npc_id and x[1] == 'weapon']:
            weapon = data['WEAPONS'].filter(id__exact=form['_'.join(weapon)]).first()
            if weapon:
                npc_weapons.append(NpcWeapon(npc=npc, weapon=weapon))

        npc_tinfoilware = []
        for tinfoilware in [x for x in keys if len(x) != 1 and int(x[0]) == npc_id and x[1] == 'tinfoilware']:
            tinfoilware = data['TINFOILWARE'].filter(id__exact=form['_'.join(tinfoilware)]).first()
            if tinfoilware:
                npc_tinfoilware.append(NpcTinfoilware(npc=npc, tinfoilware=tinfoilware))

        npc_armor = []
        armor_parts = ['helmet', 'jacket', 'pants', 'vest']
        for armor_part in armor_parts:
            armor_material = form[f'{npc_id}_armor_{armor_part}'].split(' ')
            armor_material = ' '.join(armor_material[:-1]) if armor_material else None
            armor = data['ARMOR'].filter(part_id__exact=armor_part.capitalize(), material_id__exact=armor_material).first()
            if armor:
                npc_armor.append(NpcArmor(npc=npc, armor=armor))

        npc_armor_sp = compute_armorsp(npc_armor)

        npc_comp_stats = compute_stats(npc_stats, data)

        npc_sheets[npc_id] = {
            'npc': npc,
            'npc_stats': npc_stats,
            'npc_stat_sum': npc_stat_sum,
            'npc_skills': npc_skills,
            'npc_weapons': npc_weapons,
            'npc_armor': npc_armor,
            'npc_tinfoilware': npc_tinfoilware,
            'npc_armor_sp': npc_armor_sp,
            'npc_comp_stats': npc_comp_stats
        }

    return npc_sheets
