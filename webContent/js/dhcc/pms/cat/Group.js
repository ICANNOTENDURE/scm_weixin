// zxx 2014-04-19
$(function (){
	$.extend($.fn.datagrid.methods, {
		 editCell: function(jq,param){
			 return jq.each(function(){
			 opts = $(this).datagrid('options');
			 var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
			 for(var i=0; i<fields.length; i++){
				 var col = $(this).datagrid('getColumnOption', fields[i]);
				 col.editor1 = col.editor;
				 if (fields[i] != param.field){
					 col.editor = null;
				 }
			 }
			 $(this).datagrid('beginEdit', param.index);
			 	for(var i=0; i<fields.length; i++){
			 		var col = $(this).datagrid('getColumnOption', fields[i]);
			 		col.editor = col.editor1;
			 	}
			 });
		 }
	 });
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/cat/catGroupCtrl!listGroup.htm',
	    method:'post',
	    fit:true,
	    pageSize:20,
	    pageList:[20,40,60],
	    rownumbers:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'sgId',width:100,hidden:true},
	        {field:'sgCode',title:'代码',width:100},  
	        {field:'sgDesc',title:'名称',width:100} 
	    ]],
	    onDblClickRow: function(rowIndex, rowData){
	    	$CommonUI.getDataGrid('#datagrid2').datagrid('load',{
				'dto.catGroup.parrefId': rowData.sgId
		});
	    }		
	});
	
	//加载小类
	$CommonUI.getDataGrid('#datagrid2').datagrid({  
	    url:$WEB_ROOT_PATH+'/cat/catGroupCtrl!listCatGroup.htm',
	    method:'post',
		singleSelect:true,
		striped:true,
		singleselect:true,
		rownumbers:true,pageSize:20,
	    pageList:[20,40,60],
		onClickCell:onClickCell,
	    columns:[[
	        {field:'catgroupid',hidden:true},
	        {field:'groupid',hidden:true},
	  	    {field:'catgroupcode',width:100,title:'代码'},  
	  	    {field:'catgroupname',width:100,title:'名称'},
	  	    {field:'groupname',width:100,title:'所属大类',editor : {
				type : 'combobox',
				options:{
					valueField:'sgId',
					textField:'sgDesc',
					mode:'remote',
					url:$WEB_ROOT_PATH+'/cat/catGroupCtrl!listGroupComb.htm',
					onSelect:function(rowData) {
						catgroupId=$('#datagrid2').datagrid('getRows')[editIndex]['catgroupid'];
						groupId=rowData.sgId;
						$.post(
							$WEB_ROOT_PATH+'/cat/catGroupCtrl!updateCatGroup.htm',
							{
								'dto.catGroup.groupID':catgroupId,
								'dto.catGroup.parrefId':groupId,
							},
							function(data){
								$('#datagrid2').datagrid('reload');
							}
						);
					}
				}
			  }
			} 
	  	 ]]
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
		 $CommonUI.alert("操作成功");
		 $("#datagrid2").datagrid('reload');
		 $("#detailWinSub").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("保存失败!");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		if($CommonUI.getForm('#detail').form('validate')){
			postReq($WEB_ROOT_PATH+'/cat/catGroupCtrl!saveGroup.htm',"#detail",succ,err,{skipHidden:false});
		}
	});
	
	
	
	//编辑类祖
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true;};
		if ($('#datagrid2').datagrid('validateRow', editIndex)){
			$('#datagrid2').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickCell(index, field){
		if (endEditing()){
			$('#datagrid2').datagrid('selectRow', index).datagrid('editCell', {index:index,field:field});
			editIndex = index;
		}
	}

});

//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加商品大类祖");
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
	var Id=row.sgId;
	var code=row.sgCode;
	var desc=row.sgDesc;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改");
	$("#sgId").val(Id);
	$("#sgCode").val(code);
	$("#sgDesc").val(desc);

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
		$.post($WEB_ROOT_PATH+"/cat/catGroupCtrl!deleteGroup.htm", {'dto.group.sgId':row.sgId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

function selectClick(){
	$CommonUI.getDataGrid('#datagrid').datagrid('load',{
			'dto.group.sgDesc': $('#queryPar').val()
	});
}
function selectClick2(){
	$CommonUI.getDataGrid('#datagrid2').datagrid('load',{
			'dto.catGroup.groupName': $('#queryPar2').val()
	});
}




