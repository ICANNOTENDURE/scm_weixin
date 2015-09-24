$(function() {
	if($("#showCommentFlag").val()==1){
		$("#gotoAbout").click();
	}
	$("#minus").click(function() {
		qty = $(this).parent().parent().next().val();
		if (qty > 1) {
			$(this).parent().parent().next().val(qty - 1);
		}
	});
	$("#plus").click(function() {
		qty = $(this).parent().parent().prev().val();
		$(this).parent().parent().prev().val(parseInt(qty) + 1);
	});
	$("#shopCart").click(function() {
		$btn = $(this);
		$btn.button('loading');
		venincId = $("#venincid").val();
		incId = $("#incid").val();
		qty = $("#shopQty").val();
		$.post($WEB_ROOT_PATH + '/nur/nurseCtrl!addShopCart.htm', {
			'dto.ordShopping.shopVenIncid' : venincId,
			'dto.ordShopping.shopIncid' : incId,
			'dto.ordShopping.shopQty' : qty
		}, function(data) {
			$btn.button('reset');
			if (data.resultCode == "1") {
				$("#dhcc-popup").modal('toggle');
			} else {
				$("#alert-message").html(data.resultContent);
				$("#my-alert").modal('toggle');
			}
		}, "json");
	});
	$("#jiesuan").click(
			function() {
				window.location.href = $WEB_ROOT_PATH
						+ "/nur/nurseCtrl!nursePay.htm";
			});
	$("#jixu").click(
			function() {
				window.location.href = $WEB_ROOT_PATH
						+ "/nur/nurseCtrl!nurseManageMain.htm";
			});
	//咨询商品
	$(".ds-post-button").click(
			function() {
				$btn = $(this);
				$btn.button('loading');
				venincId = $("#venincid").val();
				venIncAdviceAsk = $("#venIncAdviceAsk").val();
				$.post($WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!save.htm', {
					'dto.venIncAdvice.venIncAdviceIncId' : venincId,
					'dto.venIncAdvice.venIncAdviceAsk' : venIncAdviceAsk
				}, function(data) {
					$btn.button('reset');
					if (data.resultCode == "1") {
						add_message("am-btn-success", "提问成功", "");
						$("#venIncAdviceAsk").val("");
						getIncAdvice();
					} else {
						add_message("am-btn-danger", "失败"
								+ data.resultContent, "");
					}
				}, "json");
	});
	
	
    // 路径配置
    require.config({
        paths:{ 
            'echarts' : $WEB_ROOT_PATH +'/js/esl/echarts'
        }
    });	 
	
    $.post(
			$WEB_ROOT_PATH + '/comment/CommentCtrl!ListVenIncEvalByIncId.htm', 
			{
				'dto.venIncId' : $("#venincid").val(),
			}, 
			function(data) {
				var radar=[];
				var names=[];
				names.push(data.name);
				radar.push(
						{name:data.name,
						value:[data.avgspeed,data.avgservice,data.avgdescription,data.avgresult]
				});
				// echart
			    require(
			        [
			            'echarts',
			            'echarts/chart/radar'
			        ],
			        function (ec) {
			            // 基于准备好的dom，初始化echarts图表
			            var radardiv=ec.init(document.getElementById('venInfo')); 	
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
			            	        data:names
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
			            	                {text : '发货速度', max  : 5},
			            	                {text : '服务', max  : 5},	
			            	                {text : '商品描述', max  : 5},
			            	                {text : '满意度', max  : 5}

			            	            ],
			            	            radius : 80
			            	        }
			            	    ],
			            	    series : [
			            	        {
			            	        	name: '供应商评价',
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
			            radardiv.setOption(option);
			        }
			    );
			},'json'
	);		
    
	
	function getIncAdvice(pageNo){
		//alert(pageNo)
		venincId = $("#venincid").val();
		if(pageNo==undefined){
			pageNo=1;
		}

		$.post(
				$WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!listVenIncAdvice.htm', 
				{
					'dto.venIncAdvice.venIncAdviceIncId' : venincId,
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : 15
				}, 
				function(data) {
					$("#listAdvice").html("");
					var html="";
					html="<ul class='am-comments-list'>";
			
					$.each(data.rows, function (i) {
						html=html+"<li class='am-comment'><a href='#'><img src='http://static.duoshuo.com/images/noavatar_default.png' class='am-comment-avatar' width='48' height='48'></a>";
						html=html+"<div class='am-comment-main'>";
						html=html+"<header class='am-comment-hd'>";
						html=html+"<div class='am-comment-meta'>";
						html=html+"<a href='#' class='am-comment-author'>"+data.rows[i].askname+"</a>";
						html=html+"发表于<time>"+data.rows[i].askdate+"</time>";
						html=html+"</div>";
						html=html+"</header>";
						html=html+"<div class='am-comment-bd'>";
						if(data.rows[i].replayname!=null){
							html=html+"<ol id='ds-ctx'>";
							html=html+"<li class='ds-ctx-entry'>";
							html=html+"<div class='ds-avatar'>";
							html=html+"<img src='http://static.duoshuo.com/images/noavatar_default.png' alt='data.rows[i].replayname'>";
							html=html+"</div>";
							html=html+"<div class='ds-ctx-body'>";
							html=html+"<div class='ds-ctx-head'>";
							html=html+data.rows[i].replayname+"<a class='ds-time'>"+data.rows[i].replaydate+"</a>";
							html=html+"</div>";
							html=html+"<div class='ds-ctx-content'>";
							html=html+data.rows[i].replay;
							html=html+"</div>";
							
							html=html+"</div>";
							html=html+"</li>";
							html=html+"</ol>";
						}
						
						html=html+"<p>"+data.rows[i].ask+"</p>";
						
						//html=html+"<div class='comment-footer comment-actions'><a class='post-repost' href='javascript:void(0);'><span class='am-icon-mail-reply'></span>回复</a></div>";
						
						html=html+"</div>";
						html=html+"</div>";
						html=html+"</li>";
					});		
					html=html+"</ul>";
					$("#listAdvice").html(html);
					
					//分页
					$("#AdvicePage").html("");
					var pageCount=Math.ceil(data.total/15);
					var pageHtml="";
					pageHtml="<ul data-am-widget='pagination' class='am-pagination am-pagination-select'>";
					pageHtml=pageHtml+"<li class='am-pagination-prev'><a>上一页</a></li>";
					pageHtml=pageHtml+"<li class='am-pagination-select'><select >";
					for(var i=1;i<=pageCount;i++){
						if(i==pageNo){
							pageHtml=pageHtml+"<option value="+i+" selected='selected'>"+i+"/"+pageCount+"</option>";
						}else{
							pageHtml=pageHtml+"<option value="+i+">"+i+"/"+pageCount+"</option>";
						}
						
					}	
					pageHtml=pageHtml+"</select></li>";
					pageHtml=pageHtml+"<li class='am-pagination-next'><a >下一页</a></li>";
					pageHtml=pageHtml+"</ul>";
					$("#AdvicePage").html(pageHtml);
					$("#AdvicePage").find("select").on("change", function(){
						getIncAdvice($(this).val());
					});
					$("#AdvicePage .am-pagination-prev").on("click", function(){
						curPageNo=parseInt($("#AdvicePage").find("select").val());
						if(curPageNo==1){
							return;
						}
						getIncAdvice(curPageNo-1);
					});
					$("#AdvicePage .am-pagination-next").on("click", function(){
						curPageNo=parseInt($("#AdvicePage").find("select").val());
						if(curPageNo==pageCount){
							return;
						}
						getIncAdvice(curPageNo+1);;
					});
				}, 
				"json");
		}
	
	
	getIncAdvice(1);
	
	function getComment(pageNo){
		//alert(pageNo)
		venincId = $("#venincid").val();
		if(pageNo==undefined){
			pageNo=1;
		}

		$.post(
				$WEB_ROOT_PATH + '/comment/CommentCtrl!getIncComment.htm', 
				{
					'dto.venIncId' : venincId,
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : 15
				}, 
				function(data) {
					$("#commentList").html("");
					var html="";
					html="<ul class='am-comments-list'>";
			
					$.each(data, function (i) {
						html=html+"<li class='am-comment'><a href='#'><img src='"+$WEB_ROOT_PATH+"/images/noavatar_default.png' class='am-comment-avatar' width='48' height='48'></a>";
						html=html+"<div class='am-comment-main'>";
						html=html+"<header class='am-comment-hd'>";
						html=html+"<div class='am-comment-meta'>";
						html=html+"<a href='#' class='am-comment-author'>"+data[i].userName+"</a>";
						html=html+"评论于<time>"+data[i].eleDate+"</time>";
						html=html+"</div>";
						html=html+"</header>";
						html=html+"<div class='am-comment-bd'>";
						html=html+"<p>"+data[i].eleContent+"</p>";
						html=html+"</div>";
						html=html+"</div>";
						html=html+"</li>";
					});		
					html=html+"</ul>";
					$("#commentList").html(html);
					
					//分页
					$("#commentPage").html("");
					var pageCount=Math.ceil(data.total/15);
					var pageHtml="";
					pageHtml="<ul data-am-widget='pagination' class='am-pagination am-pagination-select'>";
					pageHtml=pageHtml+"<li class='am-pagination-prev'><a>上一页</a></li>";
					pageHtml=pageHtml+"<li class='am-pagination-select'><select >";
					for(var i=1;i<=pageCount;i++){
						if(i==pageNo){
							pageHtml=pageHtml+"<option value="+i+" selected='selected'>"+i+"/"+pageCount+"</option>";
						}else{
							pageHtml=pageHtml+"<option value="+i+">"+i+"/"+pageCount+"</option>";
						}
						
					}	
					pageHtml=pageHtml+"</select></li>";
					pageHtml=pageHtml+"<li class='am-pagination-next'><a >下一页</a></li>";
					pageHtml=pageHtml+"</ul>";
					$("#commentPage").html(pageHtml);
					$("#commentPage").find("select").on("change", function(){
						getComment($(this).val());
					});
					$("#commentPage .am-pagination-prev").on("click", function(){
						curPageNo=parseInt($("#AdvicePage").find("select").val());
						if(curPageNo==1){
							return;
						}
						getComment(curPageNo-1);
					});
					$("#commentPage .am-pagination-next").on("click", function(){
						curPageNo=parseInt($("#AdvicePage").find("select").val());
						if(curPageNo==pageCount){
							return;
						}
						getComment(curPageNo+1);;
					});
				}, 
				"json");
		}
	
	
	getComment(1);
	
	
});



