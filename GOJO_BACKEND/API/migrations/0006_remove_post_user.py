# Generated by Django 4.0.5 on 2022-06-05 00:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0005_alter_post_photo_alter_post_rooms'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='user',
        ),
    ]