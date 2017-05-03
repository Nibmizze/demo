
$(function() {
	addNumberEvent(); //对数字输入框进行事件临听
	addTableCss(); //对pimDataGrid表格样式进行样式添加
	keyPressIllegalLimit();//对系统中的物殊字符进行UI层过滤
	limitTextareaLenght(); //对系统中的textarea输入框进行限制
	htmlFistInputFocus();//让文档的第一个非日期输入框获取焦点
	selectEven();//选择监控
});

/**
 * 让文档的第一个非日期输入框获取焦点
 */
function htmlFistInputFocus(){
	if($(":input[type='text'][class='ldText input138'][disabled!='disabled']").length>0){
		$(":input[type='text'][class='ldText input138'][disabled!='disabled']")[0].focus();//让文档的第一个非日期输入框获取焦点
	}
}

function selectEven(){
	if($("select").length>0){
		$("select").keydown(function(e) {
			var keyCode = e.keyCode ? e.keyCode : e.which;
			if(keyCode==37||keyCode==39){
				if (e && e.preventDefault) {
					e.preventDefault();
				} else if (window.event) {
					window.event.returnValue = false;
				} else {
					arguments.callee.caller.arguments[0].preventDefault();
				}
			}
		});
	}
}

/**
 * 对于textarea文本框进行长度制度
 * 需要添加样式class="limitTextarea" 属性maxlength="15"
 */
function limitTextareaLenght(){
	if($(".ldTextArea").length >0 ){
		$(".ldTextArea").keypress(function(e){
			var keyCode = (e.keyCode ? e.keyCode : e.which);
			var len = parseInt($(this).attr("maxlength"));
			var textLen = parseInt($(this).val().length);
			if((keyCode != 8 || keyCode !=8) && textLen >= len){
				if (e && e.preventDefault) {
					e.preventDefault();
				} else if (window.event) {
					window.event.returnValue = false;
				} else {
					arguments.callee.caller.arguments[0].preventDefault();
				}
			}
		});
		$(".ldTextArea").change(function(){
			var len = parseInt($(this).attr("maxlength"));
			var textLen = parseInt($(this).val().length);
			if(textLen > len){
				ldDialog.alert("字符超限");
				$(this).val($(this).val().substr(0,len));
			}
		});
	}
}

/**
 * 物殊字符过滤
 */
function keyPressIllegalLimit() {
	if ($(":input").length > 0) {
		$(":input").keypress(function(e) {
			return XSSFilterKeypress(e);
		});
		$(":input").change(function() {
			return XSSFilterChange(this);
		});
	}
}

/**
 * 文本框过滤掉特殊字符
 */
function XSSFilterKeypress(e){
	var filterChars = [34,39,59,60,62,92];//["';<>\]
	for(var i=0;i<filterChars.length;i++){
		var keyCode = (e.keyCode ? e.keyCode : e.which);
		if (keyCode == filterChars[i]) {
			if (e && e.preventDefault) {
				e.preventDefault();
			} else if (window.event) {
				window.event.returnValue = false;
			} else {
				arguments.callee.caller.arguments[0].preventDefault();
			}
		}
	}
}

/**
 * 文本框过滤掉特殊字符
 */
function XSSFilterChange(e){
	var reg = /[""';<>\\]/g;
	var textValue = $(e).val();
	$(e).val(textValue.replace(reg,""));
}

var addNumberEvent = function() {
	if ($(".FloatNumberBox").length > 0) {
		// 设置金额限制为 2位小数 长度为11
		$(".FloatNumberBox").numberbox({
			maxlength : 11,
			precision : 2
		});
	}

	if ($(".IntNumberBox").length > 0) {
		// 设置输入限制为整数
		$(".IntNumberBox").numberbox({
			maxlength : 9,
			isFormat : false
		});
	}
};

var addTableCss = function() {
	// 表格单双行颜色设定
	$(".pimDataGrid tr:even").addClass("evenTrBgColor");
	$(".pimDataGrid tr:odd").addClass("oddTrBgColor");

	$(".pimDataGrid tr:gt(0)").click(function() {
		$(".pimDataGrid tr:gt(0)").attr("style", "cursor:;background-color:;");
		$(this).attr("style", "cursor:pointer;background-color: #DCF8A8;");
	});
};

/**
 * 文本框enter转跳格
 */
function keyPressForEnter() {
	if ($(".enterTab").length > 0) {
		$(".enterTab").each (function (i, dom){
			if(i!=($(".enterTab").length-1)){
				$(this).keydown(function(e) {
					if(!$(this).hasClass("infoTab")){
						return enter2Tab(e,$(this),i);
					}
					if(!$(this).hasClass("saveTab")){
						return enter2Tab(e,$(this),i);
					}
				});
			}
		});
	}
}
/**
 * 文本框enter转跳格
 */
function enter2Tab(e,curInput,pos){
	var keyCode = e.keyCode ? e.keyCode : e.which;
	if(keyCode==13){
		$(".enterTab")[pos+1].focus();
	}
}
