/**
 * 说明: 应用日志页面js
 * 作者: 于鸿
 * 日期: 2013-09-06
 */

function getYeterdayS(){
	var yesterday_milliseconds=new Date().getTime()-1000*60*60*24;
	var yesterday = new Date();
	yesterday.setTime(yesterday_milliseconds);
	var date=yesterday.format('yyyy-MM-dd');
	var dateTime=date+" 00:00:00";
	return dateTime;
}
function getYeterdayE(){
	var yesterday_milliseconds=new Date().getTime()-1000*60*60*24;
	var yesterday = new Date();
	yesterday.setTime(yesterday_milliseconds);
	var date=yesterday.format('yyyy-MM-dd');
	var dateTime=date+" 23:59:59";
	return dateTime;
}

function clear(){
	 $("#queryTimeForm input").val("");
}

function errApplogAudit(){
	$CommonUI.getWindow('#queryTimeWindow').window({
		title:"查询错误日志审计信息"
	});
	$CommonUI.getWindow('#queryTimeWindow').window("open");
	$('#queryTime_logType').val('3');
	$CommonUI.getDateTimeBox('#queryTime_dealStartTimeS').datetimebox('setValue',getYeterdayS());
	$CommonUI.getDateTimeBox('#queryTime_dealStartTimeE').datetimebox('setValue',getYeterdayE());
	$('#queryTime_btn').unbind("click");
	$("#queryTime_btn").bind("click",function(){
		var json = $CommonUI.loopBlock('#queryTimeForm');
		$("#datagrid").datagrid('load', json);
		$CommonUI.getWindow('#queryTimeWindow').window("close");
	});
}

function warnApplogAudit(){
	$CommonUI.getWindow('#queryTimeWindow').window({  
		title:"查询警告日志审计信息"
	}); 
	$CommonUI.getWindow('#queryTimeWindow').window("open");
	$('#queryTime_logType').val('2');
	$CommonUI.getDateTimeBox('#queryTime_dealStartTimeS').datetimebox('setValue',getYeterdayS());
	$CommonUI.getDateTimeBox('#queryTime_dealStartTimeE').datetimebox('setValue',getYeterdayE());
	$('#queryTime_btn').unbind("click");
	$("#queryTime_btn").bind("click",function(){
		var json = $CommonUI.loopBlock('#queryTimeForm');
		$("#datagrid").datagrid('load', json);
		$CommonUI.getWindow('#queryTimeWindow').window("close");
	});
}

function queryApplogAudit(){
	$CommonUI.getWindow('#queryWindow').window({  
		title:"查询日志审计信息"
	}); 
	$CommonUI.getWindow('#queryWindow').window("open");
	$CommonUI.getDateTimeBox('#query_dealStartTimeS').datetimebox('setValue',getYeterdayS());
	$CommonUI.getDateTimeBox('#query_dealStartTimeE').datetimebox('setValue',getYeterdayE());
	$("#query_btn").bind("click",function(){
		var json = $CommonUI.loopBlock('#queryForm');
		$("#datagrid").datagrid('load', json);
		$CommonUI.getWindow('#queryWindow').window("close");
	});
}

function detailApplogAudit(){
	
}