# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from journal.models import Journals
import datetime

# Create your models here.
class Articles(models.Model):
    name = models.CharField(max_length=100)
    image = models.ImageField()
    file = models.FileField()
    created_by = models.ForeignKey(Journals)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.name

    #Articles.objects.filter(created_by__id=id