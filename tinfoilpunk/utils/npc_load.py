from tinfoilpunk.models import Npc, NpcStat, NpcSkill, NpcWeapon, NpcArmor, NpcTinfoilware
from .npc_compute import compute_stats, compute_armorsp

def load_npc(db_id, npc_id, npc_sheets, data):

    # Create new NPC
    npc = Npc.objects.filter(id__exact=db_id).first()
    npc_stats = NpcStat.objects.filter(npc=npc)
    npc_stat_sum = sum([x.value for x in npc_stats])
    npc_skills = NpcSkill.objects.filter(npc=npc)
    npc_weapons = NpcWeapon.objects.filter(npc=npc)
    npc_armor = NpcArmor.objects.filter(npc=npc)
    npc_tinfoilware = NpcTinfoilware.objects.filter(npc=npc)

    # Compute armor sp
    npc_armor_sp = compute_armorsp(npc_armor)

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
