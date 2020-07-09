# Generated by Django 3.0.8 on 2020-07-08 16:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tinfoilpunk', '0015_auto_20200708_1824'),
    ]

    operations = [
        migrations.CreateModel(
            name='NpcWeapon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('npc', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Npc')),
                ('weapon', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Weapon')),
            ],
            options={
                'verbose_name_plural': 'Npc Weapons',
            },
        ),
        migrations.CreateModel(
            name='NpcTinfoilware',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('npc', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Npc')),
                ('tinfoilware', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Tinfoilware')),
            ],
            options={
                'verbose_name_plural': 'Npc Stats',
            },
        ),
        migrations.CreateModel(
            name='NpcStat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.IntegerField()),
                ('npc', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Npc')),
                ('stat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Stat')),
            ],
            options={
                'verbose_name_plural': 'Npc Stats',
            },
        ),
        migrations.CreateModel(
            name='NpcSkill',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.IntegerField()),
                ('npc', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Npc')),
                ('skill', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Skill')),
            ],
            options={
                'verbose_name_plural': 'Npc Skills',
            },
        ),
    ]
