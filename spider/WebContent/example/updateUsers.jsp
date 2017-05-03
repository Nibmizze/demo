<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/artDialog.source.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/plugins/iframeTools.source.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>
<title></title>
<script type="text/javascript">
	$(function(){
		var storeid = '${users[0].ins}';
		var salesid = '${users[0].salesid}';
		var roles= '${users[0].role}';
		
		//--------------------------------------------------------------------------//
		if(roles=="10"){
			$("#mid").attr("disabled",false);
	    	$("#mid").attr("placeholder","");
	    	$("#storeid").attr("disabled",true);
			$("#storeid").css("background-color","#efefef");
			$("#salesid").attr("disabled",true);
			$("#salesid").css("background-color","#efefef");
	     }else if(roles=="20"){
	    	 $("#salesid").attr("disabled",false);
	    	 $("#salesid").css("background-color","");
	    	 $("#storeid").attr("disabled",true);
	         $("#storeid").css("background-color","#efefef");
	         $("#mid").attr("disabled",true);
	         $("#mid").attr("placeholder","不可用");
	         
	         $.ajax({
		           url: '${pageContext.request.contextPath}/usersController/querySales.do',
		           type: 'POST',
		           dataType: 'json',
		           success: function (list) {
		        	   $("#salesid").html('');
		        	   $("#salesid").append("<option value=''>---请选择业务员---</option>");
		             	if(list.length!=0){
		             		for(var i = 0 ;i<list.length;i++) {
		   					  if(salesid!=null&&salesid!=''&&salesid==list[i].salesId){
		   						$("#salesid").append("<option value='"+list[i].salesId+"' selected='selected'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
		   					  }else{
		   						$("#salesid").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
		   					  }
		   					};
		  				}
		           }
		      });
	         
	     }else if(roles=="30"){
	    	 $("#mid").attr("disabled",true);
	         $("#mid").attr("placeholder","不可用");
	         $("#salesid").attr("disabled",true);
	         $("#salesid").css("background-color","#efefef");
	         $("#storeid").attr("disabled",false);
	         $("#storeid").css("background-color","");
	         
	         $.ajax({
			        url: '${pageContext.request.contextPath}/usersController/queryStore.do',
			        type: 'POST',
			        dataType: 'json',
			        success: function (list) {
			     	   $("#storeid").html('');
			     	   $("#storeid").append("<option value=''>---请选择机构---</option>");
			          	if(list.length!=0){
			          		for(var i = 0 ;i<list.length;i++) {
		   					  if(storeid!=null&&storeid!=''&&storeid==list[i].storeId){
		   						$("#storeid").append("<option value='"+list[i].storeId+"' selected='selected'>"+list[i].storeId+" "+list[i].storeName+"</option>");
		   					  }else{
		   						$("#storeid").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
		   					  }
		   					};
						}
			        }
			    });
	         
		  }else{
			 $("#mid").attr("disabled",true);
	         $("#mid").attr("placeholder","不可用");
	         $("#storeid").attr("disabled",true);
	         $("#storeid").css("background-color","#efefef");
	         $("#salesid").attr("disabled",true);
	         $("#salesid").css("background-color","#efefef");
		  }

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
			
			//----------------------------------修改用户ajax加载机构和业务员----------------------------------//
			
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
		   					  if(storeid!=null&&storeid!=''&&storeid==list[i].storeId){
		   						$("#storeid").append("<option value='"+list[i].storeId+"' selected='selected'>"+list[i].storeId+" "+list[i].storeName+"</option>");
		   					  }else{
		   						$("#storeid").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
		   					  }
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
		   					  if(salesid!=null&&salesid!=''&&salesid==list[i].salesId){
		   						$("#salesid").append("<option value='"+list[i].salesId+"' selected='selected'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
		   					  }else{
		   						$("#salesid").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
		   					  }
		   					};
		  				}
		           }
		      });
			}
			
		})
		
		
	})
	
	//-------------------------------------------文本框验证---------------------------//
		function checkSubmit(id) {
			var username = document.getElementById("username");
			var linkTel = document.getElementById("linkTel");
			var type = document.getElementById("type");
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
</script>
</head>
<body>
	<!-- 修改用户信息 -->
	<form action="${pageContext.request.contextPath}/usersController/updateUser.do" method="post">
	<c:forEach  items="${users}" var="u">
		<div class="dialogTop">
			<table style="margin-top:10px;" border="0" align="center">
				<tr>
		          <td align="right">用户名：</td>
		          <td>
	          		<input type="text"  class="ldText " id="username" name="username" value="${u.username}" style="width:140px;margin-top:5px"/>
		          </td>
	          	</tr>
	          	<tr>
		          <td align="right">用户角色：</td>
		          <td>
		          <c:if test="${u.role=='00'}">
	          			<select disabled="disabled" class="ldSelect" name="role" id="role" style="width:147px;height:24px;margin-top:5px">
		          			<option value="00">不可修改管理员角色</option>
		          		</select>
		          	</c:if>
		          	<c:if test="${u.role=='01'}">
	          			<select class="ldText" name="role" id="role" style="width:147px;height:24px;margin-top:5px">
		          			<option value="">请选择用户角色</option>
			          		<option selected="selected" value="01">01 操作员</option>
			          		<option value="02">02 财务</option>
			          		<option value="10">10 商户</option>
			          		<option value="20">20 业务员</option>
			          		<option value="30">30 机构</option>
		          		</select>
		          	</c:if>
		          	<c:if test="${u.role=='02'}">
	          			<select class="ldText" name="role" id="role" style="width:147px;height:24px;margin-top:5px">
		          			<option value="">请选择用户角色</option>
			          		<option value="01">01 操作员</option>
			          		<option selected="selected" value="02">02 财务</option>
			          		<option value="10">10 商户</option>
			          		<option value="20">20 业务员</option>
			          		<option value="30">30 机构</option>
		          		</select>
		          	</c:if>
		          	<c:if test="${u.role=='10'}">
	          			<select class="ldText" name="role" id="role" style="width:147px;height:24px;margin-top:5px">
		          			<option value="">请选择用户角色</option>
			          		<option value="01">01 操作员</option>
			          		<option value="02">02 财务</option>
			          		<option selected="selected" value="10">10 商户</option>
			          		<option value="20">20 业务员</option>
			          		<option value="30">30 机构</option>
		          		</select>
		          	</c:if>
		          	<c:if test="${u.role=='20'}">
	          			<select class="ldText" name="role" id="role" style="width:147px;height:24px;margin-top:5px">
		          			<option value="">请选择用户角色</option>
			          		<option value="01">01 操作员</option>
			          		<option value="02">02 财务</option>
			          		<option value="10">10 商户</option>
			          		<option selected="selected" value="20">20 业务员</option>
			          		<option value="30">30 机构</option>
		          		</select>
		          	</c:if>
		          	<c:if test="${u.role=='30'}">
	          			<select class="ldText" name="role" id="role" style="width:147px;height:24px;margin-top:5px">
		          			<option value="">请选择用户角色</option>
			          		<option value="01">01 操作员</option>
			          		<option value="02">02 财务</option>
			          		<option value="10">10 商户</option>
			          		<option value="20">20 业务员</option>
			          		<option selected="selected" value="30">30 机构</option>
		          		</select>
		          	</c:if>
		          </td>
	          	</tr>
	          	<tr>
		          <td align="right">真实姓名：</td>
		          <td>
	          		<input type="text"  class="ldText " name="member" value="${u.member}" style="width:140px;margin-top:5px"/>
		          </td>
	          	</tr>
	          	<tr>
		          <td align="right">商户号：</td>
		          <td>
	          		<input type="text"  class="ldText " name="mid" id="mid" value="${u.mid}" style="width:140px;margin-top:5px"/>
		          </td>
	          	</tr>
	          	<tr>
		          <td align="right">机构编号：</td>
		          <td>
		          	<select class="ldText" name="ins" id="storeid" style="width:147px;height:24px;margin-top:5px">
		          		<option value=''>---请选择机构---</option>
		          	</select>
		          </td>
	          	</tr>
	          	<tr>
		          <td align="right">业务员编号：</td>
		          <td>
		          	<select class="ldText" name="salesid" id="salesid" style="width:147px;height:24px;margin-top:5px">
		          		<option value=''>---请选择业务员---</option>
		          	</select>
		          </td>
	          	</tr>
	          	<tr>
		          <td align="right">用户状态：</td>
		          <td>
		          	<select class="ldText" name="state" id="state" style="width:147px;height:24px;margin-top:5px">
		          		<c:if test="${u.state=='0'}">
		          			<option value="">选择用户状态</option>
			          		<option value="0" selected="selected">正常</option>
			          		<option value="1">不可用</option>
		          		</c:if>
		          		<c:if test="${u.state=='1'}">
		          			<option value="">选择用户状态</option>
			          		<option value="0">正常</option>
			          		<option value="1" selected="selected">不可用</option>
		          		</c:if>
		          	</select>
		          </td>
	          	</tr>
			</table>
		</div>
		<div class="dialogBottom">
	   		<div class="btns">
		   		<input type="submit" class="ldBtnGreen" value="确定"  onclick="return checkSubmit();"/>
		    </div>
		</div>
	</c:forEach>
	</form>
</body>
</html>