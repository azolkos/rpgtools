# Generated by Django 3.0.8 on 2020-07-08 16:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tinfoilpunk', '0014_tinfoilware'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='armormaterial',
            options={'verbose_name_plural': 'Armor Materials'},
        ),
        migrations.AlterModelOptions(
            name='armorpart',
            options={'verbose_name_plural': 'Armor Parts'},
        ),
        migrations.AlterModelOptions(
            name='bodypart',
            options={'verbose_name_plural': 'Body Parts'},
        ),
        migrations.AlterModelOptions(
            name='bodytype',
            options={'verbose_name_plural': 'Body Types'},
        ),
        migrations.AlterModelOptions(
            name='careerskill',
            options={'verbose_name_plural': 'Career Skills'},
        ),
        migrations.AlterModelOptions(
            name='racebonus',
            options={'verbose_name_plural': 'Race Bonuses'},
        ),
        migrations.AlterModelOptions(
            name='tinfoilware',
            options={'verbose_name_plural': 'Tinfoilware'},
        ),
        migrations.AlterModelOptions(
            name='weaponavailability',
            options={'verbose_name_plural': 'Weapon Availabilities'},
        ),
        migrations.AlterModelOptions(
            name='weaponconcealability',
            options={'verbose_name_plural': 'Weapon Concealabilities'},
        ),
        migrations.AlterModelOptions(
            name='weaponreliability',
            options={'verbose_name_plural': 'Weapon Reliabilities'},
        ),
        migrations.AlterModelOptions(
            name='weaponsubtype',
            options={'verbose_name_plural': 'Weapon Subtypes'},
        ),
        migrations.AlterModelOptions(
            name='weapontype',
            options={'verbose_name_plural': 'Weapon Types'},
        ),
        migrations.CreateModel(
            name='Npc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('handle', models.CharField(max_length=100)),
                ('level', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Level')),
                ('race', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Race')),
                ('role', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tinfoilpunk.Role')),
            ],
        ),
    ]