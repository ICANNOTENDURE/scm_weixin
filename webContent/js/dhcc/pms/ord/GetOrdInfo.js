// zxx 2014-04-19
$(function (){
	//删除一个药
	$(".gwc_tb2 ").on('click',"tr td .frok",function(){

		deleteObj=$(this).parents("table");
		$.post(
				$WEB_ROOT_PATH+'/ord/orderCtrl!deleteShopCart.htm',
	            {
	           	 "dto.ordShopping.shopIncid":$(this).parents("tr").attr("dataid"),
	            },
	            function(data){
	               if(data.dto.opFlg=="1"){
	           			deleteObj.remove();	
	               }
	            },
	            "json"
	    );
		setTotal();

	});
	//点击减少数量
	$(".gwc_tb2").on('click',"tr td #min1",function(){
		
	    var txtobj = $(this).siblings("#text_box1");
	    
		var txtval = parseInt(txtobj.val());
		var qty=-1;flag=1;
		if(txtval<2){
			txtval=2;
			flag=0;
		};
		txtval -= 1;
		
		txtobj.val(txtval);
		if (flag==1){
			$.post(
					$WEB_ROOT_PATH+'/ord/orderCtrl!saveShopCart.htm',
		            {
		           	 "dto.ordShopping.shopIncid":$(this).parents("tr").attr("dataid"),
		           	 "dto.ordShopping.shopQty":qty,
		            }
		    );
		}
		setTotal();
	});
	
	//点击减少数量
	$(".gwc_tb2").on('click',"tr td #add1",function(){
		
	    var txtobj = $(this).siblings("#text_box1");
	    
		var txtval = parseInt(txtobj.val());
		var qty=1;flag=1;
		txtval += 1;
		txtobj.val(txtval);
		if (flag==1){
			$.post(
					$WEB_ROOT_PATH+'/ord/orderCtrl!saveShopCart.htm',
		            {
		           	 "dto.ordShopping.shopIncid":$(this).parents("tr").attr("dataid"),
		           	 "dto.ordShopping.shopQty":qty,
		            }
		    );
		}
		setTotal();
	});
	
	
	$(".tb1_td1").click(function () {
		setTotal();
	});
	
	//jquery特效制作复选框全选反选取消(无插件)
	// 全选        
	$(".allselect").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			$(this).attr("checked", true);
			$(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
		});
		setTotal();
	});

	//反选
	$("#invert").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			if ($(this).attr("checked")) {
				$(this).attr("checked", false);
				$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
			} else {
				$(this).attr("checked", true);
				$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
			} 
		});
		setTotal();
	});

	//取消
	$("#cancel").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			$(this).attr("checked", false);
			$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
		});
		setTotal();
	});

	// 所有复选(:checkbox)框点击事件
	$(".gwc_tb2 input[name=newslist]").click(function () {
		if ($(this).attr("checked")) {
			$(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
		} else {
			$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
		}
		setTotal();
	});	

	//计算合计金额和总数量
	function setTotal() {
		var num = 0;sumAmt=0;
		$(".gwc_tb2 input[name=newslist]").each(function () {
			if ($(this).attr("checked")) {
				num+=1;
				qty=$(this).parents("td").siblings(".tb1_td5").children("#text_box1").val();
				rp=$(this).parents("td").siblings(".tb1_td6").children("#total1").html();
				sumAmt+=parseInt(qty)*parseInt(rp);
				
			}
		});
		$("#zong1").text(sumAmt);
		$("#shuliang").text(num);
		if(num==0){
			$("#jz1").css("display", "block");
			$("#jz2").css("display", "none");
		}else{
			$("#jz1").css("display", "none");
			$("#jz2").css("display", "block");
		}
		
		
	}
	
	// 所有复选(:checkbox)框点击事件
	$(".back").click(function () {
		window.location.href=$WEB_ROOT_PATH+'/ord/orderCtrl!listInc.htm';
	});	
	
	setTotal();
});