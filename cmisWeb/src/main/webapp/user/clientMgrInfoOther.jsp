<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>editor/kindeditor.js"></script> 
<script type="text/javascript">
function oWorkPerformDel(pageNum)
{
	if(pageNum==1){
		var ids="";
		var $chkBoxes=$('#resultTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除年度工作业绩,您确定要删除吗?"))
			window.location="<%=basePath%>deleteMgrResult?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
	if(pageNum==2){
		var ids="";
		var $chkBoxes=$('#certTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除证照信息,您确定要删除吗?"))
			window.location="<%=basePath%>deleteMgrCert?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
	if(pageNum==3){
		var ids="";
		var $chkBoxes=$('#rprTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除奖惩记录,您确定要删除吗?"))
			window.location="<%=basePath%>deleteMgrRpr?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
	if(pageNum==4){
		var ids="";
		var $chkBoxes=$('#massTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除考核记录,您确定要删除吗?"))
			window.location="<%=basePath%>deleteMgrMass?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
	if(pageNum==5){
		var ids="";
		var $chkBoxes=$('#ltrTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除考核记录,您确定要删除吗?"))
			window.location="<%=basePath%>deleteMgrLtr?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
	if(pageNum==6){
		var ids="";
		var $chkBoxes=$('#levelTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除考核记录,您确定要删除吗?"))
			window.location="<%=basePath%>deleteMgrLevel?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
	if(pageNum==7){
		var ids="";
		var $chkBoxes=$('#workTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除工作经历,您确定要删除吗?"))
			window.location="<%=basePath%>deleteWorkHist?keys="+ids+"&mgrId="+$("#mgrId").val();
	}
}

//添加时校验审批人姓名是否存在，存在才能添加
function checkPerson() {
	var aPerson_val = $("#aPerson").val();
	$.ajax({
		url : "<%=basePath%>checkaPerson",
		data : {
			"aPerson" : aPerson_val
		},
		dataType : "json",
		//编码设置
		contentType : "application/json;charset=utf-8",
		success : function(data) {
			if (data.msg != null) {
				alert(data.msg);
				$("#aPerson").val("");
				$("#aPerson").focus();
			}
		},
		error : function() {
			alert("后台服务器出错，请联系系统管理员！");
		}
	})
}
//修改时校验审批人姓名是否存在，存在才能添加
function checkaPerson() {
	var rprAPerson_val = $("#rprAPerson").val();
	$.ajax({
		url : "<%=basePath%>checkaPerson",
		data : {
			"aPerson" : rprAPerson_val
		},
		dataType : "json",
		//编码设置
		contentType : "application/json;charset=utf-8",
		success : function(data) {
			if (data.msg != null) {
				alert(data.msg);
				$("#aPerson").val("");
				$("#aPerson").focus();
			}
		},
		error : function() {
			alert("后台服务器出错，请联系系统管理员！");
		}
	})
}
function toValid() {
	//失效时间不能为空
	var end_val = $("#end").val();
	if (end_val == "") {
		alert("失效时间不能为空，否则无法检测证书是否已失效！");
		return false;
	}
}
</script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 260			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
	var pageNumValue=$("#pageNum").val();
	var selectPages = $('#selectPages').find('a');   
	 $(selectPages).each(function () { 
	      if($(this).attr('id').substr(4,5)==pageNumValue){
	    	  $(this).attr("class","selected");
	      }else{
	    	  $(this).attr("class","");
	      }
	   })
});
Date.prototype.format = function(format) {  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S" : this.getMilliseconds()  
    // millisecond  
    }  
  
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
                .substr(4 - RegExp.$1.length));  
    }  
  
    for ( var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]  
                    : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format;  
}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">客户经理辅助信息维护</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul id="selectPages"> 
				    <li><a id="page1"  href="<%=basePath %>clientMgrInfoOther?pageNum=1&mgrId=${mgrId}" class="selected" target="rightFrame">年度工作业绩</a></li> 
				    <li><a id="page2"  href="<%=basePath %>clientMgrInfoOther?pageNum=2&mgrId=${mgrId}" target="rightFrame">证照列表</a></li> 
				    <li><a id="page3" href="<%=basePath %>clientMgrInfoOther?pageNum=3&mgrId=${mgrId}">奖惩记录</a></li> 
				    <li><a id="page4" href="<%=basePath %>clientMgrInfoOther?pageNum=4&mgrId=${mgrId}">考核记录</a></li> 
				    <li><a id="page5" href="<%=basePath %>clientMgrInfoOther?pageNum=5&mgrId=${mgrId}">学习培训记录</a></li> 
				    <li><a id="page6" href="<%=basePath %>clientMgrInfoOther?pageNum=6&mgrId=${mgrId}">等级认定记录</a></li> 
				    <li><a id="page7"  href="<%=basePath %>clientMgrInfoOther?pageNum=7&mgrId=${mgrId}">工作经历</a></li> 
		  		</ul>
		    </div>
		    
			<form action="<%=basePath%>clientMgrInfoOther" method="post" enctype="multipart/form-data">
    		<input type="hidden" name="pageNum" id="pageNum" value="${pageNum}">
    		<input type="hidden" name="mgrId" id="mgrId" value="${mgrId}" id="mgrId">
		    <!--年度工作业绩  -->
		    <c:if test="${pageNum==1}">
		  	<div id="tab1" class="tabson">
			    <ul class="seachform">
				    <li><label>工作年度</label><input name="cmWorkYear" type="text" class="scinput"/></li>
				    <li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询"/></li>
			    </ul>
			    <div class="tools">
			    	<ul class="toolbar1">
			        <li><a href="javascript:openWindow(1)"><span><img src="<%=basePath %>images/t01.png" /></span>添加</a></li>
			        <li><a href="javascript:openWindow(2)"><span><img src="<%=basePath %>images/t02.png" /></span>修改</a></li>
			        <li><a href="javascript:oWorkPerformDel(1)" ><span><img src="<%=basePath %>images/t03.png"/></span>删除</a></li>
			        </ul>
			    </div>
			    <table class="tablelist" id="resultTable">
			    	<thead>
				    	<tr class="tablehead"><td colspan="7">年度工作业绩</td></tr>
				   	</thead>
			    	<thead>
			    	<tr>
			        <th>选择</th>
			        <th>姓名</th>
			        <th>工作年度</th>
			        <th>工作业绩</th>
			        <th>附件依据</th>
			        <th>维护日期</th>
			        <th>维护人</th>
			        </tr>
			        </thead>
			        <tbody>
			          <c:forEach items="${resultList}" var="result">
			        	  <tr>
					        <td><input name="key" type="checkbox" value="${result.cmKey}" data-id="${result.cmKey}"/></td>
					        <td>${result.mgrName}</td>
					        <td>${result.cmWorkYear}</td>
						    <td>${result.cmWorkResult}</td>
						    <td><a href="<%=basePath%>downLoadFile?fileName=${result.cmAttach}" class="tablelink">${result.cmAttach}</a></td>
					        <td><fmt:formatDate value="${result.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
					        <td>${result.modifierName}</td>
					      </tr>
			          </c:forEach>
			        </tbody>
			    </table>
			</div>  
			</c:if>
			<!--证件列表  -->
			<c:if test="${pageNum==2}">
			<div id="tab2" class="tabson">
				<ul class="seachform">
					<li><label>证书类型</label>
						<div class="vocation">
							<select class="select2" name="certType">
								<option value="">请选择</option>
								<option value="1">从业资格证</option>
								<option value="2">岗位证书</option>
							</select>
						</div></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(3)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(4)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(2)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist" id="certTable">
					<thead>
						<tr class="tablehead">
							<td colspan="12">证照列表</td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>选择</th>
							<th>姓名</th>
							<th>证书名称</th>
							<th>证书类型</th>
							<th>证书编号</th>
							<th>发证单位</th>
							<th>发证时间</th>
							<th>失效时间</th>
							<th>有效性</th>
							<th>作废标识</th>
							<th>维护日期</th>
							<th>维护人</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="${certList}" var="cert">
						<tr>
							<td><input name="key" type="checkbox" value="${cert.cmKey}" data-id="${cert.cmKey}"/></td>
							<td>${cert.mgrName}</td>
							<td>${cert.certName}</td>
							<td><c:if test="${cert.certType=='1'}">从业资格证</c:if>
								<c:if test="${cert.certType=='2'}">岗位证书</c:if></td>
							<td>${cert.certNo}</td>
							<td>${cert.certUnit}</td>
							<td><fmt:formatDate value="${cert.start}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td><fmt:formatDate value="${cert.end}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td><c:if test="${cert.period=='T'}">有效</c:if>
								<c:if test="${cert.period=='F'}">无效</c:if></td>
							<td>${cert.invalid}</td>
							<td><fmt:formatDate value="${cert.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${cert.modifierName}</td>
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</c:if>
			<!--奖惩记录  -->
			<c:if test="${pageNum==3}">
			<div id="tab3" class="tabson">
				<ul class="seachform">
					<li><label>奖惩分类</label><input name="type" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(5)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(6)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(3)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist" id="rprTable">
					<thead>
						<tr class="tablehead">
							<td colspan="12">奖惩记录</td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>选择</th>
							<th>姓名</th>
							<th>奖惩分类</th>
							<th>奖惩内容</th>
							<th>生效日期</th>
							<th>审批单位</th>
							<th>审批人</th>
							<th>撤销日期</th>
							<th>撤销原因</th>
							<th>附件依据</th>
							<th>维护日期</th>
							<th>维护人</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="${rprList}" var="rpr">
						<tr>
							<td><input name="key" type="checkbox" value="${rpr.cmKey}" data-id="${rpr.cmKey}"/></td>
							<td>${rpr.mgrName}</td>
							<td>${rpr.type}</td>
							<td>${rpr.sub}</td>
							<td><fmt:formatDate value="${rpr.date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${rpr.aUnit}</td>
							<td>${rpr.aPerson}</td>
							<td><fmt:formatDate value="${rpr.rDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${rpr.aReason}</td>
							<td><a href="<%=basePath%>downLoadFile?fileName=${rpr.attach}" class="tablelink">${rpr.attach}</a></td>
							<td><fmt:formatDate value="${rpr.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${rpr.modifierName}</td>
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</c:if>
			<!--考核记录  -->
   			<c:if test="${pageNum==4}">
			<div id="tab4" class="tabson">
				<ul class="seachform">
					<li><label>考核时间</label><input name="time" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(7)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(8)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(4)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist" id="massTable">
					<thead>
						<tr class="tablehead">
							<td colspan="10">考核记录</td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>选择</th>
							<th>姓名</th>
							<th>考核时间</th>
							<th>考核内容</th>
							<th>考核结果</th>
							<th>考核评价</th>
							<th>考核单位</th>
			        		<th>附件依据</th>
							<th>维护日期</th>
							<th>维护人</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="${massList}" var="mass">
						<tr>
							<td><input name="key" type="checkbox" value="${mass.cmKey}" data-id="${mass.cmKey}"/></td>
							<td>${mass.mgrName}</td>
							<td><fmt:formatDate value="${mass.time}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${mass.sub}</td>
							<td>${mass.result}</td>
							<td>${mass.app}</td>
							<td>${mass.unit}</td>
							<td><a href="<%=basePath%>downLoadFile?fileName=${mass.attach}" class="tablelink">${mass.attach}</a></td>
							<td><fmt:formatDate value="${mass.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${mass.modifierName}</td>
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</c:if>
			<!--学员培训记录  -->
			<c:if test="${pageNum==5}">
			<div id="tab5" class="tabson">
				<ul class="seachform">
					<li><label>培训时间</label><input name="date" type="text" class="scinput" /></li>
					<li><label>科目</label><input name="sub" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(9)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(10)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(5)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist" id="ltrTable">
					<thead>
						<tr class="tablehead">
							<td colspan="13">学员培训记录</td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>选择</th>
							<th>姓名</th>
							<th>培训时间</th>
							<th>科目</th>
							<th>培训单位</th>
							<th>开始日期</th>
							<th>结束日期</th>
							<th>学时</th>
							<th>学分</th>
							<th>成绩</th>
							<th>附件依据</th>
							<th>维护日期</th>
							<th>维护人</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="${ltrList}" var="ltr">
						<tr>
							<td><input name="key" type="checkbox" value="${ltr.cmKey}" data-id="${ltr.cmKey}"/></td>
							<td>${ltr.mgrName}</td>
							<td><fmt:formatDate value="${ltr.date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${ltr.sub}</td>
							<td>${ltr.unit}</td>
							<td><fmt:formatDate value="${ltr.start}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td><fmt:formatDate value="${ltr.end}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${ltr.know}</td>
							<td>${ltr.credit}</td>
							<td>${ltr.score}</td>
							<td><a href="<%=basePath%>downLoadFile?fileName=${ltr.attach}" class="tablelink">${ltr.attach}</a></td>
							<td><fmt:formatDate value="${ltr.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${ltr.modifierName}</td>
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</c:if>
			<!--等级认定记录  -->
			<c:if test="${pageNum==6}">
			<div id="tab6" class="tabson">
				<ul class="seachform">
					<li><label>认定时间</label><input name="date" type="text" class="scinput" /></li>
					<li><label>认定级别</label><input name="level" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(11)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(12)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(6)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist" id="levelTable">
					<thead>
						<tr class="tablehead">
							<td colspan="8">等级认定记录</td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th>选择</th>
							<th>姓名</th>
							<th>认定时间</th>
							<th>认定级别</th>
							<th>认定类型</th>
							<th>附件依据</th>
							<th>维护日期</th>
							<th>维护人</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="${levelList}" var="level">
						<tr>
							<td><input name="key" type="checkbox" value="${level.cmKey}" data-id="${level.cmKey}"/></td>
							<td>${level.mgrName}</td>
							<td><fmt:formatDate value="${level.date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${level.level}</td>
							<td>${level.type}</td>
							<td><a href="<%=basePath%>downLoadFile?fileName=${level.attach}" class="tablelink">${level.attach}</a></td>
							<td><fmt:formatDate value="${level.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
							<td>${level.modifierName}</td>
						</tr>
					  </c:forEach>
					</tbody>
				</table>
			</div>
			</c:if>
			<!--工作经历  -->
			<c:if test="${pageNum==7}">
			<div id="tab7" class="tabson">
			    <ul class="seachform">
				    <li><label>职务</label>
						<div class="vocation">
							<select class="select2" name="cmPostion">
								<option value="">请选择</option>
								<c:forEach items="${mgrLevel}" var="level">
									<option value="${level.key}" <c:if test="${level.key eq lev}">selected</c:if>>${level.value}</option>		
								</c:forEach>
							</select>
						</div></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
			    </ul>
			    <div class="tools">
			    	<ul class="toolbar1">
			        <li><a href="javascript:openWindow(13)"><span><img src="<%=basePath %>images/t01.png" /></span>添加</a></li>
			        <li><a href="javascript:openWindow(14)"><span><img src="<%=basePath %>images/t02.png" /></span>修改</a></li>
			        <li><a href="javascript:oWorkPerformDel(7)" ><span><img src="<%=basePath %>images/t03.png"/></span>删除</a></li>
			        </ul>
			    </div>
			    <table class="tablelist" id="workTable">
			    	<thead>
				    	<tr class="tablehead"><td colspan="9">工作经历</td></tr>
				   	</thead>
			    	<thead>
			    	<tr>
			        <th>选择</th>
			        <th>姓名</th>
			        <th>任职日期</th>
			        <th>职务</th>
			        <th>单位</th>
			        <th>工作经历</th>
			        <th>附件依据</th>
			        <th>维护日期</th>
			        <th>维护人</th>
			        </tr>
			        </thead>
			        <tbody>
			        <c:forEach items="${workList}" var="work">
				        <tr>
					        <td><input name="key" type="checkbox" value="${work.cmKey}"  data-id="${work.cmKey}"/></td>
					        <td>${work.mgrName}</td>
					        <td><fmt:formatDate value="${work.officeDate}" pattern="yyyy-MM-dd"/></td>
					        <td>
					          <c:forEach items="${mgrLevel}" var="level">
							     <c:if test="${level.key eq work.cmPostion}">${level.value}</c:if> 	
					          </c:forEach>
					        </td>
					        <td>${work.cmUnit}</td>
					        <td>${work.cmWork}</td>
						    <td><a href="<%=basePath%>downLoadFile?fileName=${work.cmAttach}" class="tablelink">${work.cmAttach}</a></td>
					        <td><fmt:formatDate value="${work.modifyDate}" pattern="yyyy-MM-dd"/></td>
					        <td>${work.modifierName }</td>
				        </tr> 
			        </c:forEach>       
			        </tbody>
			    </table>
			</div> 	
			</c:if>
			</form>
			<script language="javascript">
				function openWindow(scanLog) {
					if (scanLog == 1) {
						document.getElementById('light1').style.display = 'block';
					}else if(scanLog == 2){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light2').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrResult?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#resultCmKey").val(data[0].cmKey);
					        		 $("#resultMgrId").val(data[0].mgrId);
					        		 $("#resultWorkYear").val(data[0].cmWorkYear);
					        		 $("#resultWorkResult").val(data[0].cmWorkResult);
					        		 $("#resultAttach").val(data[0].cmAttach);
					        	 }
					         }
					   });
					}else if(scanLog == 3){
						document.getElementById('light3').style.display = 'block';
					}else if(scanLog == 4){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light4').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrCert?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#certCmKey").val(data[0].cmKey);
					        		 $("#certMgrId").val(data[0].mgrId);
					        		 $("#certName").val(data[0].certName);
					        		 $("#certType").val(data[0].certType);
					        		 $("#certNo").val(data[0].certNo);
					        		 $("#certUnit").val(data[0].certUnit);
					        		 var Datetemp1= new Date(data[0].start);// 这里必须是整数，毫秒  
				                     var dateStr1 = Datetemp1.format("yyyy-MM-dd"); 
					        		 $("#certStart").val(dateStr1);
					        		 var Datetemp2= new Date(data[0].end);// 这里必须是整数，毫秒  
				                     var dateStr2 = Datetemp2.format("yyyy-MM-dd"); 
					        		 $("#certEnd").val(dateStr2);
					        		 $("#certRemark").val(data[0].remark);
					        		 $("#certUrl").val(data[0].certUrl);
					        	 }
					         }
					   });
					}else if(scanLog == 5){
						document.getElementById('light5').style.display = 'block';
					}else if(scanLog == 6){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light6').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrRpr?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#rprCmKey").val(data[0].cmKey);
					        		 $("#rprMgrId").val(data[0].mgrId);
					        		 $("#rprType").val(data[0].type);
					        		 $("#rprSub").val(data[0].sub);
					        		 var Datetemp1= new Date(data[0].date);// 这里必须是整数，毫秒  
				                     var dateStr1 = Datetemp1.format("yyyy-MM-dd"); 
					        		 $("#rprDate").val(dateStr1);
					        		 $("#rprAUnit").val(data[0].aUnit);
					        		 $("#rprAPerson").val(data[0].aPerson);
					        		 var Datetemp2= new Date(data[0].rDate);// 这里必须是整数，毫秒  
				                     var dateStr2 = Datetemp2.format("yyyy-MM-dd"); 
					        		 $("#rprRDate").val(dateStr2);
					        		 $("#rprAReason").val(data[0].aReason);
					        		 $("#rprRemark").val(data[0].remark);
					        		 $("#rprAttach").val(data[0].attach);
					        	 }
					         }
					   });
					}else if(scanLog == 7){
						document.getElementById('light7').style.display = 'block';
					}else if(scanLog == 8){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light8').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrMass?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#massCmKey").val(data[0].cmKey);
					        		 $("#massMgrId").val(data[0].mgrId);
					        		 var Datetemp= new Date(data[0].time);// 这里必须是整数，毫秒  
				                     var dateStr = Datetemp.format("yyyy-MM-dd"); 
					        		 $("#massTime").val(dateStr);
					        		 $("#massSub").val(data[0].sub);
					        		 $("#massPeriod").val(data[0].period);
					        		 $("#massResult").val(data[0].result);
					        		 $("#massApp").val(data[0].app);
					        		 $("#massUnit").val(data[0].unit);
					        		 $("#massRemark").val(data[0].remark);
					        		 $("#massAttach").val(data[0].attach);
					        	 }
					         }
					   });
					}else if(scanLog == 9){
						document.getElementById('light9').style.display = 'block';
					}else if(scanLog == 10){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light10').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrLtr?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#ltrCmKey").val(data[0].cmKey);
					        		 $("#ltrMgrId").val(data[0].mgrId);
					        		 var Datetemp1= new Date(data[0].date);// 这里必须是整数，毫秒  
				                     var dateStr1 = Datetemp1.format("yyyy-MM-dd"); 
					        		 $("#ltrDate").val(dateStr1);
					        		 $("#ltrSub").val(data[0].sub);
					        		 $("#ltrUnit").val(data[0].unit);
					        		 var Datetemp2= new Date(data[0].start);// 这里必须是整数，毫秒  
				                     var dateStr2 = Datetemp2.format("yyyy-MM-dd"); 
					        		 $("#ltrStart").val(dateStr2);
					        		 var Datetemp3= new Date(data[0].end);// 这里必须是整数，毫秒  
				                     var dateStr3 = Datetemp3.format("yyyy-MM-dd"); 
					        		 $("#ltrEnd").val(dateStr3);
					        		 $("#ltrKnow").val(data[0].know);
					        		 $("#ltrCredit").val(data[0].credit);
					        		 $("#ltrScore").val(data[0].score);
					        		 $("#ltrRemark").val(data[0].remark);
					        		 $("#ltrAttach").val(data[0].attach);
					        	 }
					         }
					   });
					}else if(scanLog == 11){
						document.getElementById('light11').style.display = 'block';
					}else if(scanLog == 12){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light12').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrLevel?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#levelCmKey").val(data[0].cmKey);
					        		 $("#levelMgrId").val(data[0].mgrId);
					        		 var Datetemp = new Date(data[0].date);// 这里必须是整数，毫秒  
				                     var dateStr = Datetemp.format("yyyy-MM-dd"); 
					        		 $("#levelDate").val(dateStr);
					        		 $("#levelLevel").val(data[0].level);
					        		 $("#levelType").val(data[0].type);
					        		 $("#levelAttach").val(data[0].attach);
					        	 }
					         }
					   });
					}else if(scanLog == 13){
						document.getElementById('light13').style.display = 'block';
					}else if(scanLog == 14){
						var objs=document.getElementsByName("key");//获取复选框的key
						var selectObjs=[];
						for(var i=0;i<objs.length;i++){
							if(objs[i].checked){		
								selectObjs.push(objs[i]);
							};
						}
						//只允许有一个选中
						if(selectObjs.length==1){
							document.getElementById('light14').style.display = 'block';
						}else if(selectObjs.length==0){
							alert("必须选择一项纪录修改!");
						}else{
							alert("只能选择一项纪录修改!");
						}
						$.ajax({
					         //发送请求URL，可使用相对路径也可使用绝对路径
					         url:"<%=basePath%>/modifyMgrWork?cmKey="+selectObjs[0].value,
					         //发送方式为GET，也可为POST，需要与后台对应
					         type:"GET",
					         //设置接收格式为JSON
					         dataType:"json",
					         //编码设置
					         contentType:"application/json;charset=utf-8",
					         //后台返回成功后处理数据，data为后台返回的json格式数据
					         success:function(data){
					        	 if(data.length>0){
					        		 $("#workCmKey").val(data[0].cmKey);
					        		 $("#workMgrId").val(data[0].mgrId);
					        		 var Datetemp= new Date(data[0].officeDate);// 这里必须是整数，毫秒  
				                     var dateStr = Datetemp.format("yyyy-MM-dd"); 
					        		 $("#workofficeDate").val(dateStr);
					        		 $("#workcmPostion").val(data[0].cmPostion);
					        		 $('#workcmPostion').find("option[value='02']").attr("selected",true);
					        		 $("#workUnit").val(data[0].cmUnit);
					        		 $("#workWork").val(data[0].cmWork);
					        		 $("#workAttach").val(data[0].cmAttach);
					        	 }
					         }
					   });
					}
				}
				function closeWindow(id) {
					document.getElementById(id).style.display = 'none';
				}
			</script>
			<div id="light1" class="firstScan_main">
				<form action="<%=basePath%>mgrResultAdd" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加年度工作业绩</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if>
						    </li>
						    <li><label>工作年度</label><input name="cmWorkYear" type="text" class="dfinput"/> </li>
						    <li><label>工作业绩</label><input name="cmWorkResult" type="text" class="dfinput"/></li>
						    <li><label>附件依据</label><input name="upload" type="file"/></li>
						    <li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
						    				<input type="reset" class="btn" value="关闭" onclick="closeWindow('light1')"/></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light2" class="firstScan_main">
				<form action="<%=basePath%>updateWorkResult" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="resultCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="cmAttach" id="resultAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改年度工作业绩</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="mgrId" id="resultMgrId" type="text" class="dfinput" readonly/></li>
							<li><label>工作年度</label><input name="cmWorkYear" id="resultWorkYear" type="text" class="dfinput"/></li>
							<li><label>工作业绩</label><input name="cmWorkResult" id="resultWorkResult" type="text" class="dfinput"/></li>
							<li><label>附件依据</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light2')"/></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light3" class="firstScan_main">
				<form action="<%=basePath%>addMgrCert" method="post" onsubmit="return toValid()" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加证件</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if>
						    </li>
							<li><label>证书名称</label><input name="certName" type="text" class="dfinput"/></li>
							<li><label>证书类型</label>
								<div class="vocation">
										<select class="select1" name="certType">
											<option value="">请选择</option>
											<option value="1">从业资格证</option>
											<option value="2">岗位证书</option>
										</select>
								</div></li>
							<li><label>证书编号</label><input name="certNo" type="text" class="dfinput"/></li>
							<li><label>发证单位</label><input name="certUnit" type="text" class="dfinput"/></li>
							<li><label>发证时间</label><input name="start" type="text" class="dfinput"/></li>
							<li><label>失效时间</label><input name="end" id="end" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light3')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light4" class="firstScan_main">
				<form action="<%=basePath%>updateMgrCert" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="certCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="certUrl" id="certUrl">
					<div class="formbody">
						<div class="formtitle">
							<span>修改证件</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="mgrId" id="certMgrId" type="text" class="dfinput" readonly/></li>
							<li><label>证书名称</label><input name="certName" id="certName" type="text" class="dfinput"/></li>
							<li><label>证书类型</label>
							<div class="vocation">
									<select class="select1" name="certType" id="certType">
										<option value="">请选择</option>
										<option value="1">从业资格证</option>
										<option value="2">岗位证书</option></select>
								</div></li>
							<li><label>证书编号</label><input name="certNo" id="certNo" type="text" class="dfinput"/></li>
							<li><label>发证单位</label><input name="certUnit" id="certUnit" type="text" class="dfinput"/></li>
							<li><label>发证时间</label><input name="start" id="certStart" type="text" class="dfinput"/></li>
							<li><label>失效时间</label><input name="end" id="certEnd" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" id="certRemark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light4')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light5" class="firstScan_main">
				<form action="<%=basePath%>addMgrRpr" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加奖惩记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if></li>
							<li><label>奖惩分类</label><input name="type" type="text" class="dfinput"/></li>
							<li><label>奖惩内容</label><input name="sub" type="text" class="dfinput"/></li>
							<li><label>生效日期</label><input name="date" type="text" class="dfinput"/></li>
							<li><label>审批单位</label><input name="aUnit" type="text" class="dfinput"/></li>
							<li><label>审批人</label><input name="aPerson" id="aPerson" type="text" class="dfinput" onchange="checkPerson()"/></li>
							<li><label>撤销日期</label><input name="rDate" type="text" class="dfinput"/></li>
							<li><label>撤销原因</label><input name="aReason" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light5')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light6" class="firstScan_main">
				<form action="<%=basePath%>updateMgrRpr" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="rprCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="attach" id="rprAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改奖惩记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="mgrId" id="rprMgrId" type="text" class="dfinput" readonly/></li>
							<li><label>奖惩分类</label><input name="type" id="rprType" type="text" class="dfinput"/></li>
							<li><label>奖惩内容</label><input name="sub" id="rprSub" type="text" class="dfinput"/></li>
							<li><label>生效日期</label><input name="date" id="rprDate" type="text" class="dfinput"/></li>
							<li><label>审批单位</label><input name="aUnit" id="rprAUnit" type="text" class="dfinput"/></li>
							<li><label>审批人</label><input name="aPerson" id="rprAPerson" type="text" class="dfinput" onchange="checkaPerson()"/></li>
							<li><label>撤销日期</label><input name="rDate" id="rprRDate" type="text" class="dfinput"/></li>
							<li><label>撤销原因</label><input name="aReason" id="rprAReason" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" id="rprRemark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn"value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light6')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light7" class="firstScan_main">
				<form action="<%=basePath%>addMgrMass" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加考核记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if></li>
							<li><label>考核时间</label><input name="time" type="text" class="dfinput"/></li>
							<li><label>考核内容</label><input name="sub" type="text" class="dfinput"/></li>
							<li><label>考核期间</label><input name="period" type="text" class="dfinput"/></li>
							<li><label>考核结果</label><input name="result" type="text" class="dfinput"/></li>
							<li><label>考核评价</label><input name="app" type="text" class="dfinput"/></li>
							<li><label>考核单位</label><input name="unit" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset"class="btn" value="关闭" onclick="closeWindow('light7')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light8" class="firstScan_main">
				<form action="<%=basePath%>updateMgrMass" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="massCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="attach" id="massAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改考核记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="mgrId" id="massMgrId" type="text" class="dfinput" readonly/></li>
							<li><label>考核时间</label><input name="time" id="massTime" type="text" class="dfinput"/></li>
							<li><label>考核内容</label><input name="sub" id="massSub" type="text" class="dfinput"/></li>
							<li><label>考核期间</label><input name="period" id="massPeriod" type="text" class="dfinput"/></li>
							<li><label>考核结果</label><input name="result" id="massResult" type="text" class="dfinput"/></li>
							<li><label>考核评价</label><input name="app" id="massApp" type="text" class="dfinput"/></li>
							<li><label>考核单位</label><input name="unit" id="massUnit" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" id="massRemark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light8')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light9" class="firstScan_main">
				<form action="<%=basePath%>addMgrLtr" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加学习培训记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if></li>
							<li><label>培训时间</label><input name="date" type="text" class="dfinput"/></li>
							<li><label>科目</label><input name="sub" type="text" class="dfinput"/></li>
							<li><label>培训单位</label><input name="unit" type="text" class="dfinput"/></li>
							<li><label>开始日期</label><input name="start" type="text" class="dfinput"/></li>
							<li><label>结束日期</label><input name="end" type="text" class="dfinput"/></li>
							<li><label>学时</label><input name="know" type="text" class="dfinput"/></li>
							<li><label>学分</label><input name="credit" type="text" class="dfinput"/></li>
							<li><label>成绩</label><input name="score" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light9')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light10" class="firstScan_main">
				<form action="<%=basePath%>updateMgrLtr" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="ltrCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="attach" id="ltrAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改学习培训记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="mgrId" id="ltrMgrId" type="text" class="dfinput"/></li>
							<li><label>培训时间</label><input name="date" id="ltrDate" type="text" class="dfinput"/></li>
							<li><label>科目</label><input name="sub" id="ltrSub" type="text" class="dfinput"/></li>
							<li><label>培训单位</label><input name="unit" id="ltrUnit" type="text" class="dfinput"/></li>
							<li><label>开始日期</label><input name="start" id="ltrStart" type="text" class="dfinput"/></li>
							<li><label>结束日期</label><input name="end" id="ltrEnd" type="text" class="dfinput"/></li>
							<li><label>学时</label><input name="know" id="ltrKnow" type="text" class="dfinput"/></li>
							<li><label>学分</label><input name="credit" id="ltrCredit" type="text" class="dfinput"/></li>
							<li><label>成绩</label><input name="score" id="ltrScore" type="text" class="dfinput"/></li>
							<li><label>备注</label><input name="remark" id="ltrRemark" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light10')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light11" class="firstScan_main">
				<form action="<%=basePath%>addMgrLevel" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加等级认定记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if></li>
							<li><label>认定时间</label><input name="date" type="text" class="dfinput"/></li>
							<li><label>认定级别</label><input name="level" type="text" class="dfinput"/></li>
							<li><label>认定类型</label><input name="type" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light11')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light12" class="firstScan_main">
				<form action="<%=basePath%>updateMgrLevel" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="levelCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="attach" id="levelAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改等级认定记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="mgrId" id="levelMgrId" type="text" class="dfinput"/></li>
							<li><label>认定时间</label><input name="date" id="levelDate" type="text" class="dfinput"/></li>
							<li><label>认定级别</label><input name="level" id="levelLevel" type="text" class="dfinput"/></li>
							<li><label>认定类型</label><input name="type" id="levelType" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light12')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light13" class="firstScan_main">
				<form action="<%=basePath%>addWorkHist" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="modifier" id="modifier" value="${user.userId}">
				    <input type="hidden" name="mgrId" value="${param.mgrId}">
					<div class="formbody">
						<div class="formtitle">
							<span>添加工作经历</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if></li>
							<li><label>任职日期</label><input name="officeDate" type="text" class="dfinput"/></li>
							<li><label>职务</label> 
						    	<div class="vocation">
							    	<select class="select1" name="cmPostion">
										<option value="">请选择</option>
										<c:forEach items="${mgrLevel}" var="level">
											<option value="${level.key}">${level.value}</option>		
										</c:forEach> 
							 		</select>
							 	</div>
						     </li>
							<li><label>单位</label><input name="cmUnit" type="text" class="dfinput"/></li>
							<li><label>工作经历</label><input name="cmWork" type="text" class="dfinput"/></li>
							<li><label>附件上传</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light13')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light14" class="firstScan_main">
				<form action="<%=basePath%>updateWorkHistory" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="cmKey" id="workCmKey">
				    <input type="hidden" name="modifier" value="${user.userId}">
				    <input type="hidden" name="cmAttach" id="workAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改工作经历</span>
						</div>
						<ul class="forminfo">
						    <li><label>客户经理编号</label><input name="mgrId" id="workMgrId" type="text" class="dfinput" readonly/></li>
						    <li><label>任职日期</label><input name="officeDate" id="workofficeDate" type="text" class="dfinput"/></li>
						    <li><label>职务</label> 
						    	<div class="vocation">
							    	<select class="select1" name="cmPostion" id="workcmPostion">
							    		<option value="">请选择</option>
										<c:forEach items="${mgrLevel}" var="level">
											<option value="${level.key}">${level.value}</option>		
										</c:forEach> 
							 		</select>
							 	</div>
						     </li>
						    <li><label>单位</label><input name="cmUnit" id="workUnit" type="text" class="dfinput"/> </li>
						    <li><label>工作经历</label><input name="cmWork" id="workWork" type="text" class="dfinput"/> </li>
						    <li><label>附件上传</label><input name="upload" type="file"/></li>
						    <li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
						    				<input type="reset" class="btn" value="关闭" onclick="closeWindow('light14')"/></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>
</body>
</html>