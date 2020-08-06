from django.contrib import admin
from .models import (Armor, ArmorBonusSp, ArmorPart, BodyPart, BodyType,
                     CareerSkill, Level, Race, RaceBonus, Role, Skill, Stat,
                     Tinfoilware, Weapon, WeaponAvailability,
                     WeaponConcealability, WeaponReliability, WeaponSubtype,
                     WeaponType, Wound, Npc, NpcStat, NpcSkill, NpcWeapon, NpcTinfoilware,
                     NpcArmor)

class RaceAdmin(admin.ModelAdmin):
    list_display = ('id', 'info')

class LevelAdmin(admin.ModelAdmin):
    list_display = ('id', 'lvl')

class RoleAdmin(admin.ModelAdmin):
    list_display = ('id', 'info')

class StatAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'info')

class RaceBonusAdmin(admin.ModelAdmin):
    list_display = ('race_id', 'stat_id', 'modifier')

class BodyTypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'pts_from', 'pts_to', 'bt_modifier', 'dmg_modifier')

class BodyPartAdmin(admin.ModelAdmin):
    list_display = ('id', 'd_from', 'd_to')

class SkillAdmin(admin.ModelAdmin):
    list_display = ('id', 'stat_id', 'info')

class CareerSkillAdmin(admin.ModelAdmin):
    list_display = ('role_id', 'skill_id', 'alt', 'alt_no')

class WoundAdmin(admin.ModelAdmin):
    list_display = ('id', 'short', 'stun_save_mod')

class WeaponTypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

class WeaponConcealabilityAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

class WeaponAvailabilityAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'info')

class WeaponReliabilityAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

class WeaponSubtypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

class WeaponAdmin(admin.ModelAdmin):
    list_display = ('id', 'w_type_id', 'w_subtype_id', 'accuracy', 'w_concealability_id', 'w_availability_id', 'damage', 'ammo', 'shots', 'rof', 'w_reliability_id', 'weapon_range', 'cost', 'info')

class ArmorBonusSpAdmin(admin.ModelAdmin):
    list_display = ('id', 'pts_from', 'pts_to')

class ArmorPartAdmin(admin.ModelAdmin):
    list_display = ('id', 'category')

class ArmorAdmin(admin.ModelAdmin):
    list_display = ('id', 'part_id', 'lvl', 'ev', 'sp_head', 'sp_torso', 'sp_larm', 'sp_rarm', 'sp_lleg', 'sp_rleg')

class TinfoilwareAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'info')

class NpcAdmin(admin.ModelAdmin):
    list_display = ('id', 'handle', 'level', 'race', 'role')

class NpcStatAdmin(admin.ModelAdmin):
    list_display = ('npc', 'stat_id', 'value')

class NpcSkillAdmin(admin.ModelAdmin):
    list_display = ('npc', 'skill_id', 'value')

class NpcWeaponAdmin(admin.ModelAdmin):
    list_display = ('npc', 'weapon')

class NpcTinfoilwareAdmin(admin.ModelAdmin):
    list_display = ('npc', 'tinfoilware')

class NpcArmorAdmin(admin.ModelAdmin):
    list_display = ('npc', 'armor')

# Register your models here.
admin.site.register(Race, RaceAdmin)
admin.site.register(Level, LevelAdmin)
admin.site.register(Role, RoleAdmin)
admin.site.register(Stat, StatAdmin)
admin.site.register(RaceBonus, RaceBonusAdmin)
admin.site.register(BodyType, BodyTypeAdmin)
admin.site.register(BodyPart, BodyPartAdmin)
admin.site.register(Skill, SkillAdmin)
admin.site.register(CareerSkill, CareerSkillAdmin)
admin.site.register(Wound, WoundAdmin)
admin.site.register(WeaponType, WeaponTypeAdmin)
admin.site.register(WeaponConcealability, WeaponConcealabilityAdmin)
admin.site.register(WeaponAvailability, WeaponAvailabilityAdmin)
admin.site.register(WeaponReliability, WeaponReliabilityAdmin)
admin.site.register(WeaponSubtype, WeaponSubtypeAdmin)
admin.site.register(Weapon, WeaponAdmin)
admin.site.register(ArmorBonusSp, ArmorBonusSpAdmin)
admin.site.register(ArmorPart, ArmorPartAdmin)
admin.site.register(Armor, ArmorAdmin)
admin.site.register(Tinfoilware, TinfoilwareAdmin)
admin.site.register(Npc, NpcAdmin)
admin.site.register(NpcStat, NpcStatAdmin)
admin.site.register(NpcSkill, NpcSkillAdmin)
admin.site.register(NpcWeapon, NpcWeaponAdmin)
admin.site.register(NpcTinfoilware, NpcTinfoilwareAdmin)
admin.site.register(NpcArmor, NpcArmorAdmin)
