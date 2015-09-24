<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<style type="text/css">
.appLogStaNorth {
	height: 290px;
}

.northWest {
	width: 50%;
}

.northCenter {
	width: 50%;
}

.appLogStaCenter {
	height: 100%;
}
</style>
<script type="text/javascript">
$(function(){
	var northWestJson = {
			  "chart": {
				    "bgcolor": "E9E9E9",
				    "outcnvbasefontcolor": "666666",
				    "caption": "一年内日志审计情况统计趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "日志总数",
				    "showlabels": "1",
				    "showvalues": "0",
				    "plotfillalpha": "70",
				    "numvdivlines": "10",
				    "showalternatevgridcolor": "1",
				    "alternatevgridcolor": "e1f5ff",
				    "divlinecolor": "e1f5ff",
				    "vdivlinecolor": "e1f5ff",
				    "basefontcolor": "666666",
				    "canvasborderthickness": "1",
				    "showplotborder": "0",
				    "plotborderthickness": "0",
				    "startangx": "7",
				    "endangx": "7",
				    "startangy": "-18",
				    "endangy": "-18",
				    "zgapplot": "20",
				    "zdepth": "60",
				    "exetime": "2",
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
				          "label": "七月"
				        },
				        {
				          "label": "八月"
				        },
				        {
				          "label": "九月"
				        },
				        {
				          "label": "十月"
				        },
				        {
				          "label": "十一月"
				        },
				        {
				          "label": "十二月"
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "审计通过日志",
				      "color": "B1D1DC",
				      "plotbordercolor": "B1D1DC",
				      "renderas": "Area",
				      "data": [
				        {
				          "value": "27400"
				        },
				        {
				          "value": "29800"
				        },
				        {
				          "value": "25800"
				        },
				        {
				          "value": "26800"
				        },
				        {
				          "value": "29600"
				        },
				        {
				          "value": "32600"
				        },
				        {
				          "value": "31800"
				        },
				        {
				          "value": "36700"
				        },
				        {
				          "value": "29700"
				        },
				        {
				          "value": "31900"
				        },
				        {
				          "value": "32900"
				        },
				        {
				          "value": "34800"
				        }
				      ]
				    },
				    {
				      "seriesname": "审计未通过日志",
				      "color": "C8A1D1",
				      "plotbordercolor": "C8A1D1",
				      "renderas": "Area",
				      "data": [
				        {
				          "value": "3100"
				        },{
		        		  "value": "1200"
		        		},{
				          "value": "4500"
				        },
				        {
				          "value": "6500"
				        },
				        {
				          "value": "7600"
				        },
				        {
				          "value": "6800"
				        },
				        {
				          "value": "11800"
				        },
				        {
				          "value": "19700"
				        },
				        {
				          "value": "21700"
				        },
				        {
				          "value": "21900"
				        },
				        {
				          "value": "22900"
				        },
				        {
				          "value": "39800"
				        }
				      ]
				    }
				  ]
				};
	var northCenterJson = {
			  "chart": {
				    "caption": "一年内日志种类统计趋势图",
				    "xaxisname": "统计时间",
				    "yaxisname": "日志总数",
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
				          "label": "七月"
				        },
				        {
				          "label": "八月"
				        },
				        {
				          "label": "九月"
				        },
				        {
				          "label": "十月"
				        },
				        {
				          "label": "十一月"
				        },
				        {
				          "label": "十二月"
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "错误日志",
				      "color": "008040",
				      "anchorbordercolor": "008040",
				      "data": [
				        {
				          "value": "35000"
				        },
				        {
				          "value": "60000"
				        },
				        {
				          "value": "24000"
				        },
				        {
				          "value": "10000"
				        },
				        {
				          "value": "32000"
				        },
				        {
				          "value": "60000"
				        },
				        {
				          "value": "30000"
				        },
				        {
				          "value": "30070"
				        },
				        {
				          "value": "35000"
				        },
				        {
				          "value": "31100"
				        },
				        {
				          "value": "30220"
				        },
				        {
				          "value": "31030"
				        }
				      ]
				    },
				    {
				      "seriesname": "警告日志",
				      "color": "800080",
				      "anchorbordercolor": "800080",
				      "data": [
				        {
				          "value": "27400"
				        },
				        {
				          "value": "29800"
				        },
				        {
				          "value": "25800"
				        },
				        {
				          "value": "26800"
				        },
				        {
				          "value": "29600"
				        },
				        {
				          "value": "32600"
				        },
				        {
				          "value": "31800"
				        },
				        {
				          "value": "36700"
				        },
				        {
				          "value": "29700"
				        },
				        {
				          "value": "31900"
				        },
				        {
				          "value": "32900"
				        },
				        {
				          "value": "34800"
				        }
				      ]
				    },
				    {
				      "seriesname": "正常日志",
				      "color": "FFFF00",
				      "anchorbordercolor": "FFFF00",
				      "data": [
				         {
						    "value": "3100"
						  },{
							  "value": "1200"
							},{
						    "value": "4500"
						  },
						  {
						    "value": "6500"
						  },
						  {
						    "value": "7600"
						  },
						  {
						    "value": "6800"
						  },
						  {
						    "value": "11800"
						  },
						  {
						    "value": "19700"
						  },
						  {
						    "value": "21700"
						  },
						  {
						    "value": "21900"
						  },
						  {
						    "value": "22900"
						  },
						  {
						    "value": "39800"
						  }
				      ]
				    }
				  ]
				};
	
	var centerCenterJson =  {
			  "chart": {
				    "caption": "各个业务系统日志种类统计柱状图",
				    "xaxisname": "业务系统名称",
				    "yaxisname": "日志总数",
				    "canvasbgcolor": "FEFEFE",
				    "canvasbasecolor": "FEFEFE",
				    "tooltipbgcolor": "DEDEBE",
				    "tooltipborder": "889E6D",
				    "divlinecolor": "999999",
				    "showcolumnshadow": "0",
				    "divlineisdashed": "1",
				    "divlinedashlen": "1",
				    "divlinedashgap": "2",
				    "numbersuffix": "条"
				  },
				  "categories": [
				    {
				      "category": [
				        {
				          "label": "统一运维及安全管理平台"
				        },
				        {
				          "label": "卫生综合管理"
				        },
				        {
				          "label": "居民健康卡管理平台权限"
				        },
				        {
				          "label": "基层医疗卫生服务平台权限"
				        },
				        {
				          "label": "区域协同平台权限"
				        }
				      ]
				    }
				  ],
				  "dataset": [
				    {
				      "seriesname": "错误日志",
				      "color": "A66EDD",
				      "data": [
				        {
				          "value": "44"
				        },
				        {
				          "value": "80"
				        },
				        {
					       "value": "23"
					    },
				        {
						   "value": "60"
				        },
				        {
					       "value": "80"
				        }
				      ]
				    },
				    {
				      "seriesname": "警告日志",
				      "color": "F6BD0F",
				      "data": [
				        {
				          "value": "43"
				        },
				        {
				          "value": "60"
				        },
				        {
				          "value": "75"
				        },
				        {
				          "value": "90"
				        },
				        {
				          "value": "98"
				        }
				      ]
				    },
				    {
				      "seriesname": "正常日志",
				      "color": "B1D1DC",
				      "data": [
				        {
				          "value": "60"
				        },
				        {
				          "value": "56"
				        },
				        {
				          "value": "75"
				        },
				        {
				          "value": "45"
				        },
				        {
				          "value": "90"
				        }
				      ]
				    }
				  ]
				};
	
	$CommonUI.initCharts();
	
	$CommonUI.Charts('northWestView', 'MSCombi3D', 'northWest',
			northWestJson, 'json','100%','100%');
	$CommonUI.Charts('northCenterView', 'MSLine','northCenter',
			northCenterJson, 'json','100%','100%','javascript');
	
	$CommonUI.Charts('centerCenterView', 'MSColumn2D', 'centerCenter',
			centerCenterJson, 'json','100%','100%');
	
});
</script>
</head>
<body class="layout">

	<div class="appLogStaNorth"
		data-options="region:'north',split:false,border:true">
		<div class="layout" data-options="fit:'true'">

			<div class="northWest"
				data-options="region:'west',split:false,border:true"
				style="overflow: hidden;">
				<span id="northWest" style="width: 100%; height: 100%;"> </span>
			</div>
			<div class="northCenter"
				data-options="region:'center',split:false,border:true"
				style="overflow: hidden;">
				<span id="northCenter" style="width: 100%; height: 100%;"> </span>
			</div>

		</div>
	</div>

	<div class="appLogStaCenter"
		data-options="region:'center',split:false,border:true">
		<span id="centerCenter" style="width: 100%; height: 100%;"> </span>
	</div>

</body>
</html>