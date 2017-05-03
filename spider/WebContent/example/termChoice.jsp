<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'termChoice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form id ="show" action="${pageContext.request.contextPath }/termController/showTerms.do" method="post">
		            <div class="inp">
				        创建日期:
		 			<div class="layui-inline">
						<input name="sdate" class="layui-input lim" id="LAY_demorange_s">
					</div>
		  			-
		 			<div class="layui-inline">
		  				<input name="edate" class="layui-input lim" id="LAY_demorange_e">
		 			</div> 
		 			</div>  
		 		   <div class="inp"> 机构:<input name="store_id" class="lim"></div>
		           <div class="inp"> 业务员:<input name="sales_id" class="lim"></div>           
		           <div class="inp">商户号:<input name="mid" class="lim"></div> 
		           <div class="inp"> 
		  	终端号: <input name="tid" class="lim" id="tid" list="tidInfo">
		           	<datalist id="tidInfo">
		           	 <c:forEach var="k" items="${klist}">
		           	 <option value="${k.tid }">${k.tid }</option>
		           	 </c:forEach>
		           	</datalist>
		           </div>
		           <div class="inp"> 机具产权:<input name="belong" class="lim"></div>
		           <div class="inp">机具型号:<input name="model" class="lim"></div>
		           <div class="inp">机具序列号:<input name="serial_nu" class="lim"></div>
		           
		           <div class="inp">
		  			 终端状态:
		  			<select name="state" lay-verify="required" class="lim">
		    	    	<option value="">全部状态</option>
		            	<option value="1">已激活</option>
		            	<option value="2">已注销</option>
		          	</select>
		          	<button class="layui-btn layui-btn-mini" type="submit">查询</button>
		          	</div>
		     </form>
  </body>
</html>
