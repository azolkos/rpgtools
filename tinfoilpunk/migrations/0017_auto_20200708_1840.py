# Generated by Django 3.0.8 on 2020-07-08 16:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tinfoilpunk', '0016_npcskill_npcstat_npctinfoilware_npcweapon'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='npcskill',
            unique_together={('npc', 'skill')},
        ),
        migrations.AlterUniqueTogether(
            name='npcstat',
            unique_together={('npc', 'stat')},
        ),
    ]
