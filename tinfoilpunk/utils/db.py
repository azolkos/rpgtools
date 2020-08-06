from tinfoilpunk.models import (
    Armor, ArmorBonusSp, ArmorPart, BodyPart, BodyType, CareerSkill, Level, Npc, Race,
    RaceBonus, Role, Skill, Stat, Tinfoilware, Weapon, Wound)


def get_globals():
    items = {}

    items['NPCS'] = Npc.objects.order_by('id')

    items['LEVELS'] = Level.objects.order_by('lvl')
    items['RACES'] = Race.objects.order_by('id')
    items['RACEBONUS'] = RaceBonus.objects.all()
    items['ROLES'] = Role.objects.order_by('id')

    items['STATS'] = Stat.objects.filter(category__in=['primary', 'secondary']).order_by('idx')
    items['COMP_STATS'] = Stat.objects.exclude(category__in=['primary', 'secondary']).order_by('idx', 'idy')

    items['SKILLS'] = Skill.objects.order_by('id')
    items['CAREER_SKILLS'] = CareerSkill.objects.select_related('skill')

    items['WEAPONS'] = Weapon.objects.all()

    items['ARMOR_PARTS'] = ArmorPart.objects.order_by('id')
    items['ARMOR_BONUS'] = ArmorBonusSp.objects.all()
    items['ARMOR'] = Armor.objects.order_by('part_id')

    items['BODY_PARTS'] = BodyPart.objects.order_by('idx')
    items['BODY_TYPES'] = BodyType.objects.order_by('pts_from')

    # # Wounds
    items['WOUNDS'] = Wound.objects.order_by('-stun_save_mod')
    items['WOUNDS_MAX'] = max([x.stun_save_mod for x in items['WOUNDS']])
    items['WOUNDS_MIN'] = min([x.stun_save_mod for x in items['WOUNDS']])

    items['TINFOILWARE'] = Tinfoilware.objects.all()

    return items
