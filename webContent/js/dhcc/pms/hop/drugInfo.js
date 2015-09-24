//定义一个全局的标志字段，用来控制正删改查按钮被点击之后具体的具体响应函数
var flag=-1;
$(function (){	
	
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=null;
		if(flag==0){
			demoId=$('#incdetail input[name="dto.hopInc.incId"]').val();
		}else if(flag==1){
			demoId=$('#incpicdetail input[name="dto.hopIncPic.hopIncPicId"]').val();
		}
		if(demoId){
			$CommonUI.alert("更新信息成功");
		}else{
			$CommonUI.alert("新增信息成功");
		}
		$("#datagrid").datagrid('reload');
		$("#drugInfoWin").dialog('close');
		$("#drugPicInfoWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("执行失败");	
	}
	
	// hopInc表新增和修改
	$("#saveOrUpdateIncBtn").on('click', function() {
		$("#saveOrUpdateIncBtn").hide();
		postReq($WEB_ROOT_PATH+'/hop/hopIncCtrl!save.htm',"#incdetail",succ,err,{skipHidden:false});
	});
	
	// hopIncPic表新增和修改
	$("#saveOrUpdateIncpicBtn").on('click', function() {
		$("#saveOrUpdateIncpicBtn").hide();
		postReq($WEB_ROOT_PATH+'/hop/hopIncPicCtrl!save.htm',"#incpicdetail",succ,err,{skipHidden:false});
	});
	
	
	// 点击查询的提交按钮,查询hopInc数据信息
	$("#searchIncInfoBtn").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchIncWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchIncWin').dialog('close');
	});
	
		
	// 点击查询的提交按钮,查询hopIncPic数据信息
	$("#searchIncPicBtn").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchIncPicWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchIncPicWin').dialog('close');
	});
		
	
	//获取下拉医院的所有下拉框
	var hospCombox=[$CommonUI.getComboBox('#incHospid'),$CommonUI.getComboBox('#incHosps')];
	for(var i=0;i<hospCombox.length;i++){
		hospCombox[i].combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName'
		});
	}
	
	//获取下拉厂商的所有下拉框
	var manfCombox=[$CommonUI.getComboBox('#incManfid'),$CommonUI.getComboBox('#incManfs')];
	for(var i=0;i<manfCombox.length;i++){
		manfCombox[i].combobox({
			url:$WEB_ROOT_PATH+'/manf/hopManfCtrl!getManfInfo.htm',
			valueField:'hopManfId',							
			textField:'manfName'
		});
	}
	
	
	
	$('#title').css({width:500,height:60});
	
	$('#title1').css({width:500,height:60});
});

//药品信息图标
function drugInfoIconClick() {
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopIncCtrl!list.htm',	   
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'incId',title:'表ID',width:100},
	        {field:'incCode',title:'药品代码',width:100},  
	        {field:'incName',title:'药品描述',width:100},
	        {field:'incUomcode',title:'单位代码',width:100}, 
	        {field:'incUomname',title:'单位描述',width:100}, 
	        {field:'incBuomcode',title:'小单位代码',width:100}, 
	        {field:'incBuomname',title:'小单位描述',width:100},
	        {field:'incFac',title:'系数',width:100},
	        {field:'incManfid',title:'厂商ID',width:100},
	        {field:'incHospid',title:'医院ID',width:100},
	        {field:'incHissysid',title:'his系统药品ID',width:100},  
	    ]]	 
	});
	//当flag=0时，即弹出药品信息的相关增删改查框
	flag=0;
	
}

//药品图片信息图标
function drugPicInfoClick() {
	
	//获取下拉药品的所有下拉框
	var drugCombogrid=[$CommonUI.getComboGrid('#hopIncPicIncid'),$CommonUI.getComboGrid('#hopIncPicIncids')];
	for(var i=0;i<drugCombogrid.length;i++){
		drugCombogrid[i].combogrid({
			url:$WEB_ROOT_PATH+'/hop/hopIncCtrl!getIncInfo.htm',
			idField:'incId',							
			textField:'incName',
			panelWidth: 510,
			columns: [[
			           {field:'incId',title:'ID',width:50},
			           {field:'incCode',title:'药品代码',width:100},
			           {field:'incName',title:'药品名称',width:100},
			           {field:'incUomname',title:'单位名称',width:50},
			           {field:'incBuomname',title:'小单位名称',width:50},
			           {field:'incHissysid',title:'his药品',width:50},
			           {field:'incManfid',title:'厂商',width:50},
			           {field:'incHospid',title:'医院',width:50},
			           ]],
		});
	}
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopIncPicCtrl!list.htm',	   
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'hopIncPicId',title:'表ID',width:100},
	        {field:'incPicIncid',title:'药品ID',width:100},  
	        {field:'incPicPath',title:'图片路径',width:100},  
	        {field:'incPicSeq',title:'图片排序',width:100}, 	       
	    ]]	 
	});
	//当flag=1时，即弹出药品图片信息的相关增删改查框
	flag=1;
	
}

//增加一条记录
function addClick() {
	if(flag==0){
		$CommonUI.getDialog("#drugInfoWin").dialog("setTitle","新增药品信息");
		$CommonUI.getDialog("#drugInfoWin").dialog("center");
		$CommonUI.getDialog("#drugInfoWin").dialog("open");
		$CommonUI.getForm('#incdetail').form('clear');
		$("#saveOrUpdateIncBtn").show();
	}else if(flag==1){
		$CommonUI.getDialog("#drugPicInfoWin").dialog("setTitle","新增科室信息");
		$CommonUI.getDialog("#drugPicInfoWin").dialog("center");
		$CommonUI.getDialog("#drugPicInfoWin").dialog("open");
		$CommonUI.getForm('#incpicdetail').form('clear');
		$("#saveOrUpdateIncpicBtn").show();
	}
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#incdetail').form('clear');
	$CommonUI.getForm('#incpicdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');
	if(flag==0){
		var Id=row.incId;
		$("#drugInfoWin").dialog("open");
		$CommonUI.getDialog("#drugInfoWin").dialog("setTitle","修改药品信息数据");
		var url = $WEB_ROOT_PATH+'/hop/hopIncCtrl.htm?BLHMI=findById&dto.hopInc.incId='+Id;
		$.getJSON(url, function(data){
			$CommonUI.fillBlock('#drugInfoWin',data);
		});
	}else if(flag==1){
		var Id=row.hopIncPicId;
		$("#drugPicInfoWin").dialog("open");
		$CommonUI.getDialog("#drugPicInfoWin").dialog("setTitle","修改药品图片信息数据");
		var url = $WEB_ROOT_PATH+'/hop/hopIncPicCtrl.htm?BLHMI=findById&dto.hopIncPic.hopIncPicId='+Id;
		$.getJSON(url, function(data){
			$CommonUI.fillBlock('#drugPicInfoWin',data);
		});
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
		if(flag==0){
			$.post($WEB_ROOT_PATH+"/hop/hopIncCtrl!delete.htm", {'dto.hopInc.incId':row.incId},function(){
				$CommonUI.getDataGrid("#datagrid").datagrid('reload');
			});
		}else if(flag==1){
			$.post($WEB_ROOT_PATH+"/hop/hopIncPicCtrl!delete.htm", {'dto.hopIncPic.hopIncPicId':row.hopIncPicId},function(){
				$CommonUI.getDataGrid("#datagrid").datagrid('reload');
			});
		}
		
	});
}

//条件查询提交事件
function selectClick() {
	if(flag==0){
		$CommonUI.getDialog("#searchIncWin").dialog("center");
		$CommonUI.getDialog("#searchIncWin").dialog("open");
		$("#title1").val('');
	}else if(flag==1){
		$CommonUI.getDialog("#searchIncPicWin").dialog("center");
		$CommonUI.getDialog("#searchIncPicWin").dialog("open");
		$("#title1").val('');
	}
	
}

//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#drugInfoWin").dialog("close");
	$CommonUI.getWindow("#drugPicInfoWin").dialog('close');
}