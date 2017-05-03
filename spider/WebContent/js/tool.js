var basePath;
function setMarketBasePath(_basePath) {
	this.basePath = _basePath;
}

// 图片上传
function uploadImage(ele) {
	var url = basePath + "core/upload!prepare.action";
	ldDialog.openMedium(url, "图片上传", function(window) {
		var item = window.returnValue;
		if (item == undefined) {
			return;
		}
		$("#" + ele + "").val(item.url);
	});
}

// 图片查看
function showImage(filePath) {
	ldDialog.openMedium(basePath
			+ "core/upload!detail.action?filePath=" + filePath, "查看图片",
			function(window) {
			});
}

// 选择部门
function selectArea() {
	var url = basePath + "core/areaForChoose!areaForChooseFrame.action";
	ldDialog.open(url, "选择部门", function(window) {
		var area = window.returnValue;
		if (area == undefined) {
			return;
		}
		$("#belongAreaId").val(area.id);
		$("#belongAreaName").val(area.areaName);
	}, 1024, 600);
}