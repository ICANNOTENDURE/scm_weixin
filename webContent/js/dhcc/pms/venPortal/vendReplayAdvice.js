$(function() {

	function getVenIncAdviceList(pageNo){
		if(pageNo==undefined){
			pageNo=1;
		}

		$.post(
				$WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!getVenIncAdviceList.htm', 
				{
					'dto.pageModel.pageNo' : pageNo,
					'dto.pageModel.pageSize' : 15
				}, 
				function(data) {
					$("#venIncAdviceList").html("");
					var html="";

					$.each(data.rows, function (i) {
						html=html+"<tr><td>"+i+"</td>";
						html=html+"<td>"+data.rows[i].incname+"</td>";
						html=html+"<td>"+data.rows[i].price+"</td>";
						html=html+"<td>"+data.rows[i].uom+"</td>";
						//html=html+"<td>"+data.rows[i].spec+"</td>";
						state="";
						if(i==0){
							state="am-badge-danger";
						}
						if(i==1){
							state="am-badge-warning";
						}
						if(i==2){
							state="am-badge-primary";
						}
						if(i==3){
							state="am-badge-secondary";
						}
						if(i==4){
							state="am-badge-success";
						}
						html=html+"<td><span class='am-badge "+state+"'>"+data.rows[i].qty+"</span></td>";
						
						html=html+"<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><button class='am-btn am-btn-default am-btn-xs am-text-secondary' onclick='goReply("+data.rows[i].inc+")'><span class='am-icon-pencil-square-o'></span>回复</button></div></div></td></tr>";
					});		
					$("#venIncAdviceList").html(html);
					
					//分页
					$("#venIncAdviceListPage").html("");
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
					$("#venIncAdviceListPage").html(pageHtml);
					$("#venIncAdviceListPage").find("select").on("change", function(){
						getVenIncAdviceList($(this).val());
					});
					$("#venIncAdviceListPage .am-pagination-prev").on("click", function(){
						curPageNo=parseInt($("#venIncAdviceListPage").find("select").val());
						if(curPageNo==1){
							return;
						}
						getVenIncAdviceList(curPageNo-1);
					});
					$("#venIncAdviceListPage .am-pagination-next").on("click", function(){
						curPageNo=parseInt($("#venIncAdviceListPage").find("select").val());
						if(curPageNo==pageCount){
							return;
						}
						getVenIncAdviceList(curPageNo+1);;
					});
				}, 
				"json");
		}
	
	
	getVenIncAdviceList(1);

});

function goReply(inc){
	window.open($WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!vendReplayList.htm?dto.venIncAdvice.venIncAdviceIncId='+inc);
}

