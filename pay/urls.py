from django.contrib import admin
from django.conf.urls import url,include
from pay import views

urlpatterns = [
    url('index1/',views.index1),
    url('buy/',views.buy),
    url('check_order',views.check_order),
    url('show/',views.show),
    url('order_list',views.order_list),
]