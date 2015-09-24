<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>东华电子商务平台(SCI)</title>
<script type="text/javascript">
var pageSize=2;
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
						html=html+"<li class='am-g am-text-sm am-text-truncate'><a href='"+$WEB_ROOT_PATH+"/hop/hopIncNewsCtrl!hopIncNewsDetail.htm?dto.hopIncNews.incNewsId="+data.rows[i].newsid+"' style='color: black;' title='"+data.rows[i].newstitle+"'>"+data.rows[i].newstitle+"</a></li>";
					});	
					$("#newsList").html(html);
				}, 
				"json");
		}
	
	
	getIncNews(1);
});	
</script>
</head>
<body>
	<div class="am-panel dhcc-panel-mt">
		<div class="am-panel-hd am-cf"
			data-am-collapse="{target: '#collapse-panel-notice'}">
			<span class="am-icon-newspaper-o"></span>&nbsp;医院通知<span
				class="am-fr am-text-sm"><a style="color: white;" href="<%=request.getContextPath()%>/hop/hopIncNewsCtrl!listNewsMain.htm">更多</a>></span>
		</div>
		<div id="collapse-panel-notice" class="am-panel-bd am-collapse am-in">
			<div data-am-widget="list_news"
				class="am-list-news am-list-news-default">
				<div class="am-list-news-bd">
					<ul class="am-list " style="margin-top: 5px; margin: 0, 0, 0, 0" id="newsList">
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>