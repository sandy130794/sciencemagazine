# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, HttpResponseRedirect
from annoying.functions import get_object_or_None
from models import Articles
from article_form import Articles_Form
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required(login_url='/login')
def article_form(request,id):
    myrecord = get_object_or_None(Articles, id=id)
    if request.method == 'POST':
        form = Articles_Form(request.POST,request.FILES,instance=myrecord)
        if form.is_valid():
            # articles = form.save(commit=False)
            # articles.created_by = request.id
            # articles.save()
            form.save()
            return HttpResponseRedirect('/journal/list')
    else:
        if myrecord:
            form = Articles_Form(instance=myrecord)
        else:
            form = None
    return render(request, 'article/article_form.html', {'form': form})

@login_required(login_url='/login')
def article_list(request):
    article_list = Articles.objects.all()
    return render(request, 'article/article_display.html', {'article_display':article_list})

@login_required(login_url='/login')
def delete_article(request, id):
    record = Articles.objects.get(pk = id)
    record.delete()
    article_list = Articles.objects.filter()
    form = article_list
    return HttpResponseRedirect('/article/list')


@login_required(login_url='/login')
def article_view(request, id):
    article_list = Articles.objects.filter(id=id)
    return render(request, 'article/article_view.html', {'article_display':article_list})

@login_required(login_url='/login')
def article_create(request, journal_id):
    # myrecord = get_object_or_None(Articles, id=id)
    if request.method == 'POST':
        form = Articles_Form(request.POST,request.FILES)
        if form.is_valid():
            articles = form.save(commit=False)
            articles.created_by_id = journal_id
            articles.save()
            # form.save()
            return HttpResponseRedirect('/journal/list/')
    else:
        form = Articles_Form()
    return render(request, 'article/article_form.html', {'form': form})
