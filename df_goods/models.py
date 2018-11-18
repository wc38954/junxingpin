from django.db import models
from tinymce.models import HTMLField
#安装富文本编辑器包tinymce
#pip3 install django-tinymce
# 在settings.py中为INSTALLED_APPS添加编辑器应用
# INSTALLED_APPS = (
#     ...
#     'tinymce',
# )
# 在settings.py中添加编辑配置项
# TINYMCE_DEFAULT_CONFIG = {
#     'theme': 'advanced',
#     'width': 600,
#     'height': 400,
# }
# 在根urls.py中配置
# urlpatterns = [
#     ...
#     url(r'^tinymce/', include('tinymce.urls')),
# ]



# Create your models here.
class TypeInfo(models.Model):
    ttitle = models.CharField(max_length = 50)
    isDelete = models.BooleanField(default=False)
    def __str__(self):
        return self.ttitle


class GoodsInfo(models.Model):
    gtitle=models.CharField(max_length=20)
    gpic = models.ImageField(upload_to='df_goods')
    gprice = models.DecimalField(max_digits=10,decimal_places=2)
    #max_digits位数,decimal_places=2 小数位２位
    isDelete = models.BooleanField(default=False)
    gunit = models.CharField(max_length=20)
    # gunit价格单位
    gclick = models.IntegerField()
    #点击量，用来排序
    gjianjie = models.CharField(max_length=200)
    #商品简介
    gkucun = models.IntegerField()
    #商品库存
    gcontent =HTMLField()
    #商品详情
    gtype = models.ForeignKey(TypeInfo,on_delete=models.CASCADE)
    #外键，商品分类
    def __str__(self):
        return self.gtitle
