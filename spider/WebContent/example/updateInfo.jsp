<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/artDialog.source.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/artDialog/plugins/iframeTools.source.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui.js"></script>
<title></title>
<script type="text/javascript">
/* function flush(){
    parent.location.href="${pageContext.request.contextPath}/merchController/showMerch.do";
   } */
</script>
</head>
<body>
	<!-- 修改商户信息 -->
	<div id="upd">
		<form action="${pageContext.request.contextPath}/merchController/updateInfo.do" method="post">
		<c:forEach  items="${merch}" var="m">
			<div class="dialogTop">
				<table width="500px" style="margin-top:10;" border="0" align="center">
					<tr>
			          <td align="right">机构号：</td>
			          <td>
		          		<input type="text"  class="ldText " disabled="disabled" name="storeid" value="${m.storeid}" style="width:140px;margin-top:5px"/>
			          </td>
			          <td align="right">业务员编号：</td>
			          <td>
			          	<input type="text"  class="ldText " disabled="disabled" name="salesid" value="${m.salesid}" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
			        <tr>
			          <td width="70" align="right">商户号：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " disabled="disabled" name="mid" value="${m.mid}" style="width:140px;margin-top:5px"/>
			          	<input type="hidden" name="mid" value="${m.mid}"/>
			          </td>
			          <td width="70" align="right">商户名：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " disabled="disabled" name="midName" value="${m.midName}" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td width="70" align="right">商户联系人：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="10" name="linkMan" value="${m.linkMan}" style="width:140px;margin-top:5px"/>
			          </td>
			          <td width="70" align="right">联系方式：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="11" name="linkTel" value="${m.linkTel}" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right">商户类型：</td>
			          <td>
			          	<input type="text"  class="ldText " disabled="disabled" name="type" id="utype" value="${m.type}" style="width:140px;margin-top:5px"/>
			          	<input type="hidden" name="type" value="${m.type}"/>
			          </td>
			          <td width="70" align="right">商户地址：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="50" name="address" value="${m.address}" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td width="105" align="right">借记卡手续费率/%：</td>
			          <td width="150">
			          	<c:if test="${m.type=='cups'}">
			          		<input type="text"  class="ldText " maxlength="6" name="dfee" value="${m.dfee}" style="width:140px;margin-top:5px"/>
			          	</c:if>
			          	<c:if test="${m.type=='o2o'}">
			          		<input type="text"  class="ldText " maxlength="6" name="dfee" disabled="disabled" value="该项不填" style="width:140px;margin-top:5px"/>
			          	</c:if>
			          </td>
			          <td width="70" align="right">开户行：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="6" name="branch" value="${m.branch}" style="width:140px;margin-top:5px"/>
			          </td>
		          	</tr>
			        <tr>
			          <td width="105" align="right">贷记卡手续费率/%：</td>
			          <td width="150">
			          	<c:if test="${m.type=='cups'}">
			          		<input type="text"  class="ldText " maxlength="6" name="cfee" value="${m.cfee}" style="width:140px;margin-top:5px"/>
			          	</c:if>
			          	<c:if test="${m.type=='o2o'}">
			          		<input type="text"  class="ldText " maxlength="6" name="cfee" disabled="disabled" value="该项不填" style="width:140px;margin-top:5px"/>
			          	</c:if>
			          </td>
			          <td width="75" align="right">结算账户名：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="30" name="accname" value="${m.accname}" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td width="115" align="right">借记卡封顶金额/元：</td>
			          <td width="150">
			          	<c:if test="${m.type=='cups'}">
				          	<input type="text"  class="ldText " maxlength="6" name="dtop" value="${m.dtop}" style="width:140px;margin-top:5px"/>
			          	</c:if>
			          	<c:if test="${m.type=='o2o'}">
			          		<input type="text"  class="ldText " maxlength="6" name="dfee" disabled="disabled" value="该项不填" style="width:140px;margin-top:5px"/>
			          	</c:if>
			          </td>
			          <td width="70" align="right">结算账户号：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="10" name="accno" value="${m.accno}" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
			        <tr>
			          <td width="70" align="right">O2O手续费率/%：</td>
			          <td width="150">
			          <c:if test="${m.type=='cups'}" >
			          	<input type="text"  class="ldText " maxlength="6" name="o2ofee" disabled="disabled" value="该项不填" style="width:140px;margin-top:5px"/>
			          </c:if>
			          	<c:if test="${m.type=='o2o'}">
			          	<input type="text"  class="ldText " maxlength="6" name="o2ofee" value="${m.o2ofee}" style="width:140px;margin-top:5px"/>
			          </c:if>
			          </td>
			          <td width="70" align="right">所属渠道：</td>
			          <td width="150">
			          	<input type="text"  class="ldText " maxlength="15" name="channel" value="${m.channel}" style="width:140px;margin-top:5px"/>
			          </td>
			        </tr>
				</table>
			</div>
			<div class="dialogBottom">
		   		<div class="btns">
			   		<input type="submit" class="ldBtnGreen" value="确定"/>
			    </div>
			</div>
		</c:forEach>
		</form>
	</div>
</body>
</html>