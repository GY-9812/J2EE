<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看客户经理信息</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});
  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});
  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});
});
</script>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 400	;
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath %>clientMgrList">客户经理信息综合管理维护</a></li>
			<li><a href="#">查看</a></li>
		</ul>
	</div>
	<form action="" method="post">
		<div class="formbody">
			<div class="formtitle">
				<span>客户经理基本信息</span>
			</div>
			<ul class="forminfo">
				<li><label>员工号</label><cite>${mgr.cmid}</cite></li>
				<li><label>姓名</label><cite>${mgr.cname}</cite></li>
			    <li><label>性别</label><cite>
			    	<input name="sex" type="radio" value="M" <c:if test="${'M' eq mgr.sex}">checked="checked" </c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="sex" type="radio" value="F" <c:if test="${'F' eq mgr.sex}">checked="checked" </c:if> />女</cite></li>
			    <li><label>身份证号</label><cite>${mgr.ssn}</cite></li>
			    <li><label>出生年月</label><cite><fmt:formatDate type="date" value="${mgr.birthday}" /></cite></li>
			    <li><label>年龄</label><cite>${mgr.age}</cite></li>
			    <li><label>民族</label><cite>
			        <select >
			        	<c:forEach items="${nationParam}" var="nation">
							<option value="${nation.key}" <c:if test="${nation.key eq mgr.nation}">selected</c:if>>${nation.value}</option>
						</c:forEach>
			        </select>
			    </cite></li>
			    <li><label>政治面貌</label><cite>
			    	<select >
			        	<c:forEach items="${policeStatus}" var="pol">
							<option value="${pol.key}" <c:if test="${pol.key eq mgr.political}">selected</c:if>>${pol.value}</option>
						</c:forEach>
			        </select></cite></li>
			    <li><label>籍贯</label><cite>${mgr.homeTown}</cite></li>
			    <li><label>照片</label><cite><img alt="图片不存在" src="<%=basePath %>images/upload/${mgr.photo}" style="width:100px;height:100px"></cite></li> 
			    <li><label>学历</label><cite>
			    	<select>
			        	<c:forEach items="${education}" var="edu">
							<option value="${edu.key}" <c:if test="${edu.key eq mgr.education}">selected</c:if>>${edu.value}</option>		
						</c:forEach>
			        </select></cite></li>
			    <li><label>学位</label><cite>
			    	<select>
			        	<c:forEach items="${degree}" var="degree">
							<option value="${degree.key}" <c:if test="${degree.key eq mgr.degree}">selected</c:if>>${degree.value}</option>		
						</c:forEach>
			        </select></cite></li>
			    <li><label>毕业院校及专业</label><cite>${mgr.graduation}</cite></li>
			    <li><label>专业技术职称</label><cite>${mgr.professional}</cite></li>
			    <li><label>客户经理等级</label><cite>
			    	<select>
			    		<c:forEach items="${mgrLevel}" var="level">
							<option value="${level.key}" <c:if test="${level.key eq mgr.level}">selected</c:if>>${level.value}</option>		
						</c:forEach>
			        </select></cite></li>         
			    <li><label>所在单位</label><cite>${mgr.unit}</cite></li>
			    <li><label>部门</label><cite>${mgr.dept}</cite></li>
			    <li><label>职务</label><cite>${mgr.position}</cite></li>
			    <li><label>业务条线</label><cite>${mgr.line}</cite></li>
			    <li><label>参加工作时间</label><cite><fmt:formatDate type="date" value="${mgr.hireDate}"/></cite></li>
			    <li><label>入行时间</label><cite><fmt:formatDate type="date" value="${mgr.entryDate}"/></cite></li>
			    <li><label>从事金融工作年限</label><cite>${mgr.financeYears}</cite></li>
			    <li><label>客户经理从业年限</label><cite>${mgr.workYears}</cite></li>
			    <li><label>办公电话</label><cite>${mgr.tel}</cite></li>
			    <li><label>手机</label><cite>${mgr.mobile}</cite></li>
			</ul>
		</div>
	</form>
</body>
</html>