from django.conf.urls import url
from . import views
from django.contrib.auth.views import login, logout

urlpatterns = [
    url(r'^$', views.homepage, name='home'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^login/$', login, {'template_name' : 'users/login.html'}),
    url(r'^logout/$', logout, {'template_name': 'users/logout.html'}),
    url(r'^profile/$', views.view_profile, name='profile'),
    url(r'^edit/$', views.edit_profile, name = 'edit_profile'),
    url(r'^change-password/$', views.change_password, name='change_password'),
    url(r'^upload-image/$', views.upload_pic, name='upload_image')
]