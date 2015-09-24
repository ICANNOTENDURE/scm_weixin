$(function () {
	// 提交
	$("#submitBtn").on('click', function() {
		$CommonUI.getForm("#detail").form("submit", {
			url:'appSystemConfigCtrl!saveOrUpdate.htm',
			success : function() {
				$("#detailWin").dialog('close');
				var msg = '';
				var id = $("#detailWin input[name='gatewayDto.gateway.gatewayId']").val();
				//alert(id);
				if (id == '') {
					msg = '保存成功！';
				} else {
					msg = '更新成功！';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					$("#datagrid").datagrid('reload');
					clear();
				});
			}
		});
	});
	
	// 放弃提交
	$("#cancelBtn").on('click', function() {
		$CommonUI.getDialog("#detailWin").dialog('close');
		clear();
	});	
	
	
	// 条件查询弹窗提交按钮	
	$("#querySubmitBtn").on('click', function() {
		var json = $CommonUI.loopBlock('#queryForm');
		$("#datagrid").datagrid('load', json);
		
		$CommonUI.getDialog("#queryWin").dialog('close');
	});
	
	// 条件查询弹窗放弃按钮
	$("#queryCancelBtn").on('click', function() {
		$CommonUI.getDialog('#queryWin').dialog('close');
	});
	
	// 快速查询按钮
	$("#searchBtn").on('click', function() {
		var text = $("#gatewayColumnValue").val();
		var value = '';
		if (text == "在线") {
			value = 1;
		} else if (text == "离线") {
			value = 2;
		} else if (text == "未知") {
			value = 3;
		} else if (text == "可用") {
			value = 1;
		} else if (text == "停用") {
			value = 2;
		} else {
			return;
		}
		$CommonUI.getDataGrid('#datagrid').datagrid('load', {
			"gatewayDto.columnName":$("#gatewayColumnName").val(),
			"gatewayDto.columnValue":value
		});
		//alert($("#gatewayColumnValue").val());
	});
	
//	$CommonUI.getComboBox("#onlineState").combobox('setValue', '1');
//	$CommonUI.getComboBox("#useState").combobox('setValue', '1');
});

// 添加应用系统配置信息
function addAppWin() {
	$CommonUI.getDialog("#detailWin").dialog({
		title:"新增应用系统配置信息"
	});
	
	$CommonUI.getDialog("#detailWin").dialog("open");
	$("#detailWin input").val('');
	$(".row").hide();
	$("#rowId").hide();
	//clear();
}

// 更新应用系统配置信息
function updateAppWin() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选择一个更改');
		return;
	}
	$CommonUI.getDialog("#detailWin").dialog({
		title:"更新应用系统配置信息"
	});
	
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$("#detailWin input[name='gatewayDto.gateway.gatewayId']").val(row.gatewayId);
		//$("#detailWin input[name='gatewayDto.gatewayVo.serverName']").val(row.serverName);
		//$("#detailWin input[name='gatewayDto.gatewayVo.certSerialNum']").val(row.certSerialNum);
		$("#detailWin input[name='gatewayDto.gateway.port']").val(row.port);
		$CommonUI.getComboBox("#onlineState").combobox('setValue', row.onlineState);
		$("#detailWin input[name='gatewayDto.gateway.systemType']").val(row.systemType);
		$("#detailWin input[name='gatewayDto.gateway.version']").val(row.version);
		$CommonUI.getDateBox("#regTime").datebox('setValue', row.regTime);
		$CommonUI.getDateBox("#updateTime").datebox('setValue', row.updateTime);
		$CommonUI.getComboBox("#useState").combobox('setValue', row.useState);
		
	}
	$("tr:hidden").show();
	$("#rowId").hide();
	$CommonUI.getDialog("#detailWin").dialog("open");
}

// 删除应用系统配置信息
function delAppBtn() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选择一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
		var row = $("#datagrid").datagrid('getSelected');
		$.post("appSystemConfigCtrl!delGateway.htm", {'gatewayDto.gateway.gatewayId' : row.gatewayId}, function () {
			$("#datagrid").datagrid('reload');
		});
	});
}

//条件查询按钮,打开条件查询弹窗
function searchAppWin() {
	$("#queryWin").dialog({
		title:"查找应用系统配置信息"
	});
	
	$CommonUI.getDialog("#queryWin").dialog("open");
	
	$("#queryForm input").val('');
}

//function serverInfo(value, row, index) {
//	if (row.gateway) {
//		alert(row.gateway.serverType);
//		return row.gateway.serverType+row.gateway.serverName;
//	} else {
//		return value;
//	}
//}

// 清空窗口数据
function clear() {
	$("#detailWin").val("");
	$(".row").hide();
	$("#rowId").hide();
}