# Generated by Django 3.2.10 on 2022-01-06 01:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='shares',
            field=models.BigIntegerField(default=0),
        ),
    ]
