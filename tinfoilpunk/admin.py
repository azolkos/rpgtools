from django.contrib import admin
from .models import (Armor, ArmorMaterial, ArmorPart, BodyPart, BodyType,
                     CareerSkill, Level, Race, RaceBonus, Role, Skill, Stat,
                     Tinfoilware, Weapon, WeaponAvailability,
                     WeaponConcealability, WeaponReliability, WeaponSubtype,
                     WeaponType, Wound, Npc, NpcStat, NpcSkill, NpcWeapon, NpcTinfoilware,
                     NpcArmor)

# Register your models here.
admin.site.register(Race)
admin.site.register(Level)
admin.site.register(Role)
admin.site.register(Stat)
admin.site.register(RaceBonus)
admin.site.register(BodyType)
admin.site.register(BodyPart)
admin.site.register(Skill)
admin.site.register(CareerSkill)
admin.site.register(Wound)
admin.site.register(WeaponType)
admin.site.register(WeaponConcealability)
admin.site.register(WeaponAvailability)
admin.site.register(WeaponReliability)
admin.site.register(WeaponSubtype)
admin.site.register(Weapon)
admin.site.register(ArmorPart)
admin.site.register(ArmorMaterial)
admin.site.register(Armor)
admin.site.register(Tinfoilware)
admin.site.register(Npc)
admin.site.register(NpcStat)
admin.site.register(NpcSkill)
admin.site.register(NpcWeapon)
admin.site.register(NpcTinfoilware)
admin.site.register(NpcArmor)
