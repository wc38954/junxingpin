from django.conf.urls import url,include
from . import views

app_name = 'shoppingCar'
urlpatterns = [
    url(r'^$',views.myCar),
    url(r'buyNow/',views.buyNow,name="buyNow"),
    url(r'addcar/(\d+)/',views.addCar),
    url(r'changeCart/(\d+)',views.changeCart)
    ]