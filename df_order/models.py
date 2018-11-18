from django.db import models

# Create your models here.
class OrderInfo(models.Model):
    user = models.ForeignKey('df_user.UserInfo',on_delete=models.CASCADE)
    oIsPay = models.BooleanField(default=False)
    Ototal = models.DecimalField(max_digits=10,decimal_places=2)

class OrderDetailInfo(models.Model):
    goods = models.ForeignKey('df_goods.GoodsInfo',on_delete=models.CASCADE)
    order = models.ForeignKey(OrderInfo,on_delete=models.CASCADE)
