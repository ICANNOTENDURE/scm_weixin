//$(function() {
//	// 提交
//	$("#submitBtn").on('click', function() {
//		$CommonUI.getForm("#maintainForm").form('submit', {
//			url:'maintainCtrl!saveOrUpdate.htm',
//			success : function() {
//				var msg = '';
//				var id = $("#maintainWin input[name='maintainDto.maintain.maintainId']").val();
//				if (id == '') {
//					msg = '保存成功!';
//				} else {
//					msg = '更新成功!';
//				}
//				$CommonUI.alert(msg, "", "", "", function() {
//					$("#datagrid").datagrid('reload');
//				});
//				$("#mainBody").layout('collapse','west');
//			}
//		});
//	});
//	
//	// 放弃提交
//	$("#cancelBtn").on('click', function() {
//		$("#mainBody").layout('collapse','west');
//	});
//});
//
//// 添加运维记录
//function addRow() {
//	$("#maintainWin").attr('title', '添加运维记录');
//	$("#mainBody").layout('expand', 'west');
//	$("#maintainForm").val('');
//}
//
//// 修改运维记录
//function editRow() {
//	if ($("#datagrid").datagrid('getSelections').length != 1) {
//		$CommonUI.alert('请选一个修改');
//		return;
//	}
//	$("#maintainWin").attr('title', '修改运维记录');
//	var row = $("#datagrid").datagrid('getSelected');
//	if (row) {
//		$("#maintainWin input[name='maintainDto.maintain.maintainId']").val(row.maintainId);
//		$("#maintainWin input[name='maintainDto.maintain.gatewayId']").val(row.gatewayId);
//		$("#maintainWin select[name='maintainDto.maintain.maintainType']").val(row.maintainType);
//		$("#maintainWin textarea[name='maintainDto.maintain.maintainHandle']").val(row.maintainHandle);
//		$("#maintainWin input[name='maintainDto.maintain.maintainTime']").val(row.maintainTime);
//		$("#maintainWin textarea[name='maintainDto.maintain.result']").val(row.result);
//		$("#maintainWin textarea[name='maintainDto.maintain.description']").val(row.description);
//	}
//	$("#mainBody").layout('expand', 'west');
//	$("tr:hidden").show();
//}
//
//// 删除运维记录
//function delRow() {
//	if ($("#datagrid").datagrid('getSelections').length != 1) {
//		$CommonUI.alert('请选一个删除');
//		return;
//	}
//	$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
//		var row = $("#datagrid").datagrid('getSelected');
//		$.post("maintainCtrl!delMaintain.htm", {'maintainDto.maintain.maintainId' : row.maintainId}, function() {
//			$("#datagrid").datagrid('reload');
//		});
//	});
//}
//
//function clear() {
//	$("#maintainWin").val('');
//	$(".row").hide();
//}

$(function() {
	// 添加运维记录
	$("#addMaintainBtn").on('click', function() {
		$("#maintainWin").window({
			title:"添加运维记录"
		});
		$CommonUI.getWindow("#maintainWin").window("open");
		$("#maintainForm").val('');
	});
	
	// 修改运维记录
	$("#editMaintainBtn").on('click', function() {
		if ($("#datagrid").datagrid('getSelections').length != 1) {
			$CommonUI.alert('请选一个修改');
			return;
		}
		
		$CommonUI.getWindow("#maintainWin").window({
			title:"修改运维记录"
		});
		var row = $("#datagrid").datagrid('getSelected');
		if (row) {
			$("#maintainWin input[name='maintainDto.maintain.maintainId']").val(row.maintainId);
			$("#maintainWin input[name='maintainDto.maintain.gatewayId']").val(row.gatewayId);
			$("#maintainWin select[name='maintainDto.maintain.maintainType']").val(row.maintainType);
			$("#maintainWin textarea[name='maintainDto.maintain.maintainHandle']").val(row.maintainHandle);
			$("#maintainWin input[name='maintainDto.maintain.maintainTime']").val(row.maintainTime);
			$("#maintainWin textarea[name='maintainDto.maintain.result']").val(row.result);
			$("#maintainWin textarea[name='maintainDto.maintain.description']").val(row.description);
		}
		
		$CommonUI.getWindow('#maintainWin').window("open");
		$("tr:hidden").show();
	});
	
	// 删除运维记录
	$("#removeMaintainBtn").on('click', function() {
		if ($("#datagrid").datagrid('getSelections').length != 1) {
			$CommonUI.alert('请选一个删除');
			return;
		}
		$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
			var row = $("#datagrid").datagrid('getSelected');
			$.post("maintainCtrl!delMaintain.htm", {'maintainDto.maintain.maintainId' : row.maintainId}, function() {
				$("datagrid").datagrid('reload');
		    });
		});
	});

	
});

$(function() {
	// 提交
	$("#submitBtn").on('click', function() {
		$CommonUI.getForm("#maintainForm").form('submit', {
			url:'maintainCtrl!saveOrUpdate.htm',
			success : function() {
				var msg = '';
				var id = $("#maintainWin input[name='maintainDto.maintain.maintainId']").val();
				if (id == '') {
					msg = '保存成功!';
				} else {
					msg = '更新成功!';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					$("#datagrid").datagrid('reload');
					$("#maintainWin").window('close');
				});
			}
		});
	});
	
	// 放弃提交
	$("#cancelBtn").on('click', function() {
		$CommonUI.getWindow("#maintainWin").window('close');
	});
	
});

function clear(){
	$("#maintainWin").val('');
	$(".row").hide();
}