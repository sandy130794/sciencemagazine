# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, redirect, HttpResponse, HttpResponseRedirect
from django.contrib.auth import login, authenticate
from users.user_forms import SignUpForm, EditProfileForm, ImageUploadForm
from django.contrib.auth.forms import UserChangeForm, PasswordChangeForm
from django.contrib.auth.models import User
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from annoying.functions import get_object_or_None
from models import UserProfile

# Create your views here.
@login_required(login_url='/login')
def homepage(request):
    return render(request,'base.html')

def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return HttpResponseRedirect('/user/login/')
    else:
        form = SignUpForm()
    return render(request, 'users/signup.html', {'form': form})


@login_required(login_url='/login')
def view_profile(request):
    form = {'user': request.user}
    return render(request, 'users/profile.html', form)

@login_required(login_url='/login')
def edit_profile(request):
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance = request.user)

        if form.is_valid():
            form.save()
            return redirect('/profile/')
    else:
        form = EditProfileForm(instance = request.user)
        args = {'form' : form}
        return render(request, 'users/edit_profile.html', args)

@login_required(login_url='/login')
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(data=request.POST, user = request.user)

        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect('/profile/')

        else:
            return redirect('/change-password/')

    else:
        form = PasswordChangeForm(user = request.user)
        args = {'form': form}
        return render(request, 'users/change_password.html', args)

def upload_pic(request, id=id):
    myrecord = get_object_or_None(UserProfile, id=id)
    if request.method == 'POST':
        form = ImageUploadForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            image = form.save(commit=False)
            image.created_by_id = request.user
            image.image = request.FILES['image']
            # form = ImageUploadForm(image= request.Files['image'])
            image.save()
            return redirect('/profile/')
    else:
        form = ImageUploadForm()
        return render(request, 'users/upload_image.html', {'form': form })

