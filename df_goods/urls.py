from django.conf.urls import url,include
from django.contrib import admin

from df_goods import views
urlpatterns = [
    url(r'^$', views.index),
    url(r'^(\d+)/$', views.detail),
    url(r'^mysearch/$', views.mysearch),
]
