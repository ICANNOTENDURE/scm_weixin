$(function() {
	// 提交
	$("#submitBtn").on("click", function() {
		$CommonUI.getForm("#orgInfoForm").form("submit", {
			url:'orgCtrl!saveOrUpdate.htm',
			success : function() {
				var msg = '';
				var id = $("#orgInfoWin input[name='orgDto.org.orgId']").val();
				if (id == '') {
					msg = '保存成功!';
				} else {
					msg = '更新成功!';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					$("#datagrid").datagrid('reload');
					$("#orgInfoWin").dialog('close');
					clear();
				});
			}
		});
	});
	
	// 放弃提交
	$("#cancelBtn").on("click", function() {
		$CommonUI.getDialog("#orgInfoWin").dialog('close');
	});
	
	// 条件查询弹窗提交按钮
	$("#querySubmitBtn").on("click", function() {
		var json = $CommonUI.loopBlock('#queryOrgForm');
		$("#datagrid").datagrid('load', json);
		
		$CommonUI.getDialog("#queryOrgWin").dialog('close');
	}); 
	
	// 条件查询弹窗放弃按钮
	$("#queryCancelBtn").on("click", function() {
		$CommonUI.getDialog("#queryOrgWin").dialog('close');
	});
});

// 打开添加机构信息弹窗
function addOrgWin() {
	$CommonUI.getDialog("#orgInfoWin").dialog({
		title:"添加机构信息"
	});
	$CommonUI.getDialog("#orgInfoWin").dialog("open");
	
	$("#orgInfoForm input").val('');
	clear();
}

// 打开更新机构信息弹窗
function uploadOrgWin() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	
	$CommonUI.getDialog("#orgInfoWin").dialog({
		title:"更新机构信息"
	});
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$("#orgInfoWin input[name='orgDto.org.orgId']").val(row.orgId);
		$("#orgInfoWin input[name='orgDto.org.orgName']").val(row.orgName);
		$("#orgInfoWin input[name='orgDto.org.orgCode']").val(row.orgCode);
		$("#orgInfoWin input[name='orgDto.org.addrState']").val(row.addrState);
		$("#orgInfoWin input[name='orgDto.org.addrCity']").val(row.addrCity);
		$("#orgInfoWin input[name='orgDto.org.addrCounty']").val(row.addrCounty);
		$("#orgInfoWin input[name='orgDto.org.addrTown']").val(row.addrTown);
		$("#orgInfoWin input[name='orgDto.org.addrStreet']").val(row.addrStreet);
		$("#orgInfoWin input[name='orgDto.org.addrHouseNumber']").val(row.addrHouseNumber);
		$("#orgInfoWin input[name='orgDto.org.addrDistrictsCode']").val(row.addrDistrictsCode);
		$CommonUI.getComboBox("#useState").combobox('setValue', row.useState);
//		$("#orgInfoWin input[name='orgDto.org.orgCenterId']").val(row.orgCenterId);
		$("#orgInfoWin input[name='orgDto.server.serverName']").val(row.serverName);
//		$("#orgInfoWin input[name='orgDto.server.ip']").val(row.ip);
	}
	
	$CommonUI.getDialog('#orgInfoWin').dialog("open");
	$("tr:hidden").show();
	$("#rowId").hide();
}

// 选中并删除某条机构信息
function delOrgBtn() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function() {
		var row = $("#datagrid").datagrid('getSelected');
		$.post("orgCtrl!delOrg.htm", {'orgDto.org.orgId' : row.orgId}, function() {
			$("datagrid").datagrid('reload');
		});
	});
}

// 打开查询机构信息弹窗
function searchOrgWin() {
	$CommonUI.getDialog("#queryOrgWin").dialog({
		title:'查找机构信息'
	});
	
	$CommonUI.getDialog("#queryOrgWin").dialog("open");
	$("#queryOrgForm input").val('');
}

function clear(){
	$("#orgInfoWin").val('');
	$(".row").hide();
	$("#rowId").hide();
}