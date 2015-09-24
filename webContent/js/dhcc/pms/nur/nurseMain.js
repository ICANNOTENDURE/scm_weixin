var clickFlag=0;
$(function(){
	
	if($("#qurSort").val()=="asc"){
		id=$("#qurSortOrder").val(); 
		$('#'+id).children().removeClass("am-icon-arrow-down");
		$('#'+id).children().addClass("am-icon-arrow-up");
	}

	$('#orderByQty').click(function() {
		doSort('orderByQty');
	});
	$('#orderByComment').click(function() {
		doSort('orderByComment');
	});
	$('#orderByDate').click(function() {
		doSort('orderByDate');
	});
	$('#orderByPrice').click(function() {
		doSort('orderByPrice');
	});
	function doSort(id){
		$("#qurSortOrder").val(id);
		o=$("#"+id);
		var curstyle=o.children().attr("class");
		if(curstyle=="am-icon-arrow-down"){
			 o.children().removeClass("am-icon-arrow-down");
			 o.children().addClass("am-icon-arrow-up");
			 $("#qurSort").val("asc");
		 }else{
			 o.children().removeClass("am-icon-arrow-up");
			 o.children().addClass("am-icon-arrow-down");
			 $("#qurSort").val("desc");
		 }
		$("#subscribe-form").submit();

	}
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
	
	
	//快速购物
	$('.addToShop').click(function() {
		venincId = $(this).attr("id");
		incId = $(this).attr("name");
		qty = 1;
		$.post(
				getContextPath() + '/nur/nurseCtrl!addShopCart.htm', 
				{
					'dto.ordShopping.shopVenIncid' : venincId,
					'dto.ordShopping.shopIncid' : incId,
					'dto.ordShopping.shopQty' : qty
				}, 
				function(data) {
					if (data.resultCode == "1") {
						//picpath=$btn.parent().find("img").attr("src");
						//incname=$btn.parent().find(".gallery-title").html();
						//rp=$btn.parent().find(".gallery-desc").html();
						addToShop(picpath,incname,rp,data.resultContent);
						
					} else {
						$("#dhcc-alert").find(".am-modal-hd").html("程序异常");
						$("#dhcc-alert").find(".am-modal-bd").html(data.resultContent);
						$("#dhcc-alert").modal('toggle');

					}
				}, 
				"json"
		);
	});
	
	//加入到购物车
	$("#mainInc").find('.am-btn-success').click(function() {
		$btn = $(this);
		$btn.button('loading');
		venincId = $(this).attr("id");
		incId = $(this).attr("name");
		qty = $(this).prev().find("input").val();
		$.post(
				getContextPath() + '/nur/nurseCtrl!addShopCart.htm', 
				{
					'dto.ordShopping.shopVenIncid' : venincId,
					'dto.ordShopping.shopIncid' : incId,
					'dto.ordShopping.shopQty' : qty
				}, 
				function(data) {
					$btn.button('reset');
					if (data.resultCode == "1") {
						picpath=$btn.parent().find("img").attr("src");
						incname=$btn.parent().find(".gallery-title").html();
						rp=$btn.parent().find(".gallery-desc").html();
						addToShop(picpath,incname,rp,data.resultContent);
						add_message("am-btn-success","成功加入购物车","");
						
					} else {
						add_message("am-btn-danger","程序异常"+data.resultConten,"");
						//$("#dhcc-alert").find(".am-modal-hd").html("程序异常");
						//$("#dhcc-alert").find(".am-modal-bd").html(data.resultContent);
						//$("#dhcc-alert").modal('toggle');

					}
				}, 
				"json"
		);
	});

	$("#skipTo").click(function(){
		var skipNo=$("#skipVal").val();
		var reg =/^[-+]?\d+$/;
		if(!reg.test(skipNo)){
			alert("填入数字!");
			return;
		}
		//window.location.href=getContextPath()+"/nur/nurseCtrl!nurseManageMain.htm?dto.pageModel.pageNo="+ skipNo;
		$("#qurPageNo").val(skipNo);
		$("#subscribe-form").submit();
	});
	

	
	
	function addToShop(picpath,incname,rp,shopId){
		$("#do-not-say-2").collapse('open');
		$("#do-not-say-1").collapse({toggle: false});
		$("#do-not-say-1").collapse('close');
		$("#do-not-say-3").collapse({toggle: false});
		$("#do-not-say-3").collapse('close');
		var html="";
		html="<li class='am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left' id=shopCartList"+shopId+">";
		html=html+"<div class='am-u-sm-4 am-list-thumb'>";
		html=html+"<a href='#' class=''>";
		html=html+"<img src='"+picpath+"' />";
		html=html+"</a>";
		html=html+"</div>";
		html=html+"<div class=' am-u-sm-8 am-list-main'>";
		html=html+"<h3 class='am-list-item-hd'>";
		html=html+"<a href='#' class='' style='font-size: 1.2rem'>"+incname+"&nbsp;&nbsp;&nbsp;"+rp+"</a>";
		html=html+"</h3>";
		html=html+"<div class='am-list-item-text'>";
		html=html+qty;
		html=html+"<a class='am-close am-close-alt am-close-spin am-icon-times' name="+shopId+" href='javascript:deleteShop("+shopId+");' ></a>";
		html=html+"</div>";
		html=html+"</div>";
		html=html+"</li>";
		$("#do-not-say-2").find(".am-list").prepend(html);
	}
	//本地缓存
	getLocaleCookies();
	
});

function shouwComment(vendincid,incid,rp){
	window.open(getContextPath()+"/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid="+vendincid+"&dto.ordShopping.shopIncid="+incid+"&dto.ordShopping.shopRp="+rp+"&dto.showCommentFlag=1");
}
//加入到本地缓存中
function addLocalCookies(vendincid,incid,rp,name){
	addCookie("INC^"+vendincid+"^"+incid+"^"+rp,name);
}
//获取本地缓存
function getLocaleCookies(){
	var myCookies=document.cookie.split("; ");
	var myClass="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left";
	var url=getContextPath()+"/nur/nurseCtrl!nurseIncDetail.htm?";
	var Param1="dto.ordShopping.shopVenIncid=";
	var Param2="&dto.ordShopping.shopIncid=";
	var Param3="&dto.ordShopping.shopRp=";
	var j=0;
	for (var i=myCookies.length-1;i>=0;i--){
		j=j+1;
		if(j==10){continue;}
		var incname=unescape(myCookies[i].split("=")[1]);
		var venincid=myCookies[i].split("=")[0].split("^")[1];
		var incid=myCookies[i].split("=")[0].split("^")[2];
		var RP=myCookies[i].split("=")[0].split("^")[3];
		if(myCookies[i].split("=")[0].indexOf("INC")==-1){continue;}
		$("#myHistory").append("<li class=myClass> <h3 class='am-list-item-hd'> <a href='"+url+Param1+venincid+Param2+incid+Param3+RP+"' style='font-size: 1.2rem'>"+incname+"</a>&nbsp;&nbsp;<span>"+RP+"元"+"</span></h3></li>");	
	}

	
}

function deleteShop(shopId){
	$(this).attr('data-id',shopId);
	$('#dhcc-confirm').modal({
		relatedTarget: this,
		onConfirm: function(options) {
			var shopId = $(this.relatedTarget).attr('data-id');
  			$.post(
					getContextPath()+ '/nur/nurseCtrl!deleteShopCart.htm',
					{
						'dto.orderIdStr' : shopId
					}, 
					function(data) {
						if (data.resultCode == "1") {
							add_message("am-btn-success","删除成功","");
							//$("#alert-message").html("删除成功");
							//$("#dhcc-alert").modal('toggle');
							$("#shopCartList"+shopId).remove();
						} else {
							
							add_message("am-btn-danger","删除失败"+data.resultContent,"");
							//$("#alert-message").html(data.resultContent);
							//$("#dhcc-alert").modal('toggle');
						}
					}, 
					"json"
			);
		}
	});
}

function goUrl(pageNo){
	$("#qurPageNo").val(pageNo);
	$("#subscribe-form").submit();
}