from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.article_form, name="article_form"),
    url(r'^(?P<id>\d+)$', views.article_form, name="article_edit"),
    url(r'^list/$', views.article_list, name='article_list'),
    url(r'^view/(?P<id>\d+)$', views.article_view, name="article_view"),
    url(r'^create/(?P<journal_id>\d+)$', views.article_create, name="article_create"),
    url(r'^delete/(?P<id>\d+)/$', views.delete_article, name='article_delete'),
]