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
<title>修改学习园地资料</title>
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
			<li><a href="<%=basePath%>studyList">学习园地管理</a></li>
			<li><a href="#">修改</a></li>
		</ul>
	</div>
	<form action="updateStudy" method="post" enctype="multipart/form-data">
		<div class="formbody">
			<div class="formtitle">
				<span>学习园地资料管理</span>
			</div>
			<input type="hidden" name="key" value="${member.key}">
			<input type="hidden" name="url" value="${member.url}">
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<ul class="forminfo">
				<li><label>资料名称</label><input name="name" type="text" class="dfinput" value="${member.name}" /></li>
				<li><label>完全公开</label><cite>
						<input name="line" type="radio" value="T" <c:if test="${'T' eq member.line}">checked="checked"</c:if>/>是&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="line" type="radio" value="F" <c:if test="${'F' eq member.line}">checked="checked"</c:if>/>否</cite></li>
				<li><label>资料类型</label><cite><select class="dfselect1" name="type">
							<option value="">请选择</option>
							<option value="1" <c:if test="${member.type eq '1' }"> selected </c:if>>规章制度</option>
							<option value="2" <c:if test="${member.type eq '2' }"> selected </c:if>>学习培训材料</option>
							<option value="3" <c:if test="${member.type eq '3' }"> selected </c:if>>资格岗位考试教程</option>
							<option value="4" <c:if test="${member.type eq '4' }"> selected </c:if>>客户营销技巧</option>
					</select></cite></li>
				<li><label>资料描述</label>
					<textarea name="des" cols="" rows="" class="textinput">${member.des}</textarea></li>
				<li><label>附件上传</label><input name="upload" type="file"/>原附件：${member.url}</li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1'}">
			<ul class="forminfo">
				<li><label>资料名称</label><input name="name" type="text" class="dfinput" value="${member.name}" readonly/></li>
				<li><label>完全公开</label><cite>
						<input name="line" type="radio" value="T" <c:if test="${'T' eq member.line}">checked="checked" </c:if>/>是&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="line" type="radio" value="F" <c:if test="${'F' eq member.line}">checked="checked" </c:if>/>否</cite></li>
				<li><label>资料类型</label><cite><select class="dfselect1" name="type">
							<option value="1" <c:if test="${member.type eq '1' }">selected</c:if>>规章制度</option>
							<option value="2" <c:if test="${member.type eq '2' }">selected</c:if>>学习培训材料</option>
							<option value="3" <c:if test="${member.type eq '3' }">selected</c:if>>资格岗位考试教程</option>
							<option value="4" <c:if test="${member.type eq '4' }">selected</c:if>>客户营销技巧</option>
					</select></cite></li>
				<li><label>资料描述</label>
					<textarea name="des" class="textinput" readonly>${member.des}</textarea></li>
				<li><label>附件</label><a href="#">${member.url}</a></td>
			</ul>
			</c:if>
		</div>
	</form>
</body>
</html>