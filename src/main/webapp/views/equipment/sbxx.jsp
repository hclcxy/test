<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>设备信息</title>
		<base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/sbxx.css"/>
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
        		<div class="title">设备信息</div>
        		<span class="h-lt" style="cursor:pointer" onclick="window.history.go(-1)"><i class="h-bk"></i></span>
        		<a class="h-rt" href="#"></a>
    		</div>
		</header>
		<div class="section">
			<div class="search">
				<div class="left">
					<div class="oo">
						<a href="jchat.html">
							<img src="img/sea.png"/>
						</a>
					</div>
					<input type="text" placeholder="请输入设备型号"/>
				</div>
			</div>
		</div>
		
		<div class="big">
			<div class="tit">
				<span class="bor"></span>
				<span class="na">大型设备</span>
			</div>
			<ul class="oul">
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">VIP专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">VIP专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">VIP专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">VIP专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">VIP专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">VIP专享</div>
					</a>
				</li>
			</ul>
		</div>
		
		
		
		<div class="big">
			<div class="tit">
				<span class="bor"></span>
				<span class="na">小型设备</span>
			</div>
			<ul class="oul">
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">注册专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">注册专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">注册专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">注册专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">注册专享</div>
					</a>
				</li>
				<li class="marquie">
					<a href="views/equipment/information.jsp">
					<img src="img/banner.png" />
					<div class="mask">注册专享</div>
					</a>
				</li>
			</ul>
		</div>
	</body>
</html>
