from django.db import models

# Create your models here.
class Race(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=20, primary_key=True)
    info = models.TextField()

    class Meta:
        ordering = ('id',)

class Level(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=50, primary_key=True)
    lvl = models.IntegerField()

    class Meta:
        ordering = ('lvl',)

class Role(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=50, primary_key=True)
    info = models.TextField(blank=True)

    class Meta:
        ordering = ('id',)

class Stat(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=10, primary_key=True)
    idx = models.IntegerField()
    idy = models.IntegerField(null=True, blank=True)
    category = models.CharField(max_length=20, null=True, blank=True)
    multiplier = models.FloatField(null=True, blank=True)
    info = models.TextField(null=True, blank=True)

    class Meta:
        ordering = ('idx', 'idy')

class RaceBonus(models.Model):
    def __str__(self):
        return self.race.id + ': ' + self.stat.id
    race = models.ForeignKey(Race, models.CASCADE)
    stat = models.ForeignKey(Stat, models.CASCADE)
    modifier = models.IntegerField()

    class Meta:
        verbose_name_plural = 'Race Bonuses'
        ordering = ('race', 'stat')

class BodyType(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=30, primary_key=True)
    pts_from = models.IntegerField()
    pts_to = models.IntegerField(null=True, blank=True)
    bt_modifier = models.IntegerField()
    dmg_modifier = models.IntegerField()

    class Meta:
        verbose_name_plural = 'Body Types'
        ordering = ('pts_from',)

class BodyPart(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=10, primary_key=True)
    idx = models.IntegerField()
    d_from = models.IntegerField()
    d_to = models.IntegerField()

    class Meta:
        verbose_name_plural = 'Body Parts'
        ordering = ('idx',)

class Skill(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=50, primary_key=True)
    stat = models.ForeignKey(Stat, models.SET_NULL, null=True, blank=True)
    info = models.TextField(null=True, blank=True)

    class Meta:
        ordering = ('stat', 'id')

class CareerSkill(models.Model):
    def __str__(self):
        return self.role_id + ': ' + self.skill_id
    role = models.ForeignKey(Role, on_delete=models.CASCADE)
    skill = models.ForeignKey(Skill, on_delete=models.CASCADE)
    alt = models.IntegerField(null=True, blank=True)
    alt_no = models.IntegerField(null=True, blank=True)

    class Meta:
        verbose_name_plural = 'Career Skills'
        ordering = ('role', 'skill')

class Wound(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=20, primary_key=True)
    short = models.CharField(max_length=4)
    stun_save_mod = models.IntegerField()

    class Meta:
        ordering = ('-stun_save_mod',)

class WeaponType(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=4, primary_key=True)
    name = models.CharField(max_length=30)

    class Meta:
        verbose_name_plural = 'Weapon Types'

class WeaponConcealability(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=1, primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = 'Weapon Concealabilities'

class WeaponAvailability(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=1, primary_key=True)
    name = models.CharField(max_length=20)
    info = models.CharField(max_length=100)

    class Meta:
        verbose_name_plural = 'Weapon Availabilities'

class WeaponReliability(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=2, primary_key=True)
    name = models.CharField(max_length=20)

    class Meta:
        verbose_name_plural = 'Weapon Reliabilities'

class WeaponSubtype(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=1, primary_key=True)
    name = models.CharField(max_length=20)

    class Meta:
        verbose_name_plural = 'Weapon Subtypes'

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

    class Meta:
        ordering = ('w_type', 'w_subtype', 'id')

class ArmorPart(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=20, primary_key=True)
    category = models.CharField(max_length=20)

    class Meta:
        verbose_name_plural = 'Armor Parts'
        ordering = ('category', 'id')

class Armor(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=40, primary_key=True)
    part = models.ForeignKey(ArmorPart, models.CASCADE, related_name='part')
    lvl = models.IntegerField()
    sp_head = models.IntegerField()
    sp_torso = models.IntegerField()
    sp_larm = models.IntegerField()
    sp_rarm = models.IntegerField()
    sp_lleg = models.IntegerField()
    sp_rleg = models.IntegerField()
    ev = models.IntegerField()
    cost = models.IntegerField(null=True, blank=True)

    class Meta:
        ordering = ('part', 'lvl', 'id')

class ArmorBonusSp(models.Model):
    def __str__(self):
        return str(self.id)

    id = models.IntegerField(primary_key=True)
    pts_from = models.IntegerField()
    pts_to = models.IntegerField(null=True, blank=True)

    class Meta:
        verbose_name_plural = 'Armor Bonus SP'

class Tinfoilware(models.Model):
    def __str__(self):
        return self.id
    id = models.CharField(max_length=40, primary_key=True)
    category = models.CharField(max_length=40, null=True, blank=True)
    info = models.TextField()

    class Meta:
        verbose_name_plural = 'Tinfoilware'
        ordering = ('id',)

# NPC
class Npc(models.Model):
    def __str__(self):
        return self.handle + ' (' + self.level.id + ' ' + self.race.id + ' ' + self.role.id + ') #' + str(self.id)
    handle = models.CharField(max_length=100)
    level = models.ForeignKey(Level, models.CASCADE)
    race = models.ForeignKey(Race, models.CASCADE)
    role = models.ForeignKey(Role, models.CASCADE)
    possessions = models.TextField(null=True, blank=True)

    class Meta:
        ordering = ('id',)

class NpcStat(models.Model):
    def __str__(self):
        return '#' + str(self.npc.id) + ': ' + self.stat.id
    npc = models.ForeignKey(Npc, models.CASCADE)
    stat = models.ForeignKey(Stat, models.CASCADE)
    value = models.IntegerField()

    class Meta:
        verbose_name_plural = 'Npc Stats'
        unique_together = (('npc', 'stat'),)
        ordering = ('npc', 'stat')

class NpcSkill(models.Model):
    def __str__(self):
        return '#' + str(self.npc.id) + ': ' + self.skill.id
    npc = models.ForeignKey(Npc, models.CASCADE)
    skill = models.ForeignKey(Skill, models.CASCADE)
    value = models.IntegerField()

    class Meta:
        verbose_name_plural = 'Npc Skills'
        unique_together = (('npc', 'skill'),)
        ordering = ('npc', 'skill')

class NpcWeapon(models.Model):
    def __str__(self):
        return '#' + str(self.npc.id) + ': ' + self.weapon.id
    npc = models.ForeignKey(Npc, models.CASCADE)
    weapon = models.ForeignKey(Weapon, models.CASCADE)

    class Meta:
        verbose_name_plural = 'Npc Weapons'
        ordering = ('npc', 'weapon')

class NpcTinfoilware(models.Model):
    def __str__(self):
        return '#' + str(self.npc.id) + ': ' + self.tinfoilware.id
    npc = models.ForeignKey(Npc, models.CASCADE)
    tinfoilware = models.ForeignKey(Tinfoilware, models.CASCADE)

    class Meta:
        verbose_name_plural = 'Npc Tinfoilware'
        ordering = ('npc', 'tinfoilware')

class NpcArmor(models.Model):
    def __str__(self):
        return '#' + str(self.npc.id) + ': ' + self.armor.id
    npc = models.ForeignKey(Npc, models.CASCADE)
    armor = models.ForeignKey(Armor, models.CASCADE)

    class Meta:
        verbose_name_plural = 'Npc Armor'
        unique_together = (('npc', 'armor'),)
        ordering = ('npc', 'armor')
