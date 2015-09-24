
$(function(){
	$("#datagrid").treegrid({
		url:'funcCtrl!funcList.htm'
	});
	
	//选择上级权限
	$CommonUI.getComboTree('#parentName').combotree({
		onClick: function(node){
			var row = $("#datagrid").treegrid('getSelected');
			if(row){
				$("#saveOrUpdateForm input[name='funcDto.func.parentIdOld']").val(row.parentId);
			}
			$("#saveOrUpdateForm input[name='funcDto.func.parentId']").val(node.id);
		},
		onShowPanel: function(){
			$CommonUI.getComboTree('#parentName').combotree({  
				url:'funcCtrl!funcList.htm'
			}); 
		}
	});

	
	//提交权限信息
	$("#submitFuncBtn").click(function(){
		
		if($("#saveOrUpdateForm input[name='funcDto.func.funcId']").val()!=""&&$("#saveOrUpdateForm input[name='funcDto.func.funcId']").val()==$("#saveOrUpdateForm input[name='funcDto.func.parentId']").val()){
			$CommonUI.alert("上级权限不能设为本身","","","",null);
			return;
		}
		if($CommonUI.getComboTree('#parentName').combotree("getValue")==""){
			$("#saveOrUpdateForm input[name='funcDto.func.parentId']").val(0);
   	    }
		var isValid = $CommonUI.getForm('#saveOrUpdateForm').form('validate');
		if(!isValid){
			return isValid;
		}
		$("#submitFuncBtn").hide();
		$.post(
	             "funcCtrl!saveOrUpdateFunc.htm",
	             {
	            	 "funcDto.func.systemType":$("#saveOrUpdateForm input[name='funcDto.func.systemType']").val(),
	            	 "funcDto.func.funcName":$("#saveOrUpdateForm input[name='funcDto.func.funcName']").val(),
	            	 "funcDto.func.useState":$("#saveOrUpdateForm input[name='funcDto.func.useState']").val(),
	            	 "funcDto.func.imgUrl":$("#saveOrUpdateForm input[name='funcDto.func.imgUrl']").val(),
	            	 "funcDto.func.url":$("#saveOrUpdateForm input[name='funcDto.func.url']").val(),
	            	 "funcDto.func.secutiryUrl":$("#saveOrUpdateForm input[name='funcDto.func.secutiryUrl']").val(),
	            	 
	            	 "funcDto.func.funcId":$("#saveOrUpdateForm input[name='funcDto.func.funcId']").val(),
	            	 "funcDto.func.isLeaf":$("#saveOrUpdateForm input[name='funcDto.func.isLeaf']").val(),
	            	 "funcDto.func.parentId":$("#saveOrUpdateForm input[name='funcDto.func.parentId']").val(),
	            	 "funcDto.func.menuSeq":$("#saveOrUpdateForm input[name='funcDto.func.menuSeq']").val(),
	            	 "funcDto.func.backColor":$("#saveOrUpdateForm input[name='funcDto.func.backColor']").val(),
	            	 "funcDto.menuSeqOld":$("#saveOrUpdateTable input[name='funcDto.menuSeqOld']").val()
	             },
	             function(data){
	            	//alert(data)
	            	$CommonUI.alert(data.message,"","","",null);
	                if(data.success){
	                	$('#funcDialog').dialog('close');
	                	$("#datagrid").treegrid('reload');
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
		$("#saveOrUpdateTable textarea").val("");
	});
	
///////////////////////////////////////批量导入权限
	//批量导入权限确定
	$("#addFuncsSubmitFuncBtn").click(function(){
		$("#addFuncsSubmitFuncBtn").hide();
		$CommonUI.getForm('#addFuncsForm').form('submit', {
			url: "uploadFuncAction.htm",
			onSubmit: function(){
				var isValid = $(this).form('validate');
				return isValid;
			},
			success: function(){
				$CommonUI.alert("导入成功","","","",function(){
					$('#addFuncsDialog').dialog('close');
					$("#addFuncsSubmitFuncBtn").show();
					$("#datagrid").treegrid({
						url:'funcCtrl!getFuncListBySystemType.htm?funcDto.systemType='+$CommonUI.getComboBox('#systemTypeSelect').combobox('getValue')
					});
				});
			}
		});
	});
	
	//批量导入权限取消
	$("#addFuncsCancelFuncBtn").click(function(){
		$('#addFuncsDialog').dialog('close');
	});
	
});

//添加权限信息
function addFunc(){
   	 $CommonUI.getComboBox('#useState').combobox('setValues', ["1"]);
   	 $("#saveOrUpdateTable input[name='funcDto.func.isLeaf']").val("1");
   	 
   	 var row = $("#datagrid").treegrid('getSelected');
   	 if(row){
   		 $CommonUI.getComboTree('#parentName').combotree('setValue',row.funcName);
   		 $("#saveOrUpdateTable input[name='funcDto.func.parentId']").val(row.funcId);
   	 }

	 $('#funcDialog').dialog('open');
}

//修改权限信息
function editFunc(){
	if ($("#datagrid").treegrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	var row = $("#datagrid").treegrid('getSelected');
	if (row) {
		$CommonUI.getComboBox('#systemType').combobox('setValues', [row.systemType]);
		$("#saveOrUpdateTable input[name='funcDto.func.funcName']").val(row.funcName);
		$("#saveOrUpdateTable input[name='funcDto.func.version']").val(row.version);
		$CommonUI.getComboBox('#useState').combobox('setValues', [row.useState]);
		$("#saveOrUpdateTable input[name='funcDto.func.imgUrl']").val(row.imgUrl);
		$("#saveOrUpdateTable input[name='funcDto.func.url']").val(row.url);
		$("#saveOrUpdateTable input[name='funcDto.func.secutiryUrl']").val(row.secutiryUrl);
		
		var node =$('#datagrid').treegrid('getParent',row.funcId);
		if(node!=null){
			$CommonUI.getComboTree('#parentName').combotree('setValue',node.text);
		}else{
			$CommonUI.getComboTree('#parentName').combotree('setValue','无');
		}
		
		$("#saveOrUpdateTable input[name='funcDto.func.funcId']").val(row.funcId);
		$("#saveOrUpdateForm input[name='funcDto.func.isLeaf']").val(row.isLeaf);
		$("#saveOrUpdateForm input[name='funcDto.func.parentId']").val(row.parentId);
		$("#saveOrUpdateTable input[name='funcDto.func.menuSeq']").val(row.menuSeq);
		$("#saveOrUpdateTable input[name='funcDto.menuSeqOld']").val(row.menuSeq);
		$("#saveOrUpdateTable input[name='funcDto.func.backColor']").val(row.backColor);
	}
	
	$CommonUI.getDialog('#funcDialog').dialog({  
		title: '修改权限'  
    });  
	$('#funcDialog').dialog('open');
}

//根据权限id删除权限
function cancelFunc(){
	if ($("#datagrid").treegrid('getSelections').length != 1) {
		$CommonUI.alert('请选择需要删除的节点');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question',0,function(){
		var row = $("#datagrid").treegrid('getSelected');
		$.post(
				"funcCtrl!deleteFunc.htm", 
				{'funcDto.func.funcId':row.funcId},
				function(){
					$("#datagrid").treegrid('reload');
					
					$("#showTable input").val("");
            		$("#saveOrUpdateTable input").val("");
            		$("#saveOrUpdateTable textarea").val("");
					$CommonUI.alert("删除成功","","","",null);
		        }
	    );
	});
}

//查看详细权限信息
function showFunc(){
	if ($("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个查看');
		return;
	}
	var row = $("#datagrid").datagrid('getSelected');
	if (row) {
		$.post(
		   'funcCtrl!getSystemVersion.htm',
		   {
			   'funcDto.columnName':'systemType',
			   'funcDto.columnValue':row.systemType
		   },
		   function(data){
			   $("#showTable input[name='funcDto.func.systemType']").val(data[0].systemName);
		   },
		   "json"
		);
		$("#showTable input[name='funcDto.func.funcName']").val(row.funcName);
		$("#showTable input[name='funcDto.func.menuSeq']").val(row.menuSeq);
		$("#showTable input[name='funcDto.func.version']").val(row.version);
		$("#showTable input[name='funcDto.func.useState']").val(row.useState==1?"启用":"禁用");
		$("#showTable input[name='funcDto.func.url']").val(row.url);
		$("#showTable input[name='funcDto.func.secutiryUrl']").val(row.secutiryUrl);
	}
	
	$('#showFuncWindow').window('open');
}

//批量导入权限
function addFuncs(){
	$('#addFuncsDialog').dialog('open');
}

//清空表单方法
function clear(){
	$("#saveOrUpdateTable input").val("");
	$("#saveOrUpdateTable textarea").val("");
	
	$("#showTable input").val("");
	
	$("#addFuncsForm input").val("");
	
	$CommonUI.getDialog('#funcDialog').dialog({  
		title: '添加权限'  
    });
	
	$("#submitFuncBtn").show();
}








