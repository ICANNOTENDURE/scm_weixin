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
				    "caption": "各角色人员数量分布图",
				    "showpercentageinlabel": "1",
				    "showvalues": "1",
				    "showlabels": "0",
				    "showlegend": "1",
				    "showpercentvalues": "1"
				  },
				  "data": [
				    {
				      "value": "500",
				      "label": "院长",
				      "color": "429EAD"
				    },
				    {
				      "value": "1423",
				      "label": "科主任",
				      "color": "D4AC31"
				    },
				    {
				      "value": "1234",
				      "label": "护士长",
				      "color": "4249AD"
				    },
				    {
				      "value": "5000",
				      "label": "护士",
				      "color": "AD42A2"
				    }
				  ]
				};
	var westCenterJson = {
			  "chart": {
				    "caption": "各机构人员数量分布图",
				    "xaxisname": "机构名称",
				    "yaxisname": "人员数量",
				    "numberprefix": "",
				    "useroundedges": "1",
				    "bgcolor": "FFFFFF,FFFFFF",
				    "showborder": "0",
				    "numbersuffix": "人"
				  },
				  "data": [
				    {
				      "label": "华西医院",
				      "value": "25000"
				    },
				    {
				      "label": "市一医院",
				      "value": "35000"
				    },
				    {
				      "label": "市二医院",
				      "value": "42300"
				    },
				    {
				      "label": "省医院",
				      "value": "35300"
				    },
				    {
				      "label": "中医院",
				      "value": "31300"
				    },
				    {
				      "label": "解放军附属医院",
				      "value": "33245"
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
				    "caption": "一天内在线人数统计趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "在线人数",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto",
				    "numbersuffix": "人"
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
				          "label": ""
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "在线人数",
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
				    "caption": "一天内从业人员登录次数统计趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "登录次数",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto",
				    "numbersuffix": "人"
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
				          "label": ""
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "登录次数",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "3545"
				        },
				        {
				          "value": "6034"
				        },
				        {
				          "value": "24347"
				        },
				        {
				          "value": "10665",
				        },
				        {
				          "value": "32231"
				        },
				        {
				          "value": "6007"
				        },
				        {
				          "value": "3004"
				        }
				      ]
				    }
				  ]
				};
	var eastCenterJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "一天内普通用户登录次数统计趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "登录次数",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto",
				    "numbersuffix": "人"
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
				          "label": ""
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "登录次数",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "350"
				        },
				        {
				          "value": "600"
				        },
				        {
				          "value": "800"
				        },
				        {
				          "value": "550",
				        },
				        {
				          "value": "1000"
				        },
				        {
				          "value": "620"
				        },
				        {
				          "value": "300"
				        }
				      ]
				    }
				  ]
				};
	
	$CommonUI.initCharts();
	
	$CommonUI.Charts('westNorthView', 'Pie2D', 'westNorth',
			westNorthJson, 'json','100%','100%');
	$CommonUI.Charts('westCenterView', 'Column2D', 'westCenter',
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
				<span id="centerNorth" style="width: 100%; height: 100%;"> </span>
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