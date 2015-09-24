$(function() {


	
	
	function getIncAdvice(pageNo){
		if(pageNo==undefined){
			pageNo=1;
		}
		reply=$("#reply").val();
		$.post(
				$WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!getNurIncAdviceList.htm', 
				{
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : 15,
					'dto.replyFlag':reply
				}, 
				function(data) {
					$("#nurReplayList").html("");
					var html="";
					$.each(data.rows, function (i) {
						
						html=html+"<dl class='am-accordion-item am-active'>";
						html=html+"<dt class='am-accordion-title'>商品:"+data.rows[i].incname+"&nbsp;&nbsp;&nbsp;供应商: "+data.rows[i].vendorname+"</dt>";
						html=html+"<dd class='am-accordion-bd am-collapse am-in'>";
						html=html+"<div class='am-accordion-content'>";
						//评价内容
						html=html+"<ul class='am-comments-list'>";
						$.each(data.rows[i].venIncAdvices, function (j) {
							html=html+"<li class='am-comment'><a href='#'><img src='http://static.duoshuo.com/images/noavatar_default.png' class='am-comment-avatar' width='48' height='48'></a>";
							html=html+"<div class='am-comment-main'>";
							html=html+"<header class='am-comment-hd'>";
							html=html+"<div class='am-comment-meta'>";
							html=html+"<a href='#' class='am-comment-author'>我</a>";
							html=html+"发表于<time>"+data.rows[i].venIncAdvices[j].venIncAdviceAskDate+"</time>";
							html=html+"</div>";
							html=html+"</header>";
							html=html+"<div class='am-comment-bd'>";
							
							if(data.rows[i].venIncAdvices[j].venIncAdviceReplayUserId!=null){
								html=html+"<ol id='ds-ctx'>";
								html=html+"<li class='ds-ctx-entry'>";
								html=html+"<div class='ds-avatar'>";
								html=html+"<img src='http://static.duoshuo.com/images/noavatar_default.png' alt='data.rows[i].replayname'>";
								html=html+"</div>";
								html=html+"<div class='ds-ctx-body'>";
								html=html+"<div class='ds-ctx-head'>";
								html=html+data.rows[i].vendorname+"<a class='ds-time'>"+data.rows[i].venIncAdvices[j].venIncAdviceReplayDate+"</a>";
								html=html+"</div>";
								html=html+"<div class='ds-ctx-content'>";
								html=html+data.rows[i].venIncAdvices[j].venIncAdviceReplay;
								html=html+"</div>";
								
								html=html+"</div>";
								html=html+"</li>";
								html=html+"</ol>";
							}
							
							html=html+"<p>"+data.rows[i].venIncAdvices[j].venIncAdviceAsk+"</p>";
							
							html=html+"</div>";
							html=html+"</div>";
							html=html+"</li>";
						});		
						html=html+"</ul>";
						
						html=html+"</div>";
						html=html+"</dd>";
						html=html+"</dl>";
					});	
					$("#nurReplayList").html(html);
					

					
					
					//分页
					$("#page").html("");
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
					$("#page").html(pageHtml);
					$("#page").find("select").on("change", function(){
						getIncAdvice($(this).val());
					});
					$("#page .am-pagination-prev").on("click", function(){
						curPageNo=parseInt($("#page").find("select").val());
						if(curPageNo==1){
							return;
						}
						getIncAdvice(curPageNo-1);
					});
					$("#page .am-pagination-next").on("click", function(){
						curPageNo=parseInt($("#page").find("select").val());
						if(curPageNo==pageCount){
							return;
						}
						getIncAdvice(curPageNo+1);;
					});
				}, 
				"json");
		}
	
	
	getIncAdvice(1);

});


