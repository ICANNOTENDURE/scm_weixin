<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script>  
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>

</head>

<body >
  	<div  id="main" style="height: 300px"></div>

    <script type="text/javascript">
    	$.ajaxSettings.async = false;
    	var barNames=[];
    	var barValues=[];
    	var barValue1s=[];
    	var MaxQty="";
    	var MaxMonth="";
    	var MinQty="";
    	var MinMonth="";

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
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
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
                	                    
        		
                
              
                	                    
                // 为echarts对象加载数据 
                myChart.setOption(option);
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