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
<title>添加营销记录</title>
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
	
	//校验客户是否已存在，存在才能添加营销记录
	function checkClientName() {
		var clientname_val = $("#clientname").val();
		$.ajax({
			url : "<%=basePath%>checkClientName",
			data : {
				"clientname" : clientname_val
			},
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				if (data.msg != null) {
					alert(data.msg);
					$("#clientname").val("");
					$("#clientname").focus();
				}
			},
			error : function() {
				alert("后台服务器出错，请联系系统管理员！");
			}
		})
	}
	
	function toValid() {
		//校验客户姓名的长度
		var clientname_val = $("#clientname").val();
		if (clientname_val != "" && (clientname_val.length > 8)) {
			alert("姓名不能超过8个字符，请重新输入！");
			return false;
		}
		//客户姓名不能为空
		if (clientname_val == "") {
			alert("客户姓名不能为空，请输入！");
			return false;
		}
		//客户需求不能为空
		var demand_val = $("#demand").val();
		if (demand_val == "") {
			alert("客户需求不能为空，请输入！");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>marketList">营销记录管理</a></li>
			<li><a href="<%=basePath%>user/marketRecordAdd.jsp">添加</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>addMarket" method="post" onsubmit="return toValid()" enctype="multipart/form-data">
		<div class="formbody">
			<div class="formtitle">
				<span>营销记录</span>
			</div>
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<input type="hidden" name="cmid" value="${user.userId}">
			<ul class="forminfo">
				<li><label>客户姓名</label><input name="clientname" type="text" class="dfinput" id="clientname" onchange="checkClientName()"/><i>姓名不能超过8个字符</i></li>
				<li><label>客户生产经营情况</label><textarea name="management" class="textinput"></textarea></li>
				<li><label>客户需求</label><textarea name="demand" class="textinput" id="demand"></textarea></li>
				<li><label>客户拜访报告书</label><input name="upload1" type="file"/></li>
				<li><label>客户推荐表</label><input name="upload2" type="file"/></li>
				<li><label>客户综合评价</label><input name="upload3" type="file"/></li>
				<li><label>拜访日期</label><input name="date" type="text" class="dfinput"/></li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1'}">
			<ul class="forminfo">
				<li><label>客户姓名</label><input name="clientname" type="text" class="dfinput" value="${member.clientname}" readonly/><</li>
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