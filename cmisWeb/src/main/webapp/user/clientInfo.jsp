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
<title>客户信息管理</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	function modifyClient(){
		var $ids=[];     //定义一个空数组
		var $chkBoxes=$('#clientTable').find('input:checked'); //找到选中的checkBox集
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
		window.location="<%=basePath%>modifyClient?key="+$ids[0];
	}
	function confirmMsgDel() {
		var ids="";
		var $chkBoxes=$('#clientTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除用户信息,您确定要删除吗?"))
			window.location="<%=basePath%>deleteClient?keys="+ids;
	}
	function gotoPage(pn){
		//alert("pn===="+pn);
		if(null!=pn && pn!=''){
			document.form1.action="<%=basePath%>clientInfoList?pn="+pn;
		}
		var pageNum=$("#toPageNums").val();
		if(null!=pageNum && pageNum!=''){
			document.form1.action="<%=basePath%>clientInfoList?pn="+pageNum;
		}
		document.form1.submit();
		//alter("pageNum=="+pageNum);
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
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath %>clientInfoList">客户信息管理</a></li>
		</ul>
	</div>
	<form action="clientInfoList" method="post" name="form1">
		<div class="formbody">
			<ul class="seachform">
				<li><label>客户经理编号</label><input name="cmid" type="text" class="scinput" value="${cmid}"/></li>
				<li><label>客户姓名</label><input name="clientname" type="text" class="scinput" value="${clientname}"/></li>
				<li><label>客户身份证号</label><input name="ssn" type="text" class="scinput" value="${ssn}"/></li>
				<li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar1">
					<li><a href="<%=basePath%>user/clientInfoAdd.jsp"><span><img
								src="<%=basePath%>images/t01.png" /></span>添加</a></li>
					<li><a href="javascript:modifyClient()"><span><img
								src="<%=basePath%>images/t02.png" /></span>修改</a></li>
					<li><a href="javascript:confirmMsgDel()"><span><img
								src="<%=basePath%>images/t03.png" /></span>删除</a></li>
				</ul>
			</div>
			<table class="tablelist" id="clientTable">
				<thead>
					<tr class="tablehead">
						<td colspan="11">客户信息列表</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th>选择</th>
						<th>姓名</th>
						<th>身份证号</th>
						<th>联系方式</th>
						<th>年收入（万元）</th>
						<th>资产（万元）</th>
						<th>负债（万元）</th>
						<th>客户单位</th>
						<th>家庭住址</th>
						<th>业务关联</th>
						<th>客户经理</th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach items="${pageInfo.list}" var="client">
					<tr>
						<td><input name="client_ids" type="checkbox" value="${client.key}" data-id="${client.key}"/></td>
						<td>${client.clientname}</td>
						<td>${client.ssn}</td>
						<td>${client.tel}</td>
						<td>${client.salary}</td>
						<td>${client.balance}</td>
						<td>${client.debt}</td>
						<td>${client.unit}</td>
						<td>${client.address}</td>
						<td>${client.business}</td>
						<td>${client.cmname}</td>
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