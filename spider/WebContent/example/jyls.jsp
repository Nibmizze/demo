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
    
    <title>商户流水</title>
    
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
			
		      var role='${role}';
		      if(role=="10"){
		         $("#mid").attr("disabled",true);  
		         $("#mid").attr("placeholder","不可用");
		         $("#sal").attr("disabled",true);  
		         $("#sal").attr("placeholder","不可用");
		         $("#sto").attr("disabled",true);  
		         $("#sto").attr("placeholder","不可用");
		      }else if(role=="20"){
		    	  	 $("#sal").attr("disabled",true);  
			         $("#sal").attr("placeholder","不可用");
			         $("#sto").attr("disabled",true);  
			         $("#sto").attr("placeholder","不可用");
		      }else if(role=="30"){
		    	  	 $("#sto").attr("disabled",true);  
			         $("#sto").attr("placeholder","不可用");
			      }
			
			
//------------------------------------筛选查询-----------------------------------------// 
		        
	   if(role=="30"){
		   var storeid = '${user.ins}';
		   $.ajax({
	            url: '${pageContext.request.contextPath }/transController/querySales.do',
	            type: 'POST',
	            data:{storeid:storeid},
	            dataType: 'json',
	            success: function (list) {
	            	$("#sal").html('');
	            	if(list.length!=0){
	            		$("#sal").append("<option value=''>---请选择业务员---</option>");
						for(var i = 0 ;i<list.length;i++) {
							  $("#sal").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
						};
					}
	            }
	        });
	      }else if(role=="00"||role=="01" ||role=="02"){
	    	  	 
	    	  $.ajax({
	              url: '${pageContext.request.contextPath}/merchController/queryStore.do',
	              type: 'POST',
	              dataType: 'json',
	              success: function (list) {
	           	   $("#sto").html('');
	           	   var storeid = '${storeid}';
	           	   $("#sto").append("<option value=''>---请选择机构---</option>");
	                	if(list.length!=0){
	   	   				for(var i = 0 ;i<list.length;i++) {
	   	   					  if(storeid!=null&&storeid!=''&&storeid==list[i].storeId){
	   	   						$("#sto").append("<option value='"+list[i].storeId+"' selected='selected'>"+list[i].storeId+" "+list[i].storeName+"</option>");
	   	   					  }else{
	   	   						$("#sto").append("<option value='"+list[i].storeId+"'>"+list[i].storeId+" "+list[i].storeName+"</option>");
	   	   					  }
	   	   					};
	     				}
	              }
	          });
	          
	          $("#sto").click(function(){
	          	$.ajax({
	               url: '${pageContext.request.contextPath}/merchController/querySales.do',
	               type: 'POST',
	               data:{storeid:$("#sto").val()},
	               dataType: 'json',
	               success: function (list) {
	               	$("#sal").html('');
	               	var salesid = '${salesid}'
	              	    $("#sal").append("<option value=''>---请选择业务员---</option>");
	                  	if(list.length!=0){
	      					for(var i = 0 ;i<list.length;i++) {
	      						if(salesid!=null&&salesid!=''&&salesid==list[i].salesId){
	      							$("#sal").append("<option value='"+list[i].salesId+"' selected='selected'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
	   	   					  }else{
	   	   						$("#sal").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
	   	   					  }
	      					};
	      				}
	               }
	           });
	    	  
	         }) 
	      }
		
//---------------------------------日期插件---------------------------------//
		layui.use('laydate', function(){
		     var laydate = layui.laydate;
		     var start = {
			     min: '2010-01-01',
			     max: '2099-06-16',
			     istoday: false,
			     choose: function(datas){
			     	end.min   = datas; //开始日选好后，重置结束日的最小日期
			     	end.start = datas; //将结束日的初始值设定为开始日
				}
			 };
			  
			 var end = {
			    min:'2010-01-01',
			    max: '2099-06-16',
			    istoday: false,
			    choose: function(datas){
			      start.max = datas; //结束日选好后，重置开始日的最大日期
			    }
			  };
			  
			  document.getElementById('LAY_demorange_s').onclick = function(){
			    start.elem = this;
			    laydate(start);
			  }
			  document.getElementById('LAY_demorange_e').onclick = function(){
			    end.elem = this
			    laydate(end);
			  }
			});  
		});
//----------------------------------分页跳转----------------------------------//	 
	 function goPage()
	  {
	    var reg=/^[0-9]*$/;
		var page = document.getElementById("go").value;
		if(!reg.test(page))
		{
	    var page='${curPage}';
	    location.href="${pageContext.request.contextPath }/transController/showTrans.do?page="+page+"&sdate=${sdate}&edate=${edate}&mid=${mid}&orderpos=${orderpos}&type=${type}&storeid=${storeid}&salesid=${salesid}&stat=${stat}";
	    
		}else{
		location.href="${pageContext.request.contextPath }/transController/showTrans.do?page="+page+"&sdate=${sdate}&edate=${edate}&mid=${mid}&orderpos=${orderpos}&type=${type}&storeid=${storeid}&salesid=${salesid}&stat=${stat}";
	    }
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
    #LAY_demorange_s,#LAY_demorange_e{
    	border: 1px solid black;
    }
    </style>
    <script>

</script>
  </head>
  
  <body>
    <div style="height: 35px;background-color:#efefef;"></div>
    
       
     <!-- 筛选输入表单-隐藏-js点击 -->
     <div id="dinfo">
     <form id ="show" action="${pageContext.request.contextPath }/transController/showTrans.do" method="post">
         <div class="inp">机构编号:
	    	<select name="storeid" id="sto">
	    		<option value="">---请选择机构---</option>
	    	</select>
   		 </div>
        <div class="inp">业务员号:
      		<select name="salesid" id="sal">
      			<option value="">---请先选择机构---</option>
      		</select>
         </div>
          <div class="inp">商户编号:
          	<c:if test="${empty mid}">
          		<input name="mid" id="mid" class="lim">
          	</c:if>
          	<c:if test="${not empty mid}">
          		<input name="mid" id="mid" class="lim" value="${mid}">
          	</c:if>
          	
          </div>
         <div class="inp">交易类型:
          <c:if test="${empty type}">
          	<select class="lim" name="type">
         	  <option value="">---请选择---</option>
	          <option value="1">cups</option>
	          <option value="2">o2o</option>
	         </select>
          </c:if>
          <c:if test="${type=='1'}">
          	<select class="lim" name="type">
         	  <option value="">---请选择---</option>
	          <option value="1" selected="selected">cups</option>
	          <option value="2">o2o</option>
	         </select>
          </c:if>
          <c:if test="${type=='2'}">
          	<select class="lim" name="type">
         	  <option value="">---请选择---</option>
	          <option value="1">cups</option>
	          <option value="2" selected="selected">o2o</option>
	         </select>
          </c:if>
	     </div>
         
       	<div class="inp">交易状态:
			<c:if test="${empty stat}">
				<select name="stat" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="T">处理中</option>
			       	<option value="R">已冲正</option>
			       	<option value="C">已撤销</option>
			       	<option value="S">成功</option>
			       	<option value="E">失败</option>
				</select>
			</c:if>
			<c:if test="${stat=='T'}">
				<select name="stat" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="T" selected="selected">处理中</option>
			       	<option value="R">已冲正</option>
			       	<option value="C">已撤销</option>
			       	<option value="S">成功</option>
			       	<option value="E">失败</option>
				</select>
			</c:if>
			<c:if test="${stat=='R'}">
				<select name="stat" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="T">处理中</option>
			       	<option value="R" selected="selected">已冲正</option>
			       	<option value="C">已撤销</option>
			       	<option value="S">成功</option>
			       	<option value="E">失败</option>
				</select>
			</c:if>
			<c:if test="${stat=='C'}">
				<select name="stat" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="T">处理中</option>
			       	<option value="R">已冲正</option>
			       	<option value="C" selected="selected">已撤销</option>
			       	<option value="S">成功</option>
			       	<option value="E">失败</option>
				</select>
			</c:if>
			<c:if test="${stat=='S'}">
				<select name="stat" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="T">处理中</option>
			       	<option value="R">已冲正</option>
			       	<option value="C">已撤销</option>
			       	<option value="S" selected="selected">成功</option>
			       	<option value="E">失败</option>
				</select>
			</c:if>
			<c:if test="${stat=='E'}">
				<select name="stat" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="T">处理中</option>
			       	<option value="R">已冲正</option>
			       	<option value="C">已撤销</option>
			       	<option value="S">成功</option>
			       	<option value="E" selected="selected">失败</option>
				</select>
			</c:if>
      	</div>
      	<div class="inp">POS订单号:<input name="orderpos" class="lim" value="${orderpos}"></div>
         <div class="inp">
		        系统日期:
        	<div class="layui-inline">
				<input name="sdate" class="lim" id="LAY_demorange_s">
			</div>
  			-
        	<div class="layui-inline">
				<input name="edate" class="lim" id="LAY_demorange_e">
			</div>
		 </div>             
        <div style="left:10px;top:6px;position:absolute;">
			 	<button class="layui-btn layui-btn-mini layui-btn-normal" type="submit" id="btn">查询</button>
		</div>
       	
     </form>
  	 </div>
  	<hr style="height:0px;">
	<c:choose>
		<c:when test="${not empty list}">
			<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
				<center style="overflow:auto;">
					<table id="table1" cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="3000px">
						<tr>
							<th>序号</th>
							<th>交易名称</th>
							<th>交易分类</th>
							<th>交易日期</th>
							<th>交易时间</th>
							<th>交易账号</th>
							<th>交易金额</th>
							<th>机构号</th>
							<th>商户号</th>
							<th>商户名</th>
							<th>终端号</th>
							<th>交易状态</th>
							<th>返回码</th>
							<th>返回信息</th>
							<th>交易流水号</th>
							<th>参考号</th>
							<th>授权码</th>
							<th>原交易流水号</th>
							<th>批次号</th>
							<th>POS订单号</th>
							<th>交易编号</th>
							<th>业务员编号</th>
							<th>发卡行名</th>
							<th>国际组织代码</th>
							<th>清算标志</th>
							<th>系统日期</th>
							<th>系统时间</th>
						</tr>
						<c:forEach var="l" varStatus="s" items="${list}">
							<tr>
								<td id="td">${s.index+1}</td>
								<td id="td">${l.trName}</td>
								<c:if test="${l.type=='1'}">
									<td id="td">银行卡</td>
								</c:if>
								<c:if test="${l.type!='1'}">
									<td id="td">o2o</td>
								</c:if>
								<td id="td">${l.tdate}</td>
								<td id="td">${l.ttime}</td>
								<td id="td" style="text-align: left;">${l.actno}</td>
								<td id="td">${l.amt}</td>
								<td id="td">${l.storeid}</td>
								<td id="td">${l.mid}</td>
								<td id="td">${l.midName}</td>
								<td id="td">${l.tid}</td>
								<c:if test="${l.stat=='T'}">
									<td id="td">处理中</td>
								</c:if>
								<c:if test="${l.stat=='R'}">
									<td id="td">已冲正</td>
								</c:if>
								<c:if test="${l.stat=='C'}">
									<td id="td">已撤销</td>
								</c:if>
								<c:if test="${l.stat=='S'}">
									<td id="td">成功</td>
								</c:if>
								<c:if test="${l.stat=='E'}">
									<td id="td">失败</td>
								</c:if>
								<td id="td">${l.rspcode}</td>
								<td id="td">${l.rspmsg}</td>
								<td id="td">${l.traceno}</td>
								<td id="td">${l.refno}</td>
								<td id="td">${l.authcode}</td>
								<td id="td">${l.orgtrno}</td>
								<td id="td">${l.cycleno}</td>
								<td id="td" style="text-align: left;">${l.orderpos}</td>
								<td id="td" style="text-align: left;">${l.ordero2o}</td>
								<td id="td">${l.salesid}</td>
								<td id="td">${l.crdname}</td>
								<td id="td">${l.intid}</td>
								<td id="td">${l.sucflag}</td>
								<td id="td">${l.sdatetime}</td>
								<td id="td">${l.stime}</td>
							</tr>
						</c:forEach>
					</table>
				</center>
				<center>
					<div id="demo4">
						<a href="${pageContext.request.contextPath }/transController/showTrans.do?page=1&sdate=${sdate}&edate=${edate}&mid=${mid}&orderpos=${orderpos}&type=${type}&storeid=${storeid}&salesid=${salesid}&stat=${stat}">首页</a>
						<a href="${pageContext.request.contextPath }/transController/showTrans.do?page=${curPage-1}&sdate=${sdate}&edate=${edate}&mid=${mid}&orderpos=${orderpos}&type=${type}&storeid=${storeid}&salesid=${salesid}&stat=${stat}">上一页</a>
						${curPage }/${totalpage }
						<a href="${pageContext.request.contextPath }/transController/showTrans.do?page=${curPage+1}&sdate=${sdate}&edate=${edate}&mid=${mid}&orderpos=${orderpos}&type=${type}&storeid=${storeid}&salesid=${salesid}&stat=${stat}">下一页</a>
						<a href="${pageContext.request.contextPath }/transController/showTrans.do?page=${totalpage}&sdate=${sdate}&edate=${edate}&mid=${mid}&orderpos=${orderpos}&type=${type}&storeid=${storeid}&salesid=${salesid}&stat=${stat}">尾页</a>
						<input type="text" id="go" /> <input type="button" value="跳转" onclick="goPage()" />
					</div>
					<span>共${count}条记录</span>
				</center>
			</div>
		</c:when>
		<c:otherwise>
			<center  style="overflow:auto;">
			<div style="margin-top: 20px;">
				<table cellpadding="0" cellspacing="0" border="1px"
						bordercolor="#efefef" width="3000px">
						<tr>
							<th>交易名称</th>
							<th>交易分类</th>
							<th>交易日期</th>
							<th>交易时间</th>
							<th>交易账号</th>
							<th>交易金额</th>
							<th>机构号</th>
							<th>商户号</th>
							<th>商户名</th>
							<th>终端号</th>
							<th>交易状态</th>
							<th>返回码</th>
							<th>返回信息</th>
							<th>交易流水号</th>
							<th>参考号</th>
							<th>授权码</th>
							<th>原交易流水号</th>
							<th>批次号</th>
							<th>POS订单号</th>
							<th>交易编号</th>
							<th>业务员编号</th>
							<th>发卡行名</th>
							<th>国际组织代码</th>
							<th>清算标志</th>
							<th>系统日期</th>
							<th>系统时间</th>
						</tr>
					</table>
					尚未有相关记录
				</div>
			</center>
		</c:otherwise>
	</c:choose>
	
  </body>
  
</html>
