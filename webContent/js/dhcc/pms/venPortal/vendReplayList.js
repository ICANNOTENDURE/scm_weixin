$(function() {


	
	
	function getIncAdvice(pageNo){
		venincId = $("#venincid").val();
		if(pageNo==undefined){
			pageNo=1;
		}

		$.post(
				$WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!listVenIncAdvice.htm', 
				{
					'dto.venIncAdvice.venIncAdviceIncId' : venincId,
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : 15,
					'dto.replyFlag' : 1
				}, 
				function(data) {
					$("#venReplayList").html("");
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
						
						
						
						if(data.rows[i].replayname==null){
							html=html+"<div class='comment-footer comment-actions'><a class='post-repost' href='javascript:void(0);'><span class='am-icon-mail-reply'></span>回复</a></div>";
							html=html+"<div class='ds-replybox' >";
							html=html+"<a class='ds-avatar'><img src='http://static.duoshuo.com/images/noavatar_default.png'></a>";
							html=html+"<div class='ds-textarea-wrapper ds-rounded-top'>";
							html=html+"<textarea placeholder='说点什么吧…' id='venIncAdviceAsk'></textarea>";
							html=html+"</div>";
							html=html+"<div class='ds-post-toolbar'>";
							html=html+"	<div class='ds-post-options ds-gradient-bg'></div>";
							html=html+"	<button class='ds-post-button' type='button'  data-id='"+data.rows[i].askid+"'>回复</button>";
							html=html+"</div>";
							html=html+"</div>";
						}
						html=html+"</div>";
						html=html+"</div>";
						html=html+"</li>";
					});		
					html=html+"</ul>";
					$("#venReplayList").html(html);
					
					//注册回复事件
					$(".ds-post-button").on('click',function(){
						$btn = $(this);
						$btn.button('loading');
						venIncAdviceId = $(this).attr("data-id");
						venIncAdviceReplay = $(this).parent().parent().find("textarea").val();
						
						$.post($WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!reply.htm', {
							'dto.venIncAdvice.venIncAdviceId' : venIncAdviceId,
							'dto.venIncAdvice.venIncAdviceReplay' : venIncAdviceReplay
						}, function(data) {
							$btn.button('reset');
							if (data.resultCode == "1") {
								add_message("am-btn-success", "回复成功", "");
								$btn.parent().parent().css('display','none');
								html="";
								html=html+"<ol id='ds-ctx'>";
								html=html+"<li class='ds-ctx-entry'>";
								html=html+"<div class='ds-avatar'>";
								html=html+"<img src='http://static.duoshuo.com/images/noavatar_default.png' alt='data.rows[i].replayname'>";
								html=html+"</div>";
								html=html+"<div class='ds-ctx-body'>";
								html=html+"<div class='ds-ctx-head'>";
								//html=html+venIncAdviceReplay+"<a class='ds-time'>"+venIncAdviceReplay+"</a>";
								html=html+"</div>";
								html=html+"<div class='ds-ctx-content'>";
								html=html+venIncAdviceReplay;
								html=html+"</div>";
								
								html=html+"</div>";
								html=html+"</li>";
								html=html+"</ol>";
								$btn.parent().parent().parent().find("p").before(html);
							} else {
								add_message("am-btn-danger", "失败"+ data.resultContent, "");
							}
						}, "json");
					});
					
					
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


