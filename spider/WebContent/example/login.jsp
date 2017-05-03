<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>沃银数据服务有限公司</title>
<link rel="shortcut icon" href="images/top-login.jpg" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		
		if(window != top){
	        top.location.href=location.href;
	    }
		
		var error = "${param.error}"
			if(error!=0){
				if(error==1){
						$("#code").html("账号不存在！");
					}
				if(error==2){
					$("#code").html("密码错误！");
					}
				if(error==3){
					$("#code").html("该账户已注销!");
					}
			}
		
		$("#btn").click(function(){
	        $.ajax({
	            url: '${pageContext.request.contextPath}/userController/queryCode.do',
	            type: 'POST',
	            data: {authcode:$("#authcode").val(),
	            	username:$("#username").val(),
	            	passwd:$("#passwd").val()},
	            dataType: 'json',
	            success: function (data) {
	            	$("#code").html('');
	            	if(data==1){
	            		$("#code").append("验证码错误");
	            		$("#img").click(this.src='${pageContext.request.contextPath}/example/image.jsp?rnd=' + Math.random());
	            	}else{
	            		location.href="${pageContext.request.contextPath}/userController/userlogin.do?username="+data[0]+"&passwd="+data[1]
	            	}
	            }
	        });
	    });
	})
</script>
</head>
<body>
	<div class="lobg1">
		<div id="loginbox">
			<table width="1000" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td height="94"><img src="${pageContext.request.contextPath}/images/logo.jpg" width="303"height="46"/></td>
				</tr>
				<tr>
					<td height="476"><table width="900" border="0" align="center"cellpadding="0" cellspacing="10">
						<tr>
							<td width="552"><img src="${pageContext.request.contextPath}/images/images01.png"width="500" height="338" /></td>
							<td width="318" valign="top" class="lobg4">
								<table width="249" border="0" align="center" cellpadding="0" cellspacing="10">
									<tr>
										<td width="229" height="81" class="inputt">登录系统</td>
									</tr>
									<tr>
										<td><input type="text" name="username" id="username" maxlength="15" class="loginput image1" /></td>
									</tr>
									<tr>
										<td><input type="password" name="passwd" id="passwd" maxlength="15" class="loginput image2" /></td>
									</tr>
									<tr>
										<td class="inputxx">
											<table width="230" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="140"><input name=authcode type="text"
														class="loginxc" style="width: 130Px;" id="authcode"
														placeholder="请输入验证码" maxlength="4" />
													</td>
													<td width="60"><img class="icon-repeat" id="img"
														src="${pageContext.request.contextPath}/example/image.jsp" alt="请点击刷新验证码"  title="看不清,点击换一张" border="0" align="absmiddle"
														onclick="this.src='${pageContext.request.contextPath}/example/image.jsp?rnd=' + Math.random();" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td id="code" align="center" class="inputxx"></td></tr>
									<tr>
										<td><img
												src="${pageContext.request.contextPath}/images/loginon.png" width="239" height="40"
												style="cursor: pointer;" id="btn"
												onmouseout="this.src='${pageContext.request.contextPath}/images/login.png'"
												onmousemove="this.src='${pageContext.request.contextPath}/images/loginon.png'" /></td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>