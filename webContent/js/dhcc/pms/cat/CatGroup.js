// zxx 2014-04-19
$(function (){

	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/cat/catGroupCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    pageSize:20,
	    pageList:[20,40,60],
	    rownumbers:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'groupID',title:'代码',width:100,hidden:true},
	        {field:'groupCode',title:'代码',width:100},  
	        {field:'groupName',title:'名称',width:100} 
	    ]],
	    onDblClickRow: function(rowIndex, rowData){
	    	$CommonUI.getDataGrid('#datagrid2').datagrid('load',{
	    		'dto.subCatGroup.subParrefGroupID':rowData.groupID
	    	});
	    }
	});
	
	//加载小类
	$CommonUI.getDataGrid('#datagrid2').datagrid({  
	    url:$WEB_ROOT_PATH+'/cat/subCatGroupCtrl!listSubInfo.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
		singleSelect:true,
		pagination:true,
		method:'post',
		striped:true,
		singleselect:true,
		pageSize:20,
	    pageList:[20,40,60],
	    rownumbers:true,
	    columns:[[ 
	  	    {field:'subcatgroupcode',width:100,title:'代码'},  
	  	    {field:'subcatgroupname',width:100,title:'名称'},
	  	    {field:'subparrefgroupname',width:100,title:'所属分类'} 
	  	    ]],
	  	onDblClickRow: function(rowIndex, rowData){
	  		if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
	  			$CommonUI.alert('请选一个大类');
	  			return;
	  		}
	  		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
	  		var rowSub = $CommonUI.getDataGrid("#datagrid2").datagrid('getSelected');
	  		var ID=row.groupID; //大类ID
	  		if ((ID!="")&&(rowSub.subparrefgroupid!=null)&&(ID!=rowSub.subparrefgroupid)) {$CommonUI.alert("该小类已经有所属分类<"+rowSub.subparrefgroupname+">!");return;};
	  		if ((ID!="")&&(rowSub.subparrefgroupid!=null)&&(ID==rowSub.subparrefgroupid)) {ID='';};
	  		$.post(
	  				$WEB_ROOT_PATH+'/cat/subCatGroupCtrl!save.htm',
	  				{
	  					"dto.subCatGroup.subGroupID":rowSub.subcatgroupid,
	  					"dto.subCatGroup.subGroupCode":rowSub.subcatgroupcode,
	  					"dto.subCatGroup.subGroupName":rowSub.subcatgroupname,
	  					"dto.subCatGroup.subParrefGroupID":ID
	  				},function(data){
	  					$("#datagrid2").datagrid('reload');
	  					$("#detailWinSub").dialog('close');
	  				}
	  				,"json");
  		}

	});
	
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#detail input[name="dto.catGroup.groupID"]').val();	
		if(Id){
			$CommonUI.alert("修改成功");
		}else{
			$CommonUI.alert("增加成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	//小类//新增或更新成功的回调函数
	function succSub(data){
		var Id=$('#detailSub input[name="dto.subCatGroup.subGroupID"]').val();	
		if(Id){
			$CommonUI.alert("修改成功");
		}else{
			$CommonUI.alert("增加成功");
		}
		 $("#datagrid2").datagrid('reload');
		 $("#detailWinSub").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("保存失败!");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		postReq($WEB_ROOT_PATH+'/cat/catGroupCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
	});
	
	// 新增和修改
	$("#submitBtnSub").on('click', function() {
		postReq($WEB_ROOT_PATH+'/cat/subCatGroupCtrl!save.htm',"#detailSub",succSub,err,{skipHidden:false});
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
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加药品分类");
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$CommonUI.getForm('#detail').form('clear');
}

//增加小类
function addClickSub() {
	$CommonUI.getDialog("#detailWinSub").dialog("setTitle","增加药品小类");
	$CommonUI.getDialog("#detailWinSub").dialog("center");
	$CommonUI.getDialog("#detailWinSub").dialog("open");
	$CommonUI.getForm('#detailSub').form('clear');
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#detail').form('clear');
	
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.groupID;
	var url = $WEB_ROOT_PATH+'/cat/catGroupCtrl.htm?BLHMI=findById&dto.catGroup.groupID='+Id;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改");
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#detailWin',data);
	});
}

//編輯一行记录
function editRowSub() {
	if ($CommonUI.getDataGrid("#datagrid2").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#detailSub').form('clear');
	
	var row =$("#datagrid2").datagrid('getSelected');
	var Id=row.subcatgroupid;
	var url = $WEB_ROOT_PATH+'/cat/subCatGroupCtrl.htm?BLHMI=findById&dto.subCatGroup.subGroupID='+Id;
	$("#detailWinSub").dialog("open");
	$CommonUI.getDialog("#detailWinSub").dialog("setTitle","修改");
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#detailWinSub',data);
	});
}

// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}

//取消按钮
function cancelClickSub() {
	$CommonUI.getWindow("#detailWinSub").dialog("close");
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/cat/catGroupCtrl!delete.htm", {'dto.catGroup.groupID':row.groupID},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

//刪除記錄小类
function delRowSub() {
	if ($CommonUI.getDataGrid("#datagrid2").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid2").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/cat/subCatGroupCtrl!deleteSub.htm", {'dto.subCatGroup.subGroupID':row.subcatgroupid},function(){
			$CommonUI.getDataGrid("#datagrid2").datagrid('reload');
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


function selectClick2() {
	//alert(1)
	$CommonUI.getDataGrid('#datagrid2').datagrid('load',{
		'dto.subCatGroup.subGroupName':$("#queryPar").val()
	});
}




