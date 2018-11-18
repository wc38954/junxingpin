from django.db import models

# Create your models here.
class MyCars(models.Model):
    user = models.ForeignKey('df_user.UserInfo',on_delete=models.CASCADE)
    goods = models.ForeignKey('df_goods.GoodsInfo',on_delete=models.CASCADE)
    count = models.IntegerField()
    def __str__(self):
        return '%s'%self.user




