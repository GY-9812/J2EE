<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>客户经理信息综合维护</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>editor/kindeditor.js"></script>

<script type="text/javascript">
	function modifyClientMgr(){
		var $ids=[];     //定义一个空数组
		var $chkBoxes=$('#clientMgrTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请选择一个数据！');
			return false;
		}
		if ($chkBoxes.length>1){   //如果选择多于一个会弹出警告框
			alert('最多只能选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			$ids.push($(this).attr('data-id'));
		})
		window.location="<%=basePath%>modifyClientMgr?key="+$ids[0];
	}
	
	function confirmMsgDel()
	{  
		var ids="";
	    var $chkBoxes = $('#clientMgrTable').find('input:checked');   //找到被选中的checkbox集
	    if ($chkBoxes.length == 0) {         //如果不勾选弹出警告框
	      alert('请至少选择一个数据');
	      return false;
	    }
	     //遍历被选中的checkbox集
	    $($chkBoxes).each(function () { 
	      ids +=$(this).attr('data-id')+",";
	    })
	    ids = ids.substr(0,ids.length-1);
		if (confirm("您确定要删除选中的用户信息吗?"))
			 window.location="<%=basePath%>deleteMgr?cmid="+ids; 
	}
	
	function exportMsg()
	{  
	   if(confirm("您确定要导出吗?"))
	     window.location.href = "<%=basePath%>exportExcel";
	     
	}
	
	function deleteMgr(cmid){
		 if(confirm("删除客户经理信息,您确定要删除吗?")){
			 window.location="<%=basePath%>deleteMgr?cmid="+cmid;
		 }
	}
	
	function gotoPage(pn){
		if(null!=pn && pn!=''){
			document.form1.action="<%=basePath%>clientMgrList?pn="+pn;
		}
		var pageNum=$("#toPageNums").val();
		if(null!=pageNum && pageNum!=''){
			document.form1.action="<%=basePath%>clientMgrList?pn="+pageNum;
		}
		document.form1.submit();
	}
</script>
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
<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>
<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 100
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="clientMgrList">客户经理信息综合管理维护</a></li>
		</ul>
	</div>
	<form action="clientMgrList" method="post" name="form1">
		<div class="formbody">
			<ul class="seachform">
				<li><label>机构</label><input name="unit" type="text" class="scinput" value="${unit}"/></li>
	    		<li><label>客户经理编号</label><input name="cmid" type="text" class="scinput" value="${cmid}" /></li>
	    		<li><label>姓名</label><input name="cname" type="text" class="scinput" value="${cname}"/></li>
	    		<li><label>状态</label>  
	    			<div class="vocation">
	    				<select class="select1" name="status">
	    					<option value="">请选择</option>
	    					<option value="T" <c:if test="${status=='1'}">selected</c:if>>在职</option>
	    					<option value="F" <c:if test="${status=='2'}">selected</c:if>>退出</option>
	    				</select>
					</div></li>
				<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar1">
					<li><a href="<%=basePath%>toMgrAdd"><span><img 
								src="<%=basePath%>images/t01.png"/></span>添加</a></li>
	        		<li><a href="javascript:modifyClientMgr()"><span><img 
	        					src="<%=basePath%>images/t02.png"/></span>修改</a></li>
	        		<li><a href="javascript:confirmMsgDel()" ><span><img 
	        					src="<%=basePath%>images/t03.png"/></span>删除</a></li>
	        		<li><a href="javascript:exportMsg()" ><span><img 
	        					src="<%=basePath%>images/t06.png" height="24" width="20"/></span>导出</a></li>
				</ul>
			</div>
			<table class="tablelist" id="clientMgrTable">
				<thead>
					<tr class="tablehead">
						<td colspan="10">客户经理信息列表</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th>选择</th>
						<th>员工号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>身份证号</th>
						<th>出生日期</th>
						<th>客户经理等级</th>
						<th>机构</th>
						<th>部门</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach items="${pageInfo.list}" var="mgr">
				  	<tr>
						<td><input name="cmid" data-id="${mgr.cmid}" type="checkbox" value="${mgr.cmid}"/></td>
				        <td>${mgr.cmid}</td>
				        <td>${mgr.cname}</td>
				        <td><c:if test="${mgr.sex=='F'}">女</c:if>
					        <c:if test="${mgr.sex=='M'}">男</c:if></td>
				        <td>${mgr.ssn}</td>
				        <td><fmt:formatDate value="${mgr.birthday}" pattern="yyyy-MM-dd"/></td>
				        <td><c:forEach items="${mgrLevel}" var="itemtype">
							    <c:if test="${mgr.level eq itemtype.key}">
					            	${itemtype.value}
					            </c:if>
					    	</c:forEach>
				        </td>
				        <td>${mgr.unit}</td>
				        <td>${mgr.dept}</td>
				        <td><a href="<%=basePath%>clientMgr?cmid=${mgr.cmid}" class="tablelink">查看</a> 
				            <a href="javascript:deleteMgr('${mgr.cmid}')" class="tablelink"> 删除</a>
				        </td>
				    </tr> 
				  </c:forEach>
				</tbody>
			</table>
			<div class="pagin">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="STYLE4"><div class="message">
								共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum}&nbsp;</i>页
							</div></td>
						<td><table border="0" align="right" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="45"><img src="<%=basePath%>images/first.gif" width="33"
										height="20" style="cursor: hand" onclick="gotoPage(1)" /></td>
									<td width="50"><img src="<%=basePath%>images/back.gif" width="43"
										height="20" style="cursor: hand" onclick="gotoPage(${pageInfo.pageNum-1})" /></td>
									<td width="50"><img src="<%=basePath%>images/next.gif" width="43"
										height="20" style="cursor: hand" onclick="gotoPage(${pageInfo.pageNum+1})" /></td>
									<td width="40"><img src="<%=basePath%>images/last.gif" width="33"
										height="20" style="cursor: hand" onclick="gotoPage(${pageInfo.pages})" /></td>
									<td width="100"><div align="center">
											<span class="STYLE1">转到第 <input name="textfield" id="toPageNums"
												type="text" size="4"
												style="height: 16px; width: 35px; border: 1px solid #999999;" />
												页
											</span>
										</div></td>
									<td width="40"><img src="<%=basePath%>images/go.gif" width="33"
										height="17" style="cursor: hand" onclick="gotoPage('')" /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>