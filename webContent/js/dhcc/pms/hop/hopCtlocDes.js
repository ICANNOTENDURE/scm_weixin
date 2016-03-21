$(function (){
	$("#orderUpload").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/hop/hopCtlocDestinationCtrl!upload.htm',
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
        		//$("#importDialog").dialog('close');
        		$("#err").html(obj.msg);
        		$CommonUI.alert("导入成功");
        	}else{
        		$CommonUI.alert("失败");
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
	
	//获取下拉科室的所有下拉框
	var ctlocCombox=[$CommonUI.getComboBox('#comboCtloc'),$CommonUI.getComboBox('#ctlocDesDr')];
	for(var i=0;i<ctlocCombox.length;i++){
		ctlocCombox[i].combobox({
			url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!findHopLocComboxVos.htm',
			valueField:'id',							
			textField:'name'	
		});
	}

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

function importOrder(){
	$('#importDialog').dialog('open');
	$('#impModel').html("");
		$('#impModel').append("<td class='time'>模版 </td>");
		$.post(
			$WEB_ROOT_PATH+"/sys/sysImpModelCtrl!listImpModel.htm",
			{
				'dto.impModel.type':'HOPCTLOCDESC'
			},
			function(data){
				$.each(data,function(i,dd){
						$('#impModel').append("<td class='drop'><div class='item'>"+dd.name+"</div></td>");
				});
			},
			"json"
		);
}