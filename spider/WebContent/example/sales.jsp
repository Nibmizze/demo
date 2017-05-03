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
    
    <title>业务员添加</title>
    
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
	
		$.ajax({
            url: '${pageContext.request.contextPath}/merchController/queryStore.do',
            type: 'POST',
            dataType: 'json',
            success: function (list) {
            	$("#storeid").html('');
            	if(list.length!=0){
					for(var i = 0 ;i<list.length;i++) {
						  $("#storeid").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
					};
				}
            }
        });
	
	
	$("#addSal").click(function(){
	       layui.use(['layer'], function(){
		  var layer = layui.layer;
		  layer.open({
			  title: '信息',
			  type: 1,
	          skin: 'layui-layer-rim', //加上边框
	          area: ['250px', '300px'],
	 		  closeBtn: 1,
			  content: $('#info')
				});  
	 		});
		});
	
	$("#salesid").blur(function(){
		$.ajax({
			url: '${pageContext.request.contextPath}/salesController/querySales.do',
			type: 'POST',
			data:{salesid:$("#salesid").val()},
			dataType: 'json',
			success: function (list) {
				if(list=='1'){
				layui.use(['layer'], function(){
					var layer = layui.layer;
					layer.open({content:"业务员编号已存在"});
					$("#btn").attr("disabled",true);
					});
				}else{
					$("#btn").attr("disabled",false);
				}
			}
		});
	})
	
	});
	
	//----------------------------------分页跳转----------------------------------//	 
	function goPage(){
	   var reg=/^[0-9]*$/;
		var page = document.getElementById("go").value;
		if(!reg.test(page)){
		   var page='${curPage}';
		   location.href="${pageContext.request.contextPath}/salesController/queryAllSales.do?page="+page;
		}else{
			location.href="${pageContext.request.contextPath}/salesController/queryAllSales.do?page="+page;
		}
	}
	
	//-------------------------------------------文本框验证---------------------------//
	function checkSubmit(id) {
		var salesid = document.getElementById("salesid");
		var salesMan = document.getElementById("salesMan");
		if (trim(salesid.value).length == 0 || salesid.value == "") {
			layui.use(['layer'], function(){
				   var layer = layui.layer;
				     layer.open({content:"业务员编号不能为空"});
				   });
			return false;
		}
		if (trim(salesMan.value).length == 0 || salesMan.value == "") {
			layui.use(['layer'], function(){
				   var layer = layui.layer;
				     layer.open({content:"业务员姓名不能为空"});
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
			<button class="layui-btn layui-btn-mini" id="addSal" type="button">添加</button>
		</div>
	</div>
   
	<c:choose>
	<c:when test="${not empty list}">
		<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
			<center style="overflow:auto;">
				<table id="table1" cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="100%">
					<tr>
						<th>序号</th>
						<th>机构号</th>
						<th>业务员编号</th>
						<th>业务员姓名</th>
						<th>联系电话</th>
						<th>状态</th>
						<th>邮箱</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
					<c:forEach var="l" varStatus="s" items="${list}">
						<tr>
							<td id="td"  style="width:50px;">${s.index+1}</td>
							<td id="td" style="width:100px;">${l.storeId}</td>
							<td id="td" style="width:100px;">${l.salesId}</td>
							<td id="td" style="width:100px;">${l.salesMan}</td>
							<td id="td" style="width:100px;">${l.linkTel}</td>
							<c:if test="${l.state=='0'}">
								<td id="td" style="width:50px;">录入</td>
							</c:if>
							<c:if test="${l.state=='1'}">
								<td id="td" style="width:50px;">已激活</td>
							</c:if>
							<c:if test="${l.state=='2'}">
								<td id="td" style="width:50px;">已注销</td>
							</c:if>
							<td id="td" style="width:200px;">${l.mail}</td>
							<td id="td"></td>
							<td id="td"  style="width:100px;">
								<a href="javascript:void(0);"  onclick="updateSales('${l.salesId}');" style="color:blue">修改</a>
								|
								<c:if test="${l.state!='2'}">
									<a href="${pageContext.request.contextPath}/salesController/logout.do?salesid=${l.salesId}" style="color:blue">注销</a>
								</c:if>
								<c:if test="${l.state=='2'}">
									已注销
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</center>
			<center>
				<div id="demo4">
					<a href="${pageContext.request.contextPath }/salesController/queryAllSales.do?page=1">首页</a>
					<a href="${pageContext.request.contextPath }/salesController/queryAllSales.do?page=${curPage-1}">上一页</a>
					${curPage }/${totalpage }
					<a href="${pageContext.request.contextPath }/salesController/queryAllSales.do?page=${curPage+1}">下一页</a>
					<a href="${pageContext.request.contextPath }/salesController/queryAllSales.do?page=${totalpage}">尾页</a>
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
						<th>机构号</th>
						<th>业务员编号</th>
						<th>业务员姓名</th>
						<th>联系电话</th>
						<th>状态</th>
						<th>邮箱</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</table>
				尚未有相关记录
			</div>
		</center>
	</c:otherwise>
	</c:choose>
	
	
	<!-- 添加业务员信息弹框 -->
	<div id="info" style="display: none;">
		<form action="${pageContext.request.contextPath}/salesController/addSales.do" method="post">
			<div class="dialogTop">
			  	<table style="margin-top:10;" border="0" align="center">
			        <tr>
			          <td align="right">机构号：</td>
			          <td>
			          	<select class="ldSelect" name="storeid" id="storeid" style="width:140px;height:24px;"></select>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">业务员编号：</td>
			          <td>
			          	<input type="text"  class="ldText" name="salesid" id="salesid" maxlength="11" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">业务员姓名：</td>
			          <td>
			          	<input type="text"  class="ldText" name="salesMan" id="salesMan" maxlength="20" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">联系电话：</td>
			          <td>
			          	<input type="text"  class="ldText" name="linkTel" maxlength="11" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td align="right">邮箱：</td>
			          <td>
			          	<input type="text"  class="ldText" name="mail" maxlength="20" style="width:140px;margin-top:5px"/>
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
