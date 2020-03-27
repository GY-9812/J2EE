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
<title>修改营销记录</title>
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
			<li><a href="<%=basePath%>marketList">营销记录管理</a></li>
			<li><a href="#">修改</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>updateMarket" method="post" enctype="multipart/form-data">
		<div class="formbody">
			<div class="formtitle">
				<span>营销记录</span>
			</div>
			<input type="hidden" name="key" value="${member.key}">
			<input type="hidden" name="report" value="${member.report}">
			<input type="hidden" name="test" value="${member.test}">
			<input type="hidden" name="eval" value="${member.eval}">
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<ul class="forminfo">
				<li><label>客户姓名</label><input name="clientname" type="text" class="dfinput" value="${member.clientname}"/><i>姓名不能超过8个字符</i></li>
				<li><label>客户生产经营情况</label><textarea name="management" class="textinput">${member.management}</textarea></li>
				<li><label>客户需求</label><textarea name="demand" class="textinput">${member.demand}</textarea></li>
				<li><label>客户拜访报告书</label><input name="upload1" type="file"/>原附件：${member.report}</li>
				<li><label>客户推荐表</label><input name="upload2" type="file"/>原附件：${member.test}</li>
				<li><label>客户综合评价</label><input name="upload3" type="file"/>原附件：${member.eval}</li>
				<li><label>拜访日期</label><input name="date" type="text" class="dfinput" value="<fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/>"/></li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1'}">
			<ul class="forminfo">
				<li><label>客户姓名</label><input name="clientname" type="text" class="dfinput" value="${member.clientname}" readonly/></li>
				<li><label>客户生产经营情况</label><textarea name="management" class="textinput" readonly>${member.management}</textarea></li>
				<li><label>客户需求</label><textarea name="demand" class="textinput" readonly>${member.demand}</textarea></li>
				<li><label>客户拜访报告书</label><a href="#" >${member.report}</a></li>
				<li><label>客户推荐表</label><a href="#" >${member.test}</a></li>
				<li><label>客户综合评价</label><a href="#" >${member.eval}</a></li>
				<li><label>拜访日期</label><input name="date" type="text" class="dfinput" value="<fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/>" readonly/></li>
			</ul>
			</c:if>
		</div>
	</form>
</body>
</html>