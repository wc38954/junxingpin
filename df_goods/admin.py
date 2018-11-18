from django.contrib import admin



# Register your models here.
from df_goods.models import *

#在管理界面中添加一个商品类的同时可以添加商品
class TypeGoods(admin.TabularInline):
    model=GoodsInfo
    extra = 4

@admin.register(TypeInfo)
class TypeAdmin(admin.ModelAdmin):
    inlines = [TypeGoods]
    list_display=['id','ttitle','isDelete']
    list_filter = ['ttitle']
    list_per_page = 20
    search_fields = ['ttitle']



@admin.register(GoodsInfo)
class GoodsAdmin(admin.ModelAdmin):
    list_display = ['id','gtitle','gpic','isDelete','gunit','gjianjie','gkucun','gcontent','gtype']
    list_filter = ['gtitle']
    list_per_page = 20
    search_fields = ['gtitle']

