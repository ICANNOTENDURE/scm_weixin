$(function (){
	//gird数据加载
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/logConfig/logConfigCtrl!list.htm',
	    method:'get',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},  
	        {field:'title',title:'业务操作名称',width:100},  
	        {field:'method',title:'接口设置',width:100}, 
	        {field:'args',title:'参数设置',width:100}
	    ]] 
	});
	
	// 提交
	$("#submitBtn").on('click', function() {
		$CommonUI.getDialog("#detailWin").dialog('close');
		var url = $WEB_ROOT_PATH+'/logConfig/logConfigCtrl!save.htm';
		postReq(url,'#detail',"","",{"skipHidden":false});
		$("#datagrid").datagrid('reload');
	});
	
	
	// 条件查询
	$("#selectBt").on('click', function() {
		var title=$("#title1").val();
		var method=$("#method1").val();
		var args=$("#args1").val();
		$CommonUI.getDataGrid("#datagrid").datagrid('load', {"dto.logConfigure.title": title,"dto.logConfigure.method": method,"dto.logConfigure.args": args});
		$CommonUI.getDialog("#selectWin").dialog('close');
	});
	
	$('#title').css({width:500,height:60});
	$('#method').css({width:500,height:60});
	$('#args').css({width:500,height:200});
	
	$('#title1').css({width:500,height:60});
	$('#method1').css({width:500,height:60});
	$('#args1').css({width:500,height:200});
});

// 增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$("#title").val('');
	$("#method").val('');
	$("#args").val('');
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question',0,function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/logConfig/logConfigCtrl!delete.htm", {'dto.logConfigure.id':row.id},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

// 編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}

	var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
	//row.id获得某个参数
	if (row) {
		$CommonUI.getWindow("#detailWin").dialog("open");
		$("#id").val(row.id);
		$("#title").val(row.title);
		$("#method").val(row.method);
		$("#args").val(row.args);
	}
}

// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}

// 条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#selectWin").dialog("center");
	$CommonUI.getDialog("#selectWin").dialog("open");
	$("#title1").val('');
	$("#method1").val('');
	$("#args1").val('');
}

// 条件查询取消事件
function selectCanBtClick() {
	$CommonUI.getWindow("#selectWin").dialog("close");
}