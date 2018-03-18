# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, HttpResponseRedirect
from annoying.functions import get_object_or_None
from models import Editorials
from editor_form import EditorialForm
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required(login_url='/login')
def editorial_form(request,id):
    myrecord = get_object_or_None(Editorials, id=id)
    if request.method == 'POST':
        form = EditorialForm(request.POST,request.FILES,instance=myrecord)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/journal/list')
    else:
        if myrecord:
            form = EditorialForm(instance=myrecord)
        else:
            form = None
    return render(request, 'editor/editor_form.html', {'form': form})

@login_required(login_url='/login')
def editor_list(request):
    editor_list = Editorials.objects.all()
    return render(request, 'editor/editor_display.html', {'editor_display': editor_list})

@login_required(login_url='/login')
def delete_editor(request, id):
    record = Editorials.objects.get(pk = id)
    record.delete()
    article_list = Editorials.objects.filter()
    form = article_list
    return HttpResponseRedirect('/editor/list')


@login_required(login_url='/login')
def editor_view(request, id):
    editor_list =Editorials.objects.filter(id=id)
    return render(request, 'editor/editor_view.html', {'editor_display':editor_list})

@login_required(login_url='/login')
def editor_create(request, journal_id):
    # myrecord = get_object_or_None(Editorials, id=id)
    if request.method == 'POST':
        form = EditorialForm(request.POST,request.FILES)
        if form.is_valid():
            editor = form.save(commit=False)
            editor.created_by_id = journal_id
            editor.save()
            # form.save()
            return HttpResponseRedirect('/journal/list/')
    else:
        form = EditorialForm()
    return render(request, 'editor/editor_form.html', {'form': form})