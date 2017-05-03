<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addTerm.jsp' starting page</title>
    
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/artDialog.source.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/plugins/iframeTools.source.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>
	<script type="text/javascript">
	$(function(){
	//级联2
	   $.ajax({
           url: '${pageContext.request.contextPath}/merchController/queryStore.do',
           type: 'POST',
           dataType: 'json',
           success: function (list) {
        	   $("#storeid").html('');
           		if(list.length!=0){
           			$("#storeid").append("<option value=''>-请选择机构-</option>");
					for(var i = 0 ;i<list.length;i++) {
					  $("#storeid").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
					};
				}
           	}
       });
       $("#storeid").change(function(){
       		if($("#storeid").val()!=""){
       			$("#salesid").attr("disabled",false);
       		}else{
       			$("#salesid").attr("disabled","disabled");
      		}
       });
       
		$("#storeid").click(function(){
			$("#salesid").html('');
       		$("#salesid").append("<option value=''>-请先选择机构-</option>");
       		$.ajax({
            	url: '${pageContext.request.contextPath}/merchController/querySales.do',
            	type: 'POST',
            	data:{storeid:$("#storeid").val()},
            	dataType: 'json',
            	success: function (list) {
            		if(list.length!=0){
            			$("#salesid").html('');
            			$("#salesid").append("<option value=''>-请先选择机构-</option>");
						for(var i = 0 ;i<list.length;i++) {
						  $("#salesid").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
						};
					}
            	}
        	});
       });
	});
	  //填写验证
	 function checknull(){
	    var mid = $("#mid1").val();
	    var tid = $("#tid1").val();
	    var belong = $("#belong1").val();
	    var model = $("#model1").val();
	    var serial_nu = $("#serial_nu1").val();
	    if(mid==""||tid==""||belong==""||model==""||serial_nu==""){
	       layer.alert("请将信息填写完整");
	       return false;
	    }else{
	       return true;
	    }
	 }
	</script>
  </head>
  
  <body>
    <!-- 添加终端信息弹框 -->
	<div id="addInfo">
		<form action="${pageContext.request.contextPath}/termController/addTerminfo.do" method="post" onsubmit="return checknull()">
			<div class="dialogTop">
			  	<table width="500px" style="margin-top:10px;" border="0" align="center">
		          	<tr>
			          <td style="text-align: right;">机构：</td>
			          <td>
			          	<select class="ldSelect" name="store_id" id="storeid" style="width:180px;height:24px;"></select>
			          </td>
			          <td style="text-align: right;">业务员：</td>
			          <td>
			          	<!-- <input type="text"  class="ldText " maxlength="20" name="sales_id" style="width:180px;"/> -->
			          	<select class="ldSelect" name="sales_id" id="salesid" style="width:180px;height:24px;">
			          		<option selected="selected">-请先选择机构-</option>
			          	</select>
			          </td>
		          	</tr>
			        <tr>
			          <td style="text-align: right;margin-top:5px">商户名：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="20" name="name" style="width:180px;margin-top:5px"/>
			          </td>
			          <td style="text-align: right;margin-top:5px">商户号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="mid" id="mid1" style="width:180px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td style="text-align: right;margin-top:5px">商户类型：</td>
			          <td>
			           <select class="ldSelect" name="type" id="type" style="width:180px;height:24px;margin-top:5px">
			          	  <option selected="selected" disabled="disabled" value="">---请选择---</option>
				          <option value="cups">cups</option>
				          <option value="o2o">o2o</option>
				        </select>
			          </td>
			          <td style="text-align: right;">终端号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="8" name="tid" id="tid1" style="width:180px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td style="text-align: right;">机具产权：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="belong" id="belong1" style="width:180px;margin-top:5px"/>
			          </td>
			          <td style="text-align: right;">机具型号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="model" id="model1" style="width:180px;margin-top:5px"/>
			          </td>
		          	</tr>
		          	<tr>
			          <td style="text-align: right;">机具序列号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="serial_nu" id="serial_nu1" style="width:180px;margin-top:5px"/>
			          </td>
			          <td style="text-align: right;">押金：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="deposit" style="width:180px;margin-top:5px"/>
			          </td>
		          	</tr>
			   </table>
	   		</div>
		   	<div class="dialogBottom">
		   		<div class="btns">
			   		<input type="submit" class="ldBtnGreen" value="确定"/>
			   		<input type="button" value="关闭" class="ldBtnGray" onclick="onClose();">
			    </div>
			</div>
	  </form>
	</div>
  </body>
</html>
