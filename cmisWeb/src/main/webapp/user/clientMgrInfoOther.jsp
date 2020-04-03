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
	if(pageNum=='1'){
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
					<li><label>证书名称</label><input name="certName" type="text" class="scinput" /></li>
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
							<td>${cert.certType}</td>
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
					<li><label>考核时间</label><input name="" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(7)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(8)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(4)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist">
					<thead>
						<tr class="tablehead">
							<td colspan="12">考核记录</td>
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
							<th>维护日期</th>
							<th>维护人</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach items="a" var="a">
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>Tom</td>
							<td>2016-01-01</td>
							<td>工作业绩</td>
							<td>S</td>
							<td>表现良好</td>
							<td>贵州省分公司</td>
							<td>2016-04-09</td>
							<td>admin</td>
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
					<li><label>培训时间</label><input name="" type="text" class="scinput" /></li>
					<li><label>科目</label><input name="" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(9)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(10)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(5)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist">
					<thead>
						<tr class="tablehead">
							<td colspan="14">学员培训记录</td>
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
					  <c:forEach items="a" var="a">
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>Tom</td>
							<td>2016-01-01</td>
							<td>业务流程</td>
							<td>贵州省分公司</td>
							<td>2016-01-01</td>
							<td>2016-01-10</td>
							<td>10</td>
							<td>2</td>
							<td>90</td>
							<td></td>
							<td>2016-04-09</td>
							<td>admin</td>
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
					<li><label>认定时间</label><input name="" type="text" class="scinput" /></li>
					<li><label>认定级别</label><input name="" type="text" class="scinput" /></li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar1">
						<li><a href="javascript:openWindow(11)"><span><img src="<%=basePath%>images/t01.png" /></span>添加</a></li>
						<li><a href="javascript:openWindow(12)"><span><img src="<%=basePath%>images/t02.png" /></span>修改</a></li>
						<li><a href="javascript:oWorkPerformDel(6)"><span><img src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					</ul>
				</div>
				<table class="tablelist">
					<thead>
						<tr class="tablehead">
							<td colspan="14">等级认定记录</td>
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
					  <c:forEach items="a" var="a">
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>Tom</td>
							<td>2016-01-01</td>
							<td>初级会计师</td>
							<td>初级</td>
							<td></td>
							<td>2016-04-09</td>
							<td>admin</td>
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
						var objs=document.getElementsByName("key");//获取复选框的年度工作业绩key
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
					        		 var Datetemp= new Date(data[0].officeDate);// 这里必须是整数，毫秒  
				                     var dateStr = Datetemp.format("yyyy-MM-dd"); 
					        		 $("#ResultCmKey").val(data[0].cmKey);
					        		 $("#ResultMgrId").val(data[0].mgrId);
					        		 $("#ResultWorkYear").val(data[0].cmWorkYear);
					        		 $("#ResultWorkResult").val(data[0].cmWorkResult);
					        		 $("#ResultAttach").val(data[0].cmAttach);
					        		 $("#ResultmodifyDate").val(dateStr);
					        		 $("#Resultmodifier").val(data[0].modifier);
					        	 }
					         }
					   });
					}else if(scanLog == 3){
						document.getElementById('light3').style.display = 'block';
					}else if(scanLog == 4){
						document.getElementById('light4').style.display = 'block';
					}else if(scanLog == 5){
						document.getElementById('light5').style.display = 'block';
					}else if(scanLog == 6){
						document.getElementById('light6').style.display = 'block';
					}else if(scanLog == 7){
						document.getElementById('light7').style.display = 'block';
					}else if(scanLog == 8){
						document.getElementById('light8').style.display = 'block';
					}else if(scanLog == 9){
						document.getElementById('light9').style.display = 'block';
					}else if(scanLog == 10){
						document.getElementById('light10').style.display = 'block';
					}else if(scanLog == 11){
						document.getElementById('light11').style.display = 'block';
					}else if(scanLog == 12){
						document.getElementById('light12').style.display = 'block';
					}else if(scanLog == 13){
						document.getElementById('light13').style.display = 'block';
					}else if(scanLog == 14){
						var objs=document.getElementsByName("key");//获取复选框的工作经历key
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
					        		 var Datetemp= new Date(data[0].officeDate);// 这里必须是整数，毫秒  
				                     var dateStr = Datetemp.format("yyyy-MM-dd"); 
					        		 $("#workCmKey").val(data[0].cmKey);
					        		 $("#workMgrId").val(data[0].mgrId);
					        		 $("#workofficeDate").val(dateStr);
					        		 $("#workcmPostion").val(data[0].cmPostion);
					        		 //$("#workcmPostion option[value='"+data[0].cmPostion+"']").prop("selected",true);
					        		 //$('#workcmPostion').find("option[value="+data[0].cmPostion+"]").attr("selected",true);
					        		 $('#workcmPostion').find("option[value='02']").attr("selected",true);
					        		 // $("#workcmPostion").val(data[0].cmPostion).attr("selected",true);
					        		 $("#workUnit").val(data[0].cmUnit);
					        		 $("#workWork").val(data[0].cmWork);
					        		 $("#workAttach").text(data[0].cmAttach);
					        		 $("#workHistAttach").val(data[0].cmAttach);
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
				<form action="mgrResultAdd" method="post" enctype="multipart/form-data">
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
						    <li><label>工作年度</label><input name="cmWorkYear" id="officeDate" type="text" class="dfinput"/> </li>
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
			    <input type="hidden" name="cmKey" id="ResultCmKey">
			    <input type="hidden" name="modifier" value="${user.userId}">
			    <input type="hidden" name="cmAttach" id="ResultAttach"> 
					<div class="formbody">
						<div class="formtitle">
							<span>修改年度工作业绩</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label>
							    <c:if test="${param.mgrId =='' or param.mgrId==null}">
							        <input name="mgrId" type="text" class="dfinput" value="${user.userId}" readonly/>
							    </c:if>
							    <c:if test="${param.mgrId !='' and param.mgrId!=null}">
							        <input name="mgrId" type="text" class="dfinput" value="${param.mgrId}" readonly/>
							    </c:if></li>
							<li><label>工作年度</label><input name="cmWorkYear" id="ResultWorkYear" type="text" class="dfinput"/></li>
							<li><label>工作业绩</label><input name="cmWorkResult" id="ResultWorkResult" type="text" class="dfinput"/></li>
							<li><label>附件依据</label><input name="upload" type="file"/></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light2')"/></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light3" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>添加证件</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>证书名称</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>证书类型</label>
							<div class="vocation">
									<select class="select1">
										<option value="0">请选择</option>
										<option value="1">从业资格证</option>
										<option value="2">岗位证书</option></select>
								</div></li>
							<li><label>证书编号</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>发证单位</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>发证时间</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>失效时间</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>备注</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>附件上传</label><input name="" type="file" class="dfselect1" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light3')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light4" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>修改证件</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022" /></li>
							<li><label>证书名称</label><input name="" type="text" class="dfinput" value="工程师" /></li>
							<li><label>证书类型</label>
							<div class="vocation">
									<select class="select1">
										<option value="0">请选择</option>
										<option value="1" selected>从业资格证</option>
										<option value="2">岗位证书</option></select>
								</div></li>
							<li><label>证书编号</label><input name="" type="text" class="dfinput" value="092232008000912" /></li>
							<li><label>发证单位</label><input name="" type="text" class="dfinput" value="全国计算机中心" /></li>
							<li><label>发证时间</label><input name="" type="text" class="dfinput" value="2016-04-09" /></li>
							<li><label>失效时间</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>备注</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>附件上传</label><input name="" type="file" class="dfselect1" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light4')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light5" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>添加奖惩记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>奖惩分类</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>奖惩内容</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>生效日期</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>审批单位</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>审批人</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>撤销日期</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>撤销原因</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>备注</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>附件上传</label><input name="" type="file" class="dfselect1" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light5')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light6" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>修改奖惩记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022" /></li>
							<li><label>奖惩分类</label><input name="" type="text" class="dfinput" value="优秀员工" /></li>
							<li><label>奖惩内容</label><input name="" type="text" class="dfinput" value="现金5000元" /></li>
							<li><label>生效日期</label><input name="" type="text" class="dfinput" value="2016-01-01" /></li>
							<li><label>审批单位</label><input name="" type="text" class="dfinput" value="贵州省分公司" /></li>
							<li><label>审批人</label><input name="" type="text" class="dfinput" value="admin" /></li>
							<li><label>撤销日期</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>撤销原因</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>备注</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>附件上传</label><input name="" type="file" class="dfselect1" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn"value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light6')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light7" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>添加考核记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>考核时间</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>考核内容</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>考核结果</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>考核评价</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>考核单位</label><input name="" type="text" class="dfinput" value="" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset"class="btn" value="关闭" onclick="closeWindow('light7')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light8" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>修改考核记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022" /></li>
							<li><label>考核时间</label><input name="" type="text" class="dfinput" value="2016-01-01" /></li>
							<li><label>考核内容</label><input name="" type="text" class="dfinput" value="工作业绩" /></li>
							<li><label>考核结果</label><input name="" type="text" class="dfinput" value="S" /></li>
							<li><label>考核评价</label><input name="" type="text" class="dfinput" value="表现良好" /></li>
							<li><label>考核单位</label><input name="" type="text" class="dfinput" value="贵州省分公司" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="reset" class="btn" value="关闭" onclick="closeWindow('light8')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light9" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>添加学习培训记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>培训时间</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>科目</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>培训单位</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>开始日期</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>结束日期</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>学时</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>学分</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>成绩</label><input name="" type="text" class="dfinput" value="" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input  type="reset" class="btn" value="关闭" onclick="closeWindow('light9')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light10" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>修改学习培训记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022" /></li>
							<li><label>培训时间</label><input name="" type="text" class="dfinput" value="2016-01-01" /></li>
							<li><label>科目</label><input name="" type="text" class="dfinput" value="业务流程" /></li>
							<li><label>培训单位</label><input name="" type="text" class="dfinput" value="贵州省分公司" /></li>
							<li><label>开始日期</label><input name="" type="text" class="dfinput" value="2016-01-01" /></li>
							<li><label>结束日期</label><input name="" type="text" class="dfinput" value="2016-01-10" /></li>
							<li><label>学时</label><input name="" type="text" class="dfinput" value="10" /></li>
							<li><label>学分</label><input name="" type="text" class="dfinput" value="2" /></li>
							<li><label>成绩</label><input name="" type="text" class="dfinput" value="90" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light10')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light11" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>添加等级认定记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>认定时间</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>认定级别</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>认定类型</label><input name="" type="text" class="dfinput" value="" /></li>
							<li><label>附件上传</label><input name="" type="file" class="dfselect1" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light11')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light12" class="firstScan_main">
				<form action="" method="post">
					<div class="formbody">
						<div class="formtitle">
							<span>修改等级认定记录</span>
						</div>
						<ul class="forminfo">
							<li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022" /></li>
							<li><label>认定时间</label><input name="" type="text" class="dfinput" value="2016-01-01" /></li>
							<li><label>认定级别</label><input name="" type="text" class="dfinput" value="初级会计师" /></li>
							<li><label>认定类型</label><input name="" type="text" class="dfinput" value="初级" /></li>
							<li><label>附件上传</label><input name="" type="file" class="dfselect1" /></li>
							<li>&nbsp;&nbsp;<input type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light12')" /></li>
						</ul>
					</div>
				</form>
			</div>
			<div id="light13" class="firstScan_main">
				<form action="addWorkHist" method="post" enctype="multipart/form-data">
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
				<form action="<%=basePath %>updateWorkHistory" method="post" enctype="multipart/form-data">
			    <input type="hidden" name="cmKey" id="workCmKey">
			    <input type="hidden" name="modifier" value="${user.userId}">
			    <input type="hidden" name="cmAttach" id="workHistAttach">
					<div class="formbody">
						<div class="formtitle">
							<span>修改工作经历</span>
						</div>
						<ul class="forminfo">
						    <li><label>客户经理编号</label><input name="mgrId" id="workMgrId" type="text" class="dfinput" readonly/> </li>
						    <li><label>任职日期</label><input name="officeDate" id="workofficeDate" type="text" class="dfinput"/> </li>
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
						    <li><label>附件上传</label><input name="upload" id="workAttach" type="file"/></li>
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