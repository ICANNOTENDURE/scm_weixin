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
			    	"caption": "运维类型次数分布图",
				    "showpercentageinlabel": "1",
				    "showvalues": "1",
				    "showlabels": "0",
				    "showlegend": "1",
				    "showpercentvalues": "0"
				  },
				  "data": [
				    {
				      "label": "系统安装",
				      "value": "30",
				      "color": "429EAD"
				    },
				    {
				      "label": "初始配置",
				      "value": "30",
				      "color": "D4AC31"
				    },
				    {
				      "label": "版本升级",
				      "value": "10",
				      "color": "4249AD"
				    },
				    {
				      "label": "配置修改",
				      "value": "60",
				      "color": "AD42A2"
				    },
				    {
				      "label": "重启系统",
				      "value": "40",
				      "color": "FFFF00"
				    },
				    {
				      "label": "意外停止",
				      "value": "21",
				      "color": "FF0000"
				    }
				  ]
				};
	var westCenterJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "系统意外停止趋势图",
				    "yaxisname": "停止次数",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "5月"
				        },
				        {
				          "label": "6月"
				        },
				        {
				          "label": "7月"
				        },
				        {
				          "label": "8月"
				        },
				        {
				          "label": "9月"
				        },
				        {
				          "label": "10月"
				        },
				        {
					          "label": ""
					    }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "停止次数",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "10"
				        },
				        {
				          "value": "5"
				        },
				        {
				          "value": "3"
				        },
				        {
				          "value": "2",
				        },
				        {
				          "value": "1"
				        },
				        {
				          "value": "0"
				        },
				        {
				          "value": "0"
				        }
				      ]
				    }
				  ]
				};

	var centerNorthJson = {
			"chart": {
			    "yaxisname": "停止次数",
			    "caption": "服务器意外停止次数降序排名分布图",
			    "numberprefix": "",
			    "useroundedges": "1",
			    "bgcolor": "FFFFFF,FFFFFF",
			    "showborder": "0"
			  },
			  "data": [
			    {
			      "label": "应用服务器1号",
			      "value": "11"
			    },
			    {
			      "label": "数据库服务器2号",
			      "value": "7"
			    },
			    {
			      "label": "应用服务器2号",
			      "value": "2"
			    },
			    {
				  "label": "数据库服务器1号",
				  "value": "1"
				},
			    {
			      "label": "应用服务器3号",
			      "value": "0"
			    }
			  ]
			};
	var centerCenterJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "系统重启次数趋势图",
				    "yaxisname": "重启次数",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "5月"
				        },
				        {
				          "label": "6月"
				        },
				        {
				          "label": "7月"
				        },
				        {
				          "label": "8月"
				        },
				        {
				          "label": "9月"
				        },
				        {
				          "label": "10月"
				        },
				        {
					       "label": ""
					    }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "重启次数",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "20"
				        },
				        {
				          "value": "10"
				        },
				        {
				          "value": "4"
				        },
				        {
				          "value": "4",
				        },
				        {
				          "value": "1"
				        },
				        {
				          "value": "1"
				        },
				        {
				          "value": "0"
				        }
				      ]
				    }
				  ]
				};
	var eastNorthJson = {
			"chart": {
			    "yaxisname": "停止次数",
			    "caption": "业务系统意外停止次数降序排名分布图",
			    "numberprefix": "",
			    "useroundedges": "1",
			    "bgcolor": "FFFFFF,FFFFFF",
			    "showborder": "0"
			  },
			  "data": [
			    {
			      "label": "健康浏览器",
			      "value": "9"
			    },
			    {
			      "label": "居民健康服务平台",
			      "value": "5"
			    },
			    {
			      "label": "居民健康卡管理系统",
			      "value": "4"
			    },
			    {
				  "label": "卫生综合管理系统",
				  "value": "2"
				},
			    {
			      "label": "统一运维及安全管理平台",
			      "value": "1"
			    }
			  ]
			};
	var eastCenterJson = {
			  "chart": {
				    "canvaspadding": "10",
				    "caption": "配置修改趋势图",
				    "yaxisname": "配置修改次数",
				    "bgcolor": "F7F7F7, E9E9E9",
				    "numvdivlines": "10",
				    "divlinealpha": "30",
				    "labelpadding": "10",
				    "yaxisvaluespadding": "10",
				    "showvalues": "1",
				    "rotatevalues": "1",
				    "valueposition": "auto"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "5月"
				        },
				        {
				          "label": "6月"
				        },
				        {
				          "label": "7月"
				        },
				        {
				          "label": "8月"
				        },
				        {
				          "label": "9月"
				        },
				        {
				          "label": "10月"
				        },
				        {
					       "label": ""
					    }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "配置修改次数",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "30"
				        },
				        {
				          "value": "10"
				        },
				        {
				          "value": "12"
				        },
				        {
				          "value": "3",
				        },
				        {
				          "value": "4"
				        },
				        {
				          "value": "1"
				        },
				        {
					      "value": "0"
					    }
				      ]
				    }
				  ]
				};
	
	$CommonUI.initCharts();
	
	
	
	
	$CommonUI.Charts('westNorthView', 'Pie2D', 'westNorth',
			westNorthJson, 'json','100%','100%');
	$CommonUI.Charts('westCenterView', 'MSLine', 'westCenter',
			westCenterJson, 'json','100%','100%');
	
	$CommonUI.Charts('centerNorthView', 'Column2D','centerNorth',
			centerNorthJson, 'json','100%','100%','javascript');
	$CommonUI.Charts('centerCenterView', 'MSLine', 'centerCenter',
			centerCenterJson, 'json','100%','100%');
	
	$CommonUI.Charts('eastNorthView', 'Column2D', 'eastNorth',
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