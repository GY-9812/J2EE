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
<title>添加会议</title>
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
	
	function toValid() {
		//例会主题不能为空
		var theme_val = $("#theme").val();
		if (theme_val == "") {
			alert("例会主题不能为空，请输入！");
			return false;
		}
		//例会日期不能为空
		var date_val = $("#date").val();
		if (date_val == "") {
			alert("例会日期不能为空，请输入！");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>regularMeetList">例会管理</a></li>
    		<li><a href="<%=basePath%>user/regularMeetingAdd.jsp">添加</a></li>
		</ul>
	</div>
	<form action="<%=basePath %>regularMeetAdd" method="post" onsubmit="return toValid()" enctype="multipart/form-data">
    <c:if test="${flag!='1'}">
		<input type="hidden" name="cmname" value="${uname}">
			<input type="hidden" name="cmid" value="${user.userId}">
		<div class="formbody">
			<div class="formtitle"><span>例会记录</span></div>
			<ul class="forminfo">
				<li><label>主题</label><input name="theme" type="text" class="dfinput" id="theme"/></li>
    			<li><label>日期</label><input name="date" type="text" class="dfinput" id="date"/></li>
    			<li><label>与会人员</label><textarea name="personnel"class="textinput"></textarea></li>
    			<li><label>附件</label><input name="upload" type="file" /> </li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${flag=='1' }">
    	<div class="formbody">
    		<div class="formtitle"><span>例会记录</span></div>
    		<font color="green">${success}</font>
    		<ul class="forminfo">
    			<li><label>主题</label><input name="theme" type="text" class="dfinput" value="${member.theme}"/></li>
    			<li><label>日期</label><input name="date" type="text" class="dfinput" value="<fmt:formatDate value="${member.date}" pattern="yyyy-MM-dd"/>"/></li>
    			<li><label>与会人员</label><textarea name="personnel" class="textinput">${member.personnel}</textarea></li>
    			<li><label>附件</label><a href="#" >${member.attachment }</a> </li>
    		</ul>
    	</div>
    </c:if>
    </form>
</body>
</html>