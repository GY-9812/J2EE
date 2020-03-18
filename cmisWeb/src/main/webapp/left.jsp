<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单</div>
    <dl class="leftmenu">
      <c:if test="${user.roleId=='管理员'}">
	    <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>客户经理信息管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/clientMgr.html" target="rightFrame">客户经理信息综合维护</a><i></i></li>
	        <li><cite></cite><a href="manager/clientMgrImport.html" target="rightFrame">批量导入</a><i></i></li>
   			<li><cite></cite><a href="manager/clientMgrInfoOther.html"  target="rightFrame">客户经理辅助信息维护</a><i></i></li>
	        </ul>    
	    </dd>
	    </c:if>
	   <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>营销管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/clientInfo.html" target="rightFrame">客户信息管理</a><i></i></li>
	        <li><cite></cite><a href="manager/marketRecord.html" target="rightFrame">营销记录管理</a><i></i></li>
	        </ul>    
	    </dd>
	   <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>日常工作管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/regularMeeting.html" target="rightFrame">例会管理</a><i></i></li>
	        <li><cite></cite><a href="manager/workMgr.html" target="rightFrame">工作管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>报表管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/clientMgrStat.html" target="rightFrame">报表管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>学习园地管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/studyMgr.html" target="rightFrame">学习园地管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <c:if test="${user.roleId=='管理员'}">
	   <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>用户管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="manager/userInfo.html" target="rightFrame">用户管理</a><i></i></li>
	        </ul>    
	   </dd>
    </c:if>
    </dl>  
</body>
</html>