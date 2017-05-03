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
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/artDialog.source.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/plugins/iframeTools.source.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tableStyle.js"></script>
	
<script type="text/javascript">
 $(function(){
		
	   var trans_name='${trans_name}';
	   var state='${state}';
	   var dcflag='${dcflag}';
	   var sdate='${sdate}';
	   var edate='${edate}';
	   $("#trans_name").val(trans_name);
	   $("#state").val(state);
	   $("#dcflag").val(dcflag);
	   $("#LAY_demorange_s").val(sdate);
	   $("#LAY_demorange_e").val(edate);
	    
		//日期插件
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
		
	   	$("#output").click(function(){
	    	layui.use(['layer'], function(){
				var layer = layui.layer;
				layer.open({
					title:    '信息',
					type:     1,
     			    skin:     'layui-layer-rim', //加上边框
     			    area:     ['300px', '220px'],
     			    closeBtn: 1,
					content:  $('#info')
				});  
			});
	    });
			   
	    $("#input").click(function(){
	       layui.use(['layer'], function(){
				var layer = layui.layer;
				layer.open({
					title:    '信息',
					type:     1,
     			    skin:     'layui-layer-rim', //加上边框
     			    area:     ['350px', '300px'],
     			    closeBtn: 1,
					content:  $('#inputInfo')
				});  
			});
	    });
	    
	    $("#fun").click(function(){
	        $("#show").submit();
	    });
	    $("#reset").click(function(){
	        $("#show")[0].reset();
	        $("#show").submit();
	    });
	    
	    $("#inputXls").click(function(){
	     var val = $("#time").val();
	     if(val==""){
				layer.msg("请输入日期");  
	     }else{
	         var formData = new FormData($("#upfile")[0]);
	       	$.ajax({ 
          		url: '${pageContext.request.contextPath}/merchantController/inputExcel.do?data_date='+val, 
          		type: 'POST', 
          		data: formData, 
          		dataType:'text',
         		async: true, 
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
			     		 location.href="${pageContext.request.contextPath }/merchantController/showAll.do";
			     		 }
			     		});
			  		});
				}, 
          		error: function (data) { 
               		layui.use(['layer'], function(){
			   			var layer = layui.layer;
			     		layer.closeAll();
			     		layer.alert("导入失败" );
			   		});
              	} 
			});
	        }
	   }); 
	});
	
	function checkOut(){
	  if($("#export_file").val()==""){
	   layer.alert("请输入文件名");
	   return false;
	  }
	  layer.closeAll();
	   return true;
	} 
	 
	function goPage()
	{
		var reg=/^[0-9]*$/;
		var page = document.getElementById("go").value;
		
		if(!reg.test(page))
		{
	    	var page='${curPage}';
	    	location.href=
        		"${pageContext.request.contextPath }/merchantController/showAll.do?page="+page+"&sdate=${sdate}&edate=${edate}&trans_name=${trans_name}&dcflag=${dcflag}&state=${state}";
	    }
		else
		{
			location.href=
				"${pageContext.request.contextPath }/merchantController/showAll.do?page="+page+"&sdate=${sdate}&edate=${edate}&trans_name=${trans_name}&dcflag=${dcflag}&state=${state}";
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
    		margin-top: 30px;
    	}
    	div, ul, ol, li, form, fieldset, table, p {
    		font: 12px/23px 宋体;
    	}
    	.do{
    		color:blue;
    	}
    	select{
    		border: black 1px solid;
    	}
    	#cho{
    		margin-left: 10px;
    		padding-top: 5px;
    	}
    	#smn{
    	    margin-left: 40px;
    		margin-top: 80px;
    	}
    	#LAY_demorange_s,#LAY_demorange_e{
    		border: black 1px solid;
    		width: 80px;
    		height: 15px;
    	}
    	#time{
    		border: black 1px solid;
    		width: 150px;
    		height: 20px;
    	}
    </style>
  </head>
  
  <body>
    <div style="height: 35px;background-color:#efefef;">
	    <div id="cho">
	    <button class="layui-btn layui-btn-mini layui-btn-warm" id="input" type="button"> 导入</button>
	    <button class="layui-btn layui-btn-mini" id="output" type="button">导出</button>
	    <button id="fun" class="layui-btn layui-btn-mini layui-btn-normal">查询</button>
	    <button class="layui-btn layui-btn-mini layui-btn-danger" id="reset">重置</button> 
    	</div>
    </div>
    <center>
    <div id="dinfo" style="padding-top: 10px;">
		<form id ="show" action="${pageContext.request.contextPath}/merchantController/showAll.do" method="post">
   			流水导入日期：
 			<div class="layui-inline">
				<input name="sdate" class="lim" id="LAY_demorange_s">
			</div>
  			-
 			<div class="layui-inline">
  				<input name="edate" class="lim" id="LAY_demorange_e">
 			</div>              
        
  			 交易名称：
  			<select name="trans_name" lay-verify="required" id="trans_name">
    	    	<option value="">全部交易</option>
            	<option value="消费交易">消费交易</option>
            	<option value="消费撤销">消费撤销</option>
            	<option value="未知交易">未知交易</option>
          	</select>
   
			 交易状态：
			<select name="state" lay-verify="required" id="state">
   		    	<option value="">全部状态</option>
            	<option value="S">已成功</option>
            	<option value="C">已撤销</option>
            	<option value="D">已冲正</option>
          	</select>
   
  			卡信息：
  			<select name="dcflag" lay-verify="required" id="dcflag">
            	<option value="">全部卡</option>
            	<option value="C">贷记卡</option>
            	<option value="D">借记卡</option>            	
            	<option value="Z">准贷记卡</option>
            	<option value="T">未知卡</option>
            	<option value="O">预付费卡</option>
        	</select>
		</form>
	</div> 
  	</center>
  	
  	<hr style="height:0px;">
  	
    <c:choose>
		<c:when test="${not empty mlist }">
    	<div style="margin-top: 20px;margin-left:15px;margin-right:15px">
    		<center style="overflow:auto;">
      		<table cellpadding="0" cellspacing="0" border="1px" bordercolor="#efefef" width="1750px" id="table1">
      			<tr>
        			<th>序号</th>
        			<th>交易日期</th>
        			<th>清算日期</th>
        			<th>导入日期</th>     															 						
        			<th>交易名称</th>
	        		<th>交易金额</th>
	        		<th>交易账号</th>
	        		<th>商户名称</th>
	        		<th>商户号</th>
	        		<th>终端号</th>
	        		<th>交易流水</th>
	        		<th>参考号</th>
	        		<th>授权码</th>
	        		<th>交易时间</th>
	        		<th>卡信息</th>
	        		<th>冲正标志</th>
	        		<th>撤销标志</th>
	        		<!-- <th>操作</th> -->
	      		</tr>
     	 		<c:forEach var="m" varStatus="s" items="${mlist}">
      			<tr>
				    <td>${s.index+1}</td>
				    <td>${m.tdate }</td>
				    <td>${m.settle_date }</td>
				    <td>${m.data_date }</td>
				    <td>${m.trans_name }</td>
				    <td>${m.amt }</td>
				    <td>${m.card_no }</td>
				    <td>${m.midname }</td>
				    <td>${m.mid }</td>
				    <td>${m.tid }</td>
				    <td>${m.traceno }</td>
				    <td>${m.refno }</td>
				    <td>${m.auth_id }</td>
				    <td>${m.ttime }</td>
				    <td>
                    <c:if test="${m.dcflag=='C' }">贷记卡</c:if>
                    <c:if test="${m.dcflag=='D' }">借记卡</c:if>
                    <c:if test="${m.dcflag=='Z' }">准贷记卡</c:if>
                    <c:if test="${m.dcflag=='T' }">未知卡</c:if>
                    <c:if test="${m.dcflag=='O' }">预付费卡</c:if>
				    </td>
				    <td>${m.r_flag }</td>
				    <td>${m.c_flag }</td>
				    <!-- <td><a class="do">详情</a></td> -->
				</tr>
      			</c:forEach>
      		</table>
      		</center>
       		
       		<center>
            <div id="demo4">
    			<a href="${pageContext.request.contextPath }/merchantController/showAll.do?page=1&sdate=${sdate}&edate=${edate}&trans_name=${trans_name}&dcflag=${dcflag}&state=${state}">首页</a>
    		    <a href="${pageContext.request.contextPath }/merchantController/showAll.do?page=${curPage-1}&sdate=${sdate}&edate=${edate}&trans_name=${trans_name}&dcflag=${dcflag}&state=${state}">上一页</a>
    			${curPage }/${totalpage }
    			<a href="${pageContext.request.contextPath }/merchantController/showAll.do?page=${curPage+1}&sdate=${sdate}&edate=${edate}&trans_name=${trans_name}&dcflag=${dcflag}&state=${state}">下一页</a>
    			<a href="${pageContext.request.contextPath }/merchantController/showAll.do?page=${totalpage}&sdate=${sdate}&edate=${edate}&trans_name=${trans_name}&dcflag=${dcflag}&state=${state}">尾页</a>
    			<input type="text" id="go"/>
    			<input type="button" value="跳转" onclick="goPage()"/>
    		</div>
    		<span>共${count}条记录</span>
     		</center>
		</div>
		</c:when>
		
       	<c:otherwise>
              <center>尚未有相关记录</center> 
       	</c:otherwise>
	</c:choose> 
   
    <!-- 导出文件 -->
	<div id="info" style="display: none;">
		<form action="merchantController/outputExcel.do" method="post" style="margin-left: 30px;" onsubmit="return checkOut()">
			<div id="form">
   				<span>请输入导出文件名：</span>
   				<div style="margin-top: 20px;"><input type="text" name="export_file" placeholder="例：交易表-20170228" id="export_file" style="border: 1px black solid;width: 140px;height: 22px;"></div>
   				<div class="dialogBottom">
		   				<div class="btns">
				    		<button class="ldBtnGreen" type="submit" >确认</button>
				   		</div>
				    </div>
   			</div>
   		</form>
   </div> 
   
   <!-- 导入文件 -->
   <div id="inputInfo" style="display: none;">
        	<form id ="upfile" action="${pageContext.request.contextPath}/merchantController/inputExcel.do" method="post" enctype="multipart/form-data">
          		<div class="dialogTop">
			  	<table style="margin-top:50px;margin-left: 50px;" border="0">
			  	<tr>
			          <td style="text-align: right;">请输入结算日期：</td>
			          <td style="text-align: left;">
			          	<div class="layui-inline">
						 <input name="data_date" id="time" placeholder="结算日期" onclick="layui.laydate({elem: this, istime: true, format: 'YYYYMMDD'})">
				    	</div>
			          </td>
		          	</tr>
		          	<tr><td>&nbsp;</td></tr>
		          	<tr>
			          <td style="text-align: right;">请选择上传文件：</td>
			          <td style="text-align: left;">
			          	<div class="layui-inline">
							<input type="file" name="file" id="file">
						</div>
			          </td>
		          	</tr>
        	</table>
        	</div>
        			<div class="dialogBottom">
		   				<div class="btns">
				    		<button class="ldBtnGreen" type="button" id="inputXls">确认</button>
				   		</div>
				    </div>
        	</form>
   </div>
</body>
</html>
