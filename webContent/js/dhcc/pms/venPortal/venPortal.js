
$(function() {

	$("#IncAdvice").on('click',function(){
		window.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl!vendReplayAdvice.htm';
	});
	$("#send").on('click',function(){
		window.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl!vendorSendOrd.htm';
	});
	$("#newOrder").on('click',function(){
		window.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl!vendorReciveOrd.htm?dto.state=1';
	});
	$("#reqOrder").on('click',function(){
		window.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl!vendorReciveOrd.htm?dto.state=6';
	});
	$("#news").on('click',function(){
		window.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl!vendorReciveOrd.htm?dto.state=6';
	});
	$("#incQty").on('click',function(){
		window.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl!vendorInc.htm';
	});
	function getPortalInfo(){
		$.post(
				$WEB_ROOT_PATH + '/ven/vendorCtrl!getPortalInfo.htm', 
				function(data) {
					//待恢复商品咨询
					$("#IncAdvice .infobox-data-number").html(data.adviceNum);
					$("#adviceRate").html(data.todayAdviceNum);
					//待发货
					$("#send .infobox-data-number").html(data.sendOrderNum);
					//新订单
					$("#newOrder .infobox-data-number").html(data.newOrderNum);
					//退货申请
					$("#reqOrder .infobox-data-number").html(data.reqOrderNum);
					//商品品种数
					$("#incQty .infobox-data-number").html(data.incQtyNum);
				}, 
				"json");
		}
	function getIncNews(pageNo){
		if(pageNo==undefined){
			pageNo=1;
		}
		
		$.post(
				$WEB_ROOT_PATH + '/hop/hopIncNewsCtrl!list.htm', 
				{
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : 2
				}, 
				function(data) {
					$("#newsList").html("");
					var html="";
					$.each(data.rows, function (i) {
						html=html+"<li class='am-g am-text-sm am-text-truncate'><a href='"+$WEB_ROOT_PATH+"/hop/hopIncNewsCtrl!hopIncNewsDetail.htm?dto.hopIncNews.incNewsId="+data.rows[i].newsid+"' style='color: black;' title='"+data.rows[i].newstitle+"'>"+data.rows[i].newstitle+"</a></li>";
					});	
					$("#newsList").html(html);
				}, 
				"json");
		}
	
		// 路径配置
	    require.config({
	        paths:{ 
	            'echarts' : $WEB_ROOT_PATH +'/js/esl/echarts'
	        }
	    });	 	
		$.post(
				 $WEB_ROOT_PATH+'/chart/chartCtrl!venSevenDayAmt.htm',
	
				function(data){
					var Names=[];
			    	var Datas=[];
					$.each(data,function(i){
						Names.push(data[i].name);
						Datas.push(parseFloat(data[i].value));
					});
					
					 // echart
				    require(
				        [
				            'echarts',
				            'echarts/chart/line'
				        ],
				        function (ec) {
				            // 基于准备好的dom，初始化echarts图表
				            var evalute = ec.init(document.getElementById('sevenDay')); 
				 
				            //评价结果
				            option = {
				            	    title : {
				            	        //text: '近七天销售额',
				            	        //subtext: '纯属虚构'
				            	    },
				            	    tooltip : {
				            	        trigger: 'axis'
				            	    },
				            	    legend: {
				            	        data:['单位(元)']
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
				            	            boundaryGap : false,
				            	            data : Names
				            	        }
				            	    ],
				            	    yAxis : [
				            	        {
				            	            type : 'value',
				            	            axisLabel : {
				            	                formatter: '{value} 元'
				            	            }
				            	        }
				            	    ],
				            	    series : [
				            	        {
				            	            name:'单位(元)',
				            	            type:'line',
				            	            data:Datas,
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
				            evalute.setOption(option);
				        }
				    );
				},
				'json'
		);
		
	//热销商品
	$.post(
			$WEB_ROOT_PATH+'/chart/chartCtrl!venOneMonthHotSale.htm',
			function(data){
				$("#hotSale").html("");
				var html="";
				html="<tr><th class='am-text-center'>序号</th><th>商品名称</th><th>订单量</th><th>库存</th><th>操作</th></tr>";
				$.each(data,function(i){
					html=html+"<tr>";
					html=html+"<td class='am-text-center'>"+parseInt(i+1)+"</td>";
					html=html+"<td>"+data[i].incname+"</td>";
					html=html+"<td><span class='am-badge am-badge-success'>"+data[i].orderqty+"</span></td>";
					html=html+"<td><input type='number' value='"+data[i].locqty+"' min='0'/></td>";
					html=html+"<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><button class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='saveIncQty(this)' data-id="+data[i].incid+"><span class='am-icon-pencil-square-o'></span>保存</button></div></div></td></td>";
					html=html+"</tr>";
				});
				$("#hotSale").html(html);
			},
			'json'
	);		 
	getIncNews(1);
	getPortalInfo();

});

function saveIncQty(obj){
	
	inc=$(obj).attr("data-id");
	qty=$(obj).parent().parent().parent().prev().children().val();
	$.post(
			$WEB_ROOT_PATH+'/ven/venIncCtrl!updateQty.htm',{
				'dto.venInc.venIncId':inc,
				'dto.venInc.venIncQty':qty
			},
			function(data){
				if(data.resultCode==1){
					add_message("am-btn-success","操作成功","");
				}else{
					add_message("am-btn-danger","操作失败","");
				}
			},
			'json'
	);	
}

