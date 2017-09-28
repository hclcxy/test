<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
        <base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/login2.css"/>
		<script src="js/jquery-1.7.1.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<script type="text/javascript">
		    (function (doc, win) {
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if(clientWidth>=640){
                    docEl.style.fontSize = '27px';
                }else{
                    docEl.style.fontSize = 27 * (clientWidth / 640) + 'px';
                }
            };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

	</script>
	<body>
		<header>
    		<div class="head">
        		<div class="title">登录</div>
        		<span class="h-lt" style="cursor:pointer" onclick="window.history.go(-1)"><i class="h-bk"></i></span>
        		<a class="h-rt" href="#"></a>
    		</div>
		</header>
		<div class="hh">
			<div class="logo">
				<img src="img/blog.png">
			</div>
		</div>
		
		<div class="phone">
			<div class="oimg">
				<img src="img/sj.png"/>
				<span>手机号码</span>
			</div>
			<input type="text" placeholder="请输入您的手机号码" class="inp" id="phone"/>
			<input id="btnSendCode" type="button" value="获取验证码" onClick="sendMessage()" />
		</div>
		
		<div class="phone">
			<div class="oimg">
				<img src="img/yzm.png"/>
				<span>验证码</span>
			</div>
			<input type="text" placeholder="请输入验证码" name="smsCode" id="smsCode"/>
		</div>
		
		<div class="to">
			<a href="javascript:void(0);" onClick="userLogin()">登&nbsp;录</a>
		</div>
		
		<a href="Register" class="tolog">注册</a>
	</body>
	<script type="text/javascript">
var InterValObj; //timer变量，控制时间
var count = 30; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var codeLength = 6;//验证码长度
function sendMessage() {
curCount = count;
var dealType; //验证方式
var uid=$("#uid").val();//用户uid
var phone=$("#phone").val();
if ($("#phone").attr("checked") == true) {
	dealType = "phone";
}
else {
	dealType = "email";
}
//产生验证码
for (var i = 0; i < codeLength; i++) {
	code += parseInt(Math.random() * 9).toString();
}
//设置button效果，开始计时
	$("#btnSendCode").attr("disabled", "true");
	$("#btnSendCode").val( + curCount + "秒再获取");
	InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
//向后台发送处理数据
	$.ajax({
		type: "GET", //用GET方式传输
		dataType: "json", //数据格式:JSON
		url: 'sms', //目标地址
		data:"phone="+phone,
		//data: "dealType=" + dealType +"&uid=" + uid + "&code=" + code,
		//error: function (XMLHttpRequest, textStatus, errorThrown) { },
		success: function (msg){ 
			if(msg.code==200){
				alert("验证码发送成功");
			}
			else{
				alert("验证码发送失败");
			}
		}
	});
}
//timer处理函数
function SetRemainTime() {
	if (curCount == 0) {                
		window.clearInterval(InterValObj);//停止计时器
		$("#btnSendCode").removeAttr("disabled");//启用按钮
		$("#btnSendCode").val("重新发送验证码");
		code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
	}
	else {
		curCount--;
		$("#btnSendCode").val( + curCount + "秒再获取");
	}
}
function userLogin(){
    var  phone=$("#phone").val();
	var  smsCode=$("#smsCode").val();
	 $.ajax({
		type: "POST", //用POST方式传输
		//dataType: "text", //数据格式:JSON
		url: 'userLogin', //目标地址
		data: "phone=" + phone +"&smsCode="+smsCode,
		//error: function (XMLHttpRequest, textStatus, errorThrown) { alert(errorThrown);},
		success: function (msg){
			alert(msg.data.userType);
		  if(msg.userType==4){
		  window.location.href="";	 //客服页面
		  }
		  if(msg.userType==5){
		  window.location.href="";//专家页面
		  }
		  else{
		  window.location.href==""//入口页面
		  }
		}
	});  
	
}

</script>
</html>