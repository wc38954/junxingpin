from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse


from django.shortcuts import render

# Create your views here.
import uuid

from django.views.decorators.csrf import csrf_exempt

from pay.models import *
from utils import pay
from django.shortcuts import render,HttpResponse,redirect
from df_goods.models import *
from shoppingCar.models import *
from df_order.models import *



def index1(request):
    """
    商品页面
    """
    good_list = Goods.objects.all()
    return render(request, "pay/index1.html", {"goods_list":good_list})

@csrf_exempt
def buy(request):
    """
    购买，支付
    """
    # 获取用户购买的物品对象
    uname = request.session.get('user_name')
    if uname:
        price = OrderInfo.objects.last()
        # print(price)
        # 对生成订单加密，并添加进入数据库
        no = str(uuid.uuid4())
        obj = MyCars.objects.all()[0]
        print(obj.id)

        # Order.objects.create(no=no,goods_id=obj.id)
        print('商品名:'+obj.goods.gtitle)

        # 全局变量
        alipay = pay.AliPay(
            appid="2016091700528730",
            app_notify_url="http://127.0.0.1:8000/check_order/",  # POST,发送支付状态信息
            return_url="http://127.0.0.1:8000/pay/show/",  # GET,将用户浏览器地址重定向回原网站
            app_private_key_path="utils/alipay/ying_yong_si_yao.txt",
            alipay_public_key_path="utils/alipay/zhi_fu_bao_gong_yao.txt",
            debug=True,  # 默认True测试环境、False正式环境
        )

        query_params = alipay.direct_pay(
            subject=obj.goods.gtitle,
            out_trade_no=no,    # 商品订单号
            total_amount=str(price.Ototal),  # 交易金额(保留两位小数)
        )
        # 支付宝提供的url网关
        pay_url = "https://openapi.alipaydev.com/gateway.do?{0}".format(query_params)
        return redirect(pay_url)
    else:
        return redirect('/user/login')

# @csrf_exempt
def check_order(request):
    """
    POST请求，支付宝通知支付信息，我们修改订单状态
    """
    if request.method == 'POST':
        # 全局变量
        alipay = pay.AliPay(
            appid="2016091700528730",
            app_notify_url="http://127.0.0.1:8000/check_order/",  # POST,发送支付状态信息
            return_url="http://127.0.0.1:8000/show/",  # GET,将用户浏览器地址重定向回原网站
            app_private_key_path="utils/alipay/ying_yong_si_yao.txt",
            alipay_public_key_path="utils/alipay/zhi_fu_bao_gong_yao.txt",
            debug=True,  # 默认True测试环境、False正式环境
        )

        from urllib.parse import parse_qs
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)

        post_dict = {}
        for k,v in post_data.items():
            post_dict[k] = v[0]
        sign = post_dict.pop('sign',None)
        status = alipay.verify(post_dict,sign)
        if status:
            # 支付成功
            out_trade_no = post_dict['out_trade_no']
            Order.objects.filter(no=out_trade_no).update(status=2)
            return HttpResponse('success')
        else:
            return HttpResponse('filed')
    # if request.method == "POST":                        # post请求支付宝异步通知
    #     processed_dict = {}                             # 接收支付宝传递参数
    #     for key, value in request.POST.items():         # 循环参数
    #         processed_dict[key] = value                 # 将参数添加到字典
    #     sign = processed_dict.pop('sign', None)         # 单独拿出sign字段
    #
    #     # 传递参数初始化支付类
    #     alipay = pay.AliPay(
    #         appid="2016091700528730",                                   # 设置签约的appid
    #         app_notify_url="http://127.0.0.1:8000/check_order/",           # 异步支付通知url
    #         app_private_key_path='utils/alipay/ying_yong_si_yao.txt',                      # 设置应用私钥
    #         alipay_public_key_path="utils/alipay/zhi_fu_bao_gong_yao.txt",                 # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
    #         debug=True,  # 默认False,                                   # 设置是否是沙箱环境，True是沙箱环境
    #         return_url="http://127.0.0.1:8000/pay/show/"                # 同步支付通知url
    #     )
    #
    #     # 验证支付宝返回的合法性
    #     yan_zhen = alipay.verify(processed_dict, sign)
    #     if yan_zhen is True:                                                # 判断如果合法
    #         out_trade_no = processed_dict.get('out_trade_no', None)         # 商户订单号
    #         trade_no = processed_dict.get('trade_no', None)                 # 支付宝交易号
    #         buyer_id = processed_dict.get('buyer_id', None)                 # 买家支付宝用户号
    #         trade_status = processed_dict.get('trade_status', None)         # 交易状态
    #         total_amount = processed_dict.get('total_amount', None)         # 订单金额
    #         receipt_amount = processed_dict.get('receipt_amount', None)     # 实收金额
    #         subject = processed_dict.get('subject', None)                   # 订单标题
    #         gmt_payment = processed_dict.get('gmt_payment', None)           # 交易付款时间
    #
    #         # 数据库操作
    #         print(out_trade_no)
    #         print(trade_no)
    #         print(buyer_id)
    #         print(trade_status)
    #         print(total_amount)
    #         print(receipt_amount)
    #         print(subject)
    #         print(gmt_payment)
    #
    #         # 向支付宝返回success，告诉他我们已经处理，不然他会不停的通知
    #         return HttpResponse('success')
# @csrf_exempt
def show(request):
    """
    回到我们的页面
    """
    if request.method == "GET":
        alipay = pay.AliPay(
            appid="2016091700528730",
            app_notify_url="http://127.0.0.1:8000/check_order/",  # POST,发送支付状态信息
            return_url="http://127.0.0.1:8000/pay/show/",  # GET,将用户浏览器地址重定向回原网站
            app_private_key_path="utils/alipay/ying_yong_si_yao.txt",
            alipay_public_key_path="utils/alipay/zhi_fu_bao_gong_yao.txt",
            debug=True,  # 默认True测试环境、False正式环境
        )

        params = request.GET.dict()
        # print(params)
        sign = params.pop('sign', None)
        status = alipay.verify(params, sign)
        if status:
            out_trade_no= params.pop('out_trade_no', None)
            Order.objects.filter(no=out_trade_no).update(status=2)
            uname = request.session.get('user_name', '')
            MyCars.objects.all().delete()
            # return HttpResponse('支付成功')
            return redirect('/')
        else:
            return HttpResponse('支付失败')
    else:
        return HttpResponse('只支持GET请求')


def order_list(request):
    """
    查看订单状态
    """
    order = Order.objects.all()
    print(order)
    return render(request, 'pay/order_list.html', {'orders':order})