from django.db import models

# Create your models here.
#coding=utf-8
from django.db import models
from df_goods.models import *

# Create your models here.
from django.db import models

class Goods(models.Model):
    name = models.CharField(max_length=32)
    price = models.FloatField()
    def __str__(self):
        return self.name

class Order(models.Model):
    no = models.CharField(max_length=64)
    goods = models.ForeignKey('df_goods.GoodsInfo',on_delete=models.CASCADE)
    status_choices = (
        (1,'未支付'),
        (2,'已支付'),
    )
    status = models.IntegerField(choices=status_choices,default=1)
    def __int__(self):
        return self.status