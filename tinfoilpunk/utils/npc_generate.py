from tinfoilpunk.models import Npc, NpcStat, NpcSkill, NpcWeapon, NpcArmor, NpcTinfoilware
from .npc_compute import compute_stats, compute_armorsp

def generate_npc(level, role, race, npc_id, npc_sheets, data):

    # Create new NPC
    npc = Npc(handle='New NPC', level=level, race=race, role=role, possessions='')

    # Generate primary stats
    npc_stats = []
    for stat in data['STATS']:
        value = 5 # tutaj wylosować wartość początkową dla atrybutu
        bonus = data['RACEBONUS'].filter(race_id__exact=race, stat_id=stat).first()
        value += (bonus.modifier if bonus else 0)
        npc_stats.append(NpcStat(npc=npc, stat=stat, value=value))
    npc_stat_sum = sum([x.value for x in npc_stats])

    # Generate skills
    npc_skills = []
    career_skills = data['CAREER_SKILLS'].filter(role_id__exact=role)
    norm_skills = career_skills.filter(alt__isnull=True)
    alt_skills = career_skills.filter(alt__isnull=False)
    if alt_skills:
        alt_skills = alt_skills.order_by('?')[:alt_skills.first().alt_no]
    career_skills = norm_skills | alt_skills
    for career_skill in career_skills:
        value = 5 # tutaj wylosować wartość początkową dla umiejętności
        npc_skills.append(NpcSkill(npc=npc, skill=career_skill.skill, value=value))

    # Generate weapons
    npc_weapons = []
    for _ in range(3):
        # tutaj wylosować ile chcemy broni i jakie
        weapon = data['WEAPONS'].order_by('?').first() # to losuje jedną dowolną broń
        npc_weapons.append(NpcWeapon(npc=npc, weapon=weapon))

    # Generate armor
    npc_armor = []
    for armor_part in data['ARMOR_PARTS']:
        armor = data['ARMOR'].filter(part_id=armor_part).order_by('?').first() # tutaj wylosowac jakiś materiał dla elementu zbroi lub nic nie dodawać jeśli nie chcemy
        npc_armor.append(NpcArmor(npc=npc, armor=armor))


    # Generate tinfoilware
    npc_tinfoilware = []
    for _ in range(1):
        # tutaj wylosować ile chcemy folii i jakie
        tinfoilware = data['TINFOILWARE'].order_by('?').first()
        npc_tinfoilware.append(NpcTinfoilware(npc=npc, tinfoilware=tinfoilware))

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
