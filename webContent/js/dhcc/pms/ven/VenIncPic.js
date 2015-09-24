// zxx 2014-04-19
$(function (){

	$("#uploadPics").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/ven/venIncPicCtrl!upload.htm',
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
	var drugCombogrid=[$CommonUI.getComboGrid('#venIncPicVenincid'),$CommonUI.getComboGrid('#hopIncPicIncids')];
	for(var i=0;i<drugCombogrid.length;i++){
		drugCombogrid[i].combogrid({
			url:$WEB_ROOT_PATH+'/ven/venIncCtrl!getIncInfo.htm',
			idField:'venIncId',							
			textField:'venIncName',
			panelWidth: 510,
			columns: [[
			           {field:'venIncId',title:'ID',width:50},
			           {field:'venIncCode',title:'药品代码',width:100},
			           {field:'venIncName',title:'药品名称',width:100},
			           {field:'venIncUomname',title:'单位名称',width:50},
			           {field:'venIncBuomname',title:'小单位名称',width:50},
			           {field:'venIncVensysid',title:'系统药品',width:50},
			           {field:'venIncManfid',title:'厂商',width:50},
			           {field:'venIncVenid',title:'供应商',width:50},
			           ]],
		});
	}
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/ven/venIncPicCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    columns:[[ 
            {field:'ck1',checkbox:true},  
            {field:'venIncPicId',title:'表ID',width:60},
	        {field:'venIncPicVenincid',title:'药品ID',width:100},  
	        {field:'venIncPicPath',title:'图片路径',width:140},  
	        {field:'venIncPicSeq',title:'图片排序',width:100}, 
	    ]]	 
	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#incpicdetail input[name="dto.venIncPic.venIncPicId"]').val();	
		if(Id){
			$CommonUI.alert("更新成功 ");
		}else{
			$CommonUI.alert("增加成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#drugPicInfoWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("操作失败");	
	}
	
	// 新增和修改
	$("#saveOrUpdateIncpicBtn").on('click', function() {
		postReq($WEB_ROOT_PATH+'/ven/venIncPicCtrl!save.htm',"#incpicdetail",succ,err,{skipHidden:false});
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
	$CommonUI.getDialog("#drugPicInfoWin").dialog("setTitle","add");
	$CommonUI.getDialog("#drugPicInfoWin").dialog("center");
	$CommonUI.getDialog("#drugPicInfoWin").dialog("open");
	$CommonUI.getForm('#incpicdetail').form('clear');
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#detail').form('clear');
	
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.venIncPicId;
	var url = $WEB_ROOT_PATH+'/ven/venIncPicCtrl.htm?BLHMI=findById&dto.venIncPic.venIncPicId='+Id;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改");
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
		$.post($WEB_ROOT_PATH+"/ven/venIncPicCtrl!delete.htm", {'dto.venIncPic.venIncPicId':row.venIncPicId},function(){
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
