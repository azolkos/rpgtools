from tinfoilpunk.models import Level, Role, Stat, Skill, CareerSkill, Weapon, Armor, BodyPart, BodyType, Wound

def get_globals():
    items = {}

    items['LEVELS'] = Level.objects.order_by('lvl')
    items['ROLES'] = Role.objects.order_by('id')

    items['STATS'] = Stat.objects.filter(category__in=['primary', 'secondary']).order_by('idx')
    items['COMP_STATS'] = Stat.objects.exclude(category__in=['primary', 'secondary']).order_by('idx', 'idy')

    items['SKILLS'] = Skill.objects.order_by('id')
    items['CAREER_SKILLS'] = CareerSkill.objects.select_related('skill')
    # print(items['CAREER_SKILLS'][0].skill.stat_id)

    items['WEAPONS'] = Weapon.objects.all()

    # items['WEAPON_NAMES'] = query_db('''
    #     select wcs.idx, wcs.cat, w.name
    #     from weapons w
    #     join weapon_types wt on wt.id = w.type
    #     left join weapon_subtypes ws on ws.id = w.subtype
    #     join weapon_cat_sort wcs on wcs.cat = coalesce(ws.name || ' ', '') || wt.name || 's'
    #     order by wcs.idx
    # ''')

    # items['WEAPONS_CAT'] = query_db('select * from weapon_cat_sort order by idx')

    items['ARMOR_HELMET'] = Armor.objects.filter(part_id__exact='Helmet').order_by('sp_head', 'sp_torso', 'sp_larm', 'sp_lleg')
    items['ARMOR_JACKET'] = Armor.objects.filter(part_id__exact='Jacket').order_by('sp_head', 'sp_torso', 'sp_larm', 'sp_lleg')
    items['ARMOR_VEST'] = Armor.objects.filter(part_id__exact='Vest').order_by('sp_head', 'sp_torso', 'sp_larm', 'sp_lleg')
    items['ARMOR_PANTS'] = Armor.objects.filter(part_id__exact='Pants').order_by('sp_head', 'sp_torso', 'sp_larm', 'sp_lleg')

    items['BODY_PARTS'] = BodyPart.objects.order_by('idx')
    items['BODY_TYPES'] = BodyType.objects.order_by('pts_from')

    # # Wounds
    items['WOUNDS'] = Wound.objects.order_by('-stun_save_mod')
    items['WOUNDS_MAX'] = max([x.stun_save_mod for x in items['WOUNDS']])
    items['WOUNDS_MIN'] = min([x.stun_save_mod for x in items['WOUNDS']])

    return items
