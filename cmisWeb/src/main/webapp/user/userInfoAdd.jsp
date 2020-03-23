<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>添加用户</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});
		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});
		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});
		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});
	});
	//校验用户名是否已存在
	function checkUser(){
		var username_Val = $("#username").val();
		$.ajax({
			url:"<%=basePath%>checkUser",
			data : {
				"username" : username_Val
			},
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				if (data.msg != null) {
					alert(data.msg);
					$("#username").val("");
					$("#username").focus();
				} 
			},
			error:function(){
				alert("后台服务器出错，请联系管理员！");
			}
		})
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>userInfoList">用户管理</a></li>
			<li><a href="#">添加</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>addUserInfo" method="post">
		<div class="formbody">
			<div class="formtitle">
				<span>用户基本信息</span>
			</div>
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<ul class="forminfo">
				<li><label>姓名</label><input name="username" type="text" class="dfinput" id="username" onchange="checkUser()"/></li>
				<li><label>密码</label><input name="password" type="text" class="dfinput"/></li>
				<li><label>性别</label>
				<cite><input name="sex" type="radio" checked="checked" value="M"/>男&nbsp;&nbsp;&nbsp;&nbsp;
				      <input name="sex" type="radio" value="F" />女</cite></li>
				<li><label>邮箱</label><input name="email" type="text" class="dfinput" value="" /></li>
				<li><label>密码提示问题</label><input name="question" type="text" class="dfinput" value=""/></li>
				<li><label>出生日期</label><input name="birthday" type="text" class="dfinput"/></li>
				<li><label>角色</label><cite><select class="dfselect" name="roleId">
							<option value="0">请选择</option>
							<option value="1">管理员</option>
							<option value="2">客户经理</option></select></cite></li>
				<li><label>&nbsp;</label><input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1'}">
			<ul class="forminfo">
				<li><label>姓名</label><input name="username" type="text" class="dfinput" value="${member.username }" readonly/></li>
				<li><label>密码</label><input name="password" type="password" class="dfinput" value="${member.password }" readonly/></li>
				<li><label>性别</label><cite>
					<input name="sex" type="radio" value="M"  <c:if test="${'M' eq member.sex }">checked="checked" </c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="sex" type="radio" value="F" <c:if test="${'F' eq member.sex }">checked="checked" </c:if> />女</cite></li>
				<li><label>邮箱</label><input name="email" type="text" class="dfinput" value="${member.email }" readonly/></li>
				<li><label>密码提示问题</label><input name="question" type="text" class="dfinput" value="${member.question }" readonly/></li>
				<li><label>出生日期</label><input name="birthDay" type="text" class="dfinput" value="${member.birthday }" readonly/></li>
				<li><label>角色</label><cite>
					<select class="dfselect" name="roleId">
						<option value="1" <c:if test="${'1' eq member.roleId }">selected </c:if>>管理员</option>
						<option value="2" <c:if test="${'2' eq member.roleId }">selected </c:if>>客户经理</option>
					</select></cite></li>
			</ul>
			</c:if>
		</div>
	</form>
</body>
</html>