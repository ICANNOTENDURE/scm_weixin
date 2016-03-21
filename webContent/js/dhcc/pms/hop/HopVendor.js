// zxx 2014-04-19
$(function (){
	$("#orderUpload").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/hop/hopVendorCtrl!upload.htm',
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
	
	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/hop/hopVendorCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    title:'医院供应商',
	    fit:true,
	    columns:[[ 
	        {field:'hopCode',title:'代码',width:100},  
	        {field:'hopName',title:'名称',width:100},
	        {field:'hBusinessRegNo',title:'工商执照注册号/统一社会信用代码',width:100},
	        {field:'hopType',title:'分类',width:100} 
	    ]],
	    pageSize:20,
	    pageList:[20,40,60],
	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#detail input[name="dto.hopVendor.hopVendorId"]').val();	
		if(Id){
			$CommonUI.alert("修改成功");
		}else{
			$CommonUI.alert("增加成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("faile");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		postReq($WEB_ROOT_PATH+'/hop/hopVendorCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
	});
	
	
	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#selectWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#selectWin').dialog('close');
	});
	
		$('#impModel').html("");
 		$('#impModel').append("<td class='time'>模版 </td>");
 		$.post(
 			$WEB_ROOT_PATH+"/sys/sysImpModelCtrl!listImpModel.htm",
 			{
 				'dto.impModel.type':'HOPVENDOR'
 			},
 			function(data){
 				$.each(data,function(i,dd){
 						$('#impModel').append("<td class='drop'><div class='item'>"+dd.name+"</div></td>");
 				});
 			},
 			"json"
 		);
	
});






//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","增加");
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
	var Id=row.hopVendorId;
	var url = $WEB_ROOT_PATH+'/hop/hopVendorCtrl.htm?BLHMI=findById&dto.hopVendor.hopVendorId='+Id;
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
		$.post($WEB_ROOT_PATH+"/hop/hopVendorCtrl!delete.htm", {'dto.hopVendor.hopVendorId':row.hopVendorId},function(){
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

//导入供应商
function exportClick(){
	$('#importDialog').dialog('open');
}
