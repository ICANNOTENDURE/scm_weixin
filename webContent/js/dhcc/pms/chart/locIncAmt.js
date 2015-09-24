$(function (){
	 var startDate = new Date();
    dateAdd(startDate,'D',-30);
    var endDate = new Date();
    $('#my-startDate').text(startDate.format("yyyy-MM-dd"));
    $('#my-endDate').text(new Date().format("yyyy-MM-dd"));
    var $alert = $('#my-alert');
    $('#my-start').datepicker().
      on('changeDate.datepicker.amui', function(event) {
        if (event.date.valueOf() > endDate.valueOf()) {
          $alert.find('p').text('开始日期应小于结束日期！').end().show();
        } else {
          $alert.hide();
          startDate = new Date(event.date);
          $('#my-startDate').text($('#my-start').data('date'));
          $('#startDate').val($('#my-start').data('date'));
          //alert($('#startDate').val())
          
        }
        $(this).datepicker('close');
      });

    $('#my-end').datepicker().
      on('changeDate.datepicker.amui', function(event) {
        if (event.date.valueOf() < startDate.valueOf()) {
          $alert.find('p').text('结束日期应大于开始日期！').end().show();
        } else {
          $alert.hide();
          endDate = new Date(event.date);
          $('#my-endDate').text($('#my-end').data('date'));
          $('#endDate').val($('#my-end').data('date'));
        }
        $(this).datepicker('close');
      });
    
    
    // 路径配置
    require.config({
        paths:{ 
            'echarts' : $WEB_ROOT_PATH +'/js/esl/echarts'
        }
    });	 
	
	//$("#vendorId").
    
	$("#searchBtn").on('click',function(){
		getData();
	}); 
	function getData(){

		$.post(
				$WEB_ROOT_PATH + '/chart/chartCtrl!locIncAmt.htm', 
				{
					'dto.startDate':$('#startDate').val(),
					'dto.endDate':$('#endDate').val()
				}, 
				function(data) {
					
					$("#dataList").html("");
					var html="";
					
					var legends=[];
					var series=[];
					$.each(data, function (i) {
						legends.push(data[i].name);
						series.push(parseInt(data[i].value));
						html=html+"<tr>";
						html=html+"<td>"+data[i].name+"</td>";
						html=html+"<td>"+data[i].value+"</td>";
						html=html+"</tr>";
	
					});	
					$("#dataList").html(html);
					if (document.body.clientHeight < document.documentElement.clientHeight) {
						$("#xxx2").removeAttr("style");
					} else {
						$("#xxx1").removeAttr("style");
					}
					 // echart
				    require(
				        [
				         
				            'echarts',
				            'echarts/chart/bar',
				            'echarts/chart/pie'
				        ],
				        function (ec) {
				            // 基于准备好的dom，初始化echarts图表
				            var baroption = ec.init(document.getElementById('barDiv'));	
				            var pieoption = ec.init(document.getElementById('pieDiv'));
				            //柱状图
				            option = {
									title : {
										text : '科室采购商品统计',
										subtext : '单位(元)'
									},
									tooltip : {
										trigger : 'axis'
									},
									legend : {
										data : [ '采购金额' ]
									},
									toolbox : {
										show : true,
										feature : {
											mark : {
												show : true
											},
											dataView : {
												show : true,
												readOnly : false
											},
											magicType : {
												show : true,
												type : [ 'line', 'bar' ]
											},
											restore : {
												show : true
											},
											saveAsImage : {
												show : true
											}
										}
									},
									calculable : true,
									xAxis : [ {
										type : 'category',
										data : legends
									} ],
									yAxis : [ {
										type : 'value'
									} ],
									series : [ {
										name : '订单金额',
										type : 'bar',
										 itemStyle: {
						                     normal: {                   // 系列级个性化，横向渐变填充
						                         borderRadius: 5,
						                         label : {
						                             show : true,
						                             textStyle : {
						                                 fontSize : '20',
						                                 fontFamily : '微软雅黑',
						                                 fontWeight : 'bold'
						                             }
						                         }, color : (function (){
						                             var zrColor = require('zrender/tool/color');
						                             return zrColor.getLinearGradient(
						                                 0, 0, 1000, 0,
						                                 [[0, 'rgba(30,144,255,0.8)'],[1, 'rgba(138,43,226,0.8)']]
						                             )
						                         })()
						                     }
						                 },
										data : series,
										markLine : {
											data : [ {
												type : 'average',
												name : '平均值'
											} ]
										}
									} ]
								};
				          option2 = {
		                	    title : {
		                	        text: ' ',
		                	        subtext: '单位(元)',
		                	        x:'center'
		                	    },
		                	    tooltip : {
		                	        trigger: 'item',
		                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
		                	    },
		                	    legend: {
		                	        orient : 'vertical',
		                	        x : 'left',
		                	        data:legends
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
		                	            name:'商品金额',
		                	            type:'pie',
		                	            radius : '45%',
		                	            center: ['50%', '60%'],
		                	            data:data,
		                	        }
		                	    ]
		                	};	                    
				            baroption.setOption(option);
				            pieoption.setOption(option2);
				        }
				    );
				}, 
				"json");
		}
	
	
	
});
