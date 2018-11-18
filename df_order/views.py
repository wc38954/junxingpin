from decimal import Decimal
import json

from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from df_user.models import *
from df_user import user_decorator
from shoppingCar.models import *
from datetime import datetime
from time import sleep
from decimal import Decimal
from django.db import transaction
from .models import *

# Create your views here.

# @csrf_exempt
# @user_decorator.login
# def orderinfo(request):
#     uname = request.session.get('user_name','')
#     if uname:
#         context = {'uname':uname}
#         user = UserInfo.objects.filter(uname=uname)
#         cars= MyCars.objects.all()
#         # order = OrderInfo.objects.create(Ototal=request.POST.get('price'))
#         context = {'uname': uname, 'users': user,'cars':cars}
#         return render(request,'df_order/order.html',context)
#     else:
#         return redirect('/user/login')

@csrf_exempt
@user_decorator.login
def orderinfo(request):
    uname = request.session.get('user_name','')
    if uname:
        pid = request.GET.get('pid')
        if pid:
            return HttpResponse('立即购买，呃呃呃')
        pids = request.GET.get('pids')
        pids = json.loads(pids)
        user = UserInfo.objects.filter(uname=uname)
        cars = []
        for pid in pids:
            car = MyCars.objects.filter(user_id=user[0].id,goods_id=pid)
            cars+=car
        context = {'uname': uname, 'users': user,'cars':cars}
        return render(request,'df_order/order.html',context)
    else:
        return redirect('/user/login')


@csrf_exempt
def orderhander(request):
    price = request.POST.get('price')
    uid = request.session.get('id')
    cids = request.POST.get('cids')
    cids = cids.split(' ')[1:]
    hprice = 0
    for cid in cids:
        car = MyCars.objects.filter(user_id=uid, id=cid)
        hprice = hprice + car[0].count * car[0].goods.gprice

    if float(hprice+10) == float(price):
        order = OrderInfo()
        order.Ototal = hprice+10
        order.user_id = uid
        order.save()
        # order = OrderInfo.objects.create(Ototal=hprice+10,
        #                                  user_id=uid,
        #                                  )
        # order.save()

        return JsonResponse({"data": "-1", "status": "success"})
    else:
        order = OrderInfo.objects.filter(user_id=uid)
        order.delete()
        return JsonResponse({"data": "-1", "status": "false"})