from django import forms
from django.forms import ModelForm
from models import Journals

class JournalForm(ModelForm):
    class Meta:
        model = Journals
        fields = ('name', 'image', 'file',)
