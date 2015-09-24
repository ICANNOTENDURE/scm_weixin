$(function() {
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
		 
	 
	  
	  //查看物流
	  $('#orderSection').find('.am-text-secondary').click(function(e){
		  var top=e.clientY+document.body.scrollTop-30;
		  var left=e.clientX-465;
		  var html="<div class='am-alert am-alert-primary' data-am-alert id='myDivShow' style='left:"+left+"px;top:"+top+"px;position:absolute;width600px;height;300px'>";
		  html=html+"<button type='button' class='am-close'>&times;</button>";
		  html=html+"</div>";
		  var htmltable="<table class='am-table' id='deliverTable'>";
			  htmltable=htmltable+"<thead><tr><th class='table-author'>状态</th><th class='table-author'>执行人</th><th class='table-date am-hide-sm-only'>执行时间</th><th class='table-date am-hide-sm-only'>电话</th><th class='table-author'>备注</th></tr></thead>";
		  	  htmltable=htmltable+"<tbody>";
		  	  htmltable=htmltable+"</tbody></table>";
      
		  var id=$(e.target).attr("id");
		  $("#myDivShow").each(function(){
			  $(this).remove();
		  });
		  $('body').append(html);
		  $("#myDivShow").append(htmltable);
		  $.post(getContextPath()+ '/nur/nurseCtrl!getOrderStateById.htm',
			{'dto.orderStateDto.exeState.ordId' :id},function(data){
				for(var i=0;i<data.length;i++){
					 $("#deliverTable").find("tbody").append("<tr><td>"+data[i].statedesc+"</td><td>"+data[i].exeuser+"</td><td>"+data[i].exedate+"</td><td>"+data[i].tel+"</td><td>"+data[i].remark+"</td><tr>");
				}
			},"json"	  
		  );  
	  });
	  
	//评价
	$('#orderSection').find('.am-text-warning').click(function(e){
		  orderId=$(e.target).attr("id");
		  
		  $("#dhcc-popup-comment").modal('toggle');
		  $("#commentFrame")[0].src=getContextPath() + '/comment/CommentCtrl!listMain.htm?dto.evalute.orderId='+orderId;
		 
	 });
	//查看评价
	$('#orderSection').find('.am-text-primary').click(function(e){
		  orderId=$(e.target).attr("id");
		 
		  $("#dhcc-popup-comment").modal('toggle');
		  $("#commentFrame")[0].src=getContextPath() + '/comment/CommentCtrl!listMain.htm?dto.evalute.orderId='+orderId+"&dto.id="+1;
		  
		 
	 });
	$('#orderSection').find('.am-text-danger').add('#doc-confirm-toggle').
 	on('click', function() {
 		$("#dhcc-confirm").find(".am-modal-hd").html("收货提示");
 		$("#dhcc-confirm").find(".am-modal-bd").html("确认要收货吗?");
   		$('#dhcc-confirm').modal({
     		relatedTarget: this,
     		onConfirm: function(options) {
     			$('#dhcc-modal-loading').modal({closeViaDimmer:false});
       			var detailsId = $(this.relatedTarget).attr('id');
       			$.post(
							getContextPath()+ '/nur/nurseCtrl!cmpOrder.htm',
							{
								'dto.orderIdStr' : detailsId
							}, 
							function(data) {
								$('#dhcc-modal-loading').modal('close');
								if (data.resultCode == "1") {
									$("#alert-message").html("确认成功");
									$("#dhcc-alert").modal('toggle');
									window.location.href=getContextPath()+ "/nur/nurseCtrl!nurseOrder.htm";
								} else {
									$("#alert-message").html(data.resultContent);
									$("#dhcc-alert").modal('toggle');
								}
							}, 
							"json"
					);
     		},
     		onCancel: function() {
       			//alert('算求，不弄了');
     		}
   });
 });
	
	
	//删除订单input[name='checkbox']
	$('#orderSection').find("table .am-btn-default").
 	on('click', function() {
 		var type=$(this).attr("data-type");
 		var alertType="";
 		var alertmessage="";
 		var alertTitle="提示";
 		if(type=="remove"){
 			alertType="#dhcc-confirm";
 			alertmessage="确认要删除吗?";
 		}
 		if(type=="cmp"){
			alertType="#dhcc-confirm";
			alertmessage="确认要收货吗?";
	    }
 		if(type=="retreq"){
 			alertType="#dhcc-prompt";
 			alertmessage="确认要退货吗?<br>那写点原因吧<input type='text' class='am-modal-prompt-input'>";
 		}
 		if(type=="close"){
 			alertType="#dhcc-prompt";
 			alertmessage="确认要取消订单吗?<br>那写点原因吧<input type='text' class='am-modal-prompt-input'>";
 		}
 		$(alertType).find(".am-modal-hd").html(alertTitle);
 		$(alertType).find(".am-modal-bd").html(alertmessage);
   		$(alertType).modal({
     		relatedTarget: this,
     		onConfirm: function(options) {
     			$('#dhcc-modal-loading').modal({closeViaDimmer:false});
       			var detailsId = $(this.relatedTarget).attr('id');
       			var type=$(this.relatedTarget).attr('data-type');
       			var selectBTN=$(this.relatedTarget);
       			var url="";
       			var remark="";
       			if(type=="retreq"){
       	 			url=getContextPath()+ '/nur/nurseCtrl!retReqOrder.htm';
       	 			remark=options.data;
       	 		}
       			if(type=="remove"){
       	 			url=getContextPath()+ '/nur/nurseCtrl!deleteOrderDetail.htm';
       	 		}
       			if(type=="close"){
       	 			url=getContextPath()+ '/nur/nurseCtrl!closeOrder.htm';
       	 			remark=options.data;
       	 		}
       			if(type=="cmp"){
       	 			url=$WEB_ROOT_PATH+ '/nur/nurseCtrl!cmpOrder.htm';
       	 		}
       			$.post(
	       					url,
							{
	       						'dto.orderIdStr' : detailsId,
	       						'dto.remark':remark
							}, 
							function(data) {
								$('#dhcc-modal-loading').modal('close');
								if (data.resultCode == "1") {
									if(type=="remove"){
										$(selectBTN).parent().parent().parent().remove();
									}
									if(type=="retreq"){
										$(selectBTN).parent().parent().prev().html("退货申请");
										$(selectBTN).prev().remove();
										$(selectBTN).remove();
									}
									if(type=="close"){
										$(selectBTN).parent().parent().prev().html("交易关闭");
										$(selectBTN).remove();
									}
									if(type=="cmp"){
										$(selectBTN).parent().parent().prev().html("完成");
										$(selectBTN).remove();
									}
									add_message("am-btn-success","操作成功!","");
								} else {
									$(selectBTN).parent().parent().parent().remove();
									add_message("am-btn-danger","操作失败!"+data.resultContent,"");
								}
							}, 
							"json"
					);
     		},
     		onCancel: function() {
     		}
   		});
 	 });
	

	
	$(".am-accordion-title").on('click', function() {
		//alert(2)
		if (document.body.clientHeight < document.documentElement.clientHeight) {
			//$("#xxx2").removeAttr("style");
			$("#xxx2").css('display','none');
			$("#xxx1").css('display','block');
		} else {
			//$("#xxx1").removeAttr("style");
			$("#xxx2").css('display','block');
			$("#xxx1").css('display','none');
		}
	});
	

});
function checkSelect(obj){
	$(obj).parent().parent().parent().parent().find("input[name='checkbox']").each(function(){
		  $(this).attr("checked",!this.checked);              
	});
}
//批量删除
function batOpSelect(obj){
	 orderNo=$(obj).attr("data-id");
	 var type=$(obj).attr("data-type");
	 var ordArr=[];
	 $('#'+orderNo).find("input[name='checkbox']").each(function(){
		 if($(this).attr("checked")=="checked"){
			 //删除
			 if(type=="remove"){
				 if($(this).attr("data-state")==1){
					 ordArr.push($(this).attr("data-id"));
				 }
			 }
			 //退货申请
			 if(type=="retreq"){
				 if($(this).attr("data-state")==3){
					 ordArr.push($(this).attr("data-id"));
				 }
			 }
			 //撤销订单
			 if(type=="close"){
				 if($(this).attr("data-state")==2){
					 ordArr.push($(this).attr("data-id"));
				 }
			 }
			 //确认订单
			 if(type=="cmp"){
				 if($(this).attr("data-state")==3){
					 ordArr.push($(this).attr("data-id"));
				 }
			 }
		 }              
	 });
	//再次购买
	 if(type=="buy"){
		 $("input[name='checkbox']").each(function(){
			 if($(this).attr("checked")=="checked"){
				 if($(this).attr("id")!="antiAll"){
					 ordArr.push($(this).attr("data-id"));
				 };
				 
			 }
		 });	 
	 }
	 if(ordArr.length==0){
		 $("#dhcc-alert .am-modal-bd").html("没有可操作的订单");
		 $("#dhcc-alert").modal('toggle');
		 return;
	 }
	 
	 var alertType="";
	 var alertmessage="";
	 var alertTitle="提示";
	 if(type=="buy"){
			alertType="#dhcc-confirm";
			alertmessage="确认要再次购买购买选择项吗?";
	 }
	 if(type=="remove"){
		alertType="#dhcc-confirm";
		alertmessage="确认要删除吗?";
	 }
	 if(type=="cmp"){
			alertType="#dhcc-confirm";
			alertmessage="确认要收货吗?";
	 }
	 if(type=="retreq"){
		alertType="#dhcc-prompt";
		alertmessage="确认要退货吗?<br>那写点原因吧<input type='text' class='am-modal-prompt-input'>";
	 }
	 if(type=="close"){
		alertType="#dhcc-prompt";
		alertmessage="确认要取消订单吗?<br>那写点原因吧<input type='text' class='am-modal-prompt-input'>";
	 }
	 if(ordArr.length>0){
		    $(alertType).find(".am-modal-hd").html(alertTitle);
	 		$(alertType).find(".am-modal-bd").html(alertmessage);
	   		$(alertType).modal({
	     		relatedTarget: obj,
	     		onConfirm: function(options) {
	     			$('#dhcc-modal-loading').modal({closeViaDimmer:false});
	     			var type=$(this.relatedTarget).attr('data-type');
	       			var url="";
	       			var remark="";
	       			if(type=="retreq"){
	       	 			url=$WEB_ROOT_PATH+ '/nur/nurseCtrl!retReqOrder.htm';
	       	 			remark=options.data;
	       	 		}
	       			if(type=="remove"){
	       	 			url=$WEB_ROOT_PATH+ '/nur/nurseCtrl!deleteOrderDetail.htm';
	       	 		}
	       			if(type=="close"){
	       	 			url=$WEB_ROOT_PATH+ '/nur/nurseCtrl!closeOrder.htm';
	       	 			remark=options.data;
	       	 		}
	       			if(type=="cmp"){
	       	 			url=$WEB_ROOT_PATH+ '/nur/nurseCtrl!cmpOrder.htm';
	       	 		}
	       			if(type=="buy"){
	       	 			url=$WEB_ROOT_PATH+ '/nur/nurseCtrl!addShopCartByOrder.htm';
	       	 		}
	       			$.post(
	       						url,
								{
		       						'dto.orderIdStr' : ordArr,
		       						'dto.remark' : remark
								}, 
								function(data) {
									$('#dhcc-modal-loading').modal('close');
									if (data.resultCode == "1") {
										if(type=="buy"){
											add_message("am-btn-success","已成功加入购物车!","");
										}else{
											add_message("am-btn-success","操作成功!",getContextPath()+ "/nur/nurseCtrl!nurseOrder.htm");
										}
									} else {
										add_message("am-btn-danger","操作失败!"+data.resultContent,"");
									}
								}, 
								"json"
						);
	     		},
	     		onCancel: function() {
	     		}
	   		});
	 }
}


