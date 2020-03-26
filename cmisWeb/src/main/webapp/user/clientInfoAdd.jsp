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
<title>添加客户</title>
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

	//校验身份证号码是否已存在
	function checkClient() {
		var ssn_val = $("#ssn").val();
		$.ajax({
			url : "<%=basePath%>checkClient",
			data : {
				"ssn" : ssn_val
			},
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				if (data.msg != null) {
					alert(data.msg);
					$("#ssn").val("");
					$("#ssn").focus();
				}
			},
			error : function() {
				alert("后台服务器出错，请联系系统管理员！");
			}
		})
	}

	function toValid() {
		//校验姓名的长度
		var clientname_val = $("#clientname").val();
		if (clientname_val != "" && (clientname_val.length > 8)) {
			alert("姓名不能超过8个字符，请重新输入！");
			return false;
		}
		//规定身份证号码位18位且不能为空
		var ssn_val = $("#ssn").val();
		if (ssn_val.length != 18) {
			alert("请输入标准的18位身份证号码！");
			return false;
		}
		//客户姓名不能为空
		if (clientname_val == "") {
			alert("客户姓名不能为空，请输入！");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>clientInfoList">客户信息管理</a></li>
			<li><a href="<%=basePath%>user/clientInfoAdd.jsp">添加</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>addClient" method="post" onsubmit="return toValid()">
		<div class="formbody">
			<div class="formtitle">
				<span>客户基本信息</span>
			</div>
			<font color="green">${success}</font>
			<c:if test="${flag!='1'}">
			<input type="hidden" name="cmid" value="${user.userId}">
			<ul class="forminfo">
				<li><label>客户姓名</label><input name="clientname" type="text" class="dfinput" id="clientname"/><i>姓名不能超过8个字符</i></li>
				<li><label>身份证号</label><input name="ssn" type="text" class="dfinput" id="ssn" onchange="checkClient()"/><i>身份证号码为18位</i></li>
				<li><label>联系方式</label><input name="tel" type="text" class="dfinput" /></li>
				<li><label>年收入（万元）</label><input name="salary" type="text" class="dfinput" /></li>
				<li><label>资产（万元）</label><input name="balance" type="text" class="dfinput" /></li>
				<li><label>负债（万元）</label><input name="debt" type="text" class="dfinput" /></li>
				<li><label>所在单位</label><input name="unit" type="text" class="dfinput" /></li>
				<li><label>家庭住址</label><input name="address" type="text" class="dfinput" /></li>
				<li><label>业务关联</label><input name="business" type="text" class="dfinput" /></li>
				<li><label>&nbsp;</label>
					<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="重置" /></li>
			</ul>
			</c:if>
			<c:if test="${flag=='1'}">
			<ul class="forminfo">
				<li><label>客户姓名</label><input name="clientname" type="text" class="dfinput" value="${member.clientname}" readonly/></li>
				<li><label>身份证号</label><input name="ssn" type="text" class="dfinput" id="ssn" value="${member.ssn}" readonly/></li>
				<li><label>联系方式</label><input name="tel" type="text" class="dfinput" value="${member.tel}" readonly/></li>
				<li><label>年收入（万元）</label><input name="salary" type="text" class="dfinput" value="${member.salary}" readonly/></li>
				<li><label>资产（万元）</label><input name="balance" type="text" class="dfinput" value="${member.balance}" readonly/></li>
				<li><label>负债（万元）</label><input name="debt" type="text" class="dfinput" value="${member.debt}" readonly/></li>
				<li><label>所在单位</label><input name="unit" type="text" class="dfinput" value="${member.unit}" readonly/></li>
				<li><label>家庭住址</label><input name="address" type="text" class="dfinput" value="${member.address}" readonly/></li>
				<li><label>业务关联</label><input name="business" type="text" class="dfinput" value="${member.business}" readonly/></li>
			</ul>
			</c:if>
		</div>
	</form>
</body>
</html>