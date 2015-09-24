// zxx 2014-04-19
$(function() {
	// 选择上级部门

	$CommonUI.getComboTree('#parentId').combotree(
			{
				url : $WEB_ROOT_PATH + '/weixin/wxMessageCtrl!getDepart.htm',
				onClick : function(node) {
					$("#depart input[name='dto.wxDepart.wxDepartParentId']")
							.val(node.id);
				},
				onShowPanel : function() {
					$CommonUI.getComboTree('#parentName').combotree(
							{
								url : $WEB_ROOT_PATH
										+ '/weixin/wxMessageCtrl!getDepart.htm'
							});
				}
			});
	$CommonUI.getComboTree('#userDepartId').combotree({
		url : $WEB_ROOT_PATH + '/weixin/wxMessageCtrl!getDepart.htm',
		onClick : function(node) {
			$("#user input[name='dto.wxUser.wxUserDepartId']").val(node.id);
		},
		onShowPanel : function() {
			$CommonUI.getComboTree('#parentName').combotree({
				url : $WEB_ROOT_PATH + '/weixin/wxMessageCtrl!getDepart.htm'
			});
		}
	});

	// 新增和修改
	$("#subDepartBtn").on(
			'click',
			function() {
				var isValid = $CommonUI.getForm('#depart').form('validate');
				if (!isValid) {
					return isValid;
				}
				postReq($WEB_ROOT_PATH + '/weixin/wxDepartCtrl!save.htm',
						"#depart", function(data) {
							$CommonUI.alert("操作成功");
							$("#datagridDepart").datagrid('reload');
							$("#departWin").dialog('close');
						}, function(data) {
							$CommonUI.alert("faile");
						}, {
							skipHidden : false
						});
			});
	$("#subUserBtn").on(
			'click',
			function() {
				var isValid = $CommonUI.getForm('#user').form('validate');
				if (!isValid) {
					return isValid;
				}
				postReq($WEB_ROOT_PATH + '/weixin/wxUserCtrl!save.htm',
						"#user", function(data) {
							if (data.resultCode == "0") {
								$CommonUI.alert("操作成功");
								$("#datagridUser").datagrid('reload');
								$("#userWin").dialog('close');
							} else {
								$CommonUI.alert("失败" + data.resultContent);
							}
						}, function(data) {
							$CommonUI.alert("faile");
						}, {
							skipHidden : false
						});
			});

	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		var json = $CommonUI.loopBlock('#selectWin');
		$("#datagrid").datagrid('load', json);
		$CommonUI.getDialog('#selectWin').dialog('close');
	});
});

// 增加
function addDepartClick() {
	$CommonUI.getDialog("#departWin").dialog("center");
	$CommonUI.getDialog("#departWin").dialog("open");
	$CommonUI.getForm('#depart').form('clear');
}
function addUser() {
	$CommonUI.getDialog("#userWin").dialog("center");
	$CommonUI.getDialog("#userWin").dialog("open");
	$CommonUI.getForm('#user').form('clear');
}

// 編輯一行记录
function editDepart() {
	if ($CommonUI.getDataGrid("#datagridDepart").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#depart').form('clear');
	var row = $("#datagridDepart").datagrid('getSelected');
	$("#departWin").dialog("open");
	$CommonUI.getDialog("#departWin").dialog("setTitle", "修改");

	if (row) {
		$("#depart input[name='dto.wxDepart.wxDepartId']").val(row.wxDepartId);
		$("#depart input[name='dto.wxDepart.wxDepartScmId']").val(
				row.wxDepartScmId);
		$("#depart input[name='dto.wxDepart.wxDepartParentId']").val(
				row.wxDepartParentId);
		$("#depart input[name='dto.wxDepart.wxDepartName']").val(
				row.wxDepartName);
		$CommonUI.getComboTree('#parentId').combotree('setValue',
				row.wxDepartParentId);
	}
}
// 編輯一行记录
function editUser() {
	if ($CommonUI.getDataGrid("#datagridUser").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#user').form('clear');
	var row = $("#datagridUser").datagrid('getSelected');
	$("#userWin").dialog("open");
	$CommonUI.getDialog("#userWin").dialog("setTitle", "修改");

	if (row) {
		$("#user input[name='dto.wxUser.wxUserId']").val(row.wxUserId);
		$("#user input[name='dto.wxUser.wxUserScmId']").val(row.wxUserScmId);
		$("#user input[name='dto.wxUser.wxUserDepartId']").val(
				row.wxUserDepartId);
		$("#user input[name='dto.wxUser.wxUserName']").val(row.wxUserName);
		$("#user input[name='dto.wxUser.wxUserEmail']").val(row.wxUserEmail);
		$("#user input[name='dto.wxUser.wxUserTel']").val(row.wxUserTel);
		$("#user input[name='dto.wxUser.wxUserWeixinId']").val(
				row.wxUserWeixinId);
		$CommonUI.getComboTree('#userDepartId').combotree('setValue',
				row.wxUserDepartId);
	}
}
// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}

// 刪除記錄
function delDepart() {
	if ($CommonUI.getDataGrid("#datagridDepart").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
		var row = $CommonUI.getDataGrid("#datagridDepart").datagrid(
				'getSelected');
		$.post($WEB_ROOT_PATH + "/weixin/wxDepartCtrl!delete.htm", {
			'dto.wxDepart.wxDepartId' : row.wxDepartId
		}, function(data) {
			$CommonUI.getDataGrid("#datagridDepart").datagrid('reload');
		}, 'json');
	});
}
// 刪除記錄
function delUser() {
	if ($CommonUI.getDataGrid("#datagridUser").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
		var row = $CommonUI.getDataGrid("#datagridUser")
				.datagrid('getSelected');
		$.post($WEB_ROOT_PATH + "/weixin/wxUserCtrl!delete.htm", {
			'dto.wxUser.wxUserId' : row.wxUserId
		}, function(data) {
			$CommonUI.getDataGrid("#datagridUser").datagrid('reload');
		}, 'json');
	});
}
function selectDepart() {
	$CommonUI.getDataGrid("#datagridDepart").datagrid('load', {
		'dto.wxDepart.wxDepartName' : $("#queryDepart").val()
	});
}
function selectUser() {
	$CommonUI.getDataGrid("#datagridUser").datagrid('load', {
		'dto.wxUser.wxUserName' : $("#queryUser").val()
	});
}

function departClick(rowIndex, rowData) {
	$CommonUI.getDataGrid("#datagridUser").datagrid('load', {
		'dto.wxUser.wxUserDepartId' : rowData.wxDepartId
	});
}

function syncLoc() {
	$.post(
			$WEB_ROOT_PATH + "/weixin/wxDepartCtrl!syncLoc.htm",
			function(data) {
				if(data.resultCode=="0"){
					$CommonUI.alert("更新成功"+data.resultValue);
					$CommonUI.getDataGrid("#datagridDepart").datagrid('reload');
				}else{
					$CommonUI.alert("以更新成功"+data.resultValue+"条,<br>异常信息:"+data.resultContent);
				}
				
			},
			'json'
	);
}
function syncVen() {
	$.post(
			$WEB_ROOT_PATH + "/weixin/wxDepartCtrl!syncVen.htm",
			function(data) {
					if(data.resultCode=="0"){
						$CommonUI.alert("更新成功"+data.resultValue);
						$CommonUI.getDataGrid("#datagridDepart").datagrid('reload');
					}else{
						$CommonUI.alert("以更新成功"+data.resultValue+"条,<br>异常信息:"+data.resultContent);
					}
					
			},
			'json'
	);
}
