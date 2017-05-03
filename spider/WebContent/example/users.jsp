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
		
	//--------------------------------------------------------------------------//
	
	$("#role").click(function(){
		var role=$("#role").val();
		if(role=="10"){
			$("#mid").attr("disabled",false);
	    	$("#mid").attr("placeholder","");
	    	$("#storeid").attr("disabled",true);
			$("#storeid").css("background-color","#efefef");
			$("#salesid").attr("disabled",true);
			$("#salesid").css("background-color","#efefef");
	     }else if(role=="20"){
	    	 $("#salesid").attr("disabled",false);
	    	 $("#salesid").css("background-color","");
	    	 $("#storeid").attr("disabled",true);
	         $("#storeid").css("background-color","#efefef");
	         $("#mid").attr("disabled",true);
	         $("#mid").attr("placeholder","不可用");
	     }else if(role=="30"){
	    	 $("#mid").attr("disabled",true);
	         $("#mid").attr("placeholder","不可用");
	         $("#salesid").attr("disabled",true);
	         $("#salesid").css("background-color","#efefef");
	         $("#storeid").attr("disabled",false);
	         $("#storeid").css("background-color","");
		  }else{
			 $("#mid").attr("disabled",true);
	         $("#mid").attr("placeholder","不可用");
	         $("#storeid").attr("disabled",true);
	         $("#storeid").css("background-color","#efefef");
	         $("#salesid").attr("disabled",true);
	         $("#salesid").css("background-color","#efefef");
		  }
	
	//----------------------------------添加用户ajax加载机构和业务员----------------------------------//
	
	if(role=="30"){
		$.ajax({
	        url: '${pageContext.request.contextPath}/usersController/queryStore.do',
	        type: 'POST',
	        dataType: 'json',
	        success: function (list) {
	     	   $("#storeid").html('');
	     	   $("#storeid").append("<option value=''>---请选择机构---</option>");
	          	if(list.length!=0){
	   				for(var i = 0 ;i<list.length;i++) {
	  							$("#storeid").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
	   					};
				}
	        }
	    });
	}
	
	if(role=='20'){
		$.ajax({
           url: '${pageContext.request.contextPath}/usersController/querySales.do',
           type: 'POST',
           dataType: 'json',
           success: function (list) {
        	   $("#salesid").html('');
        	   $("#salesid").append("<option value=''>---请选择业务员---</option>");
             	if(list.length!=0){
	   				for(var i = 0 ;i<list.length;i++) {
   						$("#salesid").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
   					};
  				}
           }
      });
	}
	
})
	
	//----------------------------------添加用户ajax加载机构和业务员----------------------------------//
	
	$.ajax({
	    url: '${pageContext.request.contextPath}/usersController/queryStore.do',
	    type: 'POST',
	    dataType: 'json',
	    success: function (list) {
	 	   $("#sto").html('');
	 	  var storeid = '${ins}';
	 	   $("#sto").append("<option value=''>---请选择机构---</option>");
	      	if(list.length!=0){
	      		for(var i = 0 ;i<list.length;i++) {
					  if(storeid==list[i].storeId){
						$("#sto").append("<option value='"+list[i].storeId+"' selected='selected'>"+list[i].storeId+" "+list[i].storeName+"</option>");
					  }else{
						$("#sto").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
					  }
				};
			}
	    }
	});
	
	
	$.ajax({
        url: '${pageContext.request.contextPath}/usersController/querySales.do',
        type: 'POST',
        dataType: 'json',
        success: function (list) {
     	   $("#sal").html('');
     	  var salesid = '${salesid}'
     	   $("#sal").append("<option value=''>---请选择业务员---</option>");
          	if(list.length!=0){
          		for(var i = 0 ;i<list.length;i++) {
					if(salesid==list[i].salesId){
						$("#sal").append("<option value='"+list[i].salesId+"' selected='selected'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
  					  }else{
  						$("#sal").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
  					  }
				};
			}
        }
   });
	
	
});
	
	//----------------------------------分页跳转----------------------------------//	 
	function goPage(){
	   var reg=/^[0-9]*$/;
		var page = document.getElementById("go").value;
		if(!reg.test(page)){
		   var page='${curPage}';
		   location.href="${pageContext.request.contextPath}/usersController/queryAllUsers.do?page="+page+"&ins=${ins}&salesid=${salesid}&username=${username}&role=${roles}&member=${member}&mid=${mid}&state=${state}";
		}else{
			location.href="${pageContext.request.contextPath}/usersController/queryAllUsers.do?page="+page+"&ins=${ins}&salesid=${salesid}&username=${username}&role=${roles}&member=${member}&mid=${mid}&state=${state}";
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
			var member = document.getElementById("member");
			var role = document.getElementById("role");
			
			var reg = /^1[34578]\d{9}$/;
			var mreg = /^([0-9]){15}$/;;
			if (trim(username.value).length == 0 || username.value == "") {
				layui.use(['layer'], function(){
				   var layer = layui.layer;
				     layer.open({content:"用户名不能为空"});
				   });
				return false;
			}
			if (trim(role.value).length == 0 || role.value == "") {
				layui.use(['layer'], function(){
				   var layer = layui.layer;
				     layer.open({content:"用户角色不能为空"});
				   });
				return false;
			}
			if (trim(member.value).length == 0 || member.value == "") {
				layui.use(['layer'], function(){
				   var layer = layui.layer;
				     layer.open({content:"真实姓名不能为空"});
				   });
				return false;
			}
			//---------role改成role.value
			if(role.value=="10"){
				var mid = document.getElementById("mid");
				if (trim(mid.value).length == 0 || mid.value == "") {
					layui.use(['layer'], function(){
					   var layer = layui.layer;
					     layer.open({content:"商户号不能为空"});
					   });
					return false;
				}
			}
			if(role.value=="20"){
				var salesid = document.getElementById("salesid");
				if (trim(salesid.value).length == 0 || salesid.value == "") {
					layui.use(['layer'], function(){
					   var layer = layui.layer;
					     layer.open({content:"业务员号不能为空"});
					   });
					return false;
				}
			}
			if(role.value=="30"){
				var storeid = document.getElementById("storeid");
				if (trim(storeid.value).length == 0 || storeid.value == "") {
					layui.use(['layer'], function(){
					   var layer = layui.layer;
					     layer.open({content:"机构号不能为空"});
					   });
					return false;
				}
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
   <!-- 筛选输入表单-隐藏-js点击 -->
     <form id ="show" action="${pageContext.request.contextPath }/usersController/queryAllUsers.do" method="post">
         <div class="inp">机构编号:
		    <select name="ins" id="sto">
		    	<option value="">---请选择机构---</option>
		    </select>
	     </div>

       	 <div class="inp">业务员号:
       		<select name="salesid" id="sal">
       			<option value="">---请选择业务员---</option>
       		</select>
         </div>
         <div class="inp">用户名:<input name="username" class="lim"></div> 
       	 <div class="inp">用户角色:
			<select name="role" lay-verify="required">
		       	<option value="">请选择用户角色</option>
       			<option value="00">00 管理员</option>
          		<option value="01">01 操作员</option>
          		<option value="02">02 财务</option>
          		<option value="10">10 商户</option>
          		<option value="20">20 业务员</option>
          		<option value="30">30 机构</option>
			</select>
      	 </div>
      	 <div class="inp">真实姓名:<input name="member" class="lim"></div>
      	 <div class="inp">商户号:<input name="mid" class="lim"></div>
      	 <div class="inp">用户状态:
			<select name="state" lay-verify="required">
		       	<option value="">用户状态</option>
       			<option value="0">正常</option>
          		<option value="1">已注销</option>
			</select>
      	 </div>
		 <div style="left:60px;top:6px;position:absolute;">
		 	<button class="layui-btn layui-btn-mini layui-btn-normal" type="submit" id="btn">查询</button>
		 </div>
     </form>
  	<hr style="height:0px;">
	<c:choose>
	<c:when test="${not empty list}">
		<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
			<center style="overflow:auto;">
				<table id="table1" cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="100%">
					<tr>
						<th>序号</th>
						<th>用户名</th>
						<th>用户密码</th>
						<th>用户角色</th>
						<th>真实姓名</th>
						<th>商户号</th>
						<th>机构号</th>
						<th>业务员编号</th>
						<th>用户状态</th>
						<th>操作</th>
					</tr>
					<c:forEach var="l" varStatus="s" items="${list}">
						<tr>
							<td id="td">${s.index+1}</td>
							<td id="td">${l.username}</td>
							<td id="td">${l.passwd}</td>
							<td id="td">${l.role}</td>
							<td id="td">${l.member}</td>
							<td id="td">${l.mid}</td>
							<td id="td">${l.ins}</td>
							<td id="td">${l.salesid}</td>
							<c:if test="${l.state=='0'}">
								<td id="td">正常</td>
							</c:if>
							<c:if test="${l.state=='1'}">
								<td id="td">不可用</td>
							</c:if>
							<td id="td">
								<a href="javascript:void(0);"  onclick="updateUser('${l.username}');" style="color:blue">修改</a>
								|
								<c:if test="${l.state=='0'}">
									<a href="${pageContext.request.contextPath}/usersController/logout.do?username=${l.username}" style="color:blue">注销</a>
								</c:if>
								<c:if test="${l.state=='1'}">
									已注销
								</c:if>
								|
								<a href="${pageContext.request.contextPath}/usersController/updatePwd.do?username=${l.username}" style="color:blue">密码重置</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</center>
			<center>
				<div id="demo4">
					<a href="${pageContext.request.contextPath }/usersController/queryAllUsers.do?page=1&ins=${ins}&salesid=${salesid}&username=${username}&role=${roles}&member=${member}&mid=${mid}&state=${state}">首页</a>
					<a href="${pageContext.request.contextPath }/usersController/queryAllUsers.do?page=${curPage-1}&ins=${ins}&salesid=${salesid}&username=${username}&role=${roles}&member=${member}&mid=${mid}&state=${state}">上一页</a>
					${curPage }/${totalpage }
					<a href="${pageContext.request.contextPath }/usersController/queryAllUsers.do?page=${curPage+1}&ins=${ins}&salesid=${salesid}&username=${username}&role=${roles}&member=${member}&mid=${mid}&state=${state}">下一页</a>
					<a href="${pageContext.request.contextPath }/usersController/queryAllUsers.do?page=${totalpage}&ins=${ins}&salesid=${salesid}&username=${username}&role=${roles}&member=${member}&mid=${mid}&state=${state}">尾页</a>
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
						<th>用户名</th>
						<th>用户密码</th>
						<th>用户角色</th>
						<th>真实姓名</th>
						<th>商户号</th>
						<th>机构号</th>
						<th>业务员编号</th>
						<th>用户状态</th>
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
			          <td align="right">用户名：</td>
			          <td>
			          	<input type="text"  class="ldText" name="username" id="username" maxlength="11" style="width:140px;"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">用户角色：</td>
			          <td>
	          			<select class="ldText" name="role" id="role" style="width:140px;height:24px;margin-top:5px">
		          			<option value="">请选择用户角色</option>
		          			<option value="00">00 管理员</option>
			          		<option value="01">01 操作员</option>
			          		<option value="02">02 财务</option>
			          		<option value="10">10 商户</option>
			          		<option value="20">20 业务员</option>
			          		<option value="30">30 机构</option>
		          		</select>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">真实姓名：</td>
			          <td>
		          		<input type="text"  class="ldText " id="member" name="member" maxlength="10" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">商户号：</td>
			          <td>
		          		<input type="text"  class="ldText " name="mid" id="mid" maxlength="15" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">机构编号：</td>
			          <td>
			          	<select class="ldText" name="ins" id="storeid" style="width:140px;height:24px;margin-top:5px">
			          		<option value=''>---请选择机构---</option>
			          	</select>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">业务员编号：</td>
			          <td>
			          	<select class="ldText" name="salesid" id="salesid" style="width:140px;height:24px;margin-top:5px">
			          		<option value=''>---请选择业务员---</option>
			          	</select>
			          </td>
		          	</tr>
		          	<tr>
		          <td align="right">用户状态：</td>
		          <td>
		          	<select class="ldText" name="state" id="state" style="width:140px;height:24px;margin-top:5px">
		          		<option value="0">正常</option>
		          		<option value="1">不可用</option>
		          	</select>
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
