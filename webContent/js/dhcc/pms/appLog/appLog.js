/**
 * 说明: 应用日志页面js
 * 作者: 于鸿
 * 日期: 2013-09-06
 */
function getYeterdayS(){
	var yesterday_milliseconds=new Date().getTime()-1000*60*60*24;
	var yesterday = new Date();
	yesterday.setTime(yesterday_milliseconds);
	var dateTime=yesterday.format('yyyy-MM-dd HH:mm:ss');
//	var dateTime=date+" 00:00:00";
	return dateTime;
}
function getYeterdayE(){
	var now = new Date();
	var dateTime=now.format('yyyy-MM-dd HH:mm:ss');
	return dateTime;
}

function clear(){
	 $("#queryByTimeForm input").val("");
}

function errAppLog(){
	$CommonUI.getWindow('#queryByTimeWindow').window({
		title:"查询错误日志"
	});
	$CommonUI.getWindow('#queryByTimeWindow').window("open");
	$('#logTypeByTime').val('3');
	
	$CommonUI.getDateTimeBox('#logStartTimeSByTime').datetimebox('setValue',getYeterdayS());
	$CommonUI.getDateTimeBox('#logStartTimeEByTime').datetimebox('setValue',getYeterdayE());
	$('#queryByTimeBtn').unbind("click");
	$("#queryByTimeBtn").bind("click",function(){
		var json = $CommonUI.loopBlock('#queryByTimeForm');
		$("#appLogGrid").datagrid('load', json);
		$CommonUI.getWindow('#queryByTimeWindow').window("close");
	});
}

function warnAppLog(){
	$CommonUI.getWindow('#queryByTimeWindow').window({  
		title:"查询警告日志"
	}); 
	$CommonUI.getWindow('#queryByTimeWindow').window("open");
	$('#logTypeByTime').val('2');
	$CommonUI.getDateTimeBox('#logStartTimeSByTime').datetimebox('setValue',getYeterdayS());
	$CommonUI.getDateTimeBox('#logStartTimeEByTime').datetimebox('setValue',getYeterdayE());
	$('#queryByTimeBtn').unbind("click");
	$("#queryByTimeBtn").bind("click",function(){
		var json = $CommonUI.loopBlock('#queryByTimeForm');
		$("#appLogGrid").datagrid('load', json);
		$CommonUI.getWindow('#queryByTimeWindow').window("close");
	});
}

function queryAppLog(){
	$CommonUI.getWindow('#queryAppLogWindow').window({  
		title:"查询日志"
	}); 
	$CommonUI.getWindow('#queryAppLogWindow').window("open");
	$CommonUI.getDateTimeBox('#logStartTimeS').datetimebox('setValue',getYeterdayS());
	$CommonUI.getDateTimeBox('#logStartTimeE').datetimebox('setValue',getYeterdayE());
	$("#queryAppLogBtn").bind("click",function(){
		var json = $CommonUI.loopBlock('#queryAppLogForm');
		$("#appLogGrid").datagrid('load', json);
		$CommonUI.getWindow('#queryAppLogWindow').window("close");
	});
}