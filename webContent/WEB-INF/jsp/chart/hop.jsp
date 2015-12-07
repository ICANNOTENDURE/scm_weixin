<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>
<%@include file="/WEB-INF/jsp/common/jquery.jsp"%>
<%@include file="/WEB-INF/jsp/common/jqueryUI.jsp"%>
<%@include file="/WEB-INF/jsp/common/portal.jsp"%>
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>

<script>
$(function(){
	$('#pp').portal({
		border:false,
		fit:true
	});
});

	</script>
</head>

<body >
		<div id="pp" border="false" style="position:relative">
			<div style="width:75%;">
				<div id="main" title="医院订单发货统计" closable="true" collapsible="true" style="text-align:center;height:300px;" >
				</div>
				<div  id="evalute"  title="医院评价供应商" closable="true" collapsible="true" style="height:300px">
				</div>
			</div>
			<div style="width:25%;">
				<div  id="sub"  title="医院订单供应商分布" closable="true"  collapsible="true" style="text-align:center;height:500px" >
				</div>
				
			</div>
		</div>

	<script type="text/javascript">
    	$.ajaxSettings.async = false;
    	//评价结果
    	var evalueNames=[];  //供应商
    	var evalueValues=[]; // 好评 
    	var evalueValue1s=[]; //
    	var evalueValue2s=[]; //
    	var evalueValue3s=[]; //
    	var evalueValue4s=[]; //
    	//供应商前5名
    	var pieNames=[];
    	var pieDatas=[];
    	var barNames=[];
    	var barValues=[];
    	var barValue1s=[];
    	MaxQty=0;
    	var MaxMonth="";
    	MinQty=0;
    	var MinMonth="";
    	$.post(
    			getContextPath()+'/chart/chartCtrl!listEvalute.htm',

    			function(data){
    				$.each(data.names,function(i){
    					evalueNames.push(data.names[i]);
    					evalueValues.push(parseFloat(data.values[i]));
    					evalueValue1s.push(parseFloat(data.value1s[i]));
    					evalueValue2s.push(parseFloat(data.value2s[i]));
    					evalueValue3s.push(parseFloat(data.value3s[i]));
    					evalueValue4s.push(parseFloat(data.value4s[i]));
  					});
    			},
    			'json'
    	);
    	$.post(
    			getContextPath()+'/chart/chartCtrl!listOrdVenDistribution.htm',

    			function(data){
    				$.each(data.names,function(i){
    					pieNames.push(data.names[i]);
  					});

    				pieDatas=data.chartVOs;
    			},
    			'json'
    	);
    	$.post(
    			getContextPath()+'/chart/chartCtrl!listOrdReqQty.htm',

    			function(data){
    				$.each(data.names,function(i){
    					barNames.push(data.names[i]);
    					barValues.push(parseFloat(data.values[i]));
    					barValue1s.push(parseFloat(data.value1s[i]));
  					});
    				MaxQty=parseFloat(data.maxQty);
    				MaxMonth=data.maxMonth;
    				MinQty=parseFloat(data.minQty);
    				MinMonth=data.minMonth;
    				
    			},
    			'json'
    	);
        // 路径配置
        require.config({
            paths:{ 
                'echarts' : '<%=request.getContextPath()%>/js/esl/echarts',
                'echarts/chart/bar' : '<%=request.getContextPath()%>/js/esl/echarts'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                var myChartSub = ec.init(document.getElementById('sub')); 
                var evalute = ec.init(document.getElementById('evalute')); 
                option = {
                	    title : {
                	        //text: '医院订单发货统计',
                	        subtext: '按月统计'
                	    },
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:['订单数','发货数']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : barNames
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value'
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'订单数',
                	            type:'bar',
                	            data:barValues,
                	            markPoint : {
                	                data : [
                	                    {type : 'max', name: '最大值'},
                	                    {type : 'min', name: '最小值'}
                	                ]
                	            },
                	            markLine : {
                	                data : [
                	                    {type : 'average', name: '平均值'}
                	                ]
                	            }
                	        },
                	        {
                	            name:'发货数',
                	            type:'bar',
                	            data:barValue1s,
                	            markPoint : {
                	                data : [
                	                    {type : 'max', name: '最大值'},
                	                    {type : 'min', name: '最小值'}
                	                ]
                	            },
                	            markLine : {
                	                data : [
                	                    {type : 'average', name : '平均值'}
                	                ]
                	            }
                	        }
                	    ]
                	};
                	                    
        		
                //供应商订单排名
                option2 = {
                	    title : {
                	        //text: '医院订单供应商分布',
                	        subtext: '前5名',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:pieNames
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'供应商订单数',
                	            type:'pie',
                	            radius : '45%',
                	            center: ['50%', '60%'],
                	            data:pieDatas
                	        }
                	    ]
                	};
                //评价结果
                evaluteOption = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:['非常满意', '满意','一般','不满意','很不满意']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    yAxis : [
				        {
				            type : 'category',
				            data : evalueNames
				        }
				    ],
				    series : [
				        {
				            name:'非常满意',
				            type:'bar',
				            stack: '总量',
				            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
				            data:evalueValues
				        },
				        {
				            name:'满意',
				            type:'bar',
				            stack: '总量',
				            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
				            data:evalueValue1s
				        },
				        {
				            name:'一般',
				            type:'bar',
				            stack: '总量',
				            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
				            data:evalueValue2s
				        },
				        {
				            name:'不满意',
				            type:'bar',
				            stack: '总量',
				            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
				            data:evalueValue3s
				        },
				        {
				            name:'很不满意',
				            type:'bar',
				            stack: '总量',
				            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
				            data:evalueValue4s
				        }
				    ]
				};
                // 为echarts对象加载数据 
                myChart.setOption(option);
                myChartSub.setOption(option2); 
                evalute.setOption(evaluteOption);
            }
        );
        function getContextPath(){
        	var strFullPath=window.document.location.href;
        	var strPath=window.document.location.pathname;
        	var pos=strFullPath.indexOf(strPath);
        	var prePath=strFullPath.substring(0,pos);
        	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
        	var basePath = prePath;
        	//if(canBeAccess(prePath + postPath)){
        		basePath = prePath + postPath;
        	//}
        	return basePath;
        }        
    </script>
</body>
</html>