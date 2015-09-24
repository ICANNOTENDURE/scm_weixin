<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<style type="text/css">
.userManageMainWest {
	width: 33%;
}

.westNorth {
	height: 290px;
}

.westCenter {
	height: 100%;
}

.userManageMainCenter {
	width: 34%;
}

.centerNorth {
	height: 290px;
}

.centerCenter {
	height: 100%;
}

.userManageMainEast {
	width: 33%;
}

.eastNorth {
	height: 290px;
}

.eastCenter {
	height: 100%;
}
</style>
<script type="text/javascript">
$(function(){
	var westNorthJson = {
			  "chart": {
				    "caption": "数据质量概况",
				    "showpercentageinlabel": "1",
				    "showvalues": "1",
				    "showlabels": "0",
				    "showlegend": "1",
				    "showpercentvalues": "1"
				  },
				  "data": [
				    {
				      "value": "500",
				      "label": "优秀",
				      "color": "429EAD"
				    },
				    {
				      "value": "1423",
				      "label": "良好",
				      "color": "D4AC31"
				    },
				    {
				      "value": "1234",
				      "label": "合格",
				      "color": "4249AD"
				    },
				    {
				      "value": "5000",
				      "label": "不合格",
				      "color": "AD42A2"
				    }
				  ]
				};
	var westCenterJson = {
			  "chart": {
				    "caption": "及时性概况",
				    "showpercentageinlabel": "1",
				    "showvalues": "1",
				    "showlabels": "0",
				    "showlegend": "1",
				    "showpercentvalues": "1"
				  },
				  "data": [
				    {
				      "value": "500",
				      "label": "一般",
				      "color": "429EAD"
				    },
				    {
				      "value": "1423",
				      "label": "及时",
				      "color": "D4AC31"
				    },
				    {
				      "value": "1234",
				      "label": "不及时",
				      "color": "4249AD"
				    }
				  ]
				};
	var centerNorthJson = {
			  "chart": {
				    "manageresize": "1",
				    "caption": "当前在线人数",
				    "origw": "350",
				    "origh": "350",
				    "palette": "3",
				    "bgalpha": "100",
				    "lowerlimit": "0",
				    "upperlimit": "10000",
				    "gaugestartangle": "240",
				    "gaugeendangle": "-60",
				    "gaugeouterradius": "120",
				    "gaugeinnerradius": "60%",
				    "gaugefillratio": "",
				    "basefontcolor": "000000",
				    "tooltipbgcolor": "333333",
				    "tooltipbordercolor": "333333",
				    "decimals": "1",
				    "numbersuffix": "人"
				  },
				  "colorrange": {
				    "color": [
				      {
				        "minvalue": "0",
				        "maxvalue": "2500"
				      },
				      {
				        "minvalue": "2500",
				        "maxvalue": "5000"
				      },
				      {
				        "minvalue": "5000",
				        "maxvalue": "7500"
				      },
				      {
				        "minvalue": "7500",
				        "maxvalue": "10000"
				      }
				    ]
				  },
				  "dials": {
				    "dial": [
				      {
				        "id": "Dial1",
				        "value": "6734",
				        "basewidth": "6",
				        "topwidth": "1",
				        "editmode": "1",
				        "showvalue": "1",
				        "rearextension": "10",
				        "valuey": "270"
				      }
				    ]
				  },
				  "styles": {
				    "definition": [
				      {
				        "type": "font",
				        "name": "valueFont",
				        "bordercolor": "FFFFFF",
				        "bold": "1",
				        "size": "13"
				      }
				    ],
				    "application": [
				      {
				        "toobject": "value",
				        "styles": "valueFont"
				      }
				    ]
				  }
				};
	var centerCenterJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "数据上传数量趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "数据上传数量",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto",
				    "numbersuffix": "条"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "一月"
				        },
				        {
				          "label": "二月"
				        },
				        {
				          "label": "三月"
				        },
				        {
				          "label": "四月"
				        },
				        {
				          "label": "五月"
				        },
				        {
				          "label": "六月"
				        },
				        {
				          "label": ""
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "数据上传数量",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "350"
				        },
				        {
				          "value": "600"
				        },
				        {
				          "value": "2400"
				        },
				        {
				          "value": "1000",
				        },
				        {
				          "value": "3200"
				        },
				        {
				          "value": "600"
				        },
				        {
				          "value": "300"
				        }
				      ]
				    }
				  ]
				};
	var eastNorthJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "数据质量趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "数据质量",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto",
				    "numbersuffix": "分"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "一月"
				        },
				        {
				          "label": "二月"
				        },
				        {
				          "label": "三月"
				        },
				        {
				          "label": "四月"
				        },
				        {
				          "label": "五月"
				        },
				        {
				          "label": "六月"
				        },
				        {
				          "label": ""
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "数据质量",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "89"
				        },
				        {
				          "value": "45"
				        },
				        {
				          "value": "90"
				        },
				        {
				          "value": "85",
				        },
				        {
				          "value": "78"
				        },
				        {
				          "value": "66"
				        },
				        {
				          "value": "89"
				        }
				      ]
				    }
				  ]
				};
	var eastCenterJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "数据及时性趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "数据及时性",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto",
				    "numbersuffix": "分"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "一月"
				        },
				        {
				          "label": "二月"
				        },
				        {
				          "label": "三月"
				        },
				        {
				          "label": "四月"
				        },
				        {
				          "label": "五月"
				        },
				        {
				          "label": "六月"
				        },
				        {
				          "label": ""
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "数据及时性",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "35"
				        },
				        {
				          "value": "60"
				        },
				        {
				          "value": "80"
				        },
				        {
				          "value": "55",
				        },
				        {
				          "value": "95"
				        },
				        {
				          "value": "62"
				        },
				        {
				          "value": "30"
				        }
				      ]
				    }
				  ]
				};
	
	$CommonUI.initCharts();
	
	$CommonUI.Charts('westNorthView', 'Pie2D', 'westNorth',
			westNorthJson, 'json','100%','100%');
	$CommonUI.Charts('westCenterView', 'Pie2D', 'westCenter',
			westCenterJson, 'json','100%','100%');
	
	$CommonUI.Charts('centerNorthView', 'AngularGauge','centerNorth',
			centerNorthJson, 'json','100%','100%','javascript');
	$CommonUI.Charts('centerCenterView', 'MSLine', 'centerCenter',
			centerCenterJson, 'json','100%','100%');
	
	$CommonUI.Charts('eastNorthView', 'MSLine', 'eastNorth',
			eastNorthJson, 'json','100%','100%');
	$CommonUI.Charts('eastCenterView', 'MSLine', 'eastCenter',
			eastCenterJson, 'json','100%','100%');
	
});
</script>
</head>
<body class="layout">

	<div class="userManageMainWest"
		data-options="region:'west',split:false,border:true">
		<div class="layout" data-options="fit:'true'">

			<div class="westNorth"
				data-options="region:'north',split:false,border:true"
				style="overflow: hidden;">
				<span id="westNorth" style="width: 100%; height: 100%;"> </span>
			</div>
			<div class="westCenter"
				data-options="region:'center',split:false,border:true"
				style="overflow: hidden;">
				<span id="westCenter" style="width: 100%; height: 100%;"> </span>
			</div>

		</div>
	</div>

	<div class="userManageMainCenter"
		data-options="region:'center',split:false,border:true">
		<div class="layout" data-options="fit:'true'">

			<div class="centerNorth"
				data-options="region:'north',split:false,border:true"
				style="overflow: hidden;">
				<div style="margin-top: 10px; text-align: center;">
					优秀：24条 [5.06M]<br /> <br /> 良好：61条 [13.02M]<br /> <br /> 合格：41条
					[8.81M]<br /> <br /> 不合格：213条 [45.92M]<br /> <br /> 及时：176条
					[37.97M]<br /> <br /> 一般：123条 [26.46M]<br /> <br /> 不及时：40条 [8.41M]<br />
					<br />
				</div>
			</div>
			<div class="centerCenter"
				data-options="region:'center',split:false,border:true"
				style="overflow: hidden;">
				<span id="centerCenter" style="width: 100%; height: 100%;"> </span>
			</div>

		</div>
	</div>

	<div class="userManageMainEast"
		data-options="region:'east',split:false,border:true">
		<div class="layout" data-options="fit:'true'">

			<div class="eastNorth"
				data-options="region:'north',split:false,border:true"
				style="overflow: hidden;">
				<span id="eastNorth" style="width: 100%; height: 100%;"> </span>
			</div>
			<div class="eastCenter"
				data-options="region:'center',split:false,border:true"
				style="overflow: hidden;">
				<span id="eastCenter" style="width: 100%; height: 100%;"> </span>
			</div>

		</div>
	</div>

</body>
</html>