from django.contrib import admin

# Register your models here.
from django.contrib import admin

# Register your models here.

from .models import *
@admin.register(Goods)
class GoodAdmin(admin.ModelAdmin):
    list_display=['name','price']
    list_filter=['name']
    search_fields=['name']
    list_per_page = 20


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ['no','goods','status']
    list_filter = ['no','status']
    search_fields = ['no']
    list_per_page = 20