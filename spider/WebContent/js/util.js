﻿﻿﻿String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
	if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
		return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")),
				replaceWith);
	} else {
		return this.replace(reallyDo, replaceWith);
	}
}
// 多选
function getAllChose(name) {
	var selectElems = document.getElementsByName(name);
	if (selectElems == undefined) {
		return "";
	}
	var valueStrs = "";
	for (var i = 0; i < selectElems.length; i++) {
		if (selectElems[i].checked == true && !isNull(selectElems[i].value)
				&& selectElems[i].value != 'on') {
			valueStrs += "," + selectElems[i].value;
		}
	}
	if (valueStrs != '') {
		valueStrs = valueStrs.substring(1);
	}
	return valueStrs;
}
// 单选
function getOneChose(name){
	var ids = getAllChose(name);
	if (ids == "") {
		ldDialog.alert("请先选择要查看的项");
		return;
	}
	var idArray = ids.split(",");
	if (idArray.length > 1) {
		ldDialog.alert("请先选择一条查看的项");
		return;
	}
	var id = idArray[0];
	return id;
}

// 删除数组中的某个元素
Array.prototype.del = function(n) {
	// n表示第几项，从0开始算起。
	// prototype为对象原型，注意这里为对象增加自定义方法的方法
	if (n < 0) // 如果n<0，则不进行任何操作。
		return this;
	else
		return this.slice(0, n).concat(this.slice(n + 1, this.length));
}
Array.prototype.clone = function() {
	var result = [];
	for (var i = 0; i < this.length; i++) {
		result[i] = this[i];
	}
	return result;
}
function isCheckboxSelected(formName) {
	var elements = eval("document." + formName + ".elements");
	var checked = false;
	for (var i = 0; i < elements.length; i++) {
		if (elements[i].type == "checkbox") {
			checked |= elements[i].checked;
		}
	}
	if (!checked) {
		alert("请选择要删除的记录");
		return false;
	}
	return true;
}
function amountEqual(other, another) {
	return Math.round(other * 100) - Math.round(another * 100) == 0;
}
(function($) {
	$.fn.serializeJson = function() {
		var result = {};
		var array = this.serializeArray();
		$(array).each(function() {
			if (!isNull(this.name)) {
				var nameSub = this.name.split(".");
				var targetObj = result;
				for (var i = 0; i <= nameSub.length - 2; i++) {
					if (targetObj[nameSub[i]] == undefined) {
						targetObj[nameSub[i]] = {};
						targetObj = targetObj[nameSub[i]];
					} else {
						targetObj = targetObj[nameSub[i]];
					}
				}
				targetObj[nameSub[nameSub.length - 1]] = this.value;
			}
		});
		return result;
	};
})(jQuery);

function iframeResize(iframe) {
	var idocumentElement = iframe.contentWindow.document.documentElement;
	iframe.height = idocumentElement.scrollHeight;
}

/**
 * 获取当前时间
 * 
 * @return {TypeName}
 */
function currentTime() {
	var now = new Date();
	var year = now.getFullYear(); // 年
	var month = now.getMonth() + 1; // 月
	var day = now.getDate(); // 日
	var hh = now.getHours(); // 时
	var mm = now.getMinutes(); // 分
	var ss = now.getSeconds(); // 秒
	var clock = year + "-";
	if (month < 10) {
		clock += "0";
	}
	clock += month + "-";
	if (day < 10) {
		clock += "0";
	}
	clock += day + " ";

	if (hh < 10) {
		clock += "0";
	}
	clock += hh + ":";
	if (mm < 10) {
		clock += '0';
	}
	clock += mm + ":";
	if (ss < 10) {
		clock += '0';
	}
	clock += ss;
	return (clock);
}
/**
 * 计算显示字符索引
 * 
 */
function countIndex(str,maxWord){
	 var len = 0;
	 for (var i = 0; i < str.length; i++) {
	        var c = str.charCodeAt(i);
	        //单字节加1 
	        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
	            len++;
	        }
	        else {
	            len += 2;
	        }
	        if(len>=maxWord){
	         	return i;
	         }
	    }
}
/**
 * JS实现字段太长以省略号结束
 */
function overFlowDeal(){
	var maxWord = 10;
	$(".overFlowEllipsis").each(function(){
	if($(this).text().length>0){
		var txt = judgeBrowser($(this).text());
		var indexs = countIndex(txt,maxWord);
			if(indexs > 0){
				$(this).html(txt.substring(0,indexs)+"..");
			}
		}
	});
	
}
/**
 * Js 识别浏览器
 */
function judgeBrowser(txtVal){
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    if (isOpera) {
        return txtVal.trim();
    }; //判断是否Opera浏览器
    if (userAgent.indexOf("Firefox") > -1) {
        return txtVal.trim();
    } //判断是否Firefox浏览器
    if (userAgent.indexOf("Chrome") > -1){
    	return txtVal.trim();
    }
    if (userAgent.indexOf("Safari") > -1) {
        return txtVal.trim();
    } //判断是否Safari浏览器
    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
        return txtVal;
    }else{
    	return txtVal;
    }
}

//查询框显示
function showConditionsbox() {
	$("#screeningBtn").hide();
	$("#searchBtn").show();
	$("#conditionsbox").show();
}

// 查询框隐藏
function hideConditionsbox() {
	$("#searchBtn").hide();
	$("#conditionsbox").hide();
	$("#screeningBtn").show();
}


//隐藏中间卡号
function cardNohide() {
	if($(".cardNo").length >0 ){
		$(".cardNo").each(function(){
			$(this).html(cardNohideChange($(this).text()));
		});
	}
}

// 替换中间卡号
function cardNohideChange(str){
	var reg = /^(\d{4})\d+(\d{4})$/;
	return str.replace(reg, "$1****$2");
}