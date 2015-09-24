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
		if($('#hopInc').val()==0){
			add_message("am-btn-warning","请选择商品名称");
			return;
		}
		$.post(
				$WEB_ROOT_PATH + '/chart/chartCtrl!locAmtPriceByDate.htm', 
				{
					'dto.queryType' : $('#queryType').val(),
					'dto.startDate':$('#startDate').val(),
					'dto.endDate':$('#endDate').val(),
					'dto.hopIncId':$('#hopInc').val()
				}, 
				function(data) {
					
					$("#dataList").html("");
					var html="";
					
					var legends=[];
					var series=[];
					$.each(data, function (i) {
						serie=[];
						$.each(data[i].series, function (j) {
							html=html+"<tr>";
							html=html+"<td>"+data[i].category[j]+"</td>";
							html=html+"<td>"+data[i].legend+"</td>";
							html=html+"<td>"+data[i].series[j]+"</td>";
							html=html+"</tr>";
							serie.push(parseFloat(data[i].series[j]));

						});
						legends.push(data[i].legend);

						if(i==0){
							series.push(
									{	name:data[i].legend,
										type:'bar',	
										data:serie,
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
						                         }
						                     }
						                 }
									});
						}else{
							series.push(
									{	name:data[i].legend,
										type:'bar',	
										data:serie,
										 itemStyle: {
						                     normal: {                   // 系列级个性化，横向渐变填充
						                         borderRadius: 5
						                     }
						                 }
									});
						}
						
	
	
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
				            'echarts/chart/bar'
				        ],
				        function (ec) {
				            // 基于准备好的dom，初始化echarts图表
				            var divoption = ec.init(document.getElementById('barDiv'));	
	
				            //柱状图
				          option = {
							   
							    tooltip : {
							        trigger: 'axis'
							    },
							    legend: {
							        data:legends
							    },
							    toolbox: {
							        show : true,
							        feature : {
							            mark : {show: false},
							            dataView : {show: false, readOnly: false},
							            magicType: {show: false, type: ['line', 'bar']},
							            restore : {show: false},
							            saveAsImage : {show: false}
							        }
							    },
							    calculable : true,
							    xAxis : [
							        {
							            type : 'value',
							            boundaryGap : [0, 0.01]
							        }
							    ],
							    yAxis : [
							        {
							            type : 'category',
							            data : data[0].category
							        }
							    ],
							    series : series
							};
				            	                    
				            divoption.setOption(option);
				        }
				    );
				}, 
				"json");
		}
	
	
	
});
