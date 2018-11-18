from django.contrib import admin

# Register your models here.
from .models import MyCars


@admin.register(MyCars)
class shoppingCarAdmin(admin.ModelAdmin):
    list_display = ['id','user','goods','count']#基本属性显示
    list_filter = ['user']  #过滤器
    search_fields = ['user','goods'] #搜索器
    list_per_page = 20#每页数据条数





    #添加修改页属性
    # fieldsets = [
    #     ('num',{'fields':['pdPrice']}),
    #     ('base',{'fields':['pdId','pdName']}),
    # ]      #给属性分组并排序,和上条不能同时使用

