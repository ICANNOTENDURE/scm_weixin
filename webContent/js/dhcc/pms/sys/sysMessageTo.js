$(function (){
	$CommonUI.getDataGrid('#datagrid').datagrid({  
		url:$WEB_ROOT_PATH+'/sys/sysMessageCtrl!listId.htm',
	   //url:$WEB_ROOT_PATH+'/sys/sysMessageCheckCtrl!list.htm',
		iconCls:'',//图标
	    method:'post',
	    fit:true,
	    columns:[
            [{"title":"messageId","field":"messageId","width":50,"sortable":false,"hidden":true},
             {"title":"通知标题","field":"messageTitle","width":50,"sortable":false,"hidden":false},
             {"title":"通知内容","field":"messageContent","width":50,"sortable":false,"hidden":false},
             {"title":"接收类型","field":"messageType","width":50,"sortable":false,formatter: function(value,row,index){
					switch(row.messageType){   
			        case   "1"   :   
			        	return "全部";   
			        case   "2"   :   
			            return "微信";
			        case   "3"   :   
			            return "电脑";
			        default   :   
			            return "空";   
				}
			}
             },
             {"title":"状态","field":"messageStatus","width":50,"sortable":false,"hidden":true},
             {"title":"messageTotype","field":"messageTotype","width":50,"sortable":false,"hidden":true},
             {"title":"发送单位","field":"typedesc","width":50,"sortable":false,"hidden":false},
             {"title":"发送部门类型","field":"messageSendType","width":50,"sortable":false,formatter: function(value,row,index){
					switch(row.messageSendType){   
			        case   "V"   :   
			        	return "供应商";   
			        case   "H"   :   
			            return "医院";
			        case   "S"   :   
			            return "平台";
			        default   :   
			            return "空";   
				}
			}
             },
             {"title":"发送约定日期","field":"messageDate","width":50,"sortable":false,"hidden":false},
             {"title":"创建日期","field":"messageCreatedate","width":50,"sortable":false,"hidden":false},
             {"title":"创建人","field":"messageCreateuser","width":50,"sortable":false,"hidden":true}]
	    ], 
	    //queryParams:{
	    	//"dto.ordStart":$('#StDate').datebox('getValue'),
	    	//"dto.ordEnd":$('#EdDate').datebox('getValue'),
	    //},
	    onClickRow:function(Index, row){
	 	 ClickRowDetails();
		}	 
	});
	$CommonUI.getDataGrid('#datagrid1').datagrid({  
	    url:$WEB_ROOT_PATH+'/sys/sysMessageToCtrl!listId.htm',
	    iconCls:'',//图标
	    method:'post',
	    fit:true,
	    columns:[
            [{"title":"toId","field":"toId","width":50,"sortable":false,"hidden":true},
            {"title":"接收方","field":"retype","width":50,"sortable":false,"hidden":false },
            {"title":"接收单位","field":"typedesc","width":50,"sortable":false,"hidden":false},
            {"title":"toMessageId","field":"tomessageid","width":50,"sortable":false,"hidden":true},
            {"title":"toReadFlag","field":"toReadFlag","width":50,"sortable":false,"hidden":true},
            {"title":"阅读日期","field":"toReaDate","width":50,"sortable":false,"hidden":false},
            {"title":"toWxOpenIdLong","field":"toWxOpenId","width":50,"sortable":false,"hidden":false}]
	    ],
	    onClickRow:function(Index, row){
	 	 ClickRowDetail();
		}	 
	});

	
});

function Queryreceivenews(){
	var rows=$('#datagrid').datagrid('getSelected');
	var Id=row.toMessageId;
	/*$CommonUI.getDataGrid('#datagrid').datagrid('load',{dto})*/
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/sys/sysMessageCtrl!delete.htm", {'dto.sysMessage.messageId':row.messageId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}
//刪除記錄
function delRowg() {
	
	if ($CommonUI.getDataGrid("#datagrid1").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid1").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/sys/sysMessageToCtrl!delete.htm", {'dto.sysMessageTo.toId':row.toId},function(){
			$CommonUI.getDataGrid("#datagrid1").datagrid('reload');
		} );
	});
}


//条件查询提交事件
function selectClick() {
	var json = $CommonUI.loopBlock('#toolbar');
	$("#datagrid").datagrid('load', json);
	
}
function ClickRowDetails(){
	var row =$("#datagrid").datagrid('getSelected');
	var Ids=row.messageId;
	//alert(Ids)
	$CommonUI.getDataGrid('#datagrid1').datagrid({  
	    url:$WEB_ROOT_PATH+'/sys/sysMessageToCtrl!listId.htm?dto.toMessageId='+Ids,
	    iconCls:'',//图标
	    method:'post',
	    fit:true,
	    columns:[
	             [{"title":"toId","field":"toId","width":50,"sortable":false,"hidden":true},
	             {"title":"接收方","field":"retype","width":50,"sortable":false,"hidden":false },
	             {"title":"接收单位","field":"typedesc","width":50,"sortable":false,"hidden":false},
	             {"title":"toMessageId","field":"tomessageid","width":50,"sortable":false,"hidden":true},
	             {"title":"toReadFlag","field":"toReadFlag","width":50,"sortable":false,"hidden":true},
	             {"title":"阅读日期","field":"toReaDate","width":50,"sortable":false,"hidden":false},
	             {"title":"toWxOpenIdLong","field":"toWxOpenId","width":50,"sortable":false,"hidden":false}]
	 	    ]
	});
	
}



//編輯一行记录
function ClickRowDetail() {

	
	var row =$("#datagrid1").datagrid('getSelected');
	var Id=row.tomessageid;
    $CommonUI.getDataGrid('#datagrid').datagrid({  
		url:$WEB_ROOT_PATH+'/sys/sysMessageCtrl!listId.htm?dto.messageId='+Id,
	   //url:$WEB_ROOT_PATH+'/sys/sysMessageCheckCtrl!list.htm',
		iconCls:'',//图标
	    method:'post',
	    fit:true,
	    columns:[
	             [{"title":"messageId","field":"messageId","width":50,"sortable":false,"hidden":true},
	              {"title":"通知标题","field":"messageTitle","width":50,"sortable":false,"hidden":false},
	              {"title":"通知内容","field":"messageContent","width":50,"sortable":false,"hidden":false},
	              {"title":"接收类型","field":"messageType","width":50,"sortable":false,formatter: function(value,row,index){
	 					switch(row.messageType){   
	 			        case   "1"   :   
	 			        	return "全部";   
	 			        case   "2"   :   
	 			            return "微信";
	 			        case   "3"   :   
	 			            return "电脑";
	 			        default   :   
	 			            return "空";   
	 				}
	 			}
	              },
	              {"title":"状态","field":"messageStatus","width":50,"sortable":false,"hidden":true},
	              {"title":"messageTotype","field":"messageTotype","width":50,"sortable":false,"hidden":true},
	              {"title":"发送单位","field":"typedesc","width":50,"sortable":false,"hidden":false},
	              {"title":"发送部门类型","field":"messageSendType","width":50,"sortable":false,formatter: function(value,row,index){
	 					switch(row.messageSendType){   
	 			        case   "V"   :   
	 			        	return "供应商";   
	 			        case   "H"   :   
	 			            return "医院";
	 			        case   "S"   :   
	 			            return "平台";
	 			        default   :   
	 			            return "空";   
	 				}
	 			}
	              },
	              {"title":"发送约定日期","field":"messageDate","width":50,"sortable":false,"hidden":false},
	              {"title":"创建日期","field":"messageCreatedate","width":50,"sortable":false,"hidden":false},
	              {"title":"创建人","field":"messageCreateuser","width":50,"sortable":false,"hidden":true}]
	 	    ]
	});
		

}
