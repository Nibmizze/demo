<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
	<link href="css/main.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="plugins/artDialog/artDialog.source.js"></script>
	<script type="text/javascript" src="plugins/artDialog/plugins/iframeTools.source.js"></script>
	<script type="text/javascript" src="js/validator.js"></script>
	<script type="text/javascript" src="js/ui.js"></script>
	<script type="text/javascript" src="js/tableStyle.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#addUsers").click(function(){
	       layui.use(['layer'], function(){
		  var layer = layui.layer;
		  layer.open({
			  title: '信息',
			  type: 1,
	          skin: 'layui-layer-rim', //加上边框
	          area: ['280px', '330px'],
	 		  closeBtn: 1,
			  content: $('#info')
				});  
	 		});
		});
	
	//----------------------------------分页跳转----------------------------------//	 
	function goPage(){
	   var reg=/^[0-9]*$/;
		var page = document.getElementById("go").value;
		if(!reg.test(page)){
		   var page='${curPage}';
		   location.href="${pageContext.request.contextPath}/roleController/queryAllRoles.do?page="+page;
		}else{
			location.href="${pageContext.request.contextPath}/roleController/queryAllRoles.do?page="+page;
		}
	}
	
	//----------------------------------------修改商户信息-------------------------------------//	 
	 function updateUser(username) {
     		layui.use(['layer'], function(){
  			  var layer = layui.layer;
  			  layer.open({
  				  title: '信息',
  				  type: 2,
		          skin: 'layui-layer-rim', //加上边框
		          area: ['400px', '350px'],
		          closeBtn: 1,
  				  content: ['/spider/usersController/queryUpdate.do?username='+username ]
  				});  
  		 	 });
       };
	
   	//-------------------------------------------文本框验证---------------------------//
		function checkSubmit(id) {
			var username = document.getElementById("username");
			
			var reg = /^1[34578]\d{9}$/;
			var mreg = /^([0-9]){15}$/;;
			if (trim(username.value).length == 0 || username.value == "") {
				layui.use(['layer'], function(){
				   var layer = layui.layer;
				     layer.open({content:"用户名不能为空"});
				   });
				return false;
			}
			return true;
		}
	
	//---------------------关闭弹窗-----------------------//	 
	function onClose(){
		layui.use(['layer'], function(){
	 		var layer = layui.layer;
		    	layer.closeAll();
		});
	}
	
</script>
<style type="text/css">
	#td{
	text-align: center;
	}
	#go{
	width: 30px;
	height: 20px;
	}
	#form{
	 text-align: center;
	}
	div, ul, ol, li, form, fieldset, table, p {
	font: 12px/23px 宋体;
	}
	.do{
	color:blue;
	}
	.layui-input{
	width: 80px;
	height: 15px;
	}
	.lim{
	width: 100px;
	height: 18px;
	}
	.inp{
	margin-left:12px;
	float: left;
	}
	#cho{
	margin-left: 10px;
	padding-top: 5px;
	}
</style>
</head>
  
<body>
	<div style="height: 35px;background-color:#efefef;">
		<div id="cho">
			<button class="layui-btn layui-btn-mini" id="addUsers" type="button">添加</button>
		</div>
	</div>
  	<hr style="height:0px;">
	<c:choose>
	<c:when test="${not empty list}">
		<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
			<center style="overflow:auto;">
				<table id="table1" cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="100%">
					<tr>
						<th>序号</th>
						<th>角色ID</th>
						<th>角色名称</th>
						<th>操作</th>
					</tr>
					<c:forEach var="l" varStatus="s" items="${list}">
						<tr>
							<td id="td">${s.index+1}</td>
							<td id="td">${l.roleid}</td>
							<td id="td">${l.rolename}</td>
							<td id="td">
								<a href="javascript:void(0);"  onclick="updateUser();" style="color:blue">修改</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</center>
			<center>
				<div id="demo4">
					<a href="${pageContext.request.contextPath }/roleController/queryAllRoles.do?page=1">首页</a>
					<a href="${pageContext.request.contextPath }/roleController/queryAllRoles.do?page=${curPage-1}">上一页</a>
					${curPage }/${totalpage }
					<a href="${pageContext.request.contextPath }/roleController/queryAllRoles.do?page=${curPage+1}">下一页</a>
					<a href="${pageContext.request.contextPath }/roleController/queryAllRoles.do?page=${totalpage}">尾页</a>
					<input type="text" id="go" /> <input type="button" value="跳转" onclick="goPage()" />
				</div>
				<span>共${count}条记录</span>
			</center>
		</div>
	</c:when>
	<c:otherwise>
		<center>
		<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
			<table cellpadding="0" cellspacing="0" border="1px"
					bordercolor="#efefef" width="100%">
					<tr>
						<th>序号</th>
						<th>角色ID</th>
						<th>角色名称</th>
						<th>操作</th>
					</tr>
				</table>
				尚未有相关记录
			</div>
		</center>
	</c:otherwise>
	</c:choose>
	
	<!-- 添加用户信息弹框 -->
	<div id="info" style="display: none;">
		<form action="${pageContext.request.contextPath}/usersController/addUsers.do" method="post">
			<div class="dialogTop">
			  	<table style="margin-top:10;" border="0" align="center">
			        <tr>
			          <td align="right">角色ID：</td>
			          <td>
			          	<input type="text"  class="ldText" name="roleid" id="roleid" maxlength="10" style="width:140px;"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">角色名称：</td>
			          <td>
			          	<input type="text"  class="ldText" name="rolename" id="rolename" maxlength="15" style="width:140px;"/>
			          </td>
		          	</tr>
			   </table>
	   		</div>
		   	<div class="dialogBottom">
		   		<div class="btns">
			   		<input type="submit" class="ldBtnGreen" id="btn" value="确定" onclick="return checkSubmit();"/>
			   		<input type="button" value="关闭" class="ldBtnGray" onclick="onClose();">
			    </div>
			</div>
	  </form>
	</div>
</body>
</html>
