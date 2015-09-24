$(function() {
	// 提交
	$("#submitBtn").on('click', function() {
		$CommonUI.getForm("#rsConfigForm").form("submit", {
			url:'receiveServerConfigCtrl!saveOrUpdate.htm',
			success : function() {
				var msg = '';
				var id = $("#rsConfigWin input[name='rsPriorityDto.rsPriority.gatewayId']").val();
				if (id == '') {
					msg = '保存成功!';
				} else {
					msg = '更新成功!';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					$("#datagrid").datagrid('reload');
					$("#detailWin").window('close');
				});
			}
		});
	});
	
	// 放弃提交
	$("#cancelBtn").on('click', function() {
		$CommonUI.getWindow("#rsConfigWin").window('close');
		clear();
	});
	
	// 条件查询弹窗提交按钮
	$("#querySubmitBtn").on('click', function() {
		$CommonUI.getWindow("#rsConfigWin").window('close');
	});
	
});

// 添加接收服务器配置信息
function addRSConfigWin() {
	$CommonUI.getWindow("#rsConfigWin").window({
		title:"新增接收服务器配置信息"
	});
	$CommonUI.getWindow("#rsConfigWin").window("open");
	$("#rsConfigForm input").val('');
	$("#submitBtn").show();
	$("#querySubmitBtn").hide();
	$("#cancelBtn").show();
}

// 更新接收服务器配置信息
function uploadRSConfigWin() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选择一个更改');
		return;
	}
	$CommonUI.getWindow("#rsConfigWin").window({
		title:"更新接收服务器配置信息"
	});
	
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$("#rsConfigWin input[name='rsPriorityDto.rsPriority.gatewayId']").val(row.gatewayId);
		$("#rsConfigWin input[name='rsPriorityDto.rsPriority.priorityCode']").val(row.priorityCode);
		$("#rsConfigWin input[name='rsPriorityDto.rsPriority.useSatate']").val(row.useSatate);
	}
	$CommonUI.getWindow("#rsConfigWin").window("open");	
	$("#submitBtn").show();
	$("#querySubmitBtn").hide();
	$("#cancelBtn").show();
}

// 删除接收服务器配置信息
function delRSConfigBtn() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选择一个更改');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
		var row = $("#datagrid").datagrid('getSelected');
		$.post("receiveServerConfigCtrl!delRsPriority.htm", {'rsPriorityDto.rsPriority.gatewayId' : row.gatewayId}, function () {
			$("#datagrid").datagrid('reload');
		});
	});
}

// 查询按钮，打开查询弹窗
function searchRSConfigWin() {
	$CommonUI.getWindow("#rsConfigWin").window({
		title: '查找接收服务器信息'
	});
	
	$CommonUI.getWindow("#rsConfigWin").window("open");
	$("#submitBtn").hide();
	$("#querySubmitBtn").show();
	$("#cancelBtn").show();
}

function clear() {
	$("#detailWin").val("");
	$(".row").hide();
}