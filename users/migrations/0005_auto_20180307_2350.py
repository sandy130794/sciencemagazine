# -*- coding: utf-8 -*-
# Generated by Django 1.11.10 on 2018-03-07 18:20
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_userprofile_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(blank=True, upload_to='profile_iamge'),
        ),
    ]
