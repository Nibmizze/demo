<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>沃银前置系统</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<style type="text/css">
.yhItem1 {
	line-height: 40px;
}

.member-page-title {
	height: 30px;
	padding-left: 40px;
	border-bottom: 1px solid #dfdfdf;
}
</style>
<script type="text/javascript">
	$(function(){
	        $.ajax({
	            url: '${pageContext.request.contextPath}/userController/querylog.do',
	            type: 'POST',
	            data: {userInfo:$("#userInfo").val()},
	            dataType: 'json',
	            success: function (data) {
	            	$("#info").append("<tr><td width='100' class='right yhItem1'>用户名称：</td><td class='left'>"+data[0].username+"</td></tr>");
	            	$("#info").append("<tr><td width='100' class='right yhItem1'>本次登录IP：</td><td class='left'>"+data[0].loginIp+"</td></tr>");
	            	$("#info").append("<tr><td width='100' class='right yhItem1'>本次登录时间：</td><td class='left'>"+data[0].operatetime+"</td></tr>");
	            }
	        });
	    });
</script>
</head>
	<body>
	<input type="hidden" id="userInfo" value="${uuid}">
		<div id="rightcontent1" class="welcome"
			style="float: none; min-height: 505px;">
			<div class="member-page-title">
				<h2>个人信息</h2>
			</div>
			<table>
				<tbody id="info"></tbody>
			</table>
		</div>
	</body>
</html>