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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主要内容区main</title>
<base href="<%=basePath%>">
<link href="pc/css/css.css" type="text/css" rel="stylesheet" />
<link href="pc/css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="pc/images/main/favicon.ico" />
 <link rel="stylesheet" href="pc/css/page.css" type="text/css"> 
<!-- <link rel="stylesheet" href="pc/css/page.css" type="text/css"> -->
<script src="static/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<!--  <script src="pc/js/vue.js" type="text/javascript" charset="utf-8"></script>-->
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(pc/images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(pc/images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(pc/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：用户管理</td>
  </tr>
  
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>
   		 <td width="90%" align="left" valign="middle">
	         <form method="post" action="">
	         <span>管理员：</span>
	         <input type="text" name="" value="" class="text-word">
	         <input name="" type="button" value="查询" class="text-but">
	         </form>
         </td>
  		  <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;"><a href="add.html" target="mainFrame" onFocus="this.blur()" class="add">新增管理员</a></td>
  		</tr>
	</table>
 
    
    <table class="ss"  width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr> 
        <th  align="center" valign="middle" class="borderright">全选</th>
        <th  align="center" valign="middle" class="borderright">姓名</th>
        <th  align="center" valign="middle" class="borderright">性别</th>
        <th  align="center" valign="middle" class="borderright">手机号</th>
        <th  align="center" valign="middle" class="borderright">公司</th>
        <th  align="center" valign="middle" class="borderright">行业</th>
        <th  align="center" valign="middle" class="borderright">会员等级</th>
        <th  align="center" valign="middle" class="borderright">职位</th>
        <th  align="center" valign="middle" class="borderright">设备类型</th>
        <th  align="center" valign="middle" class="borderright">是否审核</th>
        <th  align="center" valign="middle" class="borderright">公司邮箱</th>
        <th   align="center" valign="middle">编辑</th>
      </tr>
      
     
    </table>
    <table style="float:right;">
      <tr>
	    <td class="fenye" align="left" valign="top">&nbsp;&nbsp;<span></span>&nbsp;&nbsp;
	    <a href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" onclick="pageChange(this)" value="0">首页</a>&nbsp;&nbsp;
	    <a href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" onclick="pageChange(this)" value="">上一页</a>&nbsp;&nbsp;
	    <a href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" onclick="pageChange(this)" value="">下一页</a>&nbsp;&nbsp;
	    <a href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" onclick="pageChange(this)" value="">尾页</a></td>
    </tr>
    </table>
</table>
</body> 
<script src="static/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	 $(document).ready(function(){ 
  var userId= sessionStorage.getItem("userId");
	var token= sessionStorage.getItem("c_token");
	 $.ajax({ 
		type : "GET",
		dataType : "json", 
		url : 'user/getUserList', 
		data:{
			userId:userId,
		    token:token,
		},
		success : function(msg) {
			var data = msg.data.list;
			for(var i in data){
				var sex="";
				if(data[i].sex==0){
					sex="男";
				}if(data[i].sex==1){
					sex="女";
				}
				var userType="";
				if(data[i].userType==1){
					userType="A";
				}if(data[i].userType==2){
					userType="B";
				}if(data[i].userType==3){
					userType="C";
				}if(data[i].userType==4){
					userType="客服";
				}if(data[i].userType==5){
					userType="专家";
				}
				 var status="";
				if(data[i].status==1){
					status="待审核";
				}if(data[i].status==2){
					status="已审核";
				}
			 	$(".ss").append("<tr onMouseOut='this.style.backgroundColor='#ffffff'' onMouseOver='this.style.backgroundColor='#edf5ff''>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'><input type='checkbox'></td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].userName+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+sex+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].phone+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].company+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].industry+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+userType+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].positionName+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].equipmentType+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+status+"</td>"+
				        "<td align='center' valign='middle' class='borderright borderbottom'>"+data[i].email+"</td>"+
				        "<td align='center' valign='middle' class='borderbottom'>"+
				        "<a href='add.html' target='mainFrame' onFocus='this.blur()' class='add'>"+status+"</a>"+
				        "<span class='gray'>&nbsp;|&nbsp;</span>"+
				        "<a href='add.html' target='mainFrame' onFocus='this.blur()' class='add'>删除</a></td></tr>"); 
			}
			 
		}
     })
}); 
	 </script>
	 <script type="text/javascript">
	 $(document).ready(function(){ 
		 var userId= sessionStorage.getItem("userId");
			var token= sessionStorage.getItem("c_token");
			 $.ajax({ 
				type : "GET",
				dataType : "json", 
				url : 'user/getUserList', 
				data:{
					userId:userId,
				    token:token,
				    pagerSize:10
				},
				success : function(msg) {
					   var data =msg.data;
					   var endPageNumber=data.totalPage;//尾页
			           var totalCount=data.totalCount;//多少条记录
			           var totalPage=data.totalPage;//共多少页
			           var pagerNumber=data.pagerNumber;//当前页
			           $(".fenye a:nth-child(2)").attr({value:1});
			           $(".fenye a:nth-child(3)").attr({value:1});
			           $(".fenye a:nth-child(4)").attr({value:1});
			           $(".fenye a:nth-child(5)").attr({value:endPageNumber});
			           $(".fenye span").text(totalCount+"条数据   "+pagerNumber+"/"+totalPage+"页");
				}
		     })
		}); 
	//分页功能
	    function pageChange(val){
			 var button=($(val).text());
			 var pageNumber=parseInt(($(val).attr("value")));
			 var endpageNumber=$(".fenye a:nth-child(5)").attr("value");	
			 var pageSize=10;
			 if(button=="首页"){
				pageNumber=1;
			 }
			 if(button=="上一页"&&pageNumber>=2){
				 pageNumber=pageNumber-1;
			 }
			 if(button=="下一页"&&pageNumber<endpageNumber){
				 pageNumber=pageNumber+1;
			 }
			 if(button=="尾页"){
			 }
			 var title=$("#keywordTitle").val();	
			 $.ajax({
		    		type : "GET",//get提交
		    		dataType : "json",//json格式
		    		url : 'user/getUserList',
		    		data:{
		    			title:title,
		    			pagerNumber:pageNumber,
		    			pagerSize:pageSize
		    		},
		    		success : function(msg) {
		    	           var endPageNumber=msg.data.totalPage;//尾页
		    	           var totalCount=msg.data.totalCount;//多少条记录
		    	           var totalPage=msg.data.totalPage;//共多少页
		    	           var pagerNumber=msg.data.pagerNumber;//当前页
		    	           $(".fenye a:nth-child(3)").attr({value:pagerNumber});
		    	           $(".fenye a:nth-child(4)").attr({value:pagerNumber});
		    	           $(".fenye a:nth-child(5)").attr({value:endPageNumber});
		    	           $(".fenye span").text(totalCount+"条数据   "+pagerNumber+"/"+totalPage+"页");   
		    		}
		    	   }); 
			 
		 }
	</script>
</html>