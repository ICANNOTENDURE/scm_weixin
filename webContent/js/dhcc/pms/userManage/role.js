$(function(){
	//设置描述输入框样式
	$CommonUI.textarea(
		$("#description"),
	    230,
	    50,
	    false
	);
	
	//根据系统代码获取系统角色
	$CommonUI.getDataGrid('#datagrid').datagrid({  
		url:'roleCtrl!roleList.htm?roleDto.role.useState=1'  
    });
	
	
	//根据查询条件查询角色信息
	$("#searchFuncBtn").click(function(){
		$CommonUI.getDataGrid('#datagrid').datagrid('load',{
			"roleDto.columnName":$("#roleColumnName").val(),
			"roleDto.columnValue":$("#roleColumnValue").val()
		});
	});
	
	//提交角色信息
	$("#submitFuncBtn").click(function(){
		$CommonUI.getForm('#saveOrUpdateForm').form('submit', {
			url: "roleCtrl!saveOrUpdateRole.htm",
			onSubmit: function(){
				var isValid = $(this).form('validate');
				if(isValid){
					$("#submitFuncBtn").hide();
				}
				return isValid;
			},
			success: function(){
				var message = '';
				var id = $("#saveOrUpdateTable input[name='roleDto.role.roleId']").val();
				if(id == ''){
					message = '保存成功!';
				}else{
					message = '更新成功';
				}
				$CommonUI.alert(message,"","","",function(){
					$('#roleDialog').dialog('close');
					$("#datagrid").datagrid('reload');
				});
			}
		});
	});
	
	//重置表单
	$("#cancelFuncBtn").click(function(){
		$("#saveOrUpdateTable input").val("");
		$("#saveOrUpdateTable textarea").val("");
	});
	
/////////////////////////////////////////////从业人员账户查询
	//条件查询
//	$("#searchRolePraAccountBtn").click(function(){
//		var row = $("#datagrid").datagrid('getSelected');
//		$CommonUI.getDataGrid('#searchRolePraAccountDatagrid').datagrid('load',{
//			"roleDto.roleId":row.roleId,
//			"roleDto.columnName":$("#praAccountColumnName").val(),
//			"roleDto.columnValue":$("#praAccountColumnValue").val()
//		});
//	});
	
/////////////////////////////////////////////普通用户账户查询
	//条件查询
	$("#searchRoleNormalAccountBtn").click(function(){
		var row = $("#datagrid").datagrid('getSelected');
		$CommonUI.getDataGrid('#searchRoleNormalAccountDatagrid').datagrid('load',{
			"roleDto.roleId":row.roleId,
			"roleDto.columnName":$("#normalAccountNameColumnName").val(),
			"roleDto.columnValue":$("#normalAccountColumnValue").val()
		});
	});
	
});

//添加角色信息
function addRole(){
	$('#roleDialog').dialog('open');
}

//修改角色信息
function editRole(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$("#saveOrUpdateTable input[name='roleDto.role.roleId']").val(row.roleId);
		$CommonUI.getComboBox('#systemType').combobox('setValues', [row.systemType]);
		$("#saveOrUpdateTable input[name='roleDto.role.roleCode']").val(row.roleCode);
		$("#saveOrUpdateTable input[name='roleDto.role.roleName']").val(row.roleName);
		$CommonUI.getDateBox('#createTime').datebox('setValue',row.createTime);
		$CommonUI.getComboBox('#useState').combobox('setValues', [row.useState]);
		$("#description").val(row.description);
	}
	
	$CommonUI.getDialog('#roleDialog').dialog({  
		title: '修改角色'  
    }); 
	$('#roleDialog').dialog('open');
}

//根据角色id删除角色
function cancelRole(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question',0,function(){
		var row = $("#datagrid").datagrid('getSelected');
		$.post("roleCtrl!deleteRole.htm", {'roleDto.role.roleId':row.roleId},function(){
			$("#datagrid").datagrid('reload');
			
			$("#showTable input").val("");
			$("#saveOrUpdateTable input").val("");
			$("#saveOrUpdateTable textarea").val("");
			$CommonUI.alert("删除成功","","","",null);
		});
	});
}

//查看角色详细信息
function showRole(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个查看');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$.post(
		   'roleCtrl!getSystemVersion.htm',
		   {
			   'roleDto.columnName':'systemType',
			   'roleDto.columnValue':row.systemType
		   },
		   function(data){
			   $("#showTable input[name='roleDto.role.systemType']").val(data[0].systemName);
		   },
		   "json"
		);
		$("#showTable input[name='roleDto.role.roleCode']").val(row.roleCode);
		$("#showTable input[name='roleDto.role.roleName']").val(row.roleName);
		$("#showTable input[name='roleDto.role.createTime']").val(row.createTime);
		$("#showTable input[name='roleDto.role.useState']").val(row.useState==1?"启用":"禁用");
		$("#showTable input[name='roleDto.role.description']").val(row.description);
	}
	
	$('#showRoleWindow').window('open');
}

//分配权限
function saveRoleFuncs(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个角色');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	//根据系统代码获取系统权限树
	//alert(row.roleId)
	$CommonUI.getTree('#saveRoleFuncsTree').tree({  
		url:'roleCtrl!getRoleFuncs.htm?&roleDto.roleId='+row.roleId
    });
	
	$('#saveRoleFuncsDialog').dialog('open');
}
//分配科室权限
function saveLocs(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个角色');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	//根据系统代码获取系统权限树
	//alert(row.roleId)
	$CommonUI.getTree('#saveLocsTree').tree({  
		url:'roleCtrl!getRoleLocs.htm?&roleDto.roleId='+row.roleId
    });
	
	$('#saveLocsDialog').dialog('open');
}

//分配供应商权限
function saveVendors(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个角色');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	//根据系统代码获取系统权限树
	//alert(row.roleId)
	$CommonUI.getTree('#saveVensTree').tree({  
		url:'roleCtrl!getRoleVens.htm?&roleDto.roleId='+row.roleId
    });
	
	$('#saveVensDialog').dialog('open');
}
function giveFunc(){
	var row = $("#datagrid").datagrid('getSelected');
	
	var funcIds = "";
	var nodes = $CommonUI.getTree('#saveRoleFuncsTree').tree('getChecked');
	for(var i=0; i<nodes.length; i++){
		funcIds = funcIds+nodes[i].id+",";
	}
	
	nodes = $CommonUI.getTree('#saveRoleFuncsTree').tree('getChecked', 'indeterminate');
	for(var i=0; i<nodes.length; i++){
		funcIds = funcIds+nodes[i].id+",";
	}
	
	$.post(
			'roleCtrl!saveRoleFunc.htm',
			{
				"roleDto.roleId":row.roleId,
				"roleDto.funcIds":funcIds
			},
			function(data){
				if(data.success){
					//根据系统代码获取系统权限树
					$CommonUI.getTree('#saveRoleFuncsTree').tree({  
						url:'roleCtrl!getRoleFuncs.htm?roleDto.roleId='+row.roleId
				    });   
				}$CommonUI.alert(data.message);
				
			},
			"json"
	);
}


//保存供应商权限
function giveVen(){
	var row = $("#datagrid").datagrid('getSelected');
	
	var funcIds = "";
	var nodes = $CommonUI.getTree('#saveVensTree').tree('getChecked');
	for(var i=0; i<nodes.length; i++){
		funcIds = funcIds+nodes[i].id+",";
	}
	
	nodes = $CommonUI.getTree('#saveVensTree').tree('getChecked', 'indeterminate');
	for(var i=0; i<nodes.length; i++){
		funcIds = funcIds+nodes[i].id+",";
	}
	
	$.post(
			'roleCtrl!saveRoleVen.htm',
			{
				"roleDto.roleId":row.roleId,
				"roleDto.vens":funcIds
			},
			function(data){
				if(data.success){
					//根据系统代码获取系统权限树
					$CommonUI.getTree('#saveVensTree').tree({  
						url:'roleCtrl!getRoleVens.htm?roleDto.roleId='+row.roleId
				    });   
				}$CommonUI.alert(data.message);
				
			},
			"json"
	);
}

//保存科室
function giveLoc(){
	var row = $("#datagrid").datagrid('getSelected');
	
	var funcIds = "";
	var nodes = $CommonUI.getTree('#saveLocsTree').tree('getChecked');
	for(var i=0; i<nodes.length; i++){
		funcIds = funcIds+nodes[i].id+",";
	}
	
	nodes = $CommonUI.getTree('#saveLocsTree').tree('getChecked', 'indeterminate');
	for(var i=0; i<nodes.length; i++){
		funcIds = funcIds+nodes[i].id+",";
	}
	
	$.post(
			'roleCtrl!saveRoleLoc.htm',
			{
				"roleDto.roleId":row.roleId,
				"roleDto.locs":funcIds
			},
			function(data){
				if(data.success){
					//根据系统代码获取系统权限树
					$CommonUI.getTree('#saveLocsTree').tree({  
						url:'roleCtrl!getRoleLocs.htm?roleDto.roleId='+row.roleId
				    });   
				}$CommonUI.alert(data.message);
				
			},
			"json"
	);
}

//从业人员账户查询
function searchRolePraAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个角色');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	
	$CommonUI.getDataGrid('#searchRolePraAccountDatagrid').datagrid('load',{
		"roleDto.roleId":row.roleId
	});
	
	$('#searchRolePraAccountWindow').dialog('open');
}

//普通用户账户查询
function searchRoleNormalAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个角色');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	
	$CommonUI.getDataGrid('#searchRoleNormalAccountDatagrid').datagrid('load',{
		"roleDto.roleId":row.roleId
	});
	
	$('#searchRoleNormalAccountWindow').dialog('open');
}

//清空表单方法
function clear(){
	$("#saveOrUpdateTable input").val("");
	$("#saveOrUpdateTable textarea").val("");
	
	$("#showTable input").val("");
	
	$CommonUI.getDialog('#roleDialog').dialog({  
		title: '添加角色'  
    }); 
	
	$("#submitFuncBtn").show();
}












