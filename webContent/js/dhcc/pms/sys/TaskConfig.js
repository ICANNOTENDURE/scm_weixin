$(function (){
	//gird数据加载
	//alert("11")
//	$CommonUI.getDataGrid('#datagrid').datagrid({  
//	    url:$WEB_ROOT_PATH+'/sys/TaskConfigCtrl!list.htm',
//	    iconCls:'icon-edit',//图标
//	    method:'post',
//	    fit:true,	 
//	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=$('#detail input[name="dto.taskConfig.taskId"]').val();	
		if(demoId){
			$CommonUI.alert("更新任务成功");
		}else{
			$CommonUI.alert("新增任务成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("更新任务失败");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		postReq($WEB_ROOT_PATH+'/sys/TaskConfigCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
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
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加任务");
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
	var taskConfigId=row.taskId;
	var url = $WEB_ROOT_PATH+'/sys/TaskConfigCtrl.htm?BLHMI=findById&dto.taskConfig.taskId='+taskConfigId;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改任务");
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
		$.post($WEB_ROOT_PATH+"/sys/TaskConfigCtrl!delete.htm", {'dto.taskConfig.taskId':row.taskId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}



function getTimeType(value,row,index){
	if(row.timePeriodType=='1'){
		return "秒";
	}
	if(row.timePeriodType=='2'){
		return "分钟";
	}
	if(row.timePeriodType=='3'){
		return "小时";
	}
	if(row.timePeriodType=='4'){
		return "天";
	}
}

function getStatus(value,row,index){
	if(row.taskStatus=='1'){
		return "启动";
	}
	if(row.taskStatus=='2'){
		return "暂停";
	}
}

function StartTask(){
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个');
		return;
	}
	$CommonUI.confirm('确定启动任务吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/sys/TaskConfigCtrl!resumeJob.htm", {'dto.taskConfig.taskId':row.taskId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

function StopTask(){
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个任务');
		return;
	}
	$CommonUI.confirm('确定暂停任务吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/sys/TaskConfigCtrl!pauseJob.htm", {'dto.taskConfig.taskId':row.taskId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}