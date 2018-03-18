from django import forms
from django.forms import ModelForm
from models import Editorials

class EditorialForm(ModelForm):
    class Meta:
        model = Editorials
        fields = ('name', 'image', 'file',)
