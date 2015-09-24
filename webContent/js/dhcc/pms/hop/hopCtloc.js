$(function (){		
	//获取下拉医院的所有下拉框
	var hospCombox=[$CommonUI.getComboBox('#dicHospid'),$CommonUI.getComboBox('#ctlocHospid')];
	for(var i=0;i<hospCombox.length;i++){
		hospCombox[i].combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName'
		});
	}
	/*
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!list.htm',	   
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'hopCtlocId',title:'科室ID',width:100},
	        {field:'code',title:'科室代码',width:100},  
	        {field:'name',title:'科室描述',width:100},  
	        {field:'hospid',title:'医院ID',width:100}, 
	        {field:'hisid',title:'His科室ID',width:100},  
	    ]]	 
	});*/
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!listInfo.htm',	   
	    method:'post',
	    fit:true,
	    rownumbers:true,
	    pageList : [10, 20, 30],          // 可以设置每页记录条数的列表
	    pageSize : 20, 
	    columns:[[ 
            {field:'hopCtlocId',title:'科室ID',width:100},
	        {field:'code',title:'科室代码',width:100},  
	        {field:'name',title:'科室描述',width:100},
	        {field:'hospid',title:'医院ID',hidden:true},
	        {field:'hospitalName',title:'医院描述',width:100}, 
	        {field:'hisid',title:'His科室ID',width:100},
	        {field:'type',title:'科室类型',width:100,formatter: function(value,row,index){
					switch(row.type){   
				        case   "1"   :   
				        	return "入库科室";   
				        case   "2"   :   
				            return "收货科室";
				        case   "3"   :   
				            return "全部";
				        default   :   
				            return "空";   
					}
				}
	        }, 
	    ]]	 
	});
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=null;		
		demoId=$('#ctlocdetail input[name="dto.hopCtloc.hopCtlocId"]').val();			
		if(demoId){
			$CommonUI.alert("更新信息成功");
		}else{
			$CommonUI.alert("新增信息成功");
		}
		$("#datagrid").datagrid('reload');
		$("#ctlocInfoWin").dialog('close');
		
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("执行失败");	
	}
	
	
	// hopCtloc表新增和修改
	$("#saveOrUpdateCtlocBtn").on('click', function() {
		$("#saveOrUpdateCtlocBtn").hide();
		postReq($WEB_ROOT_PATH+'/hop/hopCtlocCtrl!save.htm',"#ctlocdetail",succ,err,{skipHidden:false});
	});
				
	// 点击查询的提交按钮,查询hopCtloc数据信息
	$("#searchCtlocInfoBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchCtlocWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchCtlocWin').dialog('close');
	});
			
	
	$('#title').css({width:500,height:60});
	
	$('#title1').css({width:500,height:60});
});


//增加一条记录
function addClick() {	
	$CommonUI.getDialog("#ctlocInfoWin").dialog("setTitle","新增科室信息");
	$CommonUI.getDialog("#ctlocInfoWin").dialog("center");
	$CommonUI.getDialog("#ctlocInfoWin").dialog("open");
	$CommonUI.getForm('#ctlocdetail').form('clear');
	$("#saveOrUpdateCtlocBtn").show();	
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$("#saveOrUpdateCtlocBtn").show();	
	$CommonUI.getForm('#ctlocdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.hopCtlocId;
	$("#ctlocInfoWin").dialog("open");
	$CommonUI.getDialog("#ctlocInfoWin").dialog("setTitle","修改科室信息数据");
	var url = $WEB_ROOT_PATH+'/hop/hopCtlocCtrl.htm?BLHMI=findById&dto.hopCtloc.hopCtlocId='+Id;
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#ctlocInfoWin',data);
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
		$.post($WEB_ROOT_PATH+"/hop/hopCtlocCtrl!delete.htm", {'dto.hopCtloc.hopCtlocId':row.hopCtlocId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		});			
	});
}

//条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#searchCtlocWin").dialog("center");
	$CommonUI.getDialog("#searchCtlocWin").dialog("open");
	$("#title1").val('');
	
}

//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#ctlocInfoWin").dialog("close");
	
}