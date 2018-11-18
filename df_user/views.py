#coding=utf-8
from django.shortcuts import render,redirect
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
from df_user.models import *
from hashlib import sha1
from . import user_decorator

# Create your views here.




def register(request):
    return render(request,'df_user/register.html')


#禁用csrf
@csrf_exempt
def register_handle(request):
    #接收用户输入
    post = request.POST
    uname = post.get('user_name')
    upwd = post.get('pwd')
    upwd2 = post.get('cpwd')
    uemail = post.get('email')

    #判断两次密码
    if upwd !=upwd2:
        return redirect('/user/register/')
    #密码加密
    s1 =sha1()
    s1.update(upwd.encode())
    upwd3=s1.hexdigest()

    #创建对象
    user=UserInfo()
    user.uname=uname
    user.upwd=upwd3
    user.uemail=uemail
    user.save()
    #注册成功转到登录页面
    return redirect('/user/login/')


def register_exist(request):
    uname = request.GET.get('uname')
    count = UserInfo.objects.filter(uname=uname).count()
    return JsonResponse({'count':count})

def login(request):
    uname = request.COOKIES.get('uname','')
    context = {'title':'用户登录','error_name':0,'error_pwd':0,'uname':uname}
    return render(request,'df_user/login.html',context)

@csrf_exempt
def login_handle(request):
    #接收请求信息
    uname = request.POST.get('username')
    upwd = request.POST.get('pwd')
    jizhu = request.POST.get('jizhu',0)

    #根据用户名查询对象
    users = UserInfo.objects.filter(uname=uname)
    #用户存在时
    if len(users)==1:
        s1=sha1()
        s1.update(upwd.encode())
        if s1.hexdigest()==users[0].upwd:
            red = HttpResponseRedirect('/')
            # HttpResponseRedirect
            if jizhu!=0:
                #创建cookie
                red.set_cookie('uname',uname)
            else:
                #设置cookie过期时间
                red.set_cookie('uname',uname, max_age=-1)
            request.session['id']=users[0].id
            request.session['user_name']=uname
            return red
        else:
            context = {'title':'用户登录','error_name':0,'error_pwd':1,'uname':uname,'upwd':upwd}
            return render(request,'df_user/login.html',context)


    else:
        #用户名不存在时
        context = {'title':'用户登录','error_name':1,'error_pwd':0,'uname':uname,'upwd':upwd}
        return render(request,'df_user/login.html',context)

#退出登录状态
def sign_out(request):
    if 'id' in request.session and 'user_name' in request.session:
        del request.session['id']
        del request.session['user_name']
    return redirect('/')

@user_decorator.login
def user_center_info(request):
    uname = request.session.get('user_name', '')
    context = {'uname': uname}
    return render(request,'df_user/user_center_info.html',context)

@user_decorator.login
def user_center_side(request):
    uname = request.session.get('user_name', '')
    user = UserInfo.objects.filter(uname=uname)[0]
    context = {'uname': uname,'user':user}
    return render(request,'df_user/user_center_site.html',context)

def user_side_handler(request):



    return redirect('/order/orderinfo/')


@user_decorator.login
def user_center_order(request):
    uname = request.session.get('user_name', '')
    context = {'uname': uname}
    return render(request,'df_user/user_center_order.html',context)

