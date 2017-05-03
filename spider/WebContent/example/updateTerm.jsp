<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateTerm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/artDialog.source.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/plugins/iframeTools.source.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>

    <script type="text/javascript">
    $(function(){
    //级联1
	    $.ajax({
           url: '${pageContext.request.contextPath}/merchController/queryStore.do',
           type: 'POST',
           dataType: 'json',
           success: function (list) {
        	   $("#sto").html('');
           	if(list.length!=0){
           		$("#sto").append("<option value=''>-请选择机构-</option>");
				for(var i = 0 ;i<list.length;i++) {
					  $("#sto").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
				};
			}
           }
       });
       $("#sto").change(function(){
       		if($("#sto").val()!=""){
       		$("#sal").attr("disabled",false);
       		}else{
       		$("#sal").attr("disabled","disabled");
      		}
       });
       
       $("#sto").click(function(){
        $("#sal").html('');
       	$("#sal").append("<option value=''>-请先选择机构-</option>");
       	$.ajax({
            url: '${pageContext.request.contextPath}/merchController/querySales.do',
            type: 'POST',
            data:{storeid:$("#sto").val()},
            dataType: 'json',
            success: function (list) {
            	if(list.length!=0){
            		$("#sal").html('');
            		$("#sal").append("<option value=''>-请先选择机构-</option>");
					for(var i = 0 ;i<list.length;i++) {
						  $("#sal").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
					};
				}
            }
         });
       });
     /* $.ajax({ 
          		url: '${pageContext.request.contextPath}/termController/showDatalist.do?tid='+tid, 
          		type: 'POST', 
          		dataType: "json",
          		success: function (data) {
          		layui.use(['layer'], function(){
				var layer = layui.layer;
				layer.alert(data);
				});
          		  parent.location.href="${pageContext.request.contextPath}/termController/showTerms.do";
				}, 
          		error: function (data) { 
          		  alert("error");
              	} 
			}); */
    });
   /*  function flush(){
     window.parent.location.href="${pageContext.request.contextPath}/termController/showTerms.do";
    } */
    </script>
  </head>
  
  <body>
   <div id="updateInfo">
        	<form id ="upfile" action="${pageContext.request.contextPath}/termController/updateDetail.do?tid=${term.tid }&mid=${term.mid}&type=${term.type}" method="post">
          		<div class="dialogTop">
			  	<table width="400px" style="margin-top:30px;" border="0">
			  	<tr>
			          <td style="text-align: right;">机构：</td>
			          <td>
			          	<div class="layui-inline">
							<input name="store_id" type="text" class="ldText" style="width:180px;" value="${term.store_id }" disabled="disabled">
						</div>
			          </td>
		          	</tr>
		          	<tr><td>&nbsp;</td></tr>
		          	<tr>
			          <td style="text-align: right;">业务员：</td>
			          <td>
			          	<div class="layui-inline">
							<input name="sales_id" type="text" class="ldText" style="width:180px;" value="${term.sales_id }" disabled="disabled">
						</div>
			          </td>
		          	</tr>
		          	<tr><td>&nbsp;</td></tr>
			     	<tr>
			          <td style="text-align: right;">机具产权：</td>
			          <td>
			          	<div class="layui-inline">
							<input name="belong" type="text" class="ldText" style="width:180px;" value="${term.belong }">
						</div>
			          </td>
		          	</tr>
		          	<tr><td>&nbsp;</td></tr>
		          	<tr>
			          <td style="text-align: right;">机具型号：</td>
			          <td>
			          	<div class="layui-inline">
							<input name="model" type="text" class="ldText" style="width:180px;" value="${term.model }">
						</div>
			          </td>
		          	</tr>
		          	<tr><td>&nbsp;</td></tr><tr>
			          <td style="text-align: right;">机具序列号：</td>
			          <td>
			          	<div class="layui-inline">
							<input name="serial_nu" type="text" class="ldText" style="width:180px;" value="${term.serial_nu }">
						</div>
			          </td>
		          	</tr>
		          	<tr><td>&nbsp;</td></tr>
		          	<tr>
			          <td style="text-align: right;">押金：</td>
			          <td>
			          	<div class="layui-inline">
							<input name="deposit" type="text" class="ldText" style="width:180px;" value="${term.deposit }">
						</div>
			          </td>
		          	</tr>
			    </table>
			    </div>
			    	<div class="dialogBottom">
		   				<div class="btns">
				    <button class="ldBtnGreen" type="submit">确认</button>
				   		 </div>
				    </div>
        	</form>
   </div>
  </body>
</html>
