$(function (){	
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!list.htm',	   
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'hospitalId',title:'表ID',width:100},
	        {field:'hospitalCode',title:'医院代码',width:100},  
	        {field:'hospitalName',title:'医院描述',width:100},  
	        {field:'hospitalHisdr',title:'his中的医院ID',width:100},  
	    ]]	 
	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=null;		
		demoId=$('#hospdetail input[name="dto.hospital.hospitalId"]').val();			
		if(demoId){
			$CommonUI.alert("更新信息成功");
		}else{
			$CommonUI.alert("新增信息成功");
		}
		$("#datagrid").datagrid('reload');
		$("#hospInfoWin").dialog('close');
		
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("执行失败");	
	}
	
	// hospital表新增和修改
	$("#saveOrUpdateHospBtn").on('click', function() {
		$("#saveOrUpdateHospBtn").hide();
		postReq($WEB_ROOT_PATH+'/hop/hospitalCtrl!save.htm',"#hospdetail",succ,err,{skipHidden:false});
	});
	
	
	
	// 点击查询的提交按钮,查询hopCtloc数据信息
	$("#searchHospInfoBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchHospWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchHospWin').dialog('close');
	});
				
	$('#title').css({width:500,height:60});
	
	$('#title1').css({width:500,height:60});
});


//增加一条记录
function addClick() {	
	$CommonUI.getDialog("#hospInfoWin").dialog("setTitle","新增医院信息");
	$CommonUI.getDialog("#hospInfoWin").dialog("center");
	$CommonUI.getDialog("#hospInfoWin").dialog("open");
	$CommonUI.getForm('#hospdetail').form('clear');
	$("#saveOrUpdateHospBtn").show();	
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#ctlocdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.hospitalId;
	$("#hospInfoWin").dialog("open");
	$CommonUI.getDialog("#hospInfoWin").dialog("setTitle","修改医院信息数据");
	var url = $WEB_ROOT_PATH+'/hop/hospitalCtrl.htm?BLHMI=findById&dto.hospital.hospitalId='+Id;
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#hospInfoWin',data);
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
		$.post($WEB_ROOT_PATH+"/hop/hospitalCtrl!delete.htm", {'dto.hospital.hospitalId':row.hospitalId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		});		
		
	});
}

//条件查询提交事件
function selectClick() {	
	$CommonUI.getDialog("#searchHospWin").dialog("center");
	$CommonUI.getDialog("#searchHospWin").dialog("open");
	$("#title1").val('');
		
}

//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#hospInfoWin").dialog('close');
}