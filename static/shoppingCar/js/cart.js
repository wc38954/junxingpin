/**
 * Created by tarena on 18-9-15.
 */





$(document).ready(function(){

    // var mlist = $('.num_add').parent().parent().children('.col05').text().split('元');
    // var zprice = 0;
    // var pdcount = $('.num_add').parent().children('span').text().split(',');
    // var totalNum = 0;
    // for(i=0;i<mlist.length-1;i++){
		// $('#pdcount').val(pdcount[i]);
		// $('.num_show')[i].value = pdcount[i];
		// if($('.col07').parent().children().children('.checkone').prop('checked')){
		// totalNum = totalNum + parseInt(pdcount[i]);
    //     zprice = zprice + parseFloat(mlist[i])*pdcount[i];
		// }
    //     $('.cart_list_td').children('.col07')[i].innerHTML = ((parseFloat(mlist[i])*pdcount[i]).toFixed(2)+"元");
    // }
    // $(".totalNum").text(totalNum);
    // $(".total_count").children('em').text(totalNum);
    // $('.zprice').text(zprice.toFixed(2));

    var totalp = 0;
    var totalc = 0;
    var totala = 0;
    $('.col07').each(function () {
        count=$(this).prev().find('span').text();
        console.log(count);
        $(this).prev().find('input').val(count);
        price=$(this).prev().prev().text();
        total0 = parseFloat(count)*parseFloat(price);
        $(this).text(total0.toFixed(2)+'元');
        if($(this).parent().children().children('.checkone').prop('checked')){
            totalp+=total0;
            totalc+=parseFloat(count);
        }
        totala+=parseInt(count)
    });
    $(".zprice").text(totalp.toFixed(2));
    $(".totalNum").text(totalc);
    $(".total_count").children('em').text(totala);
    console.log('坑爹');

    function total(){
        totalp = 0;
        totalc = 0;
        totala = 0;
        $('.col07').each(function () {
            count=$(this).prev().find('input').val();
            price=$(this).prev().prev().text();
            total0 = parseFloat(count)*parseFloat(price);
            $(this).text(total0.toFixed(2)+'元');

            if($(this).parent().children().children('.checkone').prop('checked')){
                totalp+=total0;
                totalc+=parseFloat(count);
            }
            totala+=parseInt(count)
        });
        $(".zprice").text(totalp.toFixed(2));
        $(".totalNum").text(totalc);
        $(".total_count").children('em').text(totala);
    }

    $("#order").click(function () {

        var howbuy = $(this).parent().children("input").val();
        if(howbuy == 'buynow'){
            pid = $('.add')[0].attributes.jia.nodeValue;
            window.location.href = location.protocol+"//"+location.hostname+':'+location.port+"/order/orderinfo"
            + "?pid="+pid
        }else{
        var pids = new Array();
        var i = 0;
        $('.add').each(function () {
            pid = $(this)[0].attributes.jia.nodeValue;
            if($(this).parent().parent().parent().children().children('.checkone').prop('checked')){
                pids[i]=pid;
                i++;
            }
        });
        window.location.href = location.protocol+"//"+location.hostname+':'+location.port+"/order/orderinfo"
            + "?pids="+JSON.stringify(pids)
        }




        // $.post("/order/orderinfo/",
        //     {'pids':JSON.stringify(pids)},
        //     function (data) {
        //     if(data.status == "nologin"){
        //         // window.location.href = location.protocol+"//"+location.hostname+':'+location.port+"/user/login"
        //     }
        //     }
        // )

    });

    $("#check_all").click(function () {
        state = $(this).prop('checked');
        $(':checkbox:not(#check_all)').prop('checked',state);
        total()
    });

    $(':checkbox:not(#check_all)').click(function () {
        if($(this).prop('checked')){
           if($(":checked").length+1==$(":checkbox").length){
               $("#check_all").prop('checked',true)
           }
        }else{
           $("#check_all").prop('checked',false)
        }
        total()
    });

    $(".add").click(function(){
        var numadd = $(this).parent().children('input').val();
        if(parseInt(numadd)>=1){
            numadd = parseInt(numadd)+1;
            $(this).parent().children('input').val(numadd);
            total();
            // var one_price = parseFloat($(this).parent().parent().parent().children(".col05").text());
            // $(this).parent().parent().parent().children(".col07").text(
            //     (parseFloat($(this).parent().parent().parent().children(".col07").text())+one_price).toFixed(2)+"元"
            //     );
            // var totalNum = parseInt($(".totalNum").text());
            // totalNum++;
            // $(".totalNum").text(totalNum);
            // $(".total_count").children('em').text(totalNum);
            // $('.zprice').text((parseFloat($('.zprice').text())+one_price).toFixed(2));
            pid = $(this)[0].attributes.jia.nodeValue;
            $.post("/shoppingCar/changeCart/0/",
                {'pdId':pid},
                function (data) {
                if(data.status == "nologin"){
                    window.location.href = location.protocol+"//"+location.hostname+':'+location.port+"/user/login"
                }else{
                    // if(data.data=="-1"){
                    //     window.location.href = "http://127.0.0.1:8000/myCar/"
                    // }
                }
                }
            )
        }

    });

	$(".minus").click(function(){
		var numinus = $(this).parent().children("input").val();
		if(parseInt(numinus)-1>0){
		numinus = parseInt(numinus)-1;
		$(this).parent().children('input').val(numinus);
            total();
        // var one_price = parseFloat($(this).parent().parent().parent().children(".col05").text());
  		// $(this).parent().parent().parent().children(".col07").text(
  		// 	(parseFloat($(this).parent().parent().parent().children(".col07").text())-one_price).toFixed(2)+"元"
  		// 	);
        //
        // var totalNum = parseInt($(".totalNum").text());
        // totalNum--;
        // $(".totalNum").text(totalNum);
        // $(".total_count").children('em').text(totalNum);
        // $('.zprice').text((parseFloat($('.zprice').text())-one_price).toFixed(2));
        pid = $(this)[0].attributes.jian.nodeValue;
        $.post("/shoppingCar/changeCart/1/",
            {'pdId':pid},
            function (data) {
            if(data.status == "nologin"){
                window.location.href = location.protocol+"//"+location.hostname+':'+location.port+"/user/login"
            }
            })
	    }
    });

	$(".delaCar").click(function () {
	    pid = $(this)[0].attributes.pdid.nodeValue;
	    console.log(pid);
        $.post("/shoppingCar/changeCart/2/",{'pdId':pid},
        function (data) {
            if(data.status=="success"){
                window.location.href = location.href;
                // location.reload();
            }else if(data.status=="nologin"){
                // window.location.href = "http://127.0.0.1:8000/user/login/"
                window.location.href = location.protocol+"//"+location.hostname+':'+location.port+"/user/login"
            }
        })
    });

	$(".num_show").blur(function () {
    count=$(this).val();
    if(count<=0){
        alert('请输入正确的数量');
        $(this).focus();
        return;
    }else if(count>=100){
        alert('数量不能超过100');
        $(this).focus();
        return;
    }else{
        pid = $(this)[0].attributes.show.nodeValue;
        $.post("/shoppingCar/changeCart/3/",{'pdId':pid,'count':count},
        function (data) {
            if(data.status=="success"){
                total();
            }
        }
        )
    }

    });


 });

