from django.contrib import admin
from .models import Level, Role, Stat, BodyType, BodyPart, Skill, CareerSkill, Wound, WeaponType, WeaponConcealability, WeaponAvailability, WeaponReliability, WeaponSubtype, Weapon, ArmorPart, ArmorMaterial, Armor

# Register your models here.
admin.site.register(Level)
admin.site.register(Role)
admin.site.register(Stat)
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
