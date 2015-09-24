// zxx 2014-04-19
var pageSize=5;
$(function (){
	function getIncNews(pageNo){
		if(pageNo==undefined){
			pageNo=1;
		}
		
		$.post(
				$WEB_ROOT_PATH + '/hop/hopIncNewsCtrl!list.htm', 
				{
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : pageSize
				}, 
				function(data) {
					$("#newsList").html("");
					var html="";
					$.each(data.rows, function (i) {
						html=html+"<li class='am-g am-list-item-desced'>";
						html=html+"<div class='am-cl'>";
						html=html+"<div class='am-fl'>";
						html=html+"<h3 class='am-list-item-hd'>";
						html=html+parseInt((pageNo-1)*pageSize+parseInt(i)+1)+",<a href='"+$WEB_ROOT_PATH+"/hop/hopIncNewsCtrl!hopIncNewsDetail.htm?dto.hopIncNews.incNewsId="+data.rows[i].newsid+"'>"+data.rows[i].newstitle+"</a>";
						html=html+"</h3>";
						html=html+"</div>";
						html=html+"<div class='am-fr am-text-xs'>";
						html=html+"阅读:"+data.rows[i].readcount+"&nbsp;&nbsp;&nbsp;&nbsp;发布人:"+data.rows[i].username+"&nbsp;&nbsp;&nbsp;&nbsp;时间:"+data.rows[i].newsdate;
						html=html+"</div>";
						html=html+"</div>";

						html=html+"<div class=' am-u-sm-12 am-list-main'>";
						html=html+"	<div class='am-list-item-text' title='"+data.rows[i].newscontent+"'>"+data.rows[i].newscontent+"</div>";
						html=html+"</div>";
						html=html+"</li>";

					});	
					$("#newsList").html(html);
					

					
					
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
						getIncNews($(this).val());
					});
					$("#page .am-pagination-prev").on("click", function(){
						curPageNo=parseInt($("#page").find("select").val());
						if(curPageNo==1){
							return;
						}
						getIncNews(curPageNo-1);
					});
					$("#page .am-pagination-next").on("click", function(){
						curPageNo=parseInt($("#page").find("select").val());
						if(curPageNo==pageCount){
							return;
						}
						getIncNews(curPageNo+1);
					});
				}, 
				"json");
		}
	
	
	getIncNews(1);
});	