// zxx 2014-04-19
$(function (){

	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/weixin/mpUserCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    columns:[
            [{"title":"wxMpUserId","field":"wxMpUserId","sortable":false,"hidden":true},{"title":"wxMpOpenId","field":"wxMpOpenId","sortable":false,"hidden":false},{"title":"wxMpSciPointer","field":"wxMpSciPointer","sortable":false,"hidden":false},{"title":"wxMpUnionid","field":"wxMpUnionid","sortable":false,"hidden":false},{"title":"wxMpNickname","field":"wxMpNickname","sortable":false,"hidden":false},{"title":"wxMpSubscribeWxTime","field":"wxMpSubscribeWxTime","sortable":false,"hidden":false},{"title":"wxMpSubscribeSciTime","field":"wxMpSubscribeSciTime","sortable":false,"hidden":false},{"title":"wxMpHeadimgurl","field":"wxMpHeadimgurl","sortable":false,"hidden":false}]
	    ]	 
	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#detail input[name="dto.mpUser.mpUserId"]').val();	
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
		var isValid = $CommonUI.getForm('#detail').form('validate');
		if(!isValid){
			return isValid;
		}
		postReq($WEB_ROOT_PATH+'/weixin/mpUserCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
	});
	
	
	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#selectWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#selectWin').dialog('close');
	});
});

//增加
function addClick() {
	$CommonUI.getDialog("#detailWin").dialog("setTitle","add");
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
	var Id=row.mpUserId;
	var url = $WEB_ROOT_PATH+'/weixin/mpUserCtrl.htm?BLHMI=findById&dto.mpUser.mpUserId='+Id;
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
		$.post($WEB_ROOT_PATH+"/weixin/mpUserCtrl!delete.htm", {'dto.mpUser.mpUserId':row.mpUserId},function(){
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
