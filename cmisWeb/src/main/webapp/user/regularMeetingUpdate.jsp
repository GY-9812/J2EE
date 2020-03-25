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
<title>Insert title here</title>
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
			<li><a href="<%=basePath%>regularMeetList">例会记录管理</a></li>
			<li><a href="<%=basePath%>user/regularMeetingUpdate.jsp">修改</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>updateMeet" method="post" enctype="multipart/form-data">
		<div class="formbody">
			<div class="formtitle">
				<span>例会记录</span>
			</div>
			<input type="hidden" name="key" value="${member.key}">
			<input type="hidden" name="attachment" value="${member.attachment}">
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<ul class="forminfo">
				<li><label>主题</label><input name="theme" type="text" class="dfinput" value="${member.theme}" /></li>
				<li><label>日期</label><input name="date" type="text" class="dfinput" value="<fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/>" /></li>
				<li><label>与会人员</label>
					<textarea name="personnel" class="textinput">${member.personnel}</textarea></li>
				<li><label>附件</label><input name="upload" type="file" />原附件：${member.attachment}</li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1' }">
    		<ul class="forminfo">
    			<li><label>主题</label><input name="theme" type="text" class="dfinput" value="${member.theme}"/></li>
    			<li><label>日期</label><input name="date" type="text" class="dfinput" value="<fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/>"/></li>
    			<li><label>与会人员</label><textarea name="personnel" class="textinput">${member.personnel}</textarea></li>
    			<li><label>附件</label><a href="#" >${member.attachment }</a> </li>
    		</ul>
    		</c:if>
		</div>
	</form>
</body>
</html>