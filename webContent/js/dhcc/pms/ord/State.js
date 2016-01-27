// zxx 2014-04-19
$(function (){

	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/ord/stateCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    pageList : [20, 40, 60],
	    pageSize : 20,
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},  
	        {field:'stateCode',title:'代码',width:100},  
	        {field:'stateName',title:'名称',width:100},
	        {field:'stateSeq',title:'顺序',width:100}
	    ]]	 
	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#detail input[name="dto.state.stateId"]').val();	
		if(Id){
			$CommonUI.alert("修改成功");
		}else{
			$CommonUI.alert("增加成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("faile");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		postReq($WEB_ROOT_PATH+'/ord/stateCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
	});
	
	
	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#selectWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#selectWin').dialog('close');
	});
	
	
	$('#title').css({width:500,height:60});
	
	$('#title1').css({width:500,height:60});
});

//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加订单状态");
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$CommonUI.getForm('#detail').form('clear');
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#detail').form('clear');
	
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.stateId;
	var url = $WEB_ROOT_PATH+'/ord/stateCtrl.htm?BLHMI=findById&dto.state.stateId='+Id;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改订单状态");
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#detailWin',data);
	});
}

// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/ord/stateCtrl!delete.htm", {'dto.state.stateId':row.stateId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

//条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#selectWin").dialog("center");
	$CommonUI.getDialog("#selectWin").dialog("open");
	$("#title1").val('');
}

// 条件查询取消事件
function selectCanBtClick() {
	$CommonUI.getWindow("#selectWin").dialog("close");
}
