<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<link href="<%=request.getContextPath()%>/css/portal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/plugins/jquery.portal.js"></script>  
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>
<style type="text/css">
		.title{
			font-size:16px;
			font-weight:bold;
			padding:20px 10px;
			background:#eee;
			overflow:hidden;
			border-bottom:1px solid #ccc;
		}
		.t-list{
			padding:5px;
		}
</style>
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
	 <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div  id="pp" style="width:800px;height:500px;">
        <div style="width:70%;">
  			<div  id="main" title="Clock"  collapsible="true" closable="true" style="height:300px"></div>
  		</div>
  		<div style="width:30%;">
  			<div  id="sub"  collapsible="true" closable="true" style="height:200px"></div>
  		</div>	
    </div>
    <script type="text/javascript">
    	$.ajaxSettings.async = false;
    	var pieNames=[];
    	var pieDatas=[];
    	var barNames=[];
    	var barValues=[];
    	var barValue1s=[];
    	var MaxQty="";
    	var MaxMonth="";
    	var MinQty="";
    	var MinMonth="";
    	alert(2)
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
    					barValues.push(data.values[i]);
    					barValue1s.push(data.value1s[i]);
  					});
    				MaxQty=data.maxQty;
    				MaxMonth=data.maxMonth;
    				MinQty=data.minQty;
    				MinQty=data.minMonth;
    				
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
                option = {
                	    title : {
                	        text: '医院订单发货统计',
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
                	                    
        		
                
                option2 = {
                	    title : {
                	        text: '医院订单供应商分布',
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
                	            radius : '65%',
                	            center: ['50%', '60%'],
                	            data:pieDatas
                	        }
                	    ]
                	};
                	                    
                // 为echarts对象加载数据 
                myChart.setOption(option);
                myChartSub.setOption(option2); 
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