$(function () {
	//查询按钮
	$("#searchCertBtn").on('click', function() {
		$CommonUI.getDataGrid('#datagrid').datagrid('load',{
			"certDto.columnName":$("#certColumnName").val(),
			"certDto.columnValue":$("#certColumnValue").val()
		});
	});
	
	// 提交表单
	$("#saveOrUpdateSubmitBtn").on('click', function() {
		$CommonUI.getForm("#saveOrUpdateForm").form("submit", {
			url:'certCtrl!saveOrUpdate.htm',
			onSubmit: function(){
				var isValid = $(this).form('validate');
				if(isValid){
					$("#submitFuncBtn").hide();
				}
				return isValid;
			},
			success : function() {
				$("#saveOrUpdateWindow").dialog('close');
				var msg = '';
				var id = $("#saveOrUpdateTable input[name='certDto.cert.certId']").val();
				if (id == '') {
					msg = '保存成功!';
				} else {
					msg = '更新成功!';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					$("#datagrid").datagrid('reload');
				});
			}
		});
	});
	// 关闭表单
	$("#saveOrUpdateCancelBtn").on('click', function() {
		$("#saveOrUpdateWindow").dialog('close');
	});
	
	// 条件查询弹窗提交按钮
	$("#querySubmitBtn").on('click', function() {
		var json = $CommonUI.loopBlock('#queryForm');
		$("#datagrid").datagrid('load', json);
		
		$CommonUI.getDialog("#queryWin").dialog('close');
	});
	// 条件查询弹窗放弃按钮
	$("#queryCancelBtn").on('click', function() {
		$CommonUI.getDialog('#queryWindow').dialog('close');
	});
	
});

// 颁发证书
function certAdd() {
	$("#saveOrUpdateWindow").dialog({
		title:"颁发证书"
	});
	$CommonUI.getDialog("#saveOrUpdateWindow").dialog("open");
}

// 更新证书
function certEdit() {
	$(".hiddenRow").hide();
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$("#saveOrUpdateWindow").dialog({
		title:"更新证书状态"
	});
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$CommonUI.getDateBox('#beginTime').datebox('setValue', row.beginTime);
		$CommonUI.getDateBox('#endTime').datebox('setValue', row.endTime);
		$("#saveOrUpdateWindow input[name='certDto.cert.country']").val(row.country);
		$("#saveOrUpdateWindow input[name='certDto.cert.province']").val(row.province);
		$("#saveOrUpdateWindow input[name='certDto.cert.locality']").val(row.locality);
		$("#saveOrUpdateWindow input[name='certDto.cert.organization']").val(row.organization);
		$("#saveOrUpdateWindow input[name='certDto.cert.section']").val(row.section);
		$("#saveOrUpdateWindow input[name='certDto.cert.commonName']").val(row.commonName);
		$("#saveOrUpdateWindow input[name='certDto.cert.email']").val(row.email);
		$CommonUI.getComboBox('#certState').combobox('setValues', [row.certState]);
		
		$("#saveOrUpdateWindow input[name='certDto.cert.certId']").val(row.certId);
		$("#saveOrUpdateWindow input[name='certDto.cert.certSerialNum']").val(row.certSerialNum);
		$("#saveOrUpdateWindow input[name='certDto.cert.gatewayId']").val(row.gatewayId);
		$("#saveOrUpdateWindow input[name='certDto.cert.createTime']").val(row.createTime);
		$("#saveOrUpdateWindow input[name='certDto.cert.certInfo']").val(row.certInfo);
		$("#saveOrUpdateWindow input[name='certDto.cert.certKeyInfo']").val(row.certKeyInfo);
		$("#saveOrUpdateWindow input[name='certDto.cert.subjectDn']").val(row.subjectDn);
		$("#saveOrUpdateWindow input[name='certDto.cert.issuerDn']").val(row.issuerDn);
	}
	$CommonUI.getDialog("#saveOrUpdateWindow").dialog("open");
}

// 删除证书
function certDelete() {
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	if(row.certSerialNum=="013948738317"){
		$CommonUI.alert('根证书无法删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question',0,function(){
		$.post("certCtrl!delCert.htm", {'certDto.cert.certId' : row.certId}, function() {
			$("#datagrid").datagrid('reload');
		});
	});
}

//打开条件查询弹窗
function certSearch() {
	$("#queryWindow").dialog({
		title:"查找证书"
	});
	$CommonUI.getDialog("#queryWindow").dialog("open");
}

//关闭窗口时清空两张表单
function clear(){
	$("#saveOrUpdateForm input").val("");
	$(".hiddenRow").show();
	$("#queryForm input").val("");
	
	$("#submitFuncBtn").show();
}
//日期格式化
function timeFormat(value,row,index) {
	return new Date(value).format('yyyy-MM-dd HH:mm:ss');
}
//证书状态值域转化
function cenvertCert(value,row,index){
	if (value==1){
		return '未使用';
	} else if(value==2){
		return '正常使用';
	}else if(value==3){
		return '吊销';
	}else if(value==4){
		return '到期';
	}
}
//证书下载
function certInfoFormater(value,row,index){
	return "<a href='downLoadCertCtrl.htm?certSerialNum="+row.certSerialNum+"'>下载证书</a>";
}
//密钥下载
function keyInfoFowformater(value,row,index){
	if(row.certSerialNum=="013948738317"){
		return "<a href='downLoadCertKeyCtrl.htm?certSerialNum="+row.certSerialNum+"'>下载密钥</a>";
	}else{
		if(row.certKeyInfo==null){
			return "无";
		}else{
			return "<a href='downLoadCertKeyCtrl.htm?certSerialNum="+row.certSerialNum+"'>下载密钥</a>-"
			+"<a href='certCtrl!deleteCertKey.htm?certDto.cert.certSerialNum="+row.certSerialNum+"'>删除密钥</a>";
		}
	}
}









