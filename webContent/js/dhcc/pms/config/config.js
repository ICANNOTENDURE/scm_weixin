$(function (){
	//gird数据加载
	//alert("11")
	$CommonUI.getDataGrid('#hibdatagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/setup/hibPropertiesCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},  
	        {field:'key',title:'属性名',width:100},  
	        {field:'value',title:'属性值',width:100} 
	    ]],
	    queryParams: {
	    	'dto.actionName': 'hibPropertiesCtrl'
		}
	});
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/setup/propertiesCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},  
	        {field:'key',title:'属性名',width:100},  
	        {field:'value',title:'属性值',width:100} 
	    ]],
	    queryParams: {
	    	'dto.actionName': 'propertiesCtrl'
		}
	});

	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		var tab = $('#tt').tabs('getSelected');
		var index = $('#tt').tabs('getTabIndex',tab);
		actionName="propertiesCtrl";
		gridid="#datagrid";
	    if(index==1){
	    	gridid="#hibdatagrid";
	    	actionName="hibPropertiesCtrl";
	    }
		 $.post(
				 $WEB_ROOT_PATH+'/setup/propertiesCtrl!save.htm',
				 {
					 "dto.actionName":actionName,
					 "dto.confItem.key":$("#key").val(),
		           	 "dto.confItem.value":$("#value").val(), 
				 },
				 function(data){
					 $CommonUI.alert("操作成功");
					 $(gridid).datagrid('reload');
					 $("#detailWin").dialog('close');
		         },
				 'json'
			 );
	});
	
	

	
	


});

//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加");
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$CommonUI.getForm('#detail').form('clear');
}

//編輯一行记录
function editRow() {
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex',tab);
    gridid="#datagrid";
    actionName="propertiesCtrl";
    if(index==1){
    	gridid="#hibdatagrid";
    	actionName="hibPropertiesCtrl";
    }
    
	
	if ($CommonUI.getDataGrid(gridid).datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#detail').form('clear');
	
	var row =$(gridid).datagrid('getSelected');
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改");
	$("#key").val(row.key);
	$("#value").val(row.value);
}

// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}
function reStart() {
	$.post($WEB_ROOT_PATH+"/setup/propertiesCtrl!refressh.htm",function(){
		
	} );
}
//刪除記錄
function delRow() {
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex',tab);
    gridid="#datagrid";
    actionName="propertiesCtrl";
    if(index==1){
    	gridid="#hibdatagrid";
    	actionName="hibPropertiesCtrl";
    }
	if ($CommonUI.getDataGrid(gridid).datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid(gridid).datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/setup/propertiesCtrl!delete.htm", {'dto.confItem.key':row.key,'dto.actionName':actionName},function(){
			$CommonUI.getDataGrid(gridid).datagrid('reload');
		} );
	});
}

