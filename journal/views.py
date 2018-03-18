# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, HttpResponseRedirect
from annoying.functions import get_object_or_None
from models import Journals
from journal_form import JournalForm
from django.contrib.auth.decorators import login_required
from article.models import Articles
from editor.models import Editorials

# Create your views here.
@login_required(login_url='/login')
def journal_form(request,id=None):
    myrecord = get_object_or_None(Journals, id=id)
    if request.method == 'POST':
        form = JournalForm(request.POST,request.FILES,instance=myrecord)
        if form.is_valid():
            journal = form.save(commit=False)
            journal.created_by = request.user
            journal.save()
            return HttpResponseRedirect('/journal/list')
    else:
        if myrecord:
            form = JournalForm(instance=myrecord)
        else:
            form = JournalForm()
    return render(request, 'journal/journal_form.html', {'form': form})

@login_required(login_url='/login')
def journal_list(request, ):
    journals_list = Journals.objects.filter(created_by__id=request.user.id)
    form = journals_list
    return render(request, 'journal/journal_display.html', { 'form': form })

@login_required(login_url='/login')
def delete_journal(request, id):
    record = Journals.objects.get(pk = id)
    record.delete()
    journals_list = Journals.objects.filter()
    form = journals_list
    return HttpResponseRedirect('/journal/list')


@login_required(login_url='/login')
def journal_articles(request, id):
    journals_list = Articles.objects.filter(created_by__id=id)
    form = journals_list
    return render(request, 'journal/journal_articles.html', {'form': form})


@login_required(login_url='/login')
def journal_editors(request, id):
    journals_list = Editorials.objects.filter(created_by__id=id)
    form = journals_list
    return render(request, 'journal/journal_editors.html', {'form': form})