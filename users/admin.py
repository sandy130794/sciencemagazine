# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from models import UserProfile
from django.contrib import admin

# Register your models here.
admin.site.register(UserProfile)
admin.site.site_header = 'Adminisitration'