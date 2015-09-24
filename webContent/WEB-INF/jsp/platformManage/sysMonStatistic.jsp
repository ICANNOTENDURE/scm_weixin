<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<style type="text/css">
.systemMonStatisticWest {
	width: 30%;
}

.systemMonStatisticCenter {
	width: 70%;
}

.centerNorth {
	height: 290px;
}

.centerCenter {
	height: 50%;
}
</style>
<script type="text/javascript">
$(function(){
	var systemMonJson = {
			  "chart": {
				    "caption": "使用率监控统计",
				    "xaxisname": "统计时间",
				    "yaxisname": "平均使用率 (%)",
				    "canvasbgcolor": "FEFEFE",
				    "canvasbasecolor": "FEFEFE",
				    "tooltipbgcolor": "DEDEBE",
				    "tooltipborder": "889E6D",
				    "divlinecolor": "999999",
				    "showcolumnshadow": "0",
				    "divlineisdashed": "1",
				    "divlinedashlen": "1",
				    "divlinedashgap": "2",
				    "numbersuffix": "%"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "00:00"
				        },
				        {
				          "label": "04:00"
				        },
				        {
				          "label": "08:00"
				        },
				        {
				          "label": "12:00"
				        },
				        {
				          "label": "16:00"
				        },
				        {
				          "label": "20:00"
				        },
				        {
				          "label": "00:00"
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "cpu",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "10"
				        },
				        {
				          "value": "20"
				        },
				        {
					       "value": "23"
					    },
				        {
						   "value": "60"
				        },
				        {
					       "value": "80"
				        },
				        {
					       "value": "50"
				        },
				        {
					       "value": "25"
				        }
				      ]
				    },
				    {
				      "seriesname": "内存",
				      "color": "F6BD0F",
				      "data": [
				        {
				          "value": "10"
				        },
				        {
				          "value": "40"
				        },
				        {
				          "value": "75"
				        },
				        {
				          "value": "90"
				        },
				        {
				          "value": "98"
				        },
				        {
				          "value": "45"
				        },
				        {
				          "value": "35"
				        }
				      ]
				    }
				  ]
				};
	var monStatisticJson = {
			  "chart": {
				    "caption": "使用率监控",
				    "xaxisname": "统计时间",
				    "yaxisname": "使用率(%)",
				    "numdivlines": "9",
				    "linethickness": "2",
				    "showvalues": "0",
				    "numvdivlines": "22",
				    "formatnumberscale": "1",
				    "labeldisplay": "ROTATE",
				    "slantlabels": "1",
				    "anchorradius": "2",
				    "anchorbgalpha": "50",
				    "showalternatevgridcolor": "1",
				    "anchoralpha": "100",
				    "animation": "1",
				    "limitsdecimalprecision": "0",
				    "divlinedecimalprecision": "1",
				    "numbersuffix": "%"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "20:00"
				        },
				        {
				          "label": "20:30"
				        },
				        {
				          "label": "21:00"
				        },
				        {
				          "label": "21:30"
				        },
				        {
				          "label": "22:00"
				        },
				        {
				          "label": "22:30"
				        },
				        {
				          "label": "23:00"
				        },
				        {
				          "label": "23:30"
				        },
				        {
				          "label": "00:00"
				        },
				        {
				          "label": "00:30"
				        },
				        {
				          "label": "01:00"
				        },
				        {
				          "label": "01:30"
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "cpu",
				      "color": "008040",
				      "anchorbordercolor": "008040",
				      "data": [
				        {
				          "value": "35"
				        },
				        {
				          "value": "60"
				        },
				        {
				          "value": "24"
				        },
				        {
				          "value": "10"
				        },
				        {
				          "value": "32"
				        },
				        {
				          "value": "60"
				        },
				        {
				          "value": "30"
				        },
				        {
				          "value": "30"
				        },
				        {
				          "value": "35"
				        },
				        {
				          "value": "31"
				        },
				        {
				          "value": "30"
				        },
				        {
				          "value": "31"
				        }
				      ]
				    },
				    {
				      "seriesname": "内存",
				      "color": "800080",
				      "anchorbordercolor": "800080",
				      "data": [
				        {
				          "value": "27"
				        },
				        {
				          "value": "29"
				        },
				        {
				          "value": "25"
				        },
				        {
				          "value": "26"
				        },
				        {
				          "value": "2"
				        },
				        {
				          "value": "32"
				        },
				        {
				          "value": "31"
				        },
				        {
				          "value": "36"
				        },
				        {
				          "value": "29"
				        },
				        {
				          "value": "31"
				        },
				        {
				          "value": "32"
				        },
				        {
				          "value": "34"
				        }
				      ]
				    }
				  ]
				};
	var systemMonStatisticJson = {
			  "chart": {
				    "caption": "系统信息",
				    "showpercentageinlabel": "1",
				    "showvalues": "1",
				    "showlabels": "0",
				    "showlegend": "1",
				    "showpercentvalues": "1"
				  },
				  "data": [
				    {
				      "value": "60",
				      "label": "cpu",
				      "color": "A66EDD"
				    },
				    {
				      "value": "40",
				      "label": "内存",
				      "color": "F6BD0F"
				    }
				  ]
				};
	$CommonUI.initCharts();
	$CommonUI.Charts('systemMonView', 'MSColumn2D', 'systemMon',
			systemMonJson, 'json','100%','100%');
	$CommonUI.Charts('monStatisticView', 'MSLine', 'monStatistic',
			monStatisticJson, 'json','100%','100%');
	$CommonUI.Charts('systemMonStatisticView', 'Pie2D', 'systemMonStatistic',
			systemMonStatisticJson, 'json','100%','290');
});
</script>
</head>
<body class="layout">

	<div class="systemMonStatisticWest"
		data-options="region:'west',split:false,border:false"
		style="overflow: hidden; background: #EFEFEF;">
		<div class="panel" title="系统信息" data-options="fit:true,closable:false"
			style="background: #EFEFEF;">
			<span id="systemMonStatistic"
				style="width: 100%; height: 100%; border: 0px solid black"> </span>

			<div style="margin-top: 50px; text-align: center;">
				${sysMonitoringDto.sysInfoVo.platformName}<br />
				硬盘大小：${sysMonitoringDto.hardDiskTotal}G<br />
				内存大小：${sysMonitoringDto.ramTotal}G<br /> 网络接口信息(接口名 : IP / 子网掩码)：<br />
				${sysMonitoringDto.name} : ${sysMonitoringDto.address} /
				${sysMonitoringDto.netmask}
			</div>

		</div>
	</div>

	<div class="systemMonStatisticCenter"
		data-options="region:'center',split:false,border:false">
		<div class="layout" data-options="fit:'true'">
			<div class="centerNorth"
				data-options="region:'north',split:false,border:false"
				style="overflow: hidden;">
				<div class="panel" title="使用率统计"
					data-options="fit:true,closable:false,tools:'#toolbarCenterNorth'">
					<span id="systemMon"
						style="width: 100%; height: 100%; border: 0px solid black">
					</span>
				</div>
			</div>
			<div class="centerCenter"
				data-options="region:'center',split:false,border:false"
				style="overflow: hidden;">
				<div class="panel" title="使用率监控"
					data-options="fit:true,closable:false,tools:'#toolbarCenterCenter'">
					<span id="monStatistic"
						style="width: 100%; height: 100%; border: 0px solid black">
					</span>
				</div>
			</div>
		</div>
	</div>

</body>
</html>