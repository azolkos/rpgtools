# Generated by Django 3.0.8 on 2020-07-10 18:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tinfoilpunk', '0025_auto_20200710_2023'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='armor',
            options={'ordering': ('part', 'material')},
        ),
        migrations.AlterModelOptions(
            name='armormaterial',
            options={'ordering': ('lvl',), 'verbose_name_plural': 'Armor Materials'},
        ),
        migrations.AlterModelOptions(
            name='armorpart',
            options={'ordering': ('id',), 'verbose_name_plural': 'Armor Parts'},
        ),
        migrations.AlterModelOptions(
            name='tinfoilware',
            options={'ordering': ('id',), 'verbose_name_plural': 'Tinfoilware'},
        ),
    ]