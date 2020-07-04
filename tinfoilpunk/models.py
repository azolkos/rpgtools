from django.db import models

# Create your models here.
class Race(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=20, primary_key=True)
    info = models.TextField()

class Level(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=50, primary_key=True)
    lvl = models.IntegerField()

class Role(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=50, primary_key=True)
    info = models.TextField(blank=True)

class Stat(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=10, primary_key=True)
    idx = models.IntegerField()
    idy = models.IntegerField(null=True, blank=True)
    category = models.CharField(max_length=20, null=True, blank=True)
    multiplier = models.FloatField(null=True, blank=True)
    info = models.TextField(null=True, blank=True)

class RaceBonus(models.Model):
    def __str__(self):
        return self.race.id + ': ' + self.stat.id
    race = models.ForeignKey(Race, models.CASCADE)
    stat = models.ForeignKey(Stat, models.CASCADE)
    modifier = models.IntegerField()

class BodyType(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=30, primary_key=True)
    pts_from = models.IntegerField()
    pts_to = models.IntegerField(null=True, blank=True)
    bt_modifier = models.IntegerField()
    dmg_modifier = models.IntegerField()

class BodyPart(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=10, primary_key=True)
    idx = models.IntegerField()
    d_from = models.IntegerField()
    d_to = models.IntegerField()

class Skill(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=50, primary_key=True)
    stat = models.ForeignKey(Stat, models.SET_NULL, null=True, blank=True)
    info = models.TextField(null=True, blank=True)

class CareerSkill(models.Model):
    def __str__(self):
        return self.role_id + ': ' + self.skill_id
    role = models.ForeignKey(Role, on_delete=models.CASCADE)
    skill = models.ForeignKey(Skill, on_delete=models.CASCADE)
    alt = models.IntegerField(null=True, blank=True)
    alt_no = models.IntegerField(null=True, blank=True)

class Wound(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=20, primary_key=True)
    short = models.CharField(max_length=4)
    stun_save_mod = models.IntegerField()

class WeaponType(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=4, primary_key=True)
    name = models.CharField(max_length=30)

class WeaponConcealability(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=1, primary_key=True)
    name = models.CharField(max_length=50)

class WeaponAvailability(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=1, primary_key=True)
    name = models.CharField(max_length=20)
    info = models.CharField(max_length=100)

class WeaponReliability(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=2, primary_key=True)
    name = models.CharField(max_length=20)

class WeaponSubtype(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=1, primary_key=True)
    name = models.CharField(max_length=20)

class Weapon(models.Model):
    def __str__(self):
        return self.id + ' (' + self.w_type.id + ')'
    id = models.CharField(max_length=100, primary_key=True)
    w_type = models.ForeignKey(WeaponType, models.SET_NULL, null=True, blank=True)
    w_subtype = models.ForeignKey(WeaponSubtype, models.SET_NULL, null=True, blank=True)
    accuracy = models.IntegerField()
    w_concealability = models.ForeignKey(WeaponConcealability, models.SET_NULL, null=True, blank=True)
    w_availability = models.ForeignKey(WeaponAvailability, models.SET_NULL, null=True, blank=True)
    damage = models.CharField(max_length=30, null=True, blank=True)
    ammo = models.CharField(max_length=20, null=True, blank=True)
    shots = models.IntegerField(null=True, blank=True)
    rof = models.IntegerField(null=True, blank=True)
    w_reliability = models.ForeignKey(WeaponReliability, models.SET_NULL, null=True, blank=True)
    weapon_range = models.CharField(max_length=20, null=True, blank=True)
    cost = models.IntegerField(null=True, blank=True)
    info = models.TextField(null=True, blank=True)

class ArmorPart(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=20, primary_key=True)

class ArmorMaterial(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=30, primary_key=True)
    lvl = models.IntegerField()

class Armor(models.Model):
    def __str__(self):
        return self.material.id + ' ' + self.part.id
    part = models.ForeignKey(ArmorPart, models.CASCADE, related_name='part')
    material = models.ForeignKey(ArmorMaterial, models.CASCADE, related_name='material')
    sp_head = models.IntegerField()
    sp_torso = models.IntegerField()
    sp_larm = models.IntegerField()
    sp_rarm = models.IntegerField()
    sp_lleg = models.IntegerField()
    sp_rleg = models.IntegerField()
    ev = models.IntegerField()
    cost = models.IntegerField(null=True, blank=True)

class Tinfoilware(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=40, primary_key=True)
    category = models.CharField(max_length=40, null=True, blank=True)
    info = models.TextField()
