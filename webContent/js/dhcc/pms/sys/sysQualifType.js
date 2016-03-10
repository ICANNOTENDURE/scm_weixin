$(function (){
	//获取下拉分类的下拉框 add  hxy
	var CatCombox=$CommonUI.getComboBox('#catgroupid');
	CatCombox.combobox({
		method:'post',
		url:$WEB_ROOT_PATH+'/sys/sysQualifTypeCtrl!getCatInfo.htm',
		valueField:'groupID',							
		textField:'groupName'
	});

	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/sys/sysQualifTypeCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    pageSize:20,
	    columns:[
            [{"title":"qualifTypeId","field":"qualifTypeId","sortable":false,"hidden":true},
             {"title":"代码","field":"code","sortable":false,"hidden":false,width:100},
             {"title":"名称","field":"name","sortable":false,"hidden":false,width:100},
             {"title":"类型","field":"type","sortable":false,"hidden":false,width:100},
             {"title":"商品类组","field":"catgroupid","sortable":false,"hidden":false,width:100},
             {"title":"排序","field":"seq","sortable":false,"hidden":false,width:100}]
	    ]	 

	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#detail input[name="dto.sysQualifType.qualifTypeId"]').val();	
		if(Id){
			$CommonUI.alert("更新字典数据成功");
		}else{
			$CommonUI.alert("新增字典数据成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("更新字典数据信息失败");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		var isValid = $CommonUI.getForm('#detail').form('validate');
		if(!isValid){
			return isValid;
		}
		postReq($WEB_ROOT_PATH+'/sys/sysQualifTypeCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
	});
	
	
	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#selectWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#selectWin').dialog('close');
	});
});

//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加字典数据");
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
	var Id=row.qualifTypeId;
	var url = $WEB_ROOT_PATH+'/sys/sysQualifTypeCtrl.htm?BLHMI=findById&dto.sysQualifType.qualifTypeId='+Id;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改字典数据");
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
		$.post($WEB_ROOT_PATH+"/sys/sysQualifTypeCtrl!delete.htm", {'dto.sysQualifType.qualifTypeId':row.qualifTypeId},function(){
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
