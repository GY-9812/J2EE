<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index</title>
<script language="JavaScript" src="<%=basePath %>js/jquery.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript">
$(function() {
	initData();
});
//生成数据
function initData() {
	var legendData= ['年收入', '资产', '负债'];
	var bgColorList =['#FBB730', '#31BDF2', '#6197fb'];
	var axisLabel ;
	 $.ajax({
			url:"<%=basePath%>cientCustStat",
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				var len = data.length;
				axisLabel=new Array(len);
				var seriesValue = [];
				for(var i=0;i<len;i++){
					axisLabel[i] = data[i].mgrName;
					var arrData = [];
					var seriesDataVal = null;
					if (i==0) {
						for (var j = 0; j < axisLabel.length; j++) {
							arrData.push(data[j].balanceSum);
						}
					}else if (i==1) {
						for (var j = 0; j < axisLabel.length; j++) {
							arrData.push(data[j].salarySum);
						}
					}else if (i==2) {
						for (var j = 0; j < axisLabel.length; j++) {
							arrData.push(data[j].debtSum);
						}
					}
					seriesDataVal = {
							barWidth: 10, //柱状条宽度
							name: legendData[i],
							type: 'bar',
							itemStyle: {
								normal: {
									show: true, //鼠标悬停时显示label数据
									barBorderRadius: [10, 10, 10, 10], //柱形图圆角，初始化效果
									color: bgColorList[i]
								}
							},
							label: {
								normal: {
									show: true, //显示数据
									position: 'top' //显示数据位置 'top/right/left/insideLeft/insideRight/insideTop/insideBottom'
								}
							},
							data: arrData
						};
					seriesValue.push(seriesDataVal);
				}
				buildChart(legendData, axisLabel, seriesValue);
			},
			error:function(){
				alert("后台服务器出错，请联系系统管理员！");
			}
		})
}

//生成Echarts图形
function buildChart(legendData, axisLabel, seriesValue) {
	var chart = document.getElementById('container');
	var echart = echarts.init(chart);
	var option = {
		title: {
			text: "客户经理客户资产统计", //正标题
			x: "center", //标题水平方向位置
			y: "0", //标题竖直方向位置
			textStyle: {
				fontSize: 18,
				fontWeight: 'normal',
				color: '#666'
			}
		},
		tooltip: {
			trigger: 'axis',
			axisPointer: {
				type: 'shadow' //阴影，若需要为直线，则值为'line'
			}
		},
		toolbox: {
			show: true,
			feature: {
				saveAsImage: {
					show: true
				}
			}
		},
		legend: {
			data: legendData,
			y: 'bottom' //图例说明文字设置

		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '10%',
			top: '10%',
			containLabel: true
		},
		xAxis: [{
			min: 0,
			type: 'category', //纵向柱状图，若需要为横向，则此处值为'value'， 下面 yAxis 的type值为'category'
			data: axisLabel
		}],
		yAxis: [{
			min: 0,
			type: 'value',
			splitArea: {
				show: false
			}
		}],
		label: {
			normal: { //显示bar数据
				show: true,
				position: 'top'
			}
		},
		series: seriesValue
	};
	echart.setOption(option);
}

</script>
</head>
<body >
    <div id="container" style="width:1150px;height:500px"></div>
</body>
</html>