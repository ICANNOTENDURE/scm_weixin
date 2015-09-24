$(function (){	
	//获取下拉科室的所有下拉框
	var ctlocCombox=[$CommonUI.getComboBox('#comboCtloc'),$CommonUI.getComboBox('#ctlocDesDr')];
	for(var i=0;i<ctlocCombox.length;i++){
		ctlocCombox[i].combobox({
			url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!findHopLocComboxVos.htm',
			valueField:'id',							
			textField:'name'	
		});
	}
//	$CommonUI.getComboBox('#comboCtloc').combobox({
//		onSelect:function(rec){
//			$("#contact").combobox({
//				url:$WEB_ROOT_PATH+'/normalAccount/normalAccountCtrl!getUserByLoc.htm?locId='+rec.hopCtlocId,
//				valueField:'id',							
//				textField:'name',
//			});
//		}
//	});
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopCtlocDestinationCtrl!listInfo.htm',	   
	    method:'post',
	    fit:true,
	    pageSize:20,
		pageList:[20,40,100],
	    columns:[[ 
	        {field:'hopctlocdestinationid',title:'表ID',width:100,hidden:true}, 
	        {field:'desctlocdr',title:'科室表ID', hidden:true},
	        {field:'desctlocname',title:'科室描述',width:100},
	        {field:'desccode',title:'代码',width:100},
	        {field:'destination',title:'收货地点',width:100},  
	        {field:'descontact',title:'联系人',width:100}, 
	        {field:'destel',title:'联系电话',width:100},
	        {field:'mail',title:'邮箱',width:100,},
	        {field:'defaultdes',title:'默认',width:20,formatter: function(value,row,index){
				if (row.hopctlocdestinationid==row.defaultdestion){
					return "Y";
				} else {
					return "";
				}
			}
	        },
	    ]]	 
	});
	
	
	// hopCtlocDestination表新增和修改
	$("#saveOrUpdateCtlocDesBtn").on('click', function() {
		var isValid = $CommonUI.getForm('#ctlocDesDestail').form('validate');
		if(!isValid){
			return isValid;
		}
		$("#saveOrUpdateCtlocDesBtn").hide();
		//postReq($WEB_ROOT_PATH+'/hop/hopCtlocDestinationCtrl!save.htm',"#ctlocDesDestail",succ,err,{skipHidden:false});
		
		$.post(
				$WEB_ROOT_PATH+'/hop/hopCtlocDestinationCtrl!save.htm',
				{
					'dto.hopCtlocDestination.hopCtlocDestinationId':$("#hopCtlocDestinationId").val(),
					'dto.hopCtlocDestination.ctlocDr':$("#comboCtloc").combobox('getValue'),
					'dto.hopCtlocDestination.contact':$("#contact").val(),
					'dto.hopCtlocDestination.tel':$("#tel").val(),
					'dto.hopCtlocDestination.mail':$("#mail").val(),
					'dto.hopCtlocDestination.code':$("#code").val(),
					'dto.hopCtlocDestination.destination':$("#destination").val(),
					'dto.defautFlag':($("#defaultFlag").attr("checked")=="checked")?1:0,
				},
				function(data){
					$("#saveOrUpdateCtlocDesBtn").show();
					$("#datagrid").datagrid('reload');
					$CommonUI.alert("操作成功");
					$("#detailWin").dialog("close");
				},
				'json'
		);
	});
		
	// 点击查询的提交按钮,查询hopCtlocDestination数据信息
	$("#searchCtlocDesInfoBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchCtlocDesWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchCtlocDesWin').dialog('close');
	});
});


//增加一条记录
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","新增收货信息");
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$CommonUI.getForm('#ctlocDesDestail').form('clear');
	$("#saveOrUpdateCtlocDesBtn").show();	
}

//編輯一行记录
function editRow() {
	$CommonUI.getForm('#ctlocDesDestail').form('clear');
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$("#saveOrUpdateCtlocDesBtn").show();	
	$CommonUI.getForm('#ctlocdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.hopctlocdestinationid;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改收货信息");
	var url = $WEB_ROOT_PATH+'/hop/hopCtlocDestinationCtrl.htm?BLHMI=findById&dto.hopCtlocDestination.hopCtlocDestinationId='+Id;
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#detailWin',data);
	});
	
//	$("#contact").combobox({
//		url:$WEB_ROOT_PATH+'/normalAccount/normalAccountCtrl!getUserByLoc.htm?locId='+row.desctlocdr,
//		valueField:'id',							
//		textField:'name',
//	});
	if(row.defaultdestion==Id){
		$("#defaultFlag").attr("checked",checked);
	}
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){		
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');	
		$.post($WEB_ROOT_PATH+"/hop/hopCtlocDestinationCtrl!delete.htm", {'dto.hopCtlocDestination.hopCtlocDestinationId':row.hopctlocdestinationid},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		});
		
	});
}

//条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#searchCtlocDesWin").dialog("center");
	$CommonUI.getDialog("#searchCtlocDesWin").dialog("open");
	$("#title1").val('');
	
}
function clear(){
	$("#ctlocDesDestail input").val("");
}
//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}