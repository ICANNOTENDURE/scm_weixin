$(function (){	
	
	$("#uploadPics").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/hop/hopIncPicCtrl!upload.htm',
        //在浏览窗口底部的文件类型下拉菜单中显示的文本
        'buttonText':'请选择',
        'fileTypeDesc': '支持的格式：',
        'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
        'fileSizeLimit': '3MB',
        'width': '70',
        'height': '20',
        'debug' : false,
        'fileObjName':'dto.upload',
        'auto': true,
        'removeCompleted':false,
	});
	//获取下拉药品的所有下拉框
	var drugCombogrid=[$CommonUI.getComboGrid('#hopIncPicIncid'),$CommonUI.getComboGrid('#hopIncPicIncids')];
	for(var i=0;i<drugCombogrid.length;i++){
		drugCombogrid[i].combogrid({
			url:$WEB_ROOT_PATH+'/hop/hopIncCtrl!getIncInfo.htm',
			idField:'incId',							
			textField:'incName',
			panelWidth: 610,
			columns: [[
			           {field:'incId',title:'ID',width:50},
			           {field:'incCode',title:'药品代码',width:100},
			           {field:'incName',title:'药品名称',width:100},
			           {field:'incUomname',title:'单位名称',width:50},
			           {field:'incBuomname',title:'小单位名称',width:50},
			           {field:'incHissysid',title:'his药品',width:50},
			           {field:'manfName',title:'厂商',width:100},
			           {field:'hospitalName',title:'医院',width:100},
			           ]],
		});
	}
	
		
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopIncPicCtrl!listInfo.htm',	   
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},
            {field:'hopIncPicId',title:'表ID',width:60},
	        {field:'incPicIncid',title:'药品ID',hidden:true},
	        {field:'incName',title:'药品',width:100},  
	        {field:'incPicPath',title:'图片路径',width:140},  
	        {field:'incPicSeq',title:'图片排序',width:100}, 	       
	    ]]	 
	});
	
	
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=null;		
		demoId=$('#incpicdetail input[name="dto.hopIncPic.hopIncPicId"]').val();

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
		
	// hopIncPic表新增和修改
	$("#saveOrUpdateIncpicBtn").on('click', function() {
		$("#saveOrUpdateIncpicBtn").hide();
		postReq($WEB_ROOT_PATH+'/hop/hopIncPicCtrl!save.htm',"#incpicdetail",succ,err,{skipHidden:false});
	});
		
		
	// 点击查询的提交按钮,查询hopIncPic数据信息
	$("#searchIncPicBtn").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchIncPicWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchIncPicWin').dialog('close');
	});
			
	
	$('#title').css({width:500,height:60});
	
	$('#title1').css({width:500,height:60});
});


//增加一条记录
function addClick() {
	$CommonUI.getDialog("#drugPicInfoWin").dialog("setTitle","新增科室信息");
	$CommonUI.getDialog("#drugPicInfoWin").dialog("center");
	$CommonUI.getDialog("#drugPicInfoWin").dialog("open");
	$CommonUI.getForm('#incpicdetail').form('clear');
	$("#saveOrUpdateIncpicBtn").show();

}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$("#saveOrUpdateIncpicBtn").show();	
	$CommonUI.getForm('#incpicdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');	
	var Id=row.hopIncPicId;
	$("#drugPicInfoWin").dialog("open");
	$CommonUI.getDialog("#drugPicInfoWin").dialog("setTitle","修改药品图片信息数据");
	var url = $WEB_ROOT_PATH+'/hop/hopIncPicCtrl.htm?BLHMI=findById&dto.hopIncPic.hopIncPicId='+Id;
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#drugPicInfoWin',data);
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
		
		$.post($WEB_ROOT_PATH+"/hop/hopIncPicCtrl!delete.htm", {'dto.hopIncPic.hopIncPicId':row.hopIncPicId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		});
		
	});
}

//条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#searchIncPicWin").dialog("center");
	$CommonUI.getDialog("#searchIncPicWin").dialog("open");
	$("#title1").val('');
		
}


//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#drugPicInfoWin").dialog('close');
}