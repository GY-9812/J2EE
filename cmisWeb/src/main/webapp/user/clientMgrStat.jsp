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
<title>报表管理</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>editor/kindeditor.js"></script>

<script type="text/javascript">
	function exportMsg() {
		if (confirm("您确定要导出excel文件吗?"))
			window.location.href="<%=basePath%>exportStatExcel";
	}
	
	function gotoPage(pn){
		if(null!=pn && pn!=''){
			document.form1.action="<%=basePath%>statList?pn="+pn;
		}
		var pageNum=$("#toPageNums").val();
		if(null!=pageNum && pageNum!=''){
			document.form1.action="<%=basePath%>statList?pn="+pageNum;
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
			width : 200
		});
		$(".select3").uedSelect({
			width : 150
		});
	});
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>statList">报表管理</a></li>
		</ul>
	</div>
	<form action="statList" method="post" name="form1">
		<div class="formbody">
			<ul class="seachform">
				<li><label>机构</label><input name="unit" type="text" class="scinput" value="${unit}"/></li>
	    		<li><label>状态</label>  
	    			<div class="vocation">
	    				<select class="select1" name="status">
	    					<option value="">请选择</option>
	    					<option value="T" <c:if test="${status=='T'}">selected</c:if>>在职</option>
	    					<option value="F" <c:if test="${status=='F'}">selected</c:if>>退出</option>
	    				</select>
					</div></li>
				<li><label>性别</label>
					<div class="vocation">
						<select class="select1" name="sex">
							<option value="">请选择</option>
							<option value="M" <c:if test="${sex=='M'}">selected</c:if>>男</option>
							<option value="F" <c:if test="${sex=='F'}">selected</c:if>>女</option>
						</select>
					</div></li>
				<li><label>学历</label>
					<div class="vocation">
						<select class="select1" name="education">
							<option value="">请选择</option>
							<c:forEach items="${education}" var="edu">
								<option value="${edu.key}" <c:if test="${edu.key eq educat}">selected</c:if>>${edu.value}</option>		
							</c:forEach>
						</select>
					</div></li>
				<li><label>专业技术职称</label><input name="professional" type="text" class="scinput" value="${professional}"/></li>
				<li><label>客户经理等级</label>
				<div class="vocation">
						<select class="select3" name="level">
							<option value="">请选择</option>
							<c:forEach items="${mgrLevel}" var="level">
								<option value="${level.key}" <c:if test="${level.key eq lev}">selected</c:if>>${level.value}</option>		
							</c:forEach>
						</select>
					</div></li>
				<li><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="submit" class="scbtn" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="scbtn" value="导出excel" onClick="exportMsg()"/></li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="tools">
				<ul>
					<li></li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr class="tablehead">
						<td colspan="14">客户经理信息列表</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th>员工号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>客户经理等级</th>
						<th>机构</th>
						<th>部门</th>
						<th>业务条线</th>
						<th>职务</th>
						<th>客户经理从业年限</th>
						<th>联系电话</th>
						<th>在职</th>
						<th>年龄</th>
						<th>学历</th>
						<th>专业职称</th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach items="${pageInfo.list}" var="mgr">
					<tr>
						<td>${mgr.cmid}</td>
						<td>${mgr.cname}</td>
						<td><c:if test="${mgr.sex=='F'}">女</c:if>
					        <c:if test="${mgr.sex=='M'}">男</c:if></td>
						<td><c:forEach items="${mgrLevel}" var="itemtype">
							    <c:if test="${mgr.level eq itemtype.key}">
					            	${itemtype.value}
					            </c:if>
					    	</c:forEach>
				        </td>
						<td>${mgr.unit}</td>
						<td>${mgr.dept}</td>
						<td>${mgr.line}</td>
						<td>${mgr.position}</td>
						<td>${mgr.workYears}</td>
						<td>${mgr.mobile}</td>
						<td><c:if test="${mgr.status=='T'}">在职</c:if>
							<c:if test="${mgr.status=='F'}">退出</c:if></td>
						<td>${mgr.age}</td>
						<td><c:forEach items="${education}" var="edu">
							    <c:if test="${mgr.education eq edu.key}">
					            	${edu.value}
					            </c:if>
					    	</c:forEach>
					    </td>
						<td>${mgr.professional}</td>
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