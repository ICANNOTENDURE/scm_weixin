$(function (){	
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/manf/hopManfCtrl!list.htm',	   
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'hopManfId',title:'表ID',width:100,hidden:true},
	        {field:'manfCode',title:'厂商代码',width:100},  
	        {field:'manfName',title:'厂商描述',width:100},  
	        {field:'manfHisid',title:'his厂商ID',width:100,hidden:true},  
	    ]]	 
	});	
	
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=null;
		demoId=$('#manfdetail input[name="dto.hopManf.hopManfId"]').val();			
		if(demoId){
			$CommonUI.alert("更新信息成功");
		}else{
			$CommonUI.alert("新增信息成功");
		}	
		$("#datagrid").datagrid('reload');
		$("#manfDetailWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("执行失败");	
	}
	
	// hopManf表新增和修改
	$("#saveOrUpdateManfBtn").on('click', function() {
		$("#saveOrUpdateManfBtn").hide();
		postReq($WEB_ROOT_PATH+'/manf/hopManfCtrl!save.htm',"#manfdetail",succ,err,{skipHidden:false});		
	});
	
	
	// 点击查询的提交按钮,查询hopManf数据信息
	$("#searchManfBtn").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchManfWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchManfWin').dialog('close');
	});
		 
	
	$('#title').css({width:500,height:60});
	
	$('#title1').css({width:500,height:60});
});

//增加一条记录
function addClick() {	
	$CommonUI.getDialog("#manfDetailWin").dialog("setTitle","新增厂商信息");
	$CommonUI.getDialog("#manfDetailWin").dialog("center");
	$CommonUI.getDialog("#manfDetailWin").dialog("open");
	$CommonUI.getForm('#manfdetail').form('clear');
	$("#saveOrUpdateManfBtn").show();
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$("#saveOrUpdateManfBtn").show();
	$CommonUI.getForm('#manfdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.hopManfId;
	$("#manfDetailWin").dialog("open");
	$CommonUI.getDialog("#manfDetailWin").dialog("setTitle","修改厂商信息数据");
	var url = $WEB_ROOT_PATH+'/manf/hopManfCtrl.htm?BLHMI=findById&dto.hopManf.hopManfId='+Id;
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#manfDetailWin',data);
	});
	
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){		
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');		
		$.post($WEB_ROOT_PATH+"/manf/hopManfCtrl!delete.htm", {'dto.hopManf.hopManfId':row.hopManfId},function(){
				$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		});			
	});
}

//条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#searchManfWin").dialog("center");
	$CommonUI.getDialog("#searchManfWin").dialog("open");
}

//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#manfDetailWin").dialog("close");	
}