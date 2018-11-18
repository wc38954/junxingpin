from django.conf.urls import url

from . import views
urlpatterns = [

    url(r'^register/$', views.register),
    url(r'^register_handle/$', views.register_handle),
    url(r'^login/$', views.login),
    url(r'^register_exist/$', views.register_exist),
    url(r'^login_handle/$', views.login_handle),
    url(r'^sign_out/$', views.sign_out),
    url(r'^user_center_info/$', views.user_center_info),
    url(r'^user_center_side/$', views.user_center_side),
    url(r'^user_center_order/$', views.user_center_order),
    url(r'^user_side_handler/$', views.user_side_handler),

]