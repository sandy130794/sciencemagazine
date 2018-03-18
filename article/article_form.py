from django import forms
from django.forms import ModelForm
from models import Articles

class Articles_Form(ModelForm):
    class Meta:
        model = Articles
        fields = ('name', 'image', 'file',)
