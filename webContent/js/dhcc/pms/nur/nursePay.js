$(function() {
	
	 	$('#payTable').find('.am-btn').add('#doc-confirm-toggle').
	    	on('click', function() {
	      		$('#dhcc-confirm').modal({
	        		relatedTarget: this,
	        		onConfirm: function(options) {
	          			var shopId = $(this.relatedTarget).attr('id');
	          			var selectBTN=$(this.relatedTarget);
	          			$.post(
								getContextPath()+ '/nur/nurseCtrl!deleteShopCart.htm',
								{
									'dto.orderIdStr' : shopId
								}, 
								function(data) {
									if (data.resultCode == "1") {
										$("#alert-message").html("删除成功");
										$("#dhcc-alert").modal('toggle');
										$(selectBTN).parent().parent().parent().remove();
										setTotal();
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
		$("#goback").click(
				function() {
					window.location.href = getContextPath()+ "/nur/nurseCtrl!nurseManageMain.htm";
		});
		// 单击数量增加和减少的
		$("#payTable").find('.am-input-group-label').click(
				function() {
					var qty = $(this).parent().find("input").val();
					var type = $(this).attr("name");
					var shopid = $(this).parent().attr("name");
					var newqty = qty;
					if (type == "plus") {
						newqty = parseInt(qty) + 1;

					} else {
						if ((parseInt(qty) - 1) <= 0) {
							return;
						}
						newqty = parseInt(qty) - 1;
					}

					var $inputObj = $(this);
					var price = $(this).parent().parent().prev().html();

					$.post(
							getContextPath() + '/nur/nurseCtrl!updateShopCart.htm',
							{
								'dto.ordShopping.shopId' : shopid,
								'dto.ordShopping.shopQty' : newqty
							}, 
							function(data) {
								if (data.resultCode == "1") {
									$inputObj.parent().find("input").val(newqty);
									$inputObj.parent().parent().next().html(newqty.mul(parseFloat(price)));
									setTotal();
								} else {
									$("#alert-message").html(data.resultContent);
									$("#dhcc-alert").modal('toggle');
								}
							}, 
							"json");
			});
		

		$("#pay").click(function() {
			var shopCartList = "";
			$("#payTable input[type=checkbox]").each(function() {
				if ($(this).attr("checked")) {
					shop = $(this).attr("id");
					if (shopCartList == "") {
						shopCartList = shop;
					} else {
						shopCartList = shopCartList + "^" + shop;
					}
				}
			});
			if (shopCartList == "") {
				$("#alert-message").html("请选择明细");
				$("#dhcc-alert").modal('open');
				return;
			}
			if($("#destion").val()==""){
				$("#alert-message").html("请选择收货地址");
				$("#dhcc-alert").modal('open');
				return;
			}
			
			$.post(getContextPath() + '/nur/nurseCtrl!saveOrderDetail.htm', {
				"dto.shopIdStr" : shopCartList,
				"dto.defaultDestion":$("#destion").val()
			}, function(data) {
				if (data.resultCode == "1") {
					//$("#alert-message").html("结算成功");
					//$("#dhcc-alert").modal('toggle');
			 		$("#dhcc-popup-2").find(".am-modal-bd").append("提交成功，订单号:"+data.resultContent);
			   		 
			   		$("#dhcc-popup-2").modal('toggle');
				} else {
					$("#alert-message").html(data.resultContent);
					$("#dhcc-alert").modal('toggle');

				}
			}, "json");
		});

		$("#selectAll").click(function() {
			if ($(this).attr("checked")) {
				$(this).attr("checked", false);
			} else {
				$(this).attr("checked", true);
			}
			$("#payTable input[type=checkbox]").each(function() {
				if ($(this).attr("checked")) {
					$(this).attr("checked", false);
				} else {
					$(this).attr("checked", true);
				}
			});
			setTotal();
		});

		$("#payTable input[type=checkbox]").click(function() {
			setTotal();
		});

		// 计算合计金额
		function setTotal() {
			totalAmt = 0;
			$(".selectItm").each(function() {
				if ($(this).attr("checked")) {
					amt = $(this).parent().parent().find(".tdamt").html();
					totalAmt = parseFloat(totalAmt).add(parseFloat(amt));
				}
			});
			$("#totalAmt").html("合计:" + totalAmt + "元");
		}

		$("#selectAll").click();
		//$("#destion").val(109);
		
		
		//评价
		$('#addAddress').click(function(e){
			  $("#dhcc-popup-address").modal('toggle');
			  $("#addressFrame")[0].src=getContextPath() + '/nur/nurseCtrl!nurseDestination.htm';
			 
		 });
});

function deleteSelect(){
	var shopStr=[];
	$(".selectItm").each(function() {
		if ($(this).attr("checked")) {
			shopStr.push($(this).attr("id"));
		}
	});
	if(shopStr.length==0){
		$("#dhcc-alert .am-modal-bd").html("请选择要删除的明细");
		$("#dhcc-alert").modal('toggle');
		return;
	}
	if(shopStr.length>0){
		    $("#dhcc-confirm").find(".am-modal-hd").html("提示");
	 		$("#dhcc-confirm").find(".am-modal-bd").html("确认要删除吗?");
	   		$("#dhcc-confirm").modal({
	     		onConfirm: function(options) {
	     			$('#dhcc-modal-loading').modal({closeViaDimmer:false});		
	       			$.post(
	       					    $WEB_ROOT_PATH+ '/nur/nurseCtrl!deleteShopCart.htm',
								{
		       						'dto.orderIdStr' : shopStr
								}, 
								function(data) {
									$('#dhcc-modal-loading').modal('close');
									if (data.resultCode == "1") {
										add_message("am-btn-success","操作成功!",getContextPath()+ "/nur/nurseCtrl!nursePay.htm");
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