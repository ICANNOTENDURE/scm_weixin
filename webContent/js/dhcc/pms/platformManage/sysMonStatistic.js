$(function(){
	
	$CommonUI.initCharts();
	$CommonUI.Charts('systemMonView', 'MSColumn2D', 'systemMon',
			'sysMonStatisticCtrl!getCenterNorthJsonChart.htm', 'jsonurl','918','265');
	$CommonUI.Charts('monStatisticView', 'ScrollLine2D', 'monStatistic',
			'sysMonStatisticCtrl!getCenterCenterJsonChart.htm', 'jsonurl','918','207');
	$CommonUI.Charts('systemMonStatisticView', 'Pie2D', 'systemMonStatistic',
			'sysMonStatisticCtrl!getWestJsonChart.htm', 'jsonurl','396','50%');
	
	$("#centerNorthSearch").click(function(){
		$CommonUI.getDialog("#centerNorthWindow").dialog("open");
	});
	$("#centerCenterSearch").click(function(){
		$CommonUI.getDialog("#centerCenterWindow").dialog("open");
	});
	
});

//关闭窗口时清空两张表单
function clear(){
	$("#centerNorthForm input").val("");
	$("#centerCenterForm input").val("");
}












