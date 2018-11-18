from django.contrib import admin

# Register your models here.
from df_user.models import *


@admin.register(UserInfo)
class UserInfoAdmin(admin.ModelAdmin):
    list_display=['uname','upwd','uemail','ushou','uaddress','uyoubian','uphone']
    list_filter=['uname']
    search_fields=['uname']
    list_per_page = 20