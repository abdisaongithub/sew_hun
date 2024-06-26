# Generated by Django 3.2.10 on 2022-03-03 11:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20220106_2152'),
    ]

    operations = [
        migrations.CreateModel(
            name='YoutubePlaylist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('playlist', models.CharField(max_length=255)),
            ],
        ),
        migrations.AlterField(
            model_name='narration',
            name='audio',
            field=models.FileField(upload_to='narrations/'),
        ),
        migrations.AlterField(
            model_name='post',
            name='created_at',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='post',
            name='updated_at',
            field=models.DateField(auto_now=True),
        ),
    ]
