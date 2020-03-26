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
<title>修改工作记录</title>
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
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>regularMeetList">工作管理</a></li>
			<li><a href="#">修改</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>updateWork" method="post">
		<div class="formbody">
			<div class="formtitle">
				<span>工作记录</span>
			</div>
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<input type="hidden" name="key" value="${member.key}">
			<ul class="forminfo">
				<li><label>客户维护</label><textarea name="manage" class="textinput">${member.manage}</textarea></li>
				<li><label>产品信息</label><textarea name="product" class="textinput">${member.product}</textarea></li>
				<li><label>货后管理</label><textarea name="loan" class="textinput">${member.loan}</textarea></li>
				<li><label>风险预警</label><textarea name="warn" class="textinput">${member.warn}</textarea></li>
				<li><label>发现问题</label><textarea name="issue" class="textinput">${member.issue}</textarea></li>
				<li><label>工作建议及感悟</label><textarea name="proposal" class="textinput">${member.proposal}</textarea></li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1'}">
			<ul class="forminfo">
				<li><label>客户维护</label><textarea name="manage" class="textinput" readonly>${member.manage}</textarea></li>
				<li><label>产品信息</label><textarea name="product" class="textinput" readonly>${member.product}</textarea></li>
				<li><label>货后管理</label><textarea name="loan" class="textinput" readonly>${member.loan}</textarea></li>
				<li><label>风险预警</label><textarea name="warn" class="textinput" readonly>${member.warn}</textarea></li>
				<li><label>发现问题</label><textarea name="issue" class="textinput" readonly>${member.issue}</textarea></li>
				<li><label>工作建议及感悟</label><textarea name="proposal" class="textinput" readonly>${member.proposal}</textarea></li>
			</ul>
			</c:if>
		</div>
	</form>
</body>
</html>