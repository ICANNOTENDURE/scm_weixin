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
				$WEB_ROOT_PATH + '/chart/chartCtrl!locGroupAmt.htm', 
				{
					'dto.startDate':$('#startDate').val(),
					'dto.endDate':$('#endDate').val()
				}, 
				function(data) {
					
					$("#dataList").html("");
					var html="";
					
					var legends=[];
					var dataGroup=[];
					var dataSubGroup=[];
					var category=[];
					var categoryData=[];
					var categoryShift=[];
					var total=0;
					$.each(data, function (i) {
						
						category.push(data[i].value1);
						categoryData.push(parseFloat(data[i].value));
						total=total+parseFloat(data[i].value);
						if($.inArray(data[i].name, legends)==-1){
							legends.push(data[i].name);
							dataGroup.push({
								value:data[i].value, name:data[i].name
							});
						}else{
							for(var pos in dataGroup){
								   if(dataGroup[pos].name==data[i].name){
									   dataGroup[pos].value=parseFloat(dataGroup[pos].value)+parseFloat(data[i].value);
								   }
								}
						}
						
						legends.push(data[i].value1);
						dataSubGroup.push({
							value:data[i].value, name:data[i].value1
						});
						html=html+"<tr>";
						html=html+"<td>"+data[i].name+"</td>";
						html=html+"<td>"+data[i].value1+"</td>";
						html=html+"<td>"+data[i].value+"</td>";
						html=html+"</tr>";
	
					});	
					
					category.unshift("合计");
					categoryData.unshift(total);
					categoryShift.push(0);
					var currShift=0;
					for(var kk=1;kk<categoryData.length-1;kk++){
						categoryShift.push(categoryData[0]-categoryData[kk]-currShift);
						currShift=currShift+categoryData[kk];
					}
					categoryShift.push(0);
					
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
				            //嵌套饼状图
				            option = {
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
				            	            magicType : {
				            	                show: true, 
				            	                type: ['pie', 'funnel']
				            	            },
				            	            restore : {show: true},
				            	            saveAsImage : {show: true}
				            	        }
				            	    },
				            	    calculable : false,
				            	    series : [
				            	        {
				            	            name:'访问来源',
				            	            type:'pie',
				            	            selectedMode: 'single',
				            	            radius : [0, 70],
				            	            
				            	            // for funnel
				            	            x: '20%',
				            	            width: '40%',
				            	            funnelAlign: 'right',
				            	            max: 1548,
				            	            
				            	            itemStyle : {
				            	                normal : {
				            	                    label : {
				            	                        position : 'inner'
				            	                    },
				            	                    labelLine : {
				            	                        show : false
				            	                    }
				            	                }
				            	            },
				            	            data:dataGroup
				            	        },
				            	        {
				            	            name:'访问来源',
				            	            type:'pie',
				            	            radius : [100, 140],
				            	            
				            	            // for funnel
				            	            x: '60%',
				            	            width: '35%',
				            	            funnelAlign: 'left',
				            	            data:dataSubGroup
				            	        }
				            	    ]
				            	};
				            option2 = {
				            	    title: {
				            	        text: '（单位:元）',
				            	        subtext: '',
				            	        sublink: ' '
				            	    },
				            	    tooltip : {
				            	        trigger: 'axis',
				            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				            	        },
				            	        formatter: function (params) {
				            	            var tar = params[0];
				            	            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
				            	        }
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
				            	    xAxis : [
				            	        {
				            	            type : 'category',
				            	            splitLine: {show:false},
				            	            data : category
				            	        }
				            	    ],
				            	    yAxis : [
				            	        {
				            	            type : 'value'
				            	        }
				            	    ],
				            	    series : [
				            	        {
				            	            name:'辅助',
				            	            type:'bar',
				            	            stack: '总量',
				            	            itemStyle:{
				            	                normal:{
				            	                    barBorderColor:'rgba(0,0,0,0)',
				            	                    color:'rgba(0,0,0,0)'
				            	                },
				            	                emphasis:{
				            	                    barBorderColor:'rgba(0,0,0,0)',
				            	                    color:'rgba(0,0,0,0)'
				            	                }
				            	            },
				            	            data:categoryShift
				            	        },
				            	        {
				            	            name:' ',
				            	            type:'bar',
				            	            stack: '总量',
				            	            itemStyle : { normal: {label : {show: true, position: 'inside'}}},
				            	            data:categoryData
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
