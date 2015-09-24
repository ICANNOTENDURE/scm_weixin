// zxx 2014-04-19
$(function (){

	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/cat/catPropertyCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    pageSize:20,
	    pageList:[20,40,60],
	    rownumbers:true,
	    columns:[[
	        {field:'proId',hidden:true},       
	        {field:'proCode',title:'代码',width:100},  
	        {field:'proName',title:'名称',width:100} 
	    ]]	 
	});
	

	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		if($CommonUI.getForm('#detail').form('validate')){
			postReq($WEB_ROOT_PATH+'/cat/catPropertyCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
		}
	});
	
	$CommonUI.getDataGrid('#datagrid').datagrid('load',{
		'dto.catProperty.proName': $('#queryPar').val()
	});
	
	
	
	//给商品增加属性
	$CommonUI.getDataGrid('#datagrid2').datagrid({  
	    url:$WEB_ROOT_PATH+'/cat/catGroupPropertyCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    pageSize:20,
	    pageList:[20,40,60],
	    rownumbers:true,
	    fitColumns:true,
	    singleSelect:true,
	    columns:[[
	        {field:'grpproid',hidden:true},
	        {field:'groupname',title:'大类',width:100},
	        {field:'catgroupname',title:'类组',width:100},
	        {field:'subcatgroupname',title:'小类',width:100},
	        {field:'subcatgroupId',hidden:true},
	        {field:'grpproname',title:'类型',width:100},
	        {field:'grpproparrefid',hidden:true},
	        {field:'grpprodesc',title:'值',width:100} 
	    ]]	 
	});
	

	
	$('#group').combobox({
    	url:$WEB_ROOT_PATH+"/cat/catGroupCtrl!listGroupComb.htm",
    	panelHeight:"auto",
        valueField:'sgId',  
        textField:'sgDesc',
        mode: 'remote',
        onSelect: function(rec){    
            var url =$WEB_ROOT_PATH+"/cat/catGroupCtrl!listCatGroupComb.htm?dto.parrefId="+rec.sgId;   
            $('#catgroup').combobox('reload', url);    
        }
    });
	$('#catgroup').combobox({
    	panelHeight:"auto",
        valueField:'groupID',  
        textField:'groupName',
        mode: 'remote',
        onSelect: function(rec){    
            var url =$WEB_ROOT_PATH+"/cat/catGroupCtrl!listSubCatGroupComb.htm?dto.parrefId="+rec.groupID;   
            $('#subcatgroup').combobox('reload', url);    
        }
    });
	$('#subcatgroup').combobox({
    	panelHeight:"auto",
        valueField:'subGroupID',  
        textField:'subGroupName',
        mode: 'remote'
    });
	
	$('#CatProperty').combobox({
    	url:$WEB_ROOT_PATH+"/cat/catPropertyCtrl!listCatPropertyComb.htm",
    	panelHeight:"auto",
        valueField:'proId',  
        textField:'proName',
        mode: 'remote',
        onSelect: function(rec){
        	if(rec.proName=="厂商"){
        		$('#desc').combobox({
        			url:$WEB_ROOT_PATH+'/manf/hopManfCtrl!getManfInfo.htm',
        			valueField:'hopManfId',							
        			textField:'manfName',
        			mode: 'remote',
        		});
        	}else{
        		
        	} 
        }
    });

	// 新增和修改
	$("#propertyBtn").on('click', function() {
		//alert($('#manftr').css('display'));
		if($CommonUI.getForm('#detailProperty').form('validate')){
			postReq($WEB_ROOT_PATH+'/cat/catGroupPropertyCtrl!save.htm',"#detailProperty",succ,err,{skipHidden:false});
		}
	});
	//新增或更新成功的回调函数
	function succ(data){
		 $CommonUI.alert("操作成功");
		 $("#datagrid2").datagrid('reload');
		 $("#propertyWin").dialog('close');
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("保存失败!");	
	}
});


//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加商品属性字典");
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
	var Id=row.proId;
	var code=row.proCode;
	var name=row.proName;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改");
	$('#detail input[name="dto.catProperty.proId').val(Id);
	$('#detail input[name="dto.catProperty.proCode').val(code);
	$('#detail input[name="dto.catProperty.proName').val(name);
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
		$.post($WEB_ROOT_PATH+"/cat/catPropertyCtrl!delete.htm", {'dto.catProperty.proId':row.proId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

//条件查询提交事件
function selectClick() {
	$CommonUI.getDataGrid('#datagrid').datagrid('load',{
		'dto.catProperty.proName': $('#queryPar').val()
	});
}
function selectClick2() {
	$CommonUI.getDataGrid('#datagrid2').datagrid('load',{
		'dto.subcatgroup': $('#subcatgroup').combobox('getValue'),
		'dto.catgroup': $('#catgroup').combobox('getValue'),
		'dto.group': $('#group').combobox('getValue')
	});
}

//商品属性
function addProperty() {
	groupText=$("#group").combobox('getText');
	catgroupText=$("#catgroup").combobox('getText');
	subcatgroupText=$("#subcatgroup").combobox('getText');
	subcatgroup=$("#subcatgroup").combobox('getValue');
	if(subcatgroupText==""){
		$CommonUI.alert('请选择商品小类');
		return;
	}
	$CommonUI.getForm("#detailProperty").form("clear");
	$("#propertyGroup").val(groupText);
	$('#propertyCatGroup').val(catgroupText);
	$('#propertySubCatGroup').val(subcatgroupText);
	$('#detailProperty input[name="dto.catGroupProperty.grpParrefId').val(subcatgroup);
	$CommonUI.getDialog("#propertyWin").dialog("setTitle","增加商品属性");
	$CommonUI.getDialog("#propertyWin").dialog("center");
	$CommonUI.getDialog("#propertyWin").dialog("open");
}

//編輯一行记录
function editProperty() {
	if ($CommonUI.getDataGrid("#datagrid2").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm("#detailProperty").form("clear");
	
	var row =$("#datagrid2").datagrid('getSelected');
	//商品属性id
	var grpproid=row.grpproid;
	var grpprodesc=row.grpprodesc;
	var groupname=row.groupname;
	var catgroupname=row.catgroupname;
	var subcatgroupname=row.subcatgroupname;
	//小类id
	var subcatgroup=row.subcatgroupid;
	//商品属性字典id
	var grpparrefid=row.grpparrefid;
	$("#propertyWin").dialog("open");
	$CommonUI.getDialog("#propertyWin").dialog("setTitle","修改");

	if(row.grpproname=="厂商"){
		$('#desc').combobox({
			url:$WEB_ROOT_PATH+'/manf/hopManfCtrl!getManfInfo.htm',
			valueField:'hopManfId',							
			textField:'manfName',
			mode: 'remote',
		});
	}else{
		
	}
	$("#propertyGroup").val(groupname);
	$('#propertyCatGroup').val(catgroupname);
	$('#propertySubCatGroup').val(subcatgroupname);
	$('#detailProperty input[name="dto.catGroupProperty.grpParrefId').val(subcatgroup);
	$('#detailProperty input[name="dto.catGroupProperty.grpProDesc').val(grpprodesc);
	$('#detailProperty input[name="dto.catGroupProperty.grpProId').val(grpproid);
	$('#CatProperty').combobox('setValue',grpparrefid);
}
//編輯一行记录
function delProperty() {
	if ($CommonUI.getDataGrid("#datagrid2").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid2").datagrid('getSelected');
		$.post(
			$WEB_ROOT_PATH+"/cat/catGroupPropertyCtrl!delete.htm", 
			{'dto.catGroupProperty.grpProId':row.grpproid},
			function(){
				$CommonUI.getDataGrid("#datagrid2").datagrid('reload');
			},
			'json'
		);
	});
}
