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
<link href="<%=basePath%>css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	function confirmMsgDel() {
		var ids="";
		var $chkBoxes=$('#userTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("删除用户信息,您确定要删除吗?"))
			window.location="<%=basePath%>deleteUser?userIds="+ids;
	}
	function userOpen() {
		var ids="";
		var $chkBoxes=$('#userTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("您确定要启用该用户吗?"))
			window.location="<%=basePath%>openUser?userIds="+ids;
	}
	function userClose() {
		var ids="";
		var $chkBoxes=$('#userTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("您确定要禁用该用户吗?"))
			window.location="<%=basePath%>closeUser?userIds="+ids;
	}
	function resetPass() {
		var ids="";
		var $chkBoxes=$('#userTable').find('input:checked'); //找到选中的checkBox集
		if ($chkBoxes.length==0){   //如果不选会弹出警告框
			alert('请至少选择一个数据！');
			return false;
		}
		//遍历被选中的数据集
		$($chkBoxes).each(function(){
			ids+=$(this).attr('data-id')+",";
		})
		if (confirm("重置密码,您确定要恢复初始密码吗?"))
			window.location="<%=basePath%>resetPass?userIds="+ids;
	}
	function gotoPage(pn){
		//alert("pn===="+pn);
		if(null!=pn && pn!=''){
			document.form1.action="<%=basePath%>userInfoList?pn="+pn;
		}
		var pageNum=$("#toPageNums").val();
		if(null!=pageNum && pageNum!=''){
			document.form1.action="<%=basePath%>userInfoList?pn="+pageNum;
		}
		document.form1.submit();
		//alter("pageNum=="+pageNum);
	}
	function modifyUser() {
		var $ids=[];     //定义一个空数组
		var $chkBoxes=$('#userTable').find('input:checked'); //找到选中的checkBox集
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
		window.location="<%=basePath%>modifyUser?userId="+$ids[0];
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
			<li><a href="#">用户管理</a></li>
		</ul>
	</div>
	<form action="userInfoList" method="post" name="form1">
		<div class="formbody">
			<ul class="seachform">
				<li><label>用户编号</label><input name="userId" type="text"
					class="scinput" /></li>
				<li><label>姓名</label><input name="username" type="text" class="scinput" /></li>
				<li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询" /></li>
			</ul>
		</div>

		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar1">
					<li><a href="<%=basePath%>user/userInfoAdd.jsp"><span><img
								src="<%=basePath%>images/t01.png" /></span>添加</a></li>
					<li><a href="javascript:modifyUser()"><span><img
								src="<%=basePath%>images/t02.png" /></span>修改</a></li>
					<li><a href="javascript:confirmMsgDel()"><span><img
								src="<%=basePath%>images/t03.png" /></span>删除</a></li>
					<li><a href="javascript:userOpen()"><span><img
								src="<%=basePath%>images/t08.png" height="24" width="24" /></span>启用</a></li>
					<li><a href="javascript:userClose()"><span><img
								src="<%=basePath%>images/t09.png" height="24" width="24" /></span>禁用</a></li>
					<li><a href="javascript:resetPass()"><span><img
								src="<%=basePath%>images/t07.png" height="20" width="20" /></span>重置密码</a></li>
				</ul>
			</div>
			<table class="tablelist" id="userTable">
				<thead>
					<tr class="tablehead">
						<td colspan="11">客户信息列表</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th>选择</th>
						<th>用户编号</th>
						<th>姓名</th>
						<th>状态</th>
						<th>注册时间</th>
						<th>最后登录时间</th>
					</tr>
				
				</thead>
				<tbody>
				 <c:forEach items="${pageInfo.list}" var="user" >
					<tr>
						<td><input name="user_ids" type="checkbox" value="${user.userId}" data-id="${user.userId}"/></td>
						<td>${user.userId}</td>
						<td>${user.username }</td>
						<td><c:if test="${user.isEnable=='T'}">启用</c:if>
							<c:if test="${user.isEnable=='F'}">禁用</c:if></td>
						<td>${user.registerTime}</td>
						<td>${user.lastTime}</td>
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