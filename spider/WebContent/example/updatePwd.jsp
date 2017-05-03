<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../plugins/artDialog/artDialog.source.js"></script>
<script type="text/javascript" src="../plugins/artDialog/plugins/iframeTools.source.js"></script>
<script type="text/javascript" src="../js/validator.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript">
	
	$(function(){
		var msg = "${param.msg}"
		if(msg!=0){
			if(msg==1){
				ldDialog.alert("修改成功");
				ldDialog.close();
			}
			if(msg==2){
				ldDialog.alert("原始密码错误，请重试!");
			}
		}
	})

	function checkSubmit(id) {
		var old = document.getElementById("oldPassword");
		var newPass = document.getElementById("newPassword");
		var repeat = document.getElementById("repeatPassword");
		var reg = /^([A-Za-z0-9]){6,18}$/; //6到18位字母和数字的组合
		if (trim(old.value).length == 0 || old.value == "") {
			ldDialog.alert("旧密码不得为空，请输入旧密码");
			return false;
		}
		if (trim(newPass.value).length == 0 || newPass.value == "") {
			ldDialog.alert("新密码不得为空，请输入新密码");
			return false;
		}
		if (!reg.test(newPass.value)) {
			ldDialog.alert("新密码不可为空<br>且必须为6至18位字母与数字组合!");
			return false;
		}
		if (trim(repeat.value).length == 0 || repeat.value == "") {
			ldDialog.alert("请再次输入新密码");
			return false;
		}
		if (newPass.value != repeat.value) {
			ldDialog.alert("两次输入的密码必须一致！");
			return false;
		}
		if (newPass.value == old.value) {
			ldDialog.alert("输入的新密码与之前的密码一致，请重新输入");
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/userController/updatePassword.do" method="post">
		<div><input type="hidden" value="${user.username}" name="username"></div>
		<div class="dialogTop" align="center">
			<table width="100%" border="0" cellspacing="1" cellpadding="10">
				<tbody><tr>
					<td width="100" align="right">
						<font color="red">*</font>原始密码：
					</td>
					<td>
						<input type="password" class="ldText input138" name="oldPassword" id="oldPassword" value="">
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<font color="red">*</font>新密码：
					</td>
					<td>
						<input type="password" class="ldText input138" name="newPassword" id="newPassword" value="">
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<font color="red">*</font>重复新密码：
					</td>
					<td>
						<input type="password" class="ldText input138" name="repeatPassword" id="repeatPassword" value="">
					</td>
				</tr>
			</tbody></table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				
					<input type="submit" value="确　定" class="ldBtnGreen" onclick="return checkSubmit();">
				
				<input type="button" value="关　闭" class="ldBtnGray" onclick="ldDialog.close();">
			</div>
		</div>
	</form>
</body>
</html>