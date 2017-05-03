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
		     if(role!="01"&&role!="00"){
		    	  $("#input").attr("class","layui-btn layui-btn-mini layui-btn-disabled");
		    	  $("#output").attr("class","layui-btn layui-btn-mini layui-btn-disabled");
		      }
			
//------------------------------添加操作时动态加载机构与业务员-----------------------------------------// 
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
		        
		        $("#storeid").click(function(){
		        	$.ajax({
			            url: '${pageContext.request.contextPath}/merchController/querySales.do',
			            type: 'POST',
			            data:{storeid:$("#storeid").val()},
			            dataType: 'json',
			            success: function (list) {
			            	$("#salesid").html('');
			            	if(list.length!=0){
								for(var i = 0 ;i<list.length;i++) {
									  $("#salesid").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
								};
							}
			            }
			        });
		        });
//------------------------------------筛选查询动态加载机构与业务员-----------------------------------------// 
		        
       if(role=='30'){
    	   var storeid = '${user.ins}';
		   $.ajax({
	            url: '${pageContext.request.contextPath }/transController/querySales.do',
	            type: 'POST',
	            data:{storeid:storeid},
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
           });
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
//---------------------------------添加信息弹框--------------------------------------------------//
	if(role=="01"||role=="00"){
		$("#output").click(function(){
	        layui.use(['layer'], function(){
			  var layer = layui.layer;
			  layer.open({
				  title: '信息',
				  type: 1,
		          skin: 'layui-layer-rim', //加上边框
		          area: ['600px', '350px'],
		 		  closeBtn: 1,
				  content: $('#info')
				});  
		 	 });
	   });
	
//------------------------------------导入表格--------------------------------------------//
	   /* $("#input").click(function(){
	     $("#file").click();
	   }); */
	   
	   $("#input").click(function(){
	       layui.use(['layer'], function(){
				var layer = layui.layer;
				layer.open({
					title:    '信息',
					type:     1,
     			    skin:     'layui-layer-rim', //加上边框
     			    area:     ['400px', '200px'],
     			    closeBtn: 1,
					content:  $('#inputInfo')
				});  
			});
	    });
	}  
//----------------------------------------------------------//	   
	   $("#type").change(function(){
	         var type=$("#type").val();
	      if(type=="cups"){
	    	 $("#dfee").attr("readonly",false);
	    	 $("#dfee").attr("placeholder","");
	    	 $("#cfee").attr("readonly",false);
	    	 $("#cfee").attr("placeholder","");
	    	 $("#dtop").attr("readonly",false);
	    	 $("#dtop").attr("placeholder","");
	         $("#o2ofee").attr("readonly",true);  
	         $("#o2ofee").attr("placeholder","该项不填"); 
	      }else{
	    	 $("#o2ofee").attr("readonly",false);
	    	 $("#o2ofee").attr("placeholder","");
	         $("#dfee").attr("readonly",true); 
	         $("#dfee").attr("placeholder","该项不填");
	         $("#cfee").attr("readonly",true);
	         $("#cfee").attr("placeholder","该项不填");
	         $("#dtop").attr("readonly",true);
	         $("#dtop").attr("placeholder","该项不填");
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
	    location.href="${pageContext.request.contextPath }/merchController/showMerch.do?page="+page+"&sdate=${sdate}&edate=${edate}&mid=${mid}&midName=${midName}&type=${type}&storeid=${storeid}&salesid=${salesid}&state=${state}";
	    
		}else{
		location.href="${pageContext.request.contextPath }/merchController/showMerch.do?page="+page+"&sdate=${sdate}&edate=${edate}&mid=${mid}&midName=${midName}&type=${type}&storeid=${storeid}&salesid=${salesid}&state=${state}";
	    }
	  }
//----------------------------------------修改商户信息-------------------------------------//	 
	 function updateInfo(mid,type) {
      		layui.use(['layer'], function(){
   			  var layer = layui.layer;
   			  layer.open({
   				  title: '信息',
   				  type: 2,
		          skin: 'layui-layer-rim', //加上边框
		          area: ['600px', '350px'],
		          closeBtn: 1,
   				  content: ['/spider/merchController/queryUpdate.do?mid='+mid+'&type='+type ]
   				});  
   		 	 });
        };
//-------------------------------------------文本框验证---------------------------//
		function checkSubmit(id) {
			var mid = document.getElementById("mid");
			var linkTel = document.getElementById("linkTel");
			var type = document.getElementById("type");
			var reg = /^1[34578]\d{9}$/;
			var mreg = /^([0-9]){15}$/;;
			if (!mreg.test(mid.value)) {
				layui.use(['layer'], function(){
					   var layer = layui.layer;
					     layer.open({content:"商户号不得为空且为15位数字组合"});
					   });
				return false;
			}
			if (trim(type.value).length == 0 || type.value == "") {
				layui.use(['layer'], function(){
					   var layer = layui.layer;
					     layer.open({content:"商户类型不得为空，请选择商户类型"});
					   });
				return false;
			}
			if (!reg.test(linkTel.value)) {
				layui.use(['layer'], function(){
					   var layer = layui.layer;
					     layer.open({content:"手机号不能为空且必须为正确的手机号!"});
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
    #LAY_demorange_s,#LAY_demorange_e{
    	border: 1px solid black;
    }
</style>
</head>
  
  <body>
    <div style="height: 35px;background-color:#efefef;">
	    <div id="cho">
	    	<button class="layui-btn layui-btn-mini layui-btn-warm" id="input" type="button"> 导入</button>
	    	<button class="layui-btn layui-btn-mini" id="output" type="button">添加</button>
	    </div>
    </div>
    
        <!-- 文件上传的表单-隐藏-js调用上传 -->
       <div id="inputInfo" style="display: none;">
          <form id ="upfile" action="${pageContext.request.contextPath}/merchController/inputExcel.do" method="post" enctype="multipart/form-data">
          		<div id="dialogTop" style="margin-top:20px;margin-left:20px;margin-right:20px">
				    <div>
				    <span>请选择上传文件：</span>
				    <input type="file" name="file" id="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
				    <a href="${pageContext.request.contextPath}/merchController/downloadModel.do" style="color: blue;">模板下载</a>
				    </div>
			    </div>
			    <div class="dialogBottom">
			   		<div class="btns">
				   		<input type="submit" class="ldBtnGreen" value="确定"/>
				   		<input type="button" value="关闭" class="ldBtnGray" onclick="onClose();">
				    </div>
				</div>
        	</form>
       </div>
       
     <!-- 筛选输入表单-隐藏-js点击 -->
     <form id ="show" action="${pageContext.request.contextPath }/merchController/showMerch.do" method="post">
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
         <div class="inp">商户类型:
          <c:if test="${type == 'cups'}">
          	<select class="lim" name="type">
	          <option value="">---请选择---</option>
	          <option value="cups" selected="selected">cups</option>
	          <option value="o2o">o2o</option>
         	</select>
          </c:if>
          <c:if test="${type == 'o2o'}">
          	<select class="lim" name="type">
	          <option value="">---请选择---</option>
	          <option value="cups">cups</option>
	          <option value="o2o" selected="selected">o2o</option>
         	</select>
          </c:if>
          <c:if test="${empty type}">
          	<select class="lim" name="type">
         	  <option value="">---请选择---</option>
	          <option value="cups">cups</option>
	          <option value="o2o">o2o</option>
         	</select>
          </c:if>
	     </div>
       	 <div class="inp">商户状态:
       	 	<c:if test="${state=='1'}">
				<select name="state" lay-verify="required">
			       	<option value="">全部状态</option>
			       	<option value="1" selected="selected">已激活</option>
			       	<option value="2">已注销</option>
				</select>
			</c:if>
			<c:if test="${state=='2'}">
				<select name="state" lay-verify="required">
			       	<option value="">全部状态</option>
			       	<option value="1">已激活</option>
			       	<option value="2" selected="selected">已注销</option>
				</select>
			</c:if>
			<c:if test="${empty state}">
				<select name="state" lay-verify="required">
			    	<option value="">全部状态</option>
			       	<option value="1">已激活</option>
			       	<option value="2">已注销</option>
				</select>
			</c:if>
      	 </div>
      	 <div class="inp">商户编号:<input name="mid" class="lim" value="${mid}"></div> 
         <div class="inp">商户名称:<input name="midName" class="lim" value="${midName}"></div>
         <div class="inp">
		        创建日期:
			<div class="layui-inline">
				<input name="sdate" class="lim" id="LAY_demorange_s">
			</div>
  			-
        	<div class="layui-inline">
				<input name="edate" class="lim" id="LAY_demorange_e">
			</div>
		 </div>
		 <div style="left:110px;top:6px;position:absolute;">
		 	<button class="layui-btn layui-btn-mini layui-btn-normal" type="submit" id="btn">查询</button>
		 </div>
     </form>
  	<hr style="height:0px;">
	<c:choose>
		<c:when test="${not empty list}">
			<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
				<center style="overflow:auto;">
					<table id="table1" cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="2500px">
						<tr>
							<th>序号</th>
							<th>机构号</th>
							<th>业务员</th>
							<th>商户名</th>
							<th>商户号</th>
							<th>商户类型</th>
							<th>借记卡手续费率</th>
							<th>贷记卡手续费率</th>
							<th>借记卡封顶金额</th>
							<th>O2O手续费率</th>
							<th>开户行</th>
							<th>结算账户名</th>
							<th>结算账户号</th>
							<th>商户联系人</th>
							<th>联系方式</th>
							<th>商户地址</th>
							<th>创建日期</th>
							<th>修改日期</th>
							<th>操作</th>
						</tr>
						<c:forEach var="l" varStatus="s" items="${list}">
							<tr>
								<td id="td">${s.index+1}</td>
								<td id="td">${l.storeid}</td>
								<td id="td">${l.salesid}</td>
								<td id="td">${l.midName}</td>
								<td id="td">${l.mid}</td>
								<td id="td">${l.type}</td>
								<td id="td">${l.dfee}</td>
								<td id="td">${l.cfee}</td>
								<td id="td">${l.dtop}</td>
								<td id="td">${l.o2ofee}</td>
								<td id="td">${l.branch}</td>
								<td id="td">${l.accname}</td>
								<td id="td">${l.accno}</td>
								<td id="td">${l.linkMan}</td>
								<td id="td">${l.linkTel}</td>
								<td id="td">${l.address}</td>
								<td id="td">${l.datadate}</td>
								<td id="td">${l.upTime}</td>
								<c:if test="${role=='01'}">
									<td id="td">
									<a href="javascript:void(0);"  onclick="updateInfo('${l.mid}','${l.type}');" style="color:blue">修改</a>|
									<c:if test="${l.state==1}">
										<a href="${pageContext.request.contextPath}/merchController/logout.do?mid=${l.mid}&type=${l.type}" style="color:blue">注销</a>
									</c:if>
									<c:if test="${l.state==2}">
										已注销
									</c:if>
								</td>
								</c:if>
								<c:if test="${role!='01'}">
									<td id="td">
									<a href="javascript:void(0);" style="color:gray">修改</a>|
									<c:if test="${l.state==1}">
										<a href="javascript:void(0);" style="color:gray">注销</a>
									</c:if>
									<c:if test="${l.state==2}">
										已注销
									</c:if>
								</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</center>
				<center>
					<div id="demo4">
						<a href="${pageContext.request.contextPath }/merchController/showMerch.do?page=1&sdate=${sdate}&edate=${edate}&mid=${mid}&midName=${midName}&type=${type}&storeid=${storeid}&salesid=${salesid}&state=${state}">首页</a>
						<a href="${pageContext.request.contextPath }/merchController/showMerch.do?page=${curPage-1}&sdate=${sdate}&edate=${edate}&mid=${mid}&midName=${midName}&type=${type}&storeid=${storeid}&salesid=${salesid}&state=${state}">上一页</a>
						${curPage }/${totalpage }
						<a href="${pageContext.request.contextPath }/merchController/showMerch.do?page=${curPage+1}&sdate=${sdate}&edate=${edate}&mid=${mid}&midName=${midName}&type=${type}&storeid=${storeid}&salesid=${salesid}&state=${state}">下一页</a>
						<a href="${pageContext.request.contextPath }/merchController/showMerch.do?page=${totalpage}&sdate=${sdate}&edate=${edate}&mid=${mid}&midName=${midName}&type=${type}&storeid=${storeid}&salesid=${salesid}&state=${state}">尾页</a>
						<input type="text" id="go" /> <input type="button" value="跳转" onclick="goPage()" />
					</div>
					<span>共${count}条记录</span>
				</center>
			</div>
		</c:when>
		<c:otherwise>
			<center style="overflow:auto;">
			<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
					<table cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="2500px">
						<tr>
							<th>序号</th>
							<th>机构号</th>
							<th>业务员</th>
							<th>商户名</th>
							<th>商户号</th>
							<th>商户类型</th>
							<th>借记卡手续费率</th>
							<th>贷记卡手续费率</th>
							<th>借记卡封顶金额</th>
							<th>O2O手续费率</th>
							<th>开户行</th>
							<th>结算账户名</th>
							<th>结算账户号</th>
							<th>商户联系人</th>
							<th>联系方式</th>
							<th>商户地址</th>
							<th>创建日期</th>
							<th>修改日期</th>
							<th>操作</th>
						</tr>
					</table>
					尚未有相关记录
				</div>
			</center>
		</c:otherwise>
	</c:choose>
	<!-- 添加商户信息弹框 -->
	<div id="info" style="display: none;">
		<form action="${pageContext.request.contextPath}/merchController/addOneInfo.do" method="post">
			<div class="dialogTop">
			  	<table style="margin-top:10;" border="0" align="center">
			        <tr>
			          <td align="right">机构号：</td>
			          <td>
			          	<select class="ldSelect" name="storeid" id="storeid" style="width:140px;height:24px;"></select>
			          </td>
			          <td align="right">业务员编号：</td>
			          <td>
			          	<select class="ldSelect" name="salesid" id="salesid" style="width:140px;height:24px;">
			          		<option selected="selected" disabled="disabled">---请先选择机构---</option>
			          	</select>
			          </td>
		          	</tr>
			        <tr>
			          <td align="right">商户号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="mid" id="mid" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">商户名：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="30" name="midName" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right">商户联系人：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="10" name="linkMan" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">联系方式：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="11" name="linkTel" id="linkTel" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right">商户类型：</td>
			          <td>
			          	<select class="ldSelect" name="type" id="type" style="width:140px;height:24px;margin-top:5px">
			          	  <option selected="selected" disabled="disabled" value="">---请选择---</option>
				          <option value="cups">cups</option>
				          <option value="o2o">o2o</option>
				        </select>
			          </td>
			          <td align="right">商户地址：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="50" name="address" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right">借记卡手续费率/%：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="6" name="dfee" id="dfee" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">开户行：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="6" name="branch" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
			        <tr>
			          <td align="right">贷记卡手续费率/%：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="6" name="cfee" id="cfee" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">结算账户名：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="30" name="accname" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right">借记卡封顶金额/元：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="6" name="dtop" id="dtop" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">结算账户号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="20" name="accno" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right">O2O手续费率/%：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="6" name="o2ofee" id="o2ofee" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">所属渠道：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="channel" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			   </table>
	   		</div>
		   	<div class="dialogBottom">
		   		<div class="btns">
			   		<input type="submit" class="ldBtnGreen" value="确定" onclick="return checkSubmit();"/>
			   		<input type="button" value="关闭" class="ldBtnGray" onclick="onClose();">
			    </div>
			</div>
	  </form>
	</div>
	
	
  </body>
  
</html>
