$(function() {
	// 系统版本目录新建按钮
	$("#createBtn").on('click', function() {
		$CommonUI.getForm("#addVersionForm").form("submit", {
			url:'systemVersionCtrl!saveOrUpdate.htm',
			//url:'uploadSystemVersionAction!createFolder.htm',
			success : function() {
//				$.post(
//					'systemVersionCtrl!saveOrUpdate.htm',
//					function() {
//						$("#tt").treegrid('reload');
//						$("#addVersionWin").window("close");
//						clear();
//					}
//				);
				$("#tt").treegrid('reload');
				$("#addVersionWin").window("close");
				clear();
			}
		});	
	});

	// 系统版本目录取消按钮
	$("#giveUpBtn").on('click', function() {
		$CommonUI.getWindow("#addVersionWin").window("close");
		clear();
	});
	
	// 系统安装文件上传按钮
	$("#uploadBtn").on('click', function() {
//		// 防止多次提交
//		$("#addVersionForm").submit(function() {
//			
//		});
		$CommonUI.getForm("#addVersionForm").form('submit', {
			url: "uploadSystemVersionAction.htm",
			onSubmit: function() {
				var isValid = $(this).form('validate');
				return isValid;
			},
			success: function() {
//				$.post(
//					'systemVersionCtrl!saveOrUpdate.htm',
//					function(data) {
//						
//					}
//				);
				$CommonUI.alert("文件上传成功", "", "", "", function() {
					$("#addVersionWin").window('close');
				});
			}
		});
		
		clear();
	});
	
	// 系统安装文件放弃按钮
	$("#cancelBtn").on('click', function() {
		$CommonUI.getWindow("#addVersionWin").window("close");
		clear();
	});
	
});

// 打开新建系统版本目录弹窗
function addCatalogWin() {
	$CommonUI.getWindow("#addVersionWin").window({
		title:"新建系统版本目录"
	});
	$CommonUI.getWindow("#addVersionWin").window("open");
	$(".createDir").show();
	$(".addPkg").hide();
	$("#btn a").hide();
	$("#createBtn").show();
	$("#giveUpBtn").show();
	
	$("#addVersionWin input[name='systemVersionDto.systemVersion.parentId']").val('');
} 

// 打开添加系统安装文件弹窗
function uploadFileWin() {
	$CommonUI.getWindow("#addVersionWin").window({
		title:"添加系统安装文件"
	});
	$CommonUI.getWindow("#addVersionWin").window("open");
	$(".createDir").hide();
	$(".addPkg").show();
	$("#btn a").hide();
	$("#uploadBtn").show();
	$("#cancelBtn").show();
	
	clear();
}

// 鼠标右键菜单事件
function rightClick(e, row) {
	e.preventDefault();
	$CommonUI.getMenu("#mm").menu('show', {
		left: e.pageX,
		top: e.pageY	
	});
}

// 菜单项单击事件：新建子目录
function createSubdir() {
	if ($("#tt").treegrid('getSelections').length != 1) {
		$CommonUI.alert('请选择根目录');
		return;
	}
	
	var node = $("#tt").treegrid('getSelected');
	$CommonUI.getWindow("#addVersionWin").window({
		title:"新建子目录"
	});
	$CommonUI.getWindow("#addVersionWin").window("open");
	$(".createDir").show();
	$(".addPkg").hide();
	$("#btn a").hide();
	$("#createBtn").show();
	$("#giveUpBtn").show();
	if (node) {
		$("#addVersionWin input[name='systemVersionDto.systemVersion.parentId']").val(node.versionId);
	} else {
		return;
	}
}

// 菜单项单击事件：新建根目录
function createRootdir() {
	var node = $("#tt").treegrid('getSelected');
	
	$CommonUI.getWindow("#addVersionWin").window({
		title:"新建根目录"
	});
	$CommonUI.getWindow("#addVersionWin").window("open");
	$(".createDir").show();
	$(".addPkg").hide();
	$("#btn a").hide();
	$("#createBtn").show();
	$("#giveUpBtn").show();
	
	if (node) {
		$("#addVersionWin input[name='systemVersionDto.systemVersion.parentId']").val('');
	}
}

// 菜单项单击事件：上传文件设置窗口
function uploadFieWin() {
	if ($("#tt").treegrid('getSelections').length != 1) {
		$CommonUI.alert('请选择文件存放目录');
		return;
	}
	
	var node = $("#tt").treegrid('getSelected');
	$CommonUI.getWindow("#addVersionWin").window({
		title:"添加系统安装文件"
	});
	$CommonUI.getWindow("#addVersionWin").window("open");
	$(".createDir").hide();
	$(".addPkg").show();
	$("#btn a").hide();
	$("#uploadBtn").show();
	$("#cancelBtn").show();
	
	if (node) {
		$("#addVersionWin input[name='systemVersionDto.systemVersion.parentId']").val(node.versionId);
		$("#addVersionWin input[name='systemVersionDto.systemVersion.systemType']").val(node.systemType);
		//$CommonUI.getComboTree('#cc').combotree('setValue', 6);
		//$CommonUI.getComboTree("#catalogue").combotree('setValue', node.filePath);
	} else {
		return;
	}
}

//菜单项单击事件：删除一行
function cancelOper() {
	if ($("#tt").treegrid('getSelections').length != 1) {
		$CommonUI.alert('请选中一行删除');
		return;
	}
	
	var node = $("#tt").treegrid('getSelected');
	if (node) {
		$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
			$.post("systemVersionCtrl!delSystemVersionById.htm", {'systemVersionDto.systemVersion.versionId' : node.versionId}, function() {
				$("#tt").treegrid('reload');
			});
		});
	} else {
		$CommonUI.alert('请选中一行删除');
		return;
	}
}

function clear() {
	$("#addVersionWin").val('');
}
