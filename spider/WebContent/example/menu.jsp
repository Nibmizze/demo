<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$(".menutitler").click(function(){
			var obj = $(this);
		    $(obj).next().slideToggle("fast",function(){
		    	if($(this).is(":hidden")){
			    	$(obj).removeClass("menutitlerDown").addClass("menutitlerUp");
			    }else{
			    	$(obj).removeClass("menutitlerUp").addClass("menutitlerDown");
			    }
		    });
		});
		$(".menu_sidebar").mouseover(function(){
			$(this).css("overflow","auto");
		});
		$(".menu_sidebar").mouseleave(function(){
			$(this).css("overflow","hidden");
		});
		//展开菜单
		$(".menutitler").click();
	});
	function openMenu(id,name,url,obj){
		parent.addTab(id,name,url);
		$(".menuselected").removeClass("menuselected").addClass("menuitem");
		$(obj).removeClass("menuitem").addClass("menuselected");
	}
</script>
</head>
<body>
	<div class="menu_sidebar">
		<c:forEach items="${leftMenu}" var="menu">
	    	<div class="menubox">
	    		<div class="menutitler menutitlerUp" id="menu_1">${menu.key}</div>
	    		<c:if test="${not empty menu.key}">
	    		<div class="menuchild">
		    		<c:forEach items="${menu.value}" var="sub">
		    			<div class="menuitem" onclick="openMenu('${sub.module_id}','${sub.module_name}','${pageContext.request.contextPath }/${sub.program_source}',this);">${sub.module_name}</div>
		    		</c:forEach>
	    		</div>
	    		</c:if>
	    	</div>
    	</c:forEach>
    </div>
</body>
</html>