# Generated by Django 3.0.8 on 2020-07-02 10:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tinfoilpunk', '0007_auto_20200702_1222'),
    ]

    operations = [
        migrations.AlterField(
            model_name='weapon',
            name='damage',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
