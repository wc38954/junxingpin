from django.shortcuts import render
from django.core.paginator import Paginator,Page
from .models import *
# Create your views here.
def index(request):
    #首页
    uname = request.session.get('user_name','')
    typelist=TypeInfo.objects.all()
    #查询商品类型对应到商品，并排序,'-'代表降序,获得前四个
    type0 = typelist[0].goodsinfo_set.all()
    # 按照点击量来降序排序,获得前四个
    type01 = typelist[0].goodsinfo_set.all()
    type1 = typelist[1].goodsinfo_set.all()
    type11 = typelist[1].goodsinfo_set.all()
    type2 = typelist[2].goodsinfo_set.all()
    type21 = typelist[2].goodsinfo_set.all()
    type3 = typelist[3].goodsinfo_set.all()
    type31 = typelist[3].goodsinfo_set.all()
    type4 = typelist[4].goodsinfo_set.all()
    type41 = typelist[4].goodsinfo_set.all()
    type5 = typelist[5].goodsinfo_set.all()
    type51 = typelist[5].goodsinfo_set.all()
    # type0 = typelist[0].goodsinfo_set.order_by('-id')[0,4]
    # # 按照点击量来降序排序,获得前四个
    # type01 = typelist[0].goodsinfo_set.order_by('-gclick')[0,4]
    # type1 = typelist[1].goodsinfo_set.order_by('-id')[0, 4]
    # type11 = typelist[1].goodsinfo_set.order_by('-gclick')[0, 4]
    # type2 = typelist[2].goodsinfo_set.order_by('-id')[0, 4]
    # type21 = typelist[2].goodsinfo_set.order_by('-gclick')[0, 4]
    # type3 = typelist[3].goodsinfo_set.order_by('-id')[0, 4]
    # type31 = typelist[3].goodsinfo_set.order_by('-gclick')[0, 4]
    # type4 = typelist[4].goodsinfo_set.order_by('-id')[0, 4]
    # type41 = typelist[4].goodsinfo_set.order_by('-gclick')[0, 4]
    # type5 = typelist[5].goodsinfo_set.order_by('-id')[0, 4]
    # type51 = typelist[5].goodsinfo_set.order_by('-gclick')[0, 4]


    context = {'uname':uname,
               'type0': type0, 'type01': type01,
               'type1': type1, 'type11': type11,
               'type2': type2, 'type21': type21,
               'type3': type3, 'type31': type31,
               'type4': type4, 'type41': type41,
               'type5': type5, 'type51': type51,}
    return render(request,'df_goods/index.html',context)


def detail(request,id):
    uname = request.session.get('user_name', '')
    goods = GoodsInfo.objects.get(pk=int(id))
    goods.gclick=goods.gclick+1
    goods.save()
    # news = goods.gtype.goodsinfo_set.order_by('-id')[0:2]
    context={
            'title':goods.gtype.ttitle,
            'guest_cart':1,
            'g':goods,
            'id':id,
            'uname':uname
            }
    return render(request,'df_goods/detail.html',context)


def mysearch(request):
    return render(request,'search/list.html')
