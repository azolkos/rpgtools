from collections import Counter
import numpy

from tinfoilpunk.models import Npc, NpcStat, NpcSkill, NpcWeapon, NpcArmor, NpcTinfoilware
from .npc_compute import compute_stats, compute_armorsp

def generate_npc(level, role, race, npc_id, npc_sheets, data):

    # Create new NPC
    npc = Npc(handle='New NPC', level=level, race=race, role=role, possessions='')

    # Generate primary stats
    npc_stats = []
    stat_sum = numpy.random.randint(25+(level.lvl-1)*10, 35+(level.lvl-1)*10)
    stat_skills = data['CAREER_SKILLS'].filter(role_id__exact=role)
    stat_skills = Counter([x.skill.stat_id for x in stat_skills])
    for k, val in stat_skills.items():
        stat_skills[k] = val * 9 / sum(stat_skills.values())
    for stat in data['STATS']:
        value = numpy.random.binomial(10, 0.5 + 0.05 * (stat_skills[stat.id] if stat_skills[stat.id] else 0))
        npc_stats.append(NpcStat(npc=npc, stat=stat, value=value))
    npc_stat_sum = sum([x.value for x in npc_stats])
    for stat in npc_stats:
        stat.value = stat.value * stat_sum / npc_stat_sum
        stat.value = round(stat.value)
        if stat.value > 10:
            stat.value = 10
        if stat.value < 1:
            stat.value = 1
        bonus = data['RACEBONUS'].filter(race_id__exact=race, stat_id=stat.stat.id).first()
        stat.value += (bonus.modifier if bonus else 0)
    npc_stat_sum = sum([x.value for x in npc_stats])

    # Generate skills
    npc_skills = []
    skill_sum = numpy.random.randint(25+(level.lvl-1)*10, 35+(level.lvl-1)*10)
    career_skills = data['CAREER_SKILLS'].filter(role_id__exact=role)
    norm_skills = career_skills.filter(alt__isnull=True)
    alt_skills = career_skills.filter(alt__isnull=False)
    if alt_skills:
        alt_skills = alt_skills.order_by('?')[:alt_skills.first().alt_no]
    career_skills = norm_skills | alt_skills
    for career_skill in career_skills:
        value = numpy.random.randint(1, 10)
        npc_skills.append(NpcSkill(npc=npc, skill=career_skill.skill, value=value))
    for skill in npc_skills:
        skill.value = round(skill.value * skill_sum / sum([x.value for x in npc_skills]))
        if skill.value > 10:
            skill.value = 10
        if skill.value < 1:
            skill.value = 1

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
