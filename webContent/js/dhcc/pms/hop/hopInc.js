$(function (){	
	
	//获取下拉分类的下拉框
	var subCatCombox=$CommonUI.getComboBox('#incCat');
	subCatCombox.combobox({
		method:'post',
		url:$WEB_ROOT_PATH+'/hop/hopIncCtrl!getSubCatInfo.htm',
		valueField:'subGroupID',							
		textField:'subGroupName'
	});
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopIncCtrl!listInfo.htm',	   
	    method:'post',
	    fit:true,
	    pageSize:20,
	    pageList:[20,40,60],
	    columns:[[ 
            {field:'incid',title:'表ID',hidden:true},
	        {field:'inccode',title:'商品代码',width:100},
	        {field:'incbarcode',title:'商品条码',width:100},
	        {field:'incname',title:'商品描述',width:100},
	        {field:'incuomcode',title:'单位代码',width:80,hidden:true}, 
	        {field:'incuomname',title:'单位描述',width:80}, 
	        {field:'incbuomcode',title:'小单位代码',width:100,hidden:true}, 
	        {field:'incbuomname',title:'小单位描述',width:100,hidden:true},
	        {field:'incfac',title:'系数',width:100,hidden:true},
	        {field:'incrp',title:'进价',width:100},
	        {field:'incmanfid',title:'厂商ID',hidden:true},
	        {field:'manfname',title:'厂商',width:100},
	        {field:'inchospid',title:'医院ID',hidden:true},
	        {field:'hospitalname',title:'医院',width:100},
	        {field:'inchissysid',title:'his药品ID',width:100,hidden:true},
	        {field:'hopincpicid',title:'药品图片表id',hidden:true},
	        {field:'incpicpath',title:'图片路径',width:140,hidden:true},
	        {field:'incpicseq',title:'图片顺序',width:100,hidden:true},
	    ]]	 
	});
	//新增或更新成功的回调函数
	function succ(data){
		var demoId=null;		
		demoId=$('#incdetail input[name="dto.hopInc.incId"]').val();		
		if(demoId){
			$CommonUI.alert("更新信息成功");
		}else{
			$CommonUI.alert("新增信息成功");
		}
		$("#datagrid").datagrid('reload');
		$("#drugInfoWin").dialog('close');		
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
	
	
	// 点击查询的提交按钮,查询hopInc数据信息
	$("#searchIncInfoBtn").on('click', function() {
		 var json=$CommonUI.loopBlock('#searchIncWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#searchIncWin').dialog('close');
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
	
	
	$("#orderUpload").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/hop/hopIncCtrl!upload.htm',
        //在浏览窗口底部的文件类型下拉菜单中显示的文本
        'buttonText':'上传',
        'fileTypeDesc': '支持的格式：',
        'fileTypeExts': '*.xls;*.xlsx',
        'fileSizeLimit': '30MB',
        'width': '60',
        'height': '20',
        'debug' : false,
        'fileObjName':'dto.upload',
        'auto': true,
        'removeCompleted':true,
        'onUploadStart': function(file) {
        	$("#orderUpload").uploadify("settings", 'formData', {'dto.uploadFileName': file.name});
        },
        'onSelect': function(){  
        	$("#gg").dialog("open");
        	$("#err").html("");	
        },
        //上传成功
        'onUploadSuccess':function(file, data, response){
        	$("#gg").dialog("close");
        	var obj=eval('('+data+')');
        	if(obj.opFlg=="1"){
        		$("#importDialog").dialog('close');
        		$CommonUI.alert("导入成功");
        		$("#search").click();
        	}else{
        		$CommonUI.alert(obj.msg);
        		$("#err").html(obj.msg);
        	};
        },
        //检测FLASH失败调用
        'onFallback': function() {
            alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
        },
        //返回一个错误，选择文件的时候触发
        'onSelectError': function(file, errorCode, errorMsg) {
            switch (errorCode) {
            case - 100 : alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                break;
            case - 110 : alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
                break;
            case - 120 : alert("文件 [" + file.name + "] 大小异常！");
                break;
            case - 130 : alert("文件 [" + file.name + "] 类型不正确！");
                break;
            }
        }
    });
	
	$('#title').css({width:500,height:60});
	
		$('#impModel').html("");
 		$('#impModel').append("<td class='time'>模版 </td>");
 		$.post(
 			$WEB_ROOT_PATH+"/sys/sysImpModelCtrl!listImpModel.htm",
 			{
 				'dto.impModel.type':'INC'
 			},
 			function(data){
 				$.each(data,function(i,dd){
 						$('#impModel').append("<td class='drop'><div class='item'>"+dd.name+"</div></td>");
 				});
 			},
 			"json"
 		);
});


//增加一条记录
function addClick() {	
	$CommonUI.getDialog("#drugInfoWin").dialog("setTitle","新增药品信息");
	$CommonUI.getDialog("#drugInfoWin").dialog("center");
	$CommonUI.getDialog("#drugInfoWin").dialog("open");
	$CommonUI.getForm('#incdetail').form('clear');
	$("#saveOrUpdateIncBtn").show();
	
}

//編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$("#saveOrUpdateIncBtn").show();
	$CommonUI.getForm('#incdetail').form('clear');
	$CommonUI.getForm('#incpicdetail').form('clear');
	var row =$("#datagrid").datagrid('getSelected');
	
	var Id=row.incid;
	$("#drugInfoWin").dialog("open");
	$CommonUI.getDialog("#drugInfoWin").dialog("setTitle","修改药品信息数据");
	var url = $WEB_ROOT_PATH+'/hop/hopIncCtrl.htm?BLHMI=findById&dto.hopInc.incId='+Id;
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#drugInfoWin',data);
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
		$.post($WEB_ROOT_PATH+"/hop/hopIncCtrl!delete.htm", {'dto.hopInc.incId':row.incid},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		});
				
	});
}

//条件查询提交事件
function selectClick() {	
	$CommonUI.getDialog("#searchIncWin").dialog("center");
	$CommonUI.getDialog("#searchIncWin").dialog("open");
	$("#title1").val('');
	
}

//取消按钮
function cancelClick() {
	$CommonUI.getWindow("#drugInfoWin").dialog("close");	
}


//导入订单
function importOrder(){
	$('#importDialog').dialog('open');
}