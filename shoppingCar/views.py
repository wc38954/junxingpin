from django.shortcuts import render,redirect
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
# Create your views here.
from .models import MyCars
from df_goods.models import GoodsInfo

def myCar(request):
    # if request.method == "POST":
    #     name = request.POST.get('name')
    #     status = 0
    #     result = "Error!"
    #     return HttpResponse(json.dumps({
    #         "status": status,
    #         "result": result
    #     }))

    uname = request.session.get('user_name')
    uid = request.session.get('id')
    if uname:
        productList = []
        productOne = {}
        Ap = MyCars.objects.filter(user_id=uid)
        for item in Ap:
            productOne['pdName']=item.goods.gtitle
            productOne['pdId']=item.goods_id
            productOne['pdPrice']=item.goods.gprice
            productOne['pdCount']=item.count
            productOne['gpic']=item.goods.gpic
            productList.append(productOne)
            productOne = {}
        return render(request,'shoppingCar/cart.html',{'productList':productList,'uname':uname})
    else:
        return redirect('/user/login/')

def buyNow(request):
    uname = request.session.get('user_name')
    pdId = request.GET.get('pdId')
    count = request.GET.get('num')
    if uname:
        productList = []
        productOne = {}
        goods = GoodsInfo.objects.filter(id=pdId)[0]
        productOne['pdName'] = goods.gtitle
        productOne['pdId'] = pdId
        productOne['pdPrice'] = goods.gprice
        productOne['pdCount'] = count
        productOne['gpic'] = goods.gpic
        productList.append(productOne)
        productOne = {}
        return render(request, 'shoppingCar/cart.html', {'productList': productList, 'uname': uname,'buynow':1})
    else:
        return redirect('/user/login/')


@csrf_exempt
def addCar(request,id):
    # 判断用户是否登录
    user_name = request.session.get('user_name')
    user_id = request.session.get('id')
    if user_name == None:
        #没登录
        return JsonResponse({"data": "-1", "status": "nologin"})
    else:
        user = MyCars.objects.filter(user_id=user_id,goods_id=id)
        if user:
            # print(user[0].user_id)
            if user[0].goods_id == int(id):
                user.update(count=user[0].count + int(request.POST.get('num')))
                return redirect('/%s'%id)
            inputCar = MyCars.objects.create(user_id=user_id,
                                             goods_id=id,
                                             count=request.POST.get('num'))
            inputCar.save()
            return redirect('/%s' % id)
        else:
            inputCar = MyCars.objects.create(user_id=user_id,
                                             goods_id=id,
                                             count=request.POST.get('num'))
            inputCar.save()
            return redirect('/%s'%id)

@csrf_exempt
def changeCart(request,flag):
    # 判断用户是否登录
    user_name = request.session.get('user_name','')
    user_id = request.session.get('id','')
    user = MyCars.objects.filter(user_id=user_id)
    if user_name and user_id:
        pdId = request.POST.get('pdId')
        count = request.POST.get('count')
        if flag == "0":
            producti = MyCars.objects.filter(user_id=user_id,goods_id=pdId)
            producti.update(count=producti[0].count + 1)
            return JsonResponse({"data": "-1", "status": "success"})
        elif flag == "1":
            producti = MyCars.objects.filter(user_id=user_id, goods_id=pdId)
            producti.update(count=producti[0].count - 1)
            return JsonResponse({"data": "-1", "status": "success"})
        elif flag == '2':
            print(pdId)
            producti = MyCars.objects.filter(user_id=user_id, goods_id=pdId)
            producti.delete()
            return JsonResponse({"data": "0", "status": "success"})
        elif flag == '3':
            producti = MyCars.objects.filter(user_id=user_id, goods_id=pdId)
            producti.update(count=count)
            return JsonResponse({"data": "-1", "status": "success"})

    else:
        # 没登录
        return JsonResponse({"data": "-1", "status": "error"})


