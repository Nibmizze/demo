
/**
 *表单样式事件
 */ 
$(function(){
    $("#table1 tr:eq(0)").css("background-color","#999"); //标题的样式
	$("#table1 tr:gt(0):even").css("background-color","white"); //奇数行的样式
	$("#table1 tr:gt(0):odd").css("background-color","#d1eeee"); //偶数行的样式
	$("#table1 tr").click(function(){
		$("#table1 tr:gt(0):even").css("background-color","white"); //奇数行的样式
		$("#table1 tr:gt(0):odd").css("background-color","#d1eeee"); //偶数行的样式
		$(this).css("background-color","#999");
	});
	
	/* $("tr:gt(0)").mouseenter(function(){
	var color = $(this).css("background-color");
	$(this).css("background-color","#efefef");
	$(this).mouseleave(function(){
		$(this).css("background-color",color);
	});
	$(this).mousedown(function(){
　　　　　　$(this).css("background-color","gray");
　　　　}); 
	$(this).mouseup(function(){
		$("#table1 tr:gt(0):even").css("background-color","white"); //奇数行的样式
		$("#table1 tr:gt(0):odd").css("background-color","#d1eeee"); //偶数行的样式
		$(this).css("background-color","lightgray");
	});
}); */
	
});