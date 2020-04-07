<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧菜单</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript">
	function init(){
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
	  	var option = null;
	 	$.ajax({
			url:"<%=basePath%>userStat",
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				var len = data.length;
			    var type = new Array(len);
			    var count= new Array(len);
				for(var i=0;i<len;i++){
					type[i]= data[i].type=='F'?"女性":"男性";
					count[i]= data[i].count;
				}
				var option = {
					title:{
						text:'用户性别统计柱状图',
						x: "center",
					},
					tooltip:{
						  
					},
				    xAxis: {
				    	type: 'category',
				    	data: type
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [{
				        data: count,
				        type: 'bar',
			   	    	itemStyle: {
							normal: {
								// 随机显示
								color: function(d) {
									return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);
								}
							},
						}
					}]
				};
				myChart.setOption(option);
			},
			error:function(){
				alert("后台服务器出错，请联系系统管理员！");
			}
		})
	}
</script>
</head>
<body onload="init()">
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
	    <li><a href="#">首页</a></li>
	    </ul>
    </div>
    <div class="mainindex">
	    <div class="welinfo">
	    	<span><img src="images/sun.png" alt="天气" /></span>
	    	<b>${user.username}${time}，欢迎访问客户经理信息管理系统</b>
    	</div>
    	
	    <!--按照用户的性别生成一个柱状图-->
	    <div id="container" style="width:600px;height:400px">
	       
	    </div>
	</div>
</body>

</html>