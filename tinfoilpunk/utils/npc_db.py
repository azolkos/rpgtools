from tinfoilpunk.models import Npc, NpcStat, NpcSkill, NpcWeapon, NpcArmor, NpcTinfoilware
from .npc_compute import compute_stats, compute_armorsp

def load_npc(db_id, npc_id, npc_sheets, data):

    # Load npc
    npc = Npc.objects.filter(id__exact=db_id).first()
    npc_stats = NpcStat.objects.filter(npc=npc)
    npc_stat_sum = sum([x.value for x in npc_stats])
    npc_skills = NpcSkill.objects.filter(npc=npc)
    npc_weapons = NpcWeapon.objects.filter(npc=npc)
    npc_armor = NpcArmor.objects.filter(npc=npc)
    npc_tinfoilware = NpcTinfoilware.objects.filter(npc=npc)

    # Compute armor sp
    npc_armor_sp = compute_armorsp(npc_armor, data)

    # Generate computed stats
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

def save_npc(npc):

    # Upsert npc
    if npc['npc'].id != 'None':
        npc_inst = Npc.objects.get(id=npc['npc'].id)
        npc_inst.handle = npc['npc'].handle
        npc_inst.possessions = npc['npc'].possessions
        npc_inst.save()
    else:
        npc['npc'].id = None
        npc['npc'].save()

    # Upsert stats
    for npc_stat in npc['npc_stats']:
        npc_stat.npc = npc['npc']
        try:
            npc_stat_inst = NpcStat.objects.get(npc=npc_stat.npc, stat=npc_stat.stat)
            npc_stat_inst.value = npc_stat.value
            npc_stat_inst.save()
        except NpcStat.DoesNotExist:
            npc_stat.save()

    # Insert skills
    NpcSkill.objects.filter(npc=npc['npc']).delete()
    for npc_skill in npc['npc_skills']:
        npc_skill.npc = npc['npc']
        npc_skill.save()

    # Insert weapons
    NpcWeapon.objects.filter(npc=npc['npc']).delete()
    for npc_weapon in npc['npc_weapons']:
        npc_weapon.npc = npc['npc']
        npc_weapon.save()

    # Insert armor
    NpcArmor.objects.filter(npc=npc['npc']).delete()
    for npc_armor in npc['npc_armor']:
        npc_armor.npc = npc['npc']
        npc_armor.save()

    # Insert tinfoilware
    NpcTinfoilware.objects.filter(npc=npc['npc']).delete()
    for npc_tinfoilwre in npc['npc_tinfoilware']:
        npc_tinfoilwre.npc = npc['npc']
        npc_tinfoilwre.save()
