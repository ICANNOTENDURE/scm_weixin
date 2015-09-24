$(function() {
	    var startDate = new Date();
	    dateAdd(startDate,'D',-30);
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
	 
		$('.am-input-group-label').click(function() {
			qty = $(this).parent().find("input").val();
			type = $(this).attr("name");
			newqty = qty;
			if (type == "plus") {
				newqty = parseInt(qty) + 1;

			} else {
				if ((parseInt(qty) - 1) <= 0) {
					return;
				}
				newqty = parseInt(qty) - 1;
			}
			$(this).parent().find("input").val(newqty);
		});
});
function selectItem(obj){
	   planno=$(obj).attr("data-planno");
	   hopincid=$(obj).attr("data-hopincid");
	   planItmId=$(obj).attr("data-planItmId");
	   window.location.href=$WEB_ROOT_PATH+ '/ord/orderPlanCtrl!selectItm.htm?dto.hopIncId='+hopincid+"&dto.planNo="+planno+"&dto.planItmId="+planItmId;
}
function removeSelect(obj){
	$.post(
			getContextPath() + '/ord/orderPlanCtrl!removeOrderPlan.htm', 
			{
				'dto.planItmId' : $(obj).attr("data-planItmId")
			}, 
			function(data) {
				if (data.resultCode == "1") {
					url=window.location.href=$WEB_ROOT_PATH+ '/ord/orderPlanCtrl!listMain.htm?dto.planNo='+data.resultContent;
					add_message("am-btn-success","操作成功!",url);
				} else {
					add_message("am-btn-danger","操作失败!","");
				}
			}, 
			"json"
	);

}
function saveQty(obj){
	$.post(
			getContextPath() + '/ord/orderPlanCtrl!updateOrderPlan.htm', 
			{
				'dto.planItmId' : $(obj).attr("data-planItmId"),
				'dto.planQty' : $(obj).parent().parent().parent().find("input[name='qty']").val()
			}, 
			function(data) {
				if (data.resultCode == "1") {
					add_message("am-btn-success","操作成功!","");
				} else {
					add_message("am-btn-danger","操作失败!","");
				}
			}, 
			"json"
	);

}
function cmpOrderPlan(obj){
	
	 var plandArr=[];
	 var planNo=$(obj).attr("data-id");
	 $('#'+planNo).find("input[name='checkbox']").each(function(){
		 if($(this).attr("checked")=="checked"){
			 if($(this).attr("data-state")!=""){
				 plandArr.push($(this).attr("data-id"));
			 }
		 }              
	 });
	 if(plandArr.length==0){
		 $("#dhcc-alert .am-modal-bd").html("没有可操作的数据");
		 $("#dhcc-alert").modal('toggle');
		 return;
	 }
	$.post(
			getContextPath() + '/ord/orderPlanCtrl!cmpOrderPlan.htm', 
			{
				'dto.planIdStr' : plandArr
			}, 
			function(data) {
				if (data.resultCode == "1") {
					url=window.location.href=$WEB_ROOT_PATH+ '/ord/orderPlanCtrl!listMain.htm'; //?dto.planNo='+data.resultContent;
					add_message("am-btn-success","操作成功!",url);
				} else {
					add_message("am-btn-danger","操作失败!","");
				}
			}, 
			"json"
	);

}

function deleteOrderPlan(obj){
	var plandArr=[];
	var planNo=$(obj).attr("data-id");
	 $('#'+planNo).find("input[name='checkbox']").each(function(){
		 if($(this).attr("checked")=="checked"){
			plandArr.push($(this).attr("data-id"));
		 }              
	 });
	 if(plandArr.length==0){
		 $("#dhcc-alert .am-modal-bd").html("没有可操作的数据");
		 $("#dhcc-alert").modal('toggle');
		 return;
	 }
	$.post(
			getContextPath() + '/ord/orderPlanCtrl!deleteOrderPlan.htm', 
			{
				'dto.planIdStr' : plandArr
			}, 
			function(data) {
				if (data.resultCode == "1") {
					url=window.location.href=$WEB_ROOT_PATH+ '/ord/orderPlanCtrl!listMain.htm'; 
					
					add_message("am-btn-success","操作成功!",url);
				} else {
					add_message("am-btn-danger","操作失败!","");
				}
			}, 
			"json"
	);

}

function checkSelect(obj){
	$(obj).parent().parent().parent().parent().find("input[name='checkbox']").each(function(){
		  $(this).attr("checked",!this.checked);              
	});
}