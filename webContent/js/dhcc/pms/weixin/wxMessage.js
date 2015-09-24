
// zxx 2014-04-19
var KE;
$(function() {

	$CommonUI.getDataGrid('#datagrid').datagrid({
		url : $WEB_ROOT_PATH + '/weixin/wxMessageCtrl!list.htm',
		iconCls : 'icon-edit',// 图标
		method : 'post',
		fit : true,
		columns : [ [ {
			field : 'ck1',
			checkbox : true
		}, {
			"title" : "wxMessageId",
			"field" : "wxMessageId",
			"sortable" : false,
			"hidden" : true
		}, {
			"title" : "标题",
			"field" : "wxMessageTitle",
			"sortable" : false,
			"hidden" : false,
			'width' : 50
		}, {
			"title" : "内容",
			"field" : "wxMessageContent",
			"sortable" : false,
			"hidden" : true,
			'width' : 150
		}, {
			"title" : "日期",
			"field" : "wxMessageDate",
			"sortable" : false,
			"hidden" : false,
			'width' : 50
		}, {
			"title" : "接收范围",
			"field" : "wxMessageToPartyId",
			"sortable" : false,
			"hidden" : false,
			'width' : 50
		} ] ]
	});

	// 新增或更新成功的回调函数
	function succ(data) {
		var Id = $('#detail input[name="dto.wxMessage.wxMessageId"]').val();
		if (Id) {
			$CommonUI.alert("修改成功");
		} else {
			$CommonUI.alert("增加成功");
		}
		$("#datagrid").datagrid('reload');
		$("#detailWin").dialog('close');
	}

	// 新增或更新失败的回调函数
	function err(xhr, textStatus, errorThrown) {
		$CommonUI.alert("faile");
	}

	// 新增和修改
	$("#submitBtn").on(
			'click',
			function() {
				var isValid = $CommonUI.getForm('#detail').form('validate');
				if (!isValid) {
					return isValid;
				}
				KE.sync('content');
				postReq($WEB_ROOT_PATH + '/weixin/wxMessageCtrl!save.htm',
						"#detail", succ, err, {
							skipHidden : false
						});
			});

	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		var json = $CommonUI.loopBlock('#selectWin');
		$("#datagrid").datagrid('load', json);
		$CommonUI.getDialog('#selectWin').dialog('close');
	});
	

	
	$("#Upload").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/weixin/wxMessageCtrl!upload.htm',
        //在浏览窗口底部的文件类型下拉菜单中显示的文本
        'buttonText':'上传',
        'fileTypeDesc': '支持的格式：',
        'fileTypeExts': '*.jpg;*.jpeg;*.png',
        'fileSizeLimit': '30MB',
        'width': '60',
        'height': '20',
        'debug' : false,
        'fileObjName':'dto.upload',
        'auto': true,
        'removeCompleted':true,
        'onUploadStart': function(file) {
        	$("#Upload").uploadify("settings", 'formData', {'dto.uploadFileName': file.name,'dto.type': 1,'dto.wxMessage.wxMessageId': $("#saveOrUpdateTable input[name='dto.wxMessage.wxMessageId']").val()});
        },
        //上传成功
        'onUploadSuccess':function(file, data, response){
        	var obj=eval('('+data+')');
        	if(obj.resultCode=="0"){
        		$('#imgTr').remove();
        		if(isNullOrEmpty($("#saveOrUpdateTable input[name='dto.wxMessage.wxMessagePicUrl']").val()!="")==false){
					imgUrl=$WEB_ROOT_PATH +"/uploadWeixin/"+obj.resultContent;
					html="<tr id='imgTr' ><td class='textLabel'>标题图片:</td><td ><img src='"+imgUrl+"' width=105px></img>";
					html=html+"<div><a class='dhc-linkbutton l-btn l-btn-plain'  onclick='javascript:viewPic()' ><span class='l-btn-left'><span class='l-btn-text icon-search l-btn-icon-left'>预览</span></span></a>";
					html=html+"<div id='showPic' src='"+imgUrl+"' style='float:left'></div></td>";
					$('#PicTr').after(html);
				}
        	}else{
        		$CommonUI.alert(obj.resultCotent);
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
	
	KE=KindEditor.create('textarea[name="dto.wxMessage.wxMessageContent"]', {
		uploadJson : $WEB_ROOT_PATH + '/weixin/wxMessageCtrl!upload.htm?dto.type=2',
		extraFileUploadParams:{'dto.wxMessage.wxMessageId':$("#saveOrUpdateTable input[name='dto.wxMessage.wxMessageId']").val()},
		afterCreate : function() {this.loadPlugin('autoheight');},
		afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
	});
	
	$(".panel-tool-max").click();
});

// 增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle", "微信消息推送");
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$CommonUI.getForm('#detail').form('clear');
}

// 編輯一行记录
function editRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	
	$CommonUI.getForm('#detail').form('clear');

	var row = $("#datagrid").datagrid('getSelected');
	var Id = row.wxMessageId;
	var url = $WEB_ROOT_PATH
			+ '/weixin/wxMessageCtrl.htm?BLHMI=findById&dto.wxMessage.wxMessageId='
			+ Id;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle", "修改");
	$.getJSON(url, function(data) {
		$CommonUI.fillBlock('#detailWin', data);
		
		$('#imgTr').remove();
		if(isNullOrEmpty($("#saveOrUpdateTable input[name='dto.wxMessage.wxMessagePicUrl']").val()!="")==false){
			imgUrl= $WEB_ROOT_PATH+"/uploadWeixin/"+$("#saveOrUpdateTable input[name='dto.wxMessage.wxMessagePicUrl']").val();
			html="<tr id='imgTr' ><td class='textLabel'>标题图片:</td><td ><img src='"+imgUrl+"' width=105px></img>";
			html=html+"<div><a class='dhc-linkbutton l-btn l-btn-plain'  onclick='javascript:viewPic()' ><span class='l-btn-left'><span class='l-btn-text icon-search l-btn-icon-left'>预览</span></span></a>";
			html=html+"<div id='showPic' src='"+imgUrl+"' style='float:left'></div></td>";
			$('#PicTr').after(html);
		}
		str=$("#content").val();
		KE.html($("#content").val());
	});
}

// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}

// 刪除記錄
function delRow() {
	var rows = $CommonUI.getDataGrid("#datagrid").datagrid('getSelections');
	if (rows.length < 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}

	$CommonUI.confirm('确定删除吗？', 'question', 0,
			function() {
				var rows = $CommonUI.getDataGrid("#datagrid").datagrid(
						'getSelections');
				var ids = [];
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].wxMessageId);
				}
				$.post($WEB_ROOT_PATH + "/weixin/wxMessageCtrl!delete.htm", {
					'dto.wxMessage.wxMessageId' : ids.join()
				}, function() {
					$CommonUI.getDataGrid("#datagrid").datagrid('reload');
				});
			});
}

// 条件查询提交事件
function selectClick() {
	$CommonUI.getDialog("#selectWin").dialog("center");
	$CommonUI.getDialog("#selectWin").dialog("open");
	$("#title1").val('');
}

// 条件查询取消事件
function selectCanBtClick() {
	$CommonUI.getWindow("#selectWin").dialog("close");
	var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
	$.post($WEB_ROOT_PATH + "/weixin/wxMessageCtrl!delete.htm", {
		'dto.wxMessage.wxMessageId' : row.wxMessageId
	}, function() {
		$CommonUI.getDataGrid("#datagrid").datagrid('reload');
	});
}

function sendClick() {
	var rows = $CommonUI.getDataGrid("#datagrid").datagrid('getSelections');
	if (rows.length < 1) {
		$CommonUI.alert('请选择信息');
		return;
	}

	var ids = [];
	for (var i = 0; i < rows.length; i++) {
		ids.push(rows[i].wxMessageId);
	}
	$.post($WEB_ROOT_PATH + "/weixin/wxMessageCtrl!sendMessage.htm", {
		'dto.wxMessage.wxMessageId' : ids.join()
	}, function(data) {
		if(data.resultCode=="0"){
			$CommonUI.alert("推送成功");
		}else{
			$CommonUI.alert(data.resultContent);
		}
		
	}, 'json');

}

// 分配权限
function selectUsers() {

	$CommonUI.getTree('#saveUsersTree').tree({
		url : $WEB_ROOT_PATH + "/weixin/wxMessageCtrl!getDepart.htm"
	});

	$('#saveUsersDialog').dialog('open');
}
function giveDepart() {

	var departId = "";
	var departName = "";
	var nodes = $CommonUI.getTree('#saveUsersTree').tree('getChecked');
	for (var i = 0; i < nodes.length; i++) {
		departId = departId + nodes[i].id + "|";
		departName = departName + nodes[i].text + ",";
	}
	$("#departName").html(departName);
	$("#saveOrUpdateTable input[name='dto.wxMessage.wxMessageToPartyId']").val(
			departId);
	$('#saveUsersDialog').dialog('close');

}

function viewPic(){
	$CommonUI.imageTransfer("showPic",$WEB_ROOT_PATH+"/js",400,300,{
		'Close':true,
		'Reset':true
	});
}