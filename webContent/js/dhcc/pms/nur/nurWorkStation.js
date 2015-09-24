
$(function(){
	$("#IncAdvice .infobox-icon").on('click',function(){
		window.open($WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!nurReplayList.htm?');
	});
	$("#IncAdvice .infobox-data").on('click',function(){
		window.open($WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!nurReplayList.htm?');
	});
	$("#IncAdvice .stat-success").on('click',function(){
		window.open($WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!nurReplayList.htm?dto.replyFlag=1');
	});
	$("#forSend").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=2');
	});
	$("#newOrder").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=1');
	});
	$("#ret .infobox-icon").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=8');
	});
	$("#ret .infobox-data").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=8');
	});
	$("#ret .stat-important").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=7');
	});
	$("#recieve").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=3');
	});
	$("#comment").on('click',function(){
		window.open($WEB_ROOT_PATH + '/nur/nurseCtrl!nurseOrder.htm?dto.ordState=4');
	});
	function getNurPortalInfo(){
		$.post(
				$WEB_ROOT_PATH + '/ven/venIncAdviceCtrl!getNurPortalInfo.htm', 
				function(data) {
					//待恢复商品咨询 AdviceAskNum
					$("#IncAdvice .infobox-data-number").html(data.adviceReplyNum);
					$("#IncAdvice .stat-success").html(data.adviceAskNum);
					//待恢复商品咨询 AdviceAskNum
					$("#forSend .infobox-data-number").html(data.forSendNum);
					//新订单数
					$("#newOrder .infobox-data-number").html(data.newOrderNum);
					//退货申请
					$("#ret .infobox-data-number").html(data.noRetOrderNum);
					//退货数
					$("#ret .stat-important").html(data.retOrderNum);
					//待收货recieve
					$("#recieve .infobox-data-number").html(data.recieveNum);
					//评价
					$("#comment .infobox-data-number").html(data.commentNum);
				}, 
		"json");
	}
	
	getNurPortalInfo();
});