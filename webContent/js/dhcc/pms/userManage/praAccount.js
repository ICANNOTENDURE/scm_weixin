$(function(){
	// 扩展validatebox的validType属性
	$.extend($.fn.validatebox.defaults.rules, {
	  //添加自己的表单验证规则
	  //扩展validatebox的validType属性
		idCard: {
	    	validator: function(value, param){ 
		    	if (/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '身份证格式有误'
	    },
	    telphone:{
	    	validator: function(value, param){ 
		    	if (/^[1]([3][0-9]{1}|59|58|88|89|55)[0-9]{8}$/.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '手机号格式有误'
	    },
	    accountAlias:{
	    	validator: function(value, param){ 
		    	if (/[^0-9](.)*/.test(value)&&/^((?!@).)+$/.test(value)&&/^.{6,20}$/.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '账户名不能以数字开头，不能包含"@",长度为6-20位'
	    }
	});
	
	//获取系统名称
	$CommonUI.getComboBox('#systemTypeSelect').combobox({
		 url:$WEB_ROOT_PATH+'/role/roleCtrl!getSystemVersion.htm?roleDto.columnName=parentId&roleDto.columnValue=null'
	});
	
	//条件查询从业人员账户信息
	$("#searchPraAccountBtn").click(function(){
		$CommonUI.getDataGrid('#datagrid').datagrid('load',{
			"praAccountDto.columnName":$("#praAccountColumnName").val(),
			"praAccountDto.columnValue":$("#praAccountColumnValue").val()
		});
	});
	
	//提交表单
	$("#submitFuncBtn").click(function(){
		
		var isValid = $CommonUI.getForm('#saveOrUpdateForm').form('validate');
		if(!isValid){
			return isValid;
		}
		
		$("#submitFuncBtn").hide();
		$.post(
				"praAccountCtrl!saveOrUpdatePraAccount.htm",
	             {
					"praAccountDto.praAccount.accountAlias":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.accountAlias']").val(),
					"praAccountDto.praAccount.useState":$CommonUI.getComboBox('#useState').combobox('getValue'),
					"praAccountDto.praAccount.praUser.realName":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.realName']").val(),
					"praAccountDto.praAccount.praUser.sex":$CommonUI.getComboBox('#praUserSex').combobox('getValue'),
					"praAccountDto.praAccount.praUser.nation":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.nation']").val(),
					"praAccountDto.praAccount.praUser.province":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.province']").val(),
					"praAccountDto.praAccount.praUser.birthday":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.birthday']").val(),
					"praAccountDto.praAccount.praUser.idCard":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.idCard']").val(),
					"praAccountDto.praAccount.praUser.telphone":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.telphone']").val(),
					"praAccountDto.praAccount.praUser.address":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.address']").val(),
					"praAccountDto.praAccount.praUser.email":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.email']").val(),
					"praAccountDto.praAccount.praUser.zipCode":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.zipCode']").val(),
					"praAccountDto.praAccount.description":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.description']").val(),
					
					"praAccountDto.praAccount.accountId":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.accountId']").val(),
					"praAccountDto.praAccount.password":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.password']").val(),
					"praAccountDto.praAccount.sessionKey":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.sessionKey']").val(),
					"praAccountDto.praAccount.praUser.userId":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.userId']").val(),
					"praAccountDto.praAccount.regTime":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.regTime']").val(),
					"praAccountDto.praAccount.logNum":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.logNum']").val(),
					"praAccountDto.praAccount.updateTime":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.updateTime']").val(),
					"praAccountDto.praAccount.loginTime":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.loginTime']").val(),
					"praAccountDto.praAccount.onlineState":$CommonUI.getComboBox('#onlineState').combobox('getValue'),
					"praAccountDto.praAccount.accountName":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.accountName']").val(),
					"praAccountDto.praAccount.praUser.userCenterId":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.userCenterId']").val(),
					"praAccountDto.praAccount.praUser.orgId":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.orgId']").val(),
					"praAccountDto.praAccount.praUser.postCategory":$("#saveOrUpdateForm input[name='praAccountDto.praAccount.praUser.postCategory']").val(),
					"praAccountDto.accountAliasOld":$("#saveOrUpdateForm input[name='praAccountDto.accountAliasOld']").val(),
	             },
	             function(data){
	            	$CommonUI.alert(data.message,"","","",null);
	                if(data.success){
	                	$('#praAccountDialog').dialog('close');
						$("#datagrid").datagrid('reload');
	                }else{
	                	$("#submitFuncBtn").show();
	                }
	             },
	             "json"
	    );
	});
	
	//重置表单
	$("#cancelFuncBtn").click(function(){
		$("#saveOrUpdateTable input").val("");
	});
	
/////////////////////////////////////////////////账户角色	
    //变更当前系统
    $CommonUI.getComboBox('#systemTypeSelect').combobox({
    	//刷新角色信息面板
    	onChange: function(){
    		//根据系统代码获取系统角色
        	$CommonUI.getDataGrid('#praAccountRoleDatagrid').datagrid({  
        		url:'praAccountCtrl!getPraAccountRole.htm?praAccountDto.systemType='+$CommonUI.getComboBox('#systemTypeSelect').combobox('getValue')+"&praAccountDto.accountId="+$("#datagrid").datagrid('getSelected').accountId   
            }); 
		}
    });
	//根据查询条件查询角色信息
	$("#searchPraAccountRole").click(function(){
		$CommonUI.getDataGrid('#praAccountRoleDatagrid').datagrid('load',{
			"praAccountDto.columnName":$("#roleColumnName").val(),
			"praAccountDto.columnValue":$("#roleColumnValue").val() 
		});
	});
	//保存账户角色信息
	$("#savePraAccountRole").click(function(){
		var row = $("#datagrid").datagrid('getSelected');
		var accountId = row.accountId;
		
		var roleId = "";
		var rows = $("#praAccountRoleDatagrid").datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			roleId = roleId+rows[i].roleId+",";
		}
		
		$.post(
				'praAccountCtrl!savePraAccountRole.htm',
				{
					"praAccountDto.accountId":accountId,
					"praAccountDto.roleId":roleId,
					"praAccountDto.systemType":$CommonUI.getComboBox('#systemTypeSelect').combobox('getValue')
				},
				function(data){
					if(data.message){
						$CommonUI.getDataGrid('#praAccountRoleDatagrid').datagrid({  
							url:'praAccountCtrl!getPraAccountRole.htm?praAccountDto.systemType='+$CommonUI.getComboBox('#systemTypeSelect').combobox('getValue')+"&praAccountDto.accountId="+accountId     
				        }); 
					}
					$CommonUI.alert(data.message);
				},
				"json"
		);
	});
	
});

//添加从业人员账户
function addPraAccount(){
	$('#praAccountDialog').dialog('open');
}

//修改从业人员账户信息
function editPraAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.accountAlias']").val(row.accountAlias);
		$("#saveOrUpdateTable input[name='praAccountDto.accountAliasOld']").val(row.accountAlias);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.accountName']").val(row.accountName);
		$CommonUI.getComboBox('#useState').combobox('setValues', [row.useState]);
		$CommonUI.getComboBox('#onlineState').combobox('setValues', [row.onlineState]);
		$CommonUI.getDateBox('#regTime').datebox('setValue', new Date(row.regTime).format("yyyy-MM-dd"));
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.logNum']").val(row.logNum);
		$CommonUI.getDateBox('#updateTime').datebox('setValue', new Date(row.updateTime).format("yyyy-MM-dd"));
		$CommonUI.getDateBox('#loginTime').datebox('setValue', new Date(row.loginTime).format("yyyy-MM-dd"));
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.description']").val(row.description);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.accountId']").val(row.accountId);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.password']").val(row.password);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.sessionKey']").val(row.sessionKey);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.userId']").val(row.praUser.userId);
		
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.realName']").val(row.praUser.realName);
		$CommonUI.getComboBox('#praUserSex').combobox('setValues', [row.praUser.sex]);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.nation']").val(row.praUser.nation);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.province']").val(row.praUser.province);
		$CommonUI.getDateBox('#praUserBirthday').datebox('setValue', new Date(row.praUser.birthday).format("yyyy-MM-dd"));
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.idCard']").val(row.praUser.idCard);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.telphone']").val(row.praUser.telphone);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.email']").val(row.praUser.email);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.address']").val(row.praUser.address);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.zipCode']").val(row.praUser.zipCode);
		
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.userCenterId']").val(row.praUser.userCenterId);
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.orgId']").val(row.praUser.orgId);
		
		$("#saveOrUpdateTable input[name='praAccountDto.praAccount.praUser.postCategory']").val(row.praUser.postCategory);
	}
	
	$CommonUI.getDialog('#praAccountDialog').dialog({  
		title: '修改从业人员账户'  
    });  
	$('#praAccountDialog').dialog('open');
}

//根据从业人员账户id删除从业人员账户
function cancelPraAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question',0,function(){
		var row = $("#datagrid").datagrid('getSelected');
		$.post("praAccountCtrl!deletePraAccount.htm", {'praAccountDto.praAccount.accountId':row.accountId},function(){
			$("#datagrid").datagrid('reload');
			
			$("#showTable input").val("");
			$("#saveOrUpdateTable input").val("");
			$CommonUI.alert("删除成功","","","",null);
		});
	});
}

//查看从业人员账户详细信息
function showPralAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个查看');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$("#showTable input[name='praAccountDto.praAccount.accountName']").val(row.accountName);
		$("#showTable input[name='praAccountDto.praAccount.accountAlias']").val(row.accountAlias);
		
		var useState = "";
		if(row.useState=='1'){
			useState = "可用";
		}else if(row.useState=='2'){
			useState = "停用";
		}
		else if(row.useState=='3'){
			useState = "待审核";
		}
		$("#showTable input[name='praAccountDto.praAccount.useState']").val(useState);
        var onlineState = "";
		if(row.onlineState=='1'){
			onlineState = "在线";
		}else if(row.onlineState=='2'){
			onlineState = "离线";
		}else if(row.onlineState=='3'){
			onlineState = "未知";
		}
		$("#showTable input[name='praAccountDto.praAccount.onlineState']").val(onlineState);
		
		$("#showTable input[name='praAccountDto.praAccount.regTime']").val(new Date(row.regTime).format('yyyy-MM-dd'));
		$("#showTable input[name='praAccountDto.praAccount.logNum']").val(row.logNum);
		$("#showTable input[name='praAccountDto.praAccount.loginTime']").val(new Date(row.loginTime).format('yyyy-MM-dd'));
		$("#showTable input[name='praAccountDto.praAccount.updateTime']").val(new Date(row.updateTime).format('yyyy-MM-dd'));
		$("#showTable input[name='praAccountDto.praAccount.description']").val(row.description);
		
		$("#showTable input[name='praAccountDto.praAccount.praUser.realName']").val(row.praUser.realName);
		
		var sex = "";
		if(row.praUser.sex==1){
			sex = "男";
		}else if(row.praUser.sex==2){
			sex = "女";
		}else if(row.praUser.sex==3){
			sex = "双性";
		}else{
			sex = "未知";
		}
		$("#showTable input[name='praAccountDto.praAccount.praUser.sex']").val(sex);
		
		$("#showTable input[name='praAccountDto.praAccount.praUser.nation']").val(row.praUser.nation);
		$("#showTable input[name='praAccountDto.praAccount.praUser.province']").val(row.praUser.province);
		$("#showTable input[name='praAccountDto.praAccount.praUser.birthday']").val(row.praUser.birthday);
		$("#showTable input[name='praAccountDto.praAccount.praUser.idCard']").val(row.praUser.idCard);
		$("#showTable input[name='praAccountDto.praAccount.praUser.telphone']").val(row.praUser.telphone);
		$("#showTable input[name='praAccountDto.praAccount.praUser.email']").val(row.praUser.email);
		$("#showTable input[name='praAccountDto.praAccount.praUser.address']").val(row.praUser.address);
		$("#showTable input[name='praAccountDto.praAccount.praUser.zipCode']").val(row.praUser.zipCode);
	}
	
	$('#showPraAccountWindow').window('open');
}

//获取账户角色
function praAccountRole(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个账户');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	//根据系统代码和账户id获取账户该系统下的角色
	$CommonUI.getDataGrid('#praAccountRoleDatagrid').datagrid({  
		url:'praAccountCtrl!getPraAccountRole.htm?praAccountDto.systemType='+$CommonUI.getComboBox('#systemTypeSelect').combobox('getValue')+"&praAccountDto.accountId="+row.accountId,
		onLoadSuccess:function(){
			var rows = $CommonUI.getDataGrid('#praAccountRoleDatagrid').datagrid("getRows");
			for(var i=0;i<rows.length;i++){
				if(rows[i].checkboxFlag=="1"){
					$CommonUI.getDataGrid('#praAccountRoleDatagrid').datagrid("selectRow",i);
				}
			}
			
		}
    }); 
	
	$('#praAccountRoleWindow').window('open');
}

//查询账户权限
function praAccountFunc(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个账户');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	
	$CommonUI.getTree('#praAccountFuncTree').tree({
		url:'praAccountCtrl!getPraAccountFunc.htm?praAccountDto.accountId='+row.accountId
    });
	
	$('#praAccountFuncWindow').window('open');
}

//清空表单方法
function clear(){
	$("#saveOrUpdateTable input").val("");
	$("#showTable input").val("");
	
	$CommonUI.getDialog('#praAccountDialog').dialog({  
		title: '添加从业人员账户'  
    });
	
	$("#submitFuncBtn").show();
}




