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
	
	
	$("#searchBtn").on('click',function(){
		getData(1);
	}); 
	function getData(pageNo){
		if(pageNo==undefined){
			pageNo=1;
		}
		$.post(
				$WEB_ROOT_PATH + '/comment/CommentCtrl!ListVenEval.htm', 
				{
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : pageSize,
					'dto.queryValue' : $("#queryValue").val(),
					'dto.queryResult' : $("#queryResult").val(),
					'dto.queryCondition' : $("#queryCondition").val(),
					'dto.queryType' : $("#queryType").val(),
					'dto.startDate':$('#startDate').val(),
					'dto.endDate':$('#endDate').val()
				}, 
				function(data) {
					
					$("#dataList").html("");
					var html="";
					
					var vendorNames=[];
					var ele5=[];
					var ele4=[];
					var ele3=[];
					var ele2=[];
					var ele1=[];
					var radar=[];
					$.each(data.rows, function (i) {
						html=html+"<tr>";
						html=html+"<td>"+data.rows[i].name+"</td>";
						html=html+"<td>"+data.rows[i].value1+"</td>";
						html=html+"<td>"+data.rows[i].pec1+"%</td>";
						html=html+"<td>"+data.rows[i].value2+"</td>";
						html=html+"<td>"+data.rows[i].pec2+"%</td>";
						html=html+"<td>"+data.rows[i].value3+"</td>";
						html=html+"<td>"+data.rows[i].pec3+"%</td>";
						html=html+"<td>"+data.rows[i].value4+"</td>";
						html=html+"<td>"+data.rows[i].pec4+"%</td>";
						html=html+"<td>"+data.rows[i].value5+"</td>";
						html=html+"<td>"+data.rows[i].pec5+"%</td>";
						html=html+"<td><button class='am-btn am-btn-default am-btn-xs am-text-secondary am-btn-block' onclick='refuseVen(this)' data-id="+data.rows[i].id+"><span class='am-icon-pencil-square-o'></span>下架</button></td>";
						html=html+"</tr>";
						vendorNames.push(data.rows[i].name);
						ele5.push(data.rows[i].value5);
						ele4.push(data.rows[i].value4);
						ele3.push(data.rows[i].value3);
						ele2.push(data.rows[i].value2);
						ele1.push(data.rows[i].value1);
						
						radar.push(
						{name:data.rows[i].name,
						value:[data.rows[i].pec5,data.rows[i].pec4,data.rows[i].pec3,data.rows[i].pec2,data.rows[i].pec1]
						});
	
	
					});	
					$("#dataList").html(html);
					

					
					
					//分页
					$("#page").html("");
					var pageCount=Math.ceil(data.total/pageSize);
					var pageHtml="";
					pageHtml="<ul data-am-widget='pagination' class='am-pagination am-pagination-select'>";
					pageHtml=pageHtml+"<li class='am-pagination-prev'><a>上一页</a></li>";
					pageHtml=pageHtml+"<li class='am-pagination-select'><select >";
					for(var i=1;i<=pageCount;i++){
						if(i==pageNo){
							pageHtml=pageHtml+"<option value="+i+" selected='selected'>"+i+"/"+pageCount+"</option>";
						}else{
							pageHtml=pageHtml+"<option value="+i+">"+i+"/"+pageCount+"</option>";
						};
						
					}	
					pageHtml=pageHtml+"</select></li>";
					pageHtml=pageHtml+"<li class='am-pagination-next'><a >下一页</a></li>";
					pageHtml=pageHtml+"</ul>";
					$("#page").html(pageHtml);
					
					if (document.body.clientHeight < document.documentElement.clientHeight) {
						$("#xxx2").removeAttr("style");
					} else {
						$("#xxx1").removeAttr("style");
					}
					
					$("#page").find("select").on("change", function(){
						getData($(this).val());
					});
					$("#page .am-pagination-prev").on("click", function(){
						curPageNo=parseInt($("#page").find("select").val());
						if(curPageNo==1){
							return;
						}
						getData(curPageNo-1);
					});
					$("#page .am-pagination-next").on("click", function(){
						curPageNo=parseInt($("#page").find("select").val());
						if(curPageNo==pageCount){
							return;
						}
						getData(curPageNo+1);
					});
					
					
					var series=[];

					series.push({
						 name:"非常满意",
		                 type:'bar',
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
		                 },
		                 data:ele5,
		                 markLine : {
		                     data : [
		                         {type : 'average', name : '平均值'},
		                         {type : 'max'},
		                         {type : 'min'}
		                     ]
		                 }
						
					});
					series.push({
						 name:"满意",
		                 type:'bar',
		                 itemStyle: {
		                     normal: {                   // 系列级个性化，横向渐变填充
		                         borderRadius: 5
		                     }
		                 },
		                 data:ele4
						
					});	
					series.push({
						 name:"一般",
		                 type:'bar',

		                 itemStyle: {
		                     normal: {                   // 系列级个性化，横向渐变填充
		                         borderRadius: 5
		                     }
		                 },
		                 data:ele3
						
					});
					series.push({
						 name:"不满意",
		                 type:'bar',

		                 itemStyle: {
		                     normal: {                   // 系列级个性化，横向渐变填充
		                         borderRadius: 5
		                     }
		                 },
		                 data:ele2
						
					});
					series.push({
						 name:"很不满意",
		                 type:'bar',

		                 itemStyle: {
		                     normal: {                   // 系列级个性化，横向渐变填充
		                         borderRadius: 5
		                     }
		                 },
		                 data:ele1,
		                 
						
					});
					

					 // echart
				    require(
				        [
				            'echarts',
				            'echarts/chart/bar',
				            'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
				            'echarts/chart/radar'
				        ],
				        function (ec) {
				            // 基于准备好的dom，初始化echarts图表
				            var evalute = ec.init(document.getElementById('venEval')); 
				            var pie=ec.init(document.getElementById('venEvalPie')); 	
				            //饼状图
				            option = {
				            	    title : {
				            	        text: ' ',
				            	        subtext: ''
				            	    },
				            	    tooltip : {
				            	        trigger: 'axis'
				            	    },
				            	    legend: {
				            	        x : 'center',
				            	        data:vendorNames
				            	    },
				            	    toolbox: {
				            	        show : true,
				            	        feature : {
				            	            mark : {show: false},
				            	            dataView : {show: false, readOnly: false},
				            	            restore : {show: false},
				            	            saveAsImage : {show: false}
				            	        }
				            	    },
				            	    calculable : true,
				            	    polar : [
				            	        {
				            	            indicator : [
				            	                {text : '非常满意', max  : 100},
				            	                {text : '满意', max  : 100},	
				            	                {text : '一般', max  : 100},
				            	                {text : '不满意', max  : 100},
				            	                {text : '很不满意', max  : 100}

				            	            ],
				            	            radius : 130
				            	        }
				            	    ],
				            	    series : [
				            	        {
				            	            name: '供应商评价对比',
				            	            type: 'radar',
				            	            itemStyle: {
				            	                normal: {
				            	                    areaStyle: {
				            	                        type: 'default'
				            	                    }
				            	                }
				            	            },
				            	            data : radar
				            	        }
				            	    ]
				            	};
				            //柱状图
				            evaluteOption = {tooltip : {
				                show: true,
				                trigger: 'item'
				            },
				            legend: {
				                data: ['非常满意','满意','一般','不满意','很不满意']
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
				                    type : 'category',
				                    data :vendorNames
				                }
				            ],
				            yAxis : [
				                {
				                    type : 'value'
				                }
				            ],
				            series : series
				            };
				            evalute.setOption(evaluteOption);
				            pie.setOption(option);
				        }
				    );
				}, 
				"json");
		}
	
	
	
});

function refuseVen(obj){
	hopvenid=$(obj).attr("data-id");
	$.post(
			$WEB_ROOT_PATH+'/hop/hopVendorCtrl!updateAuditFlag.htm',
			{
				'dto.hopVendor.hopVendorId': hopvenid,
				'dto.hopVendor.hopAuditFlag': "N",
			},function(data){
				if(data.resultCode=="1"){
					add_message("am-btn-success","操作成功","");
				}else{
					add_message("am-btn-danger","操作失败","");
				}
			},'json'
	);
}
