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
<title>用户信息列表</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
<script language="JavaScript" src="<%=basePath %>js/jquery-form.js"></script>
<script type="text/javascript">
function checkData(){  
    var fileDir = $("#upfile").val();  
    var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
    if("" == fileDir){  
    	alert("选择需要导入的Excel文件！");  
        	return false;  
    }  
    if(".xls" != suffix && ".xlsx" != suffix ){  
        alert("选择Excel格式的文件导入！");  
            return false;  
    }
    return true;  
}
$(document).ready(function(){
    $("#btn").click(function(){
	    if(checkData()){
	    	$('#form1').ajaxSubmit({
	        	url:'<%=basePath%>uploadExcel',
	            dataType: 'text',
	            success: resutlMsg,
	            error: errorMsg
	        });
	        function resutlMsg(msg){
	            alert(msg);
	            $("#upfile").val("");
	        }
	        function errorMsg(){
	            alert("导入excel出错！");
	        }
	    }
	});     
});  
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">批量导入</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>导入客户经理数据</span>
		</div>
		<form action="" method="POST" enctype="multipart/form-data" id="form1">
			<input type="hidden" name="modifier" value="${uname}">
			<ul class="forminfo">
				<li><label>选择文件路径:</label><input id="upfile" name="upfile" type="file" class="dfinputfile" /></li>
				<li><label>&nbsp;</label><input name="" type="button" id="btn" class="btn" value="导入" /></li>
			</ul>
		</form>
	</div>
</body>
</html>