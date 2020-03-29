<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
<title>添加客户经理信息</title>
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
</script>
<script type="text/javascript">
	//校验用户是否已存在
	function checkUser(){
		var cname_val = $("#cname").val();
		$.ajax({
			url:"<%=basePath%>checkUser",
			data : {
				"username" : cname_val
			},
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				if (data.msg != null) {
					alert(data.msg);
					$("#cname").val("");
					$("#cname").focus();
				} 
			},
			error:function(){
				alert("后台服务器出错，请联系系统管理员！");
			}
		})
	}
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath %>clientMgrList">客户经理信息综合管理维护</a></li>
			<li><a href="#">添加</a></li>
		</ul>
	</div>
	<form action="<%=basePath%>addMgr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="modifyMemner" value="${user.userId}"/>
		<input type="hidden" name="modifier" value="${uname}"/>
    	<div class="formbody">
    		<div class="formtitle"><span>客户经理基本信息</span></div>
   			<c:if test="${flag!='1'}">
    		<ul class="forminfo">
    			<li><label>姓名</label><input name="cname" type="text" class="dfinput" value="" id="cname" onchange="checkUser()"/> </li>
    			<li><label>性别</label><cite><input name="sex" type="radio" value="M" checked="checked" />男
                                &nbsp;&nbsp;&nbsp;&nbsp;<input name="sex" type="radio" value="F" />女</cite></li>
    			<li><label>身份证号</label><input name="ssn" type="text" class="dfinput" length="18"/> </li>
			    <li><label>出生年月</label><input name="birthday" type="text" class="dfinput"  value="<fmt:formatDate value="${mgr.birthday}" pattern="yyyy-MM-dd"/>"/></li>
			    <li><label>年龄</label><input name="age" type="text" class="dfinput"/></li>
			    <li><label>民族</label><cite>
			           <select class="dfselect" name="nation">
			                 <c:forEach items="${nationParam}" var="nation">
								<option value="${nation.key}" >${nation.value }</option>		
						    </c:forEach>
						  </select>
			           </cite></li>
			    <li><label>政治面貌</label><cite>
			             <select class="dfselect" name="political">
			                 <c:forEach items="${policeStatus}" var="pol">
								<option value="${pol.key }">
									${pol.value }
								</option>		
						    </c:forEach>
						 </select>
						  </cite></li>
			    <li><label>籍贯</label><input name="homeTown" type="text" class="dfinput"  value=""/></li>
			    <li><label>照片</label><input name="pic" type="file"/>
			    </li>
			    <li><label>学历</label><cite>  
			       <select class="dfselect" name="education" >
			              <c:forEach items="${education}" var="edu">
								<option value="${edu.key }" >${edu.value }</option>		
						  </c:forEach>
			        </select>  </cite></li>
			    <li><label>学位</label><cite><select class="dfselect" name="degree">
						              <c:forEach items="${degree}" var="degree">
											<option value="${degree.key }" >${degree.value }</option>		
									  </c:forEach>
			    </select></cite></li>
			    <li><label>毕业院校及专业</label><input name="graduation" type="text" class="dfinput"  value=""/></li>
			    <li><label>专业技术职称</label><input name="professional" type="text" class="dfinput"  value=""/></li>
			    <li><label>客户经理等级</label><cite><select class="dfselect1" name="level">
					             <c:forEach items="${mgrLevel}" var="level">
											<option value="${level.key }" >${level.value }</option>		
									  </c:forEach>
					          </select></cite></li>
					           
			    <li><label>所在单位</label><input name="unit" type="text" class="dfinput"  value=""/></li>
			    <li><label>部门</label><input name="dept" type="text" class="dfinput"  value=""/></li>
			    <li><label>职务</label><input name="position" type="text" class="dfinput"  value=""/></li>
			    <li><label>业务条线</label><cite><input name="line" type="text" class="dfinput"  value=""/></cite></li>
			    <li><label>参加工作时间</label><input name="hireDate" type="text" class="dfinput"  value="<fmt:formatDate value="${mgr.hireDate}" pattern="yyyy-MM-dd"/>"/></li>
			    <li><label>入行时间</label><input name="entryDate" type="text" class="dfinput"  value="<fmt:formatDate value="${mgr.entryDate}" pattern="yyyy-MM-dd"/>"/></li>
			    <li><label>从事金融工作年限</label><input name="financeYears" type="text" class="dfinput"  value=""/></li>
			    <li><label>客户经理从业年限</label><input name="workYears" type="text" class="dfinput"  value=""/></li>
			    <!-- <li><label>退出时间</label><input name="exitTime" type="text" class="dfinput"  value=""/></li> -->
			    <li><label>办公电话</label><input name="tel" type="text" class="dfinput"  value=""/></li>
			    <li><label>手机</label><input name="mobile" type="text" class="dfinput"  value=""/></li>
			    <li>&nbsp;&nbsp;<input type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
			    				<input type="reset" class="btn" value="重置"/></li>
    		</ul>
    		</c:if>
    		<c:if test="${flag=='1'}">
    		<font color="green">${message}</font>
     		<ul class="forminfo">
			    <li><label>姓名</label><cite>${mgr.cname}</cite></li>
			    <li><label>性别</label><cite>
			    	<input name="sex" type="radio" value="M"  <c:if test="${'M' eq mgr.sex }">checked="checked" </c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="sex" type="radio" value="F" <c:if test="${'F' eq mgr.sex }">checked="checked" </c:if> />女</cite></li>
			    <li><label>身份证号</label><cite>${mgr.ssn}</cite></li>
			    <li><label>出生年月</label><cite><fmt:formatDate type="date" value="${mgr.birthday }" /></cite></li>
			    <li><label>年龄</label><cite>${mgr.age}</cite></li>
			    <li><label>民族</label><cite>
			        <select >
			              <c:forEach items="${nationParam}" var="nation">
								<option value="${nation.key}" <c:if test="${nation.key eq mgr.nation}">selected</c:if>>${nation.value}</option>
						  </c:forEach>
			        </select>
			    </cite></li>
			    <li><label>政治面貌</label><cite>
			          <select >
			              <c:forEach items="${policeStatus}" var="pol">
								<option value="${pol.key}" <c:if test="${pol.key eq mgr.political}">selected</c:if>>${pol.value}</option>
						  </c:forEach>
			        </select>
			        </cite>
			     </li>
			    <li><label>籍贯</label><cite>${mgr.homeTown}</cite></li>
			    <li><label>照片</label><cite><img alt="图片不存在" src="<%=basePath %>images/upload/${mgr.photo}" style="width:100px;height:100px"></cite></li> 
			    <li><label>学历</label><cite>
			       <select>
			              <c:forEach items="${education}" var="edu">
								<option value="${edu.key}" <c:if test="${edu.key eq mgr.education}">selected</c:if>>${edu.value}</option>		
						  </c:forEach>
			        </select>
			    </cite></li>
			    <li><label>学位</label><cite>
			     <select >
			              <c:forEach items="${degree}" var="degree">
								<option value="${degree.key}" <c:if test="${degree.key eq mgr.degree}">selected</c:if>>${degree.value}</option>		
						  </c:forEach>
			        </select>
			        </cite></li>
			    <li><label>毕业院校及专业</label><cite>${mgr.graduation}</cite></li>
			    <li><label>专业技术职称</label><cite>${mgr.professional}</cite></li>
			    <li><label>客户经理等级</label><cite>
			    	<select >
			    		<c:forEach items="${mgrLevel}" var="level">
							<option value="${level.key}" <c:if test="${level.key eq mgr.level}">selected</c:if>>${level.value}</option>		
						</c:forEach>
			        </select>
			        </cite></li>         
			    <li><label>所在单位</label><cite>${mgr.unit }</cite></li>
			    <li><label>部门</label><cite>${mgr.dept }</cite></li>
			    <li><label>职务</label><cite>${mgr.position }</cite></li>
			    <li><label>业务条线</label><cite>${mgr.line }</cite></li>
			    <li><label>参加工作时间</label><cite><fmt:formatDate type="date" value="${mgr.hireDate }" /></cite></li>
			    <li><label>入行时间</label><cite><fmt:formatDate type="date" value="${mgr.entryDate }" /></cite></li>
			    <li><label>从事金融工作年限</label><cite>${mgr.financeYears }</cite></li>
			    <li><label>客户经理从业年限</label><cite>${mgr.workYears }</cite></li>
			    <%-- <li><label>退出时间</label><cite><fmt:formatDate type="date" value="${mgr.exitTime }" /> </cite></li> --%>
			    <li><label>办公电话</label><cite>${mgr.tel }</cite></li>
			    <li><label>手机</label><cite>${mgr.mobile }</cite></li>
    		</ul>
    		</c:if>
    	</div>
    </form>
</body>
</html>