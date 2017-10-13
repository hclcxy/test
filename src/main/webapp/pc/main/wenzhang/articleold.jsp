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
<link rel="stylesheet" href="pc/css/adminstyle.css" type="text/css">
 <link rel="stylesheet" href="pc/css/page.css" type="text/css"> 
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
<!-- top -->
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
  <tr> 
    <td width="24%">位置： 
    </td>
    <td width="76%"><div align="center" class="emenubutton">
		  <span id="showaddclassnav"></span>         
           <input type="button" name="Submit" value="增加信息" onclick="self.location.href='pc/main/wenzhang/articleAdd.jsp'">
		  &nbsp;          
        </div></td>
  </tr>
</table>
<!-- 搜索栏 -->
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
    <tr> 
      <td width="100%"> <div align="right">&nbsp;搜索： 
          <select name="showspecial" id="showspecial">
            <option value="0">不限属性</option>
            <option value="1">推荐</option>
            <option value="2">头条</option>
          </select>
          <input name="keyboard" type="text" id="keyboard" value="关键字">
		  <span id="searchclassnav"></span>
          <input type="button" name="" id="servicdgdf" value="搜索">
        </div></td>
    </tr>
</table>
<br>


  <table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="10%" height="25"><div align="center"><a href="pc/main/xinximain/article.jsp" title="已发布信息总数：">未过期(12) </a></div></td>
      <td width="10%"><div align="center"><a href="pc/main/xinximain/article.jsp">过期 (12)</a></div></td>
      <td width="10%">&nbsp;</td>
      <td width="58%">&nbsp; </td>
      <td width="6%">&nbsp;</td>
      <td width="6%">&nbsp;</td>
    </tr>
  </table>
  <!-- 文章列表 -->
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" id="articleList">
    <tr class="header"> 
      <td height="25" colspan="8"></td>
    </tr>
    <tr> 
      <td width="3%"><div align="center"></div></td>
      <td width="6%" height="25"><div align="center">标题</div></td>
      <td width="36%" height="25"><div align="center">用户等级可见</div></td>
      <td width="14%" height="25"> <div align="center">状态</div></td>
	  <td width="14%" height="25"> <div align="center">编辑</div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25"> <div align="center"> 
          <input type=checkbox name=chkall value=on onclick="CheckAll(this.form)">
        </div></td>
      <td height="25" colspan="7"><div align="center"> 
          <input type="submit" name="Submit3" value="多条删除" onclick="document.listform.enews.value='DelNews_all';document.listform.action='';">		 
        </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" colspan="8"> 
      　 </td>
    </tr>
  </table>
<!-- 分页 -->
  <div id="app">
    <div>
      <div class="page"  v-show="show">
        <div class="pagelist">
          <span class="jump" :class="{disabled:pstart}" @click="{current_page--}">上一页</span>
          <span v-show="current_page>5" class="jump" @click="jumpPage(1)">1</span>
          <span class="ellipsis"  v-show="efont">...</span>
          <span class="jump" v-for="num in indexs" :class="{bgprimary:current_page==num}" @click="jumpPage(num)">{{num}}</span>
          <span class="ellipsis"  v-show="ebehind">...</span>
          <span :class="{disabled:pend}" class="jump" @click="{current_page++}">下一页</span>
          <span v-show="current_page<pages-4" class="jump" @click="jumpPage(pages)">{{pages}}</span>
          <span class="jumppoint">跳转到：</span>
          <span class="jumpinp"><input type="text" v-model="changePage"></span>
          <span class="jump gobtn" @click="jumpPage(changePage)">GO</span>
        </div>
      </div>
    </div>
  </div> 
</body>
<script src="static/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="pc/js/vue.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
//分页部分开始
var newlist = new Vue({
	    el: '#app',
	    data: {
	      current_page: 1, //当前页
	      pages: 50, //总页数
	      changePage:'',//跳转页
	      nowIndex:0
	    },
	    computed:{
	       show:function(){
	           return this.pages && this.pages !=1
	       },
	       pstart: function() {
	         return this.current_page == 1;
	       },
	       pend: function() {
	         return this.current_page == this.pages;
	       },
	       efont: function() {
	         if (this.pages <= 7) return false;
	         return this.current_page > 5
	       },
	       ebehind: function() {
	         if (this.pages <= 7) return false;
	         var nowAy = this.indexs;
	         return nowAy[nowAy.length - 1] != this.pages;
	       },
	       indexs: function() {

	         var left = 1,
	           right = this.pages,
	           ar = [];
	         if (this.pages >= 7) {
	           if (this.current_page > 5 && this.current_page < this.pages - 4) {
	             left = Number(this.current_page) - 3;
	             right = Number(this.current_page) + 3;
	           } else {
	             if (this.current_page <= 5) {
	               left = 1;
	               right = 7;
	             } else {
	               right = this.pages;

	               left = this.pages - 6;
	             }
	           }
	         }
	         while (left <= right) {
	           ar.push(left);
	           left++;
	         }
	         return ar;
	       },
	     },
	    methods: {
	      jumpPage: function(id) {
	        this.current_page = id;
	      },
	    },

	  }) 
	 //分页部分结束
	 //列表加载
   $.ajax({
	type : "GET",
	dataType : "json",
	url : "article/articleList",
	data:"",
	success : function(msg) {
           var data=msg.datas;         
           //添加信息
           for(var i in data){       	   
        	   $(".tableborder").append("11");
          /*$(".tableborder").append("<tr bgcolor='#FFFFFF' onmouseout='this.style.backgroundColor='"'#ffffff'"' onmouseover='this.style.backgroundColor="'#C3EFFF'"'>"+ 
		            	      "<td><div align='center'>"+ 
		            	          "<input name='id[]' type='checkbox' id='id[]' value=''>"+
		            			  "<input name='infoid[]' type='hidden' value='"+data[i].articleId+"'>"+
		            	          "</div>"+
		            	      "</td>"+
		            	      "<td height='25'> <div align='center'>"+data[i].title+"</div></td>"+                        
		            	      "<td height='25'> <div align='center'> 文章</div></td>"+
		            	      "<td height='25'> <div align='center'> 文章</div></td>"+
		            	      "<td height='25'> <div align='center'>"+
		            	           "<a href='pc/main/xinximain/articleAdd.jsp'>设置已过期</a>|"+  
		            	           "<a href='pc/main/xinximain/articleAdd.jsp'>删除</a>| "+ 
		            	           "<a href='pc/main/xinximain/articleAdd.jsp'>查看详情</a>"+ 
		            	      "</td>"+
		            	  "</tr>");  */
                       }
	             }
            }); 	
/* function CheckAll(form){
>>>>>>> 8c17e115af34b472ce449b598aabd78273bb1aa3
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall'){
       e.checked = form.chkall.checked;
    }
    }
  } 


 function GetSelectId(form)
{
  var ids='';
  var dh='';
  for (var i=0;i<form.elements.length;i++)
  {
	var e = form.elements[i];
	if (e.name == 'id[]')
	{
	   if(e.checked==true)
	   {
       		ids+=dh+e.value;
			dh=',';
	   }
	}
  }
  return ids;
}
 function PushInfoToSp(form){
	var id='';
	id=GetSelectId(form);
	if(id=='')
	{
		alert('请选择要推送的信息');
		return false;
	}
	window.open('');
} */

</script>

</html>