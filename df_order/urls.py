from django.conf.urls import url

from df_order import views
urlpatterns = [

    url(r'^orderinfo/$', views.orderinfo),
    url(r'^orderhander/$', views.orderhander),


]