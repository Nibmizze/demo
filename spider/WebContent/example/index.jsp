<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>沃银数据服务有限公司</title>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../plugins/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript" src="../plugins/artDialog/artDialog.source.js"></script>
<script type="text/javascript" src="../plugins/artDialog/plugins/iframeTools.source.js"></script>
<script type="text/javascript" src="../plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript">
	function changePassword() {
		ldDialog.open("updatePwd.jsp", "修改密码", function(window) {
			var returnValue = window.returnValue;
			if (returnValue == undefined) {
				return true;
			} else {
				ldDialog.tips("处理成功！");
				return true;
			}
		}, 300, 300);
	}
</script>
</head>
<body style="overflow: hidden;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<!-- 头部开始 -->
		<tr style="height: 70px;">
			<td>
				<div>
					<div class="headerbg">
						<div class="header-l">
							<div class="headerfun">
								<span class="userinfo">${user.username} </span>
								|
								<span><a href="javascript:void(0);" onclick="changePassword();">修改密码</a></span>

								|
								<span class="loginout"> <a href="${pageContext.request.contextPath}/userController/quit.do?uuid=${uuid}">退出</a></span>
							</div>
						</div>
						<div class="header-r"></div>
					</div>
				</div>
			</td>
		</tr>
		<!-- 头部结束 -->

		<!-- 导航开始 -->
		<tr style="height: 33px;">
			<td>
				<div class="nav">
					<ul>
						<li class="nav_itemon nav_noclose" id="tab_welcome">
							<div class="navtitle" onclick="activateTab('welcome');">首页</div>
						</li>
					</ul>
					<div class="delbody" onclick="showlist();">
						<div class="alltabbox">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr class="alltabbox-item" onclick="removeAllTab();">
									<td class="alltabbox-item-iconcloseall">&nbsp;</td>
									<td class="alltabbox-item-text">关闭全部</td>
									<td class="alltabbox-item-noclose">&nbsp;</td>
								</tr>
								<tbody id="alltabbox-tbd1">
									<tr class="alltabbox-item" id="alltabbox-item_welcome">
										<td class="alltabbox-item-iconselected">&nbsp;</td>
										<td class="alltabbox-item-text"
											onclick="activateTab('welcome');">首页</td>
										<td class="alltabbox-item-noclose">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<!-- 导航结束 -->

		<tr>
			<td>
				<div class="loadingmark"></div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="contentTable">
					<tr>
						<td valign="top" id="menuTd" style="width: 160px;"><iframe
								class="contentFrame" width="100%" height="100%" src="${pageContext.request.contextPath}/userController/leftMenu.do"
								frameborder="0" scrolling="no"></iframe></td>
						<td width="7" valign="middle" class="middlebut">
							<div class="middlebutbg_l" onclick="menuToggle();"></div>
						</td>
						<td valign="top" id="contentTd"><iframe id="if_welcome"
								name="update" class="contentFrame tabIframe" width="100%"
								height="100%" src="userInfo.jsp" frameborder="0"></iframe></td>
					</tr>
				</table>
			</td>
		</tr>

		<!-- 底部开始 -->
		<tr style="height: 30px;">
			<td>
				<div id="footer" class="footer">
					<div class="footertxt"></div>
				</div>
			</td>
		</tr>
		<!-- 底部结束 -->
	</table>
</body>
</html>