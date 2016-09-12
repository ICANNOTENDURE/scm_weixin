$(function(){
	$('#venPar').combobox({
    	url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm",
    	panelHeight:"auto",
        valueField:'vendorId',  
        textField:'name',
        mode: 'remote',
    });
 	$("#hopPar").combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName',
			onSelect:function(rec){
				$("#locPar").combobox({
					url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm?dto.hopCtloc.hospid='+rec.hospitalId,
					valueField:'hopCtlocId',							
					textField:'name',
					mode: 'remote'
				});
				
			}
	});
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
	

	
    //条件查询普通用户帐户信息
	$("#searchNormalAccountBtn").click(function(){
		$CommonUI.getDataGrid('#datagrid').datagrid('load',{
			"normalAccountDto.columnName":$("#normalAccountColumnName").val(),
			"normalAccountDto.hopId":$CommonUI.getComboBox('#hopPar').combobox('getValue'),
			"normalAccountDto.locId":$CommonUI.getComboBox('#locPar').combobox('getValue'),
			"normalAccountDto.venId":$CommonUI.getComboBox('#venPar').combobox('getValue')
		});
	});
	
	//提交表单
	$("#submitFuncBtn").click(function(){
		var isValid = $CommonUI.getForm('#saveOrUpdateForm').form('validate');
		if(!isValid){
			return isValid;
		}
		//alert($("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.realName']").val());
		$("#submitFuncBtn").hide();
		$.post(
				"normalAccountCtrl!saveOrUpdateNormalAccount.htm",
	             {
					"normalAccountDto.normalAccount.accountAlias":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.accountAlias']").val(),
					"normalAccountDto.normalAccount.useState":$CommonUI.getComboBox('#useState').combobox('getValue'),
					"normalAccountDto.normalAccount.normalUser.realName":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.realName']").val(),
					"normalAccountDto.normalAccount.normalUser.sex":$CommonUI.getComboBox('#normalUserSex').combobox('getValue'),
					"normalAccountDto.normalAccount.normalUser.nation":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.nation']").val(),
					"normalAccountDto.normalAccount.normalUser.province":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.province']").val(),
					"normalAccountDto.normalAccount.normalUser.birthday":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.birthday']").val(),
					"normalAccountDto.normalAccount.normalUser.idCard":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.idCard']").val(),
					"normalAccountDto.normalAccount.normalUser.telephone":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.telephone']").val(),
					"normalAccountDto.normalAccount.normalUser.address":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.address']").val(),
					"normalAccountDto.normalAccount.normalUser.email":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.email']").val(),
					"normalAccountDto.normalAccount.normalUser.zipCode":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.zipCode']").val(),
					"normalAccountDto.normalAccount.normalUser.healthNumber":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.healthNumber']").val(),
					"normalAccountDto.normalAccount.normalUser.ssNumber":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.ssNumber']").val(),
					
					"normalAccountDto.normalAccount.normalUser.type":$CommonUI.getComboBox('#type').combobox('getValue'),
					"normalAccountDto.normalAccount.normalUser.locId":$CommonUI.getComboBox('#loc').combobox('getValue'),
					"normalAccountDto.normalAccount.normalUser.vendorId":$CommonUI.getComboBox('#ven').combobox('getValue'),
					
					"normalAccountDto.normalAccount.description":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.description']").val(),
					
					"normalAccountDto.normalAccount.sessionKey":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.sessionKey']").val(),
					"normalAccountDto.normalAccount.password":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.password']").val(),
					"normalAccountDto.normalAccount.accountId":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.accountId']").val(),
					"normalAccountDto.normalAccount.normalUser.userId":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.userId']").val(),
					"normalAccountDto.normalAccount.normalUser.userCenterId":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.normalUser.userCenterId']").val(),
					"normalAccountDto.normalAccount.onlineState":$CommonUI.getComboBox('#onlineState').combobox('getValue'),
					"normalAccountDto.normalAccount.updateTime":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.updateTime']").val(),
					"normalAccountDto.normalAccount.loginTime":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.loginTime']").val(),
					"normalAccountDto.normalAccount.regTime":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.regTime']").val(),
					"normalAccountDto.normalAccount.logNum":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.logNum']").val(),
					"normalAccountDto.normalAccount.accountName":$("#saveOrUpdateForm input[name='normalAccountDto.normalAccount.accountName']").val(),
					"normalAccountDto.accountAliasOld":$("#saveOrUpdateForm input[name='normalAccountDto.accountAliasOld']").val()
	             },
	             function(data){
	            	$CommonUI.alert(data.message,"","","",null);
	                if(data.success){
	                	$('#normalAccountDialog').dialog('close');
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
 
	//根据查询条件查询角色信息
	$("#searchNormalAccountRole").click(function(){
		$CommonUI.getDataGrid('#normalAccountRoleDatagrid').datagrid('load',{
			"normalAccountDto.columnName":$("#roleColumnName").val(),
			"normalAccountDto.columnValue":$("#roleColumnValue").val()
		});
	});
	//保存账户角色信息
	$("#saveNormalAccountRole").click(function(){
		var row = $("#datagrid").datagrid('getSelected');
		var accountId = row.accountid;
		
		var roleId = "";
		var rows = $("#normalAccountRoleDatagrid").datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			roleId = roleId+rows[i].roleId+",";
		}
		
		$.post(
				'normalAccountCtrl!saveNormalAccountRole.htm',
				{
					"normalAccountDto.accountId":accountId,
					"normalAccountDto.roleId":roleId
				},
				function(data){
					if(data.message){
						$CommonUI.getDataGrid('#normalAccountRoleDatagrid').datagrid({  
				    		url:'normalAccountCtrl!getNormalAccountRole.htm?normalAccountDto.accountId='+$("#datagrid").datagrid('getSelected').accountid   
				        });  
					}
					$CommonUI.alert(data.message);
				},
				"json"
		);
	});
	
	$('#type').combobox({
			onSelect:function(rec){
				if((rec.value==1)||(rec.value==3)){
					$("#ven").combobox('clear');
					$("#hop").combobox({
						url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
						valueField:'hospitalId',							
						textField:'hospitalName',
						onSelect:function(rec){
							$("#loc").combobox({
								url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm?dto.hopCtloc.hospid='+rec.hospitalId,
								valueField:'hopCtlocId',							
								textField:'name',
								mode: 'remote'
							});
							
						}
					});
				}
				if(rec.value==2){
					$("#hop").combobox('clear');
					$("#ven").combobox({
						url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm",
				    	panelHeight:"auto",
				        valueField:'vendorId',  
				        textField:'name',
				        mode: 'remote',
					});
				}
			}	
	});
	
});

//添加普通用户账户信息
function addNormalAccount(){
	$('#normalAccountDialog').dialog('open');
}

//修改普通用户账户
function editNormalAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$.ajaxSettings.async = false;
	var row = $("#datagrid").datagrid('getSelected');
	var Id = row.accountid;
	var url = $WEB_ROOT_PATH+ '/normalAccount/normalAccountCtrl!findbyId.htm?normalAccountDto.normalAccount.accountId=' + Id;
	$("#normalAccountDialog").dialog("open");
	$CommonUI.getDialog("#normalAccountDialog").dialog("setTitle", "修改");
	$.getJSON(url, function(data) {
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.accountName']").val(data.normalAccount.accountName);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.accountAlias']").val(data.normalAccount.accountAlias);
		$("#saveOrUpdateTable input[name='normalAccountDto.accountAliasOld']").val(data.normalAccount.accountAlias);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.realName']").val(data.normalAccount.normalUser.realName);
		
		$CommonUI.getComboBox('#useState').combobox('setValues', [data.normalAccount.useState]);
		$CommonUI.getComboBox('#normalUserSex').combobox('setValues', [data.normalAccount.normalUser.sex]);
		$CommonUI.getDateBox('#normalUserBirthday').datebox('setValue', new Date(data.normalAccount.normalUser.birthday).format("yyyy-MM-dd"));
		
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.nation']").val(data.normalAccount.normalUser.nation);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.idCard']").val(data.normalAccount.normalUser.idCard);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.telephone']").val(data.normalAccount.normalUser.telephone);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.address']").val(data.normalAccount.normalUser.address);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.email']").val(data.normalAccount.normalUser.email);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.zipCode']").val(data.normalAccount.normalUser.zipCode);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.healthNumber']").val(data.normalAccount.normalUser.healthNumber);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.ssNumber']").val(data.normalAccount.normalUser.ssNumber);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.province']").val(data.normalAccount.normalUser.province);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.description']").val(data.normalAccount.description);
		
		
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.sessionKey']").val(data.normalAccount.sessionKey);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.password']").val(data.normalAccount.password);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.accountId']").val(data.normalAccount.accountId);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.userId']").val(data.normalAccount.normalUser.userId);
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.normalUser.userCenterId']").val(data.normalAccount.normalUser.userCenterId);
		$CommonUI.getComboBox('#onlineState').combobox('setValues', [data.normalAccount.onlineState]);
		
		
		$CommonUI.getComboBox('#type').combobox('setValues', [data.normalAccount.normalUser.type]);
		vendorId=data.normalAccount.normalUser.vendorId;
		locId=data.normalAccount.normalUser.locId;
		if(locId!=null){
			$("#loc").combobox({
				url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm',
				valueField:'hopCtlocId',							
				textField:'name'
			});
			$CommonUI.getComboBox('#loc').combobox('setValues', [locId]);
			$("#hop").combobox({
				url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
				valueField:'hospitalId',							
				textField:'hospitalName',
				onSelect:function(rec){
					$("#loc").combobox({
						url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm?dto.hopCtloc.hospid='+rec.hospitalId,
						valueField:'hopCtlocId',							
						textField:'name',
						mode: 'remote'
					});	
				}
			});
			
			
			$.post(
				$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!findHopId.htm',
				{
					"dto.hopCtloc.hopCtlocId":[locId],
				},
				function(data){
					$CommonUI.getComboBox('#hop').combobox('setValue', data.dto.hopCtloc.hospid);
				},
				"json"
			);
			
			
		}
		if(vendorId!=null){
			$("#ven").combobox({
				url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm", //+[row.normalUser.vendorId],
		    	panelHeight:"auto",
		        valueField:'vendorId',  
		        textField:'name',
		        mode: 'remote'
			});
			$.post(
				 $WEB_ROOT_PATH+"/ven/vendorCtrl!findById.htm",	
				 {
						'dto.vendor.vendorId':[vendorId],
				 },
				 function(data){
					 	$CommonUI.getComboGrid('#ven').combobox("loadData",  [{"name":data,"vendorId":vendorId}]);
						$CommonUI.getComboGrid('#ven').combobox('setValue', vendorId);
				 }
			);
			$CommonUI.getComboGrid('#ven').combobox('setValue', vendorId);
		}
		$CommonUI.getDateBox('#updateTime').datebox('setValue', new Date(data.normalAccount.updateTime).format("yyyy-MM-dd"));
		$CommonUI.getDateBox('#loginTime').datebox('setValue', new Date(data.normalAccount.loginTime).format("yyyy-MM-dd"));
		$CommonUI.getDateBox('#regTime').datebox('setValue', new Date(data.normalAccount.regTime).format("yyyy-MM-dd"));
		$("#saveOrUpdateTable input[name='normalAccountDto.normalAccount.logNum']").val(data.normalAccount.logNum);
	});

}

//根据普通用户账户id删除普通用户账户
function cancelNormalAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question',0,function(){
		var row = $("#datagrid").datagrid('getSelected');
		$.post("normalAccountCtrl!deleteNormalAccount.htm", {'normalAccountDto.normalAccount.accountId':row.accountid},function(){
			$CommonUI.alert("删除成功","","","",null);
			$("#datagrid").datagrid('reload');
		});
	});
}

//查看普通账户详细信息
function showNormalAccount(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个查看');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	if(row){
		$("#showTable input[name='normalAccountDto.normalAccount.accountName']").val(row.accountName);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.realName']").val(row.normalUser.realName);
		
		var useState = "";
		if(row.useState=='1'){
			useState = "启用";
		}else if(row.useState=='2'){
			useState = "禁用";
		}
		else if(row.useState=='3'){
			useState = "待审核";
		}
		$("#showTable input[name='normalAccountDto.normalAccount.useState']").val(useState);
		var onlineState = "";
		if(row.onlineState=='1'){
			onlineState = "在线";
		}else if(row.onlineState=='2'){
			onlineState = "离线";
		}else if(row.onlineState=='3'){
			onlineState = "未知";
		}
		$("#showTable input[name='normalAccountDto.normalAccount.onlineState']").val(onlineState);
		
		$("#showTable input[name='normalAccountDto.normalAccount.regTime']").val(row.regTime);
		$("#showTable input[name='normalAccountDto.normalAccount.logNum']").val(row.logNum);
		$("#showTable input[name='normalAccountDto.normalAccount.loginTime']").val(row.loginTime);
		$("#showTable input[name='normalAccountDto.normalAccount.updateTime']").val(row.updateTime);
		
		var sex = "";
		if(row.normalUser.sex==1){
			sex = "男";
		}else if(row.normalUser.sex==2){
			sex = "女";
		}else if(row.normalUser.sex==3){
			sex = "双性";
		}else{
			sex = "未知";
		}
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.sex']").val(sex);
		
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.nation']").val(row.normalUser.nation);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.birthday']").val(row.normalUser.birthday);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.idCard']").val(row.normalUser.idCard);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.telephone']").val(row.normalUser.telephone);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.address']").val(row.normalUser.address);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.email']").val(row.normalUser.email);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.zipCode']").val(row.normalUser.zipCode);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.healthNumber']").val(row.normalUser.healthNumber);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.ssNumber']").val(row.normalUser.ssNumber);
		$("#showTable input[name='normalAccountDto.normalAccount.normalUser.province']").val(row.normalUser.province);
		$("#showTable input[name='normalAccountDto.normalAccount.description']").val(row.description);
		
	}
	
	$('#showNormalAccountWindow').window('open');
}

//获取账户角色
function normalAccountRole(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个账户');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	//根据系统代码和账户id获取账户该系统下的角色
	$CommonUI.getDataGrid('#normalAccountRoleDatagrid').datagrid({  
		url:'normalAccountCtrl!getNormalAccountRole.htm?normalAccountDto.accountId='+row.accountid,   
		onLoadSuccess:function(){
			var rows = $CommonUI.getDataGrid('#normalAccountRoleDatagrid').datagrid("getRows");
			for(var i=0;i<rows.length;i++){
				if(rows[i].checkboxFlag=="1"){
					$CommonUI.getDataGrid('#normalAccountRoleDatagrid').datagrid("selectRow",i);
				}
			}
			
		}
    }); 
	
	$('#normalAccountRoleWindow').window('open');
}

//查询账户权限
function normalAccountFunc(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个账户');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	
	$CommonUI.getTree('#normalAccountFuncTree').tree({
		url:'normalAccountCtrl!getNormalAccountFunc.htm?normalAccountDto.accountId='+row.accountid
    });
	
	$('#normalAccountFuncWindow').window('open');
}

//清空表单方法
function clear(){
	$("#saveOrUpdateTable input").val("");
	$("#showTable input").val("");
	
	$CommonUI.getDialog('#normalAccountDialog').dialog({  
		title: '添加普通用户账户'  
    });  
	
	$("#submitFuncBtn").show();
}


var first=0;
var venFlag;



