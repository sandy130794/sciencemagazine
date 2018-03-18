from django.conf.urls import url
from . import views
from django.contrib.auth.decorators import login_required

urlpatterns = [
    url(r'^$', views.journal_form, name="journal_form"),
    url(r'^(?P<id>\d+)/$', views.journal_form, name="journal_edit"),
    url(r'^list/$', views.journal_list, name='journal_list'),
    url(r'^delete/(?P<id>\d+)/$', views.delete_journal, name='Journal_delete'),
    url(r'^articles/(?P<id>\d+)/$', views.journal_articles, name="journal_articles"),
    url(r'^editors/(?P<id>\d+)/$', views.journal_editors, name="journal_editors"),
]