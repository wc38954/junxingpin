from django.contrib import admin
from .models import *
# Register your models here.
@admin.register(OrderInfo)
class orderadmin(admin.ModelAdmin):
    list_display = ['id','user','oIsPay','Ototal']