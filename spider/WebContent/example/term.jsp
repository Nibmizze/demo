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
    
    <title>终端管理</title>
    
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
	
	    //日期插件
		layui.use('laydate', function(){
			var laydate = layui.laydate;
		    var start = {
			    min: '2010-01-01'
			    ,max: '2099-06-16'
			    ,istoday: false
			    ,choose: function(datas){
			      end.min = datas; //开始日选好后，重置结束日的最小日期
			      end.start = datas //将结束日的初始值设定为开始日
			    }
			};
			  
			var end = {
			    min:'2010-01-01'
			    ,max: '2099-06-16'
			    ,istoday: false
			    ,choose: function(datas){
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
	   
	   var role='${role}';
	   		
		   if(role!="01"&&role!="00"){
		    	  $("#output").attr("class","layui-btn layui-btn-mini layui-btn-disabled");
		    	  $("#input").attr("class","layui-btn layui-btn-mini layui-btn-disabled");
		      }
		   
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
		      
			  
	   
	   if(role=="01"||role=="00"){
	    //------------------------------------导入表格（显示）--------------------------------------------//
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
	    
	    //---------------------------------添加信息弹框--------------------------------------------------//
	    $("#output").click(function(){
	       layui.use(['layer'], function(){
				var layer = layui.layer;
				layer.open({
					title:    '信息',
					type:     1,
     			    skin:     'layui-layer-rim', //加上边框
     			    area:     ['600px', '280px'],
     			    closeBtn: 1,
					content:  $('#addInfo')
				});  
			});
	    });
	  }  
	    //---------------------------------终端号自动补充--------------------------------------------------//
	    $("#tid").keyup(function(){
	    	var tid = $("#tid").val();
	      	$("#tidInfo").html("");
	      	if(tid!=""){
	        	$.ajax({ 
          			url: '${pageContext.request.contextPath}/termController/showDatalist.do?tid='+tid, 
          			type: 'POST', 
          			dataType: "text",
          			success: function (data) {
	          			var list = data.split(",");
		            	var opt = "";
		            	for(var i=0;i<10;i++){
		              		opt = opt + "<option>"+list[i]+"</option>";
		            	}
		            	$("#tidInfo").append(opt);
					}, 
          			error: function (data) { 
              		} 
				}); 
	      	}
	    });
	    
	     //------------------------------------导入表格--------------------------------------------//
	    $("#inputXls").click(function(){
	         var formData = new FormData($("#upfile")[0]);
	       	$.ajax({ 
          		url: '${pageContext.request.contextPath}/termController/inputTermExcel.do', 
          		type: 'POST', 
          		data: formData, 
          		dataType:'text',
         		async: false, 
          		cache: false, 
          		contentType: false, 
          		processData: false, 
          		success: function (data) {
             		layui.use(['layer'], function(){
			 			var layer = layui.layer;
			 			layer.closeAll();
			     		layer.open({
			     		content:data
			     		,btn:['确认']
			     		,yes:function(){
			     		 location.href="${pageContext.request.contextPath }/termController/showTerms.do";
			     		 }
			     		});
			  		});
				}, 
          		error: function (data) { 
               		layui.use(['layer'], function(){
			   			var layer = layui.layer;
			     		layer.closeAll();
			     		layer.alert("导入失败!" );
			   		});
              	} 
			});
	   }); 
	   
	      $("#sto").change(function(){
       		if($("#sto").val()!=""){
       			$("#sal").attr("disabled",false);
       		}else{
       			$("#sal").attr("disabled","disabled");
      		}
       });
	   //------------------------------------筛选查询动态加载机构与业务员-----------------------------------------// 
	   if(role=="30"){
	   var storeid = '${user.ins}';
       		$.ajax({
            	url: '${pageContext.request.contextPath}/merchController/querySales.do',
            	type: 'POST',
            	data:{storeid:storeid},
            	dataType: 'json',
            	success: function (list) {
            		$("#sal").html('');
            		var salesid = '${sales_id}'
	            	$("#sal").append("<option value=''>--请选择业务员--</option>");
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
	           	   var storeid = '${store_id}';
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
	   //------------------------------添加操作时动态加载机构与业务员-----------------------------------------// 
	   $.ajax({
           url: '${pageContext.request.contextPath}/merchController/queryStore.do',
           type: 'POST',
           dataType: 'json',
           success: function (list) {
        	   $("#storeid").html('');
           		if(list.length!=0){
           			$("#storeid").append("<option value=''>---请选择机构---</option>");
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
       		$("#salesid").append("<option value=''>请先选择机构</option>");
       		$.ajax({
            	url: '${pageContext.request.contextPath}/merchController/querySales.do',
            	type: 'POST',
            	data:{storeid:$("#storeid").val()},
            	dataType: 'json',
            	success: function (list) {
            		if(list.length!=0){
            			$("#salesid").html('');
            			$("#salesid").append("<option value=''>请先选择机构</option>");
						for(var i = 0 ;i<list.length;i++) {
						  $("#salesid").append("<option value='"+list[i].salesId+"'>"+list[i].salesId+" "+list[i].salesMan+"</option>");
						};
					}
            	}
        	});
       });
       //查询表单提交
       $("#selshow").click(function(){
          $("#show").submit();
       });      
	});
	 
	//----------------------------------------修改终端信息-------------------------------------//	 
	function updateInfo(type,mid,tid){
		layui.use(['layer'], function(){
	   		var layer = layui.layer;
		   	layer.open({
				title:    '信息',
				type:     2,
	        	/* skin:     'layui-layer-rim', //加上边框 */
	     		area:     ['400px', '450px'],
	     		closeBtn: 1,
	     		shadeClose: true,
				content:  ['/spider/termController/showSTerm.do?type='+type+'&mid='+mid+'&tid='+tid ]
			}); 
		}); 
	 }
	 
	function onClose(){
		layui.use(['layer'], function(){
			var layer = layui.layer;
		    layer.closeAll();
		});
	}
	 //跳页
	 function goPage()
	 {
	    var reg=/^[0-9]*$/;
		var page = document.getElementById("go").value;
		if(!reg.test(page))
		{
		    var page='${curPage}';
	    	location.href="${pageContext.request.contextPath }/termController/showTerms.do?page="+page+"&sdate=${sdate}&edate=${edate}&name=${termName}&mid=${mid}&tid=${tid}&belong=${belong}&model=${model}&state=${state}&serial_nu=${serial_nu}&store_id=${store_id}&sales_id=${sales_id}";
		}else{
			location.href="${pageContext.request.contextPath }/termController/showTerms.do?page="+page+"&sdate=${sdate}&edate=${edate}&name=${termName}&mid=${mid}&tid=${tid}&belong=${belong}&model=${model}&state=${state}&serial_nu=${serial_nu}&store_id=${store_id}&sales_id=${sales_id}";
	    }
	 }
	  
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
	
    <style type="text/css">
    	td{
    		text-align: center;
    	}
    	#go{
    		width: 30px;
    		height: 20px;
    	}
    	#form{
    		margin-left: 40px;
    		margin-top: 40px;
    	}
    	div, ul, ol, li, form, fieldset, table, p {
    		font: 12px/23px 宋体;
    	}
    	.do{
    		color:blue;
    	}
    	.lim{
    		width: 100px;
    		height: 18px;
    	}
    	#cho{
    		margin-left: 10px;
    		padding-top: 5px;
    	}
    	.inp{
     		margin-left:12px;
     		float: left;
    	}
    	#smn{
      		margin-left: 40px;
      		margin-top: 5px;
    	}
    	#LAY_demorange_s,#LAY_demorange_e{
    	 border:solid 1px gray;
    	}
    	.sol{
    	   width: 130px;
    	}
    </style>
  </head>
  
  <body>
    <!-- 抬头选择 -->
    <div style="height: 35px;background-color:#efefef;">
	    <div id="cho">
	    <button class="layui-btn layui-btn-mini layui-btn-warm" id="input" type="button">导入</button>
	    <button class="layui-btn layui-btn-mini" id="output" type="button"> 添加</button>
	    <button class="layui-btn layui-btn-mini layui-btn-normal" id="selshow">查询</button>
	    </div>
    </div>
    
    <!-- 筛选输入表单-隐藏-js点击 -->
    <div id="dinfo" style="display: block;padding-top: 10px;">
		     <form id ="show" action="${pageContext.request.contextPath }/termController/showTerms.do" method="post">
		 		   <div class="inp"> 机构名称:
		 		 	 	<select name="store_id" id="sto" class="sol">
	    				  	<option value="">---请选择机构---</option>
	    				</select>
		 		   </div>
		           <div class="inp"> 业务员名:
			            <select name="sales_id" id="sal">
	      					<option value="">---请先选择机构---</option>
	      				</select>
		           </div>        
		           <div class="inp">商户名称:<input name="name" class="lim" value="${termName }" id="mid"></div>   
		           <div class="inp">商户编号:<input name="mid" class="lim" value="${mid }" id="mid"></div> 
		           <div class="inp"> 
		  	终端编号: <input name="tid" class="lim" id="tid" list="tidInfo" value="${tid }">
		           		<datalist id="tidInfo">
		           		</datalist>
		           </div>
		           <div class="inp"> 机具产权:<input name="belong" class="lim" value="${belong}"></div>
		           <div class="inp">机具型号:<input name="model" class="lim" value="${model}"></div>
		           <div class="inp">机具序列号:<input name="serial_nu" id="serial_nu" class="lim" value="${serial_nu }"></div>
		           
		           <div class="inp">
		  			 终端状态:
		  			<c:if test="${state=='1'}">
			  			<select name="state" lay-verify="required" class="lim">
			    	    	<option value="">全部状态</option>
			            	<option value="1" selected="selected">已激活</option>
			            	<option value="2">已注销</option>
			          	</select>
		          	</c:if>
		          	<c:if test="${state=='2'}">
			  			<select name="state" lay-verify="required" class="lim">
			    	    	<option value="">全部状态</option>
			            	<option value="1">已激活</option>
			            	<option value="2" selected="selected">已注销</option>
			          	</select>
		          	</c:if>
		          	<c:if test="${empty state}">
			  			<select name="state" lay-verify="required" class="lim">
			    	    	<option value="">全部状态</option>
			            	<option value="1">已激活</option>
			            	<option value="2">已注销</option>
			          	</select>
		          	</c:if>
		          	</div>
		          	<div class="inp">
				        创建日期:
		 			<div class="layui-inline">
						<input name="sdate" class="lim" id="LAY_demorange_s" value="${sdate }">
					</div>
		  			-
		 			<div class="layui-inline">
		  				<input name="edate" class="lim" id="LAY_demorange_e" value="${edate }">
		 			</div> 
		 			</div>  
		     </form> 
	  </div> 
  	<hr style="height:0px;">
  
    <!-- 信息显示表格 -->
    <c:choose>
		<c:when test="${not empty tlist }">
		    <div style="margin-top: 20px;margin-left:15px;margin-right:15px;overflow: auto;">
			      <table cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="1360px" id="table1">
			      <tr>
			        <th>序号</th>
			        <th>机构编号</th>
			        <th>业务员号</th>
			        <th>终端押金</th>
			        <th>商户名称</th>
			        <th>商户类型</th>     															 						
			        <th>商户编号</th>
			        <th>终端编号</th>
			        <th>机具产权</th>
			        <th>机具型号</th>
			        <th>机具序号</th>
			        <th>添加日期</th>
			        <th>修改日期</th>
			        <th>操作</th>
			      </tr>
			      <c:forEach var="t" varStatus="s" items="${tlist}">
			      <tr>
			       <td>${s.index+1}</td>
			       <td>${t.store_id }</td>
			       <td>${t.sales_id }</td>
			       <td>${t.deposit }</td>
			       <td>${t.name }</td>
			       <td>${t.type }</td>
			       <td>${t.mid }</td>
			       <td>${t.tid }</td>
			       <td>${t.belong }</td>
			       <td>${t.model }</td>
			       <td>${t.serial_nu }</td>
			       <td>${t.data_date }</td>
			       <td>${t.up_time }</td>
			       <c:choose>
				       <c:when test="${role eq '01' || role eq '00'}">
					       <td>
					       <a href="javascript:updateInfo('${t.type }','${t.mid }','${t.tid }')" style="color: blue;">修改</a>|
					       <c:if test="${t.state== 1 }">
					       <a href="${pageContext.request.contextPath}/termController/updateState.do?tid=${t.tid }&mid=${t.mid }&type=${t.type }&state=2" style="color: blue;">注销</a>
					       </c:if>
					       <c:if test="${t.state== 2 }">
					              已注销
					       </c:if>
					       </td>
				       </c:when>
				       <c:otherwise>
					       <td>
					       <a style="color: gray;">修改</a>|
					       <c:if test="${t.state== 1 }">
					       <a style="color: gray;">注销</a>
					       </c:if>
					       <c:if test="${t.state== 2 }">
					              已注销
					       </c:if>
					       </td>
				       </c:otherwise>
			       </c:choose>
			       </tr>
			      </c:forEach>
			      </table>
			      </div>
			      <!-- 分页 -->
			       <center>
			            <div id="demo4">
			    			<a href="${pageContext.request.contextPath }/termController/showTerms.do?page=1&sdate=${sdate}&edate=${edate}&name=${termName}&mid=${mid}&tid=${tid}&belong=${belong}&model=${model}&state=${state}&serial_nu=${serial_nu}&store_id=${store_id}&sales_id=${sales_id}">首页</a>
			    		    <a href="${pageContext.request.contextPath }/termController/showTerms.do?page=${curPage-1}&sdate=${sdate}&edate=${edate}&name=${termName}&mid=${mid}&tid=${tid}&belong=${belong}&model=${model}&state=${state}&serial_nu=${serial_nu}&store_id=${store_id}&sales_id=${sales_id}">上一页</a>
			    			${curPage }/${totalpage }
			    			<a href="${pageContext.request.contextPath }/termController/showTerms.do?page=${curPage+1}&sdate=${sdate}&edate=${edate}&name=${termName}&mid=${mid}&tid=${tid}&belong=${belong}&model=${model}&state=${state}&serial_nu=${serial_nu}&store_id=${store_id}&sales_id=${sales_id}">下一页</a>
			    			<a href="${pageContext.request.contextPath }/termController/showTerms.do?page=${totalpage}&sdate=${sdate}&edate=${edate}&name=${termName}&mid=${mid}&tid=${tid}&belong=${belong}&model=${model}&state=${state}&serial_nu=${serial_nu}&store_id=${store_id}&sales_id=${sales_id}">尾页</a>
			    			<input type="text" id="go"/>
			    			<input type="button" value="跳转" onclick="goPage()"/>
			    			<br>
			    			<span>共${count}条记录</span>
			    		</div>
			     </center>
	    </c:when>
       <c:otherwise>
              <center><div style="margin-top: 30px;">尚未有相关记录</div></center> 
       </c:otherwise>
   </c:choose> 
   
   
    <!-- 文件上传的表单-隐藏-js调用上传 -->
   <div id="inputInfo" style="display: none;">
        	<form id ="upfile" action="${pageContext.request.contextPath}/termController/inputTermExcel.do" method="post" enctype="multipart/form-data">
          		<div id="dialogTop" style="margin-top:20px;margin-left:20px;margin-right:20px">
				    <div>
				    <span>请选择上传文件：</span>
				    <input type="file" name="file" id="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
				    <a href="${pageContext.request.contextPath}/termController/downloadModel.do" style="color: blue;">模板下载</a>
				    </div>
			    </div>
			        <div class="dialogBottom">
		   				<div class="btns">
				   		 <button class="ldBtnGreen" type="button" id="inputXls">确认</button>
				   		 <input type="button" value="关闭" class="ldBtnGray" onclick="onClose();">
				   		 </div>
				    </div>
        	</form>
   </div>
   
    <!-- 添加终端信息弹框 -->
	<div id="addInfo" style="display: none;">
		<form action="${pageContext.request.contextPath}/termController/addTerminfo.do" method="post" onsubmit="return checknull()">
			<div class="dialogTop">
			  	<table width="500px" style="margin-top:10px;" border="0" align="center">
		          	<tr>
			          <td style="text-align: right;">机构编号：</td>
			          <td>
			          	<select class="ldSelect" name="store_id" id="storeid" style="width:180px;height:24px;">
			          		<option>请选择机构</option>
			          	</select>
			          </td>
			          <td style="text-align: right;">业务员号：</td>
			          <td>
			          	<!-- <input type="text"  class="ldText " maxlength="20" name="sales_id" style="width:180px;"/> -->
			          	<select class="ldSelect" name="sales_id" id="salesid" style="width:180px;height:24px;">
			          		<option>请先选择机构</option>
			          	</select>
			          </td>
		          	</tr>
			        <tr>
			          <td style="text-align: right;margin-top:5px">商户名称：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="20" name="name" style="width:180px;margin-top:5px"/>
			          </td>
			          <td style="text-align: right;margin-top:5px">商户编号：</td>
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
			          <td style="text-align: right;">终端编号：</td>
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
			          <td style="text-align: right;">机具序号：</td>
			          <td>
			          	<input type="text"  class="ldText " maxlength="15" name="serial_nu" id="serial_nu1" style="width:180px;margin-top:5px"/>
			          </td>
			          <td style="text-align: right;">终端押金：</td>
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
