from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.editorial_form, name="editor_form"),
    url(r'^(?P<id>\d+)$', views.editorial_form, name="editor_edit"),
    url(r'^list/$', views.editor_list, name='editor_list'),
    url(r'^view/(?P<id>\d+)$', views.editor_view, name="editor_view"),
    url(r'^create/(?P<journal_id>\d+)$', views.editor_create, name="editor_create"),
    url(r'^delete/(?P<id>\d+)/$', views.delete_editor, name='editor_delete'),
]
