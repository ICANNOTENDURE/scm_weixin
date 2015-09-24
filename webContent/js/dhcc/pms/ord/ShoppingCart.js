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
	
	// 返回购物列表事件
	$(".back").click(function () {
		window.location.href=$WEB_ROOT_PATH+'/ord/orderCtrl!listInc.htm';
	});	

	// 提交事件
	$(".jz2").click(function () {
		var shopCartList ="";
		$(".gwc_tb2 input[name=newslist]").each(function () {
			if ($(this).attr("checked")) {
				shop=$(this).parents("tr").attr("dataname");
				if (shopCartList==""){
					shopCartList=shop;
				}else{
					shopCartList=shopCartList+"^"+shop;
				}
			}
		});
		$.post(
				$WEB_ROOT_PATH+'/ord/orderCtrl!saveOrdInfo.htm',
	            {
	           	 "dto.ordShop":shopCartList,
	            },
				function(data){
		               if(data.dto.opFlg=="1"){
		           			//window.location.href=$WEB_ROOT_PATH+'/ord/orderCtrl!getOrdInfo.htm';
		            	   $("#saveOrUpdateBtn").show();
		            	   $('#vendorId').combobox({
			           	    	url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=",
			           	    	panelHeight:"auto",
			           	        valueField:'vendorId',  
			           	        textField:'name',
			           	        mode:'remote',
			           	        onChange:function (newValue, oldValue){
			           	            if(newValue !=null){
			           	            	if(newValue!=oldValue){ 
			           	            		var urlStr =$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=" + encodeURIComponent(newValue);  
			           	            		$("#vendorId").combobox("reload",urlStr);
			           	            	}
			           	            }  
			           	        },
			           	    	onSelect:function(rec){
			           	    		var url = $WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=" + encodeURIComponent(rec.name);  ;
			           	    		$('#vendorId').combobox('reload', url);
			           	    		
			           	    		
			           	    		
			           	    	}
		           	        });
		            	   
		            	   $('#locId').combobox({
			           			url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm',
			           			valueField:'hopCtlocId',							
			           			textField:'name',
			           			onSelect:function(rec){
			           				$("#recDestination").combobox({
			           	    			url:$WEB_ROOT_PATH+'/ord/orderCtrl!findLocDesctionComboList.htm?dto.loc='+rec.hopCtlocId,
			           	    			valueField:'hopCtlocDestinationId',							
			           	    			textField:'destination',
			           	    			mode:'remote',
			           	    		});
			           			}	
		           			});
		            	   $('#purId').combobox({
			           			url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm',
			           			valueField:'hopCtlocId',							
			           			textField:'name'	
		           			});
		            	   $CommonUI.getDialog("#OrdInfoWin").dialog("setTitle","确认收货信息");
		            	   $CommonUI.getDialog("#OrdInfoWin").dialog("center");
		            	   $CommonUI.getDialog("#OrdInfoWin").dialog("open");
		            	   $CommonUI.getForm('#OrdInfoWin').form('clear');
		               }
		         },
		         "json"
	    );
		

	});	
	// hopManf表新增和修改
	$("#saveOrUpdateBtn").on('click', function() {
		$("#saveOrUpdateBtn").hide();
		$.post(
				$WEB_ROOT_PATH+'/ord/orderCtrl!save.htm',
	            {
	           	 	"dto.order.deliveryDate":$("#deliveryDate").datebox('getValue'),
	           	    "dto.order.emFlag":$("#emFlag").attr("checked"),
	           	    "dto.order.remark":$("#remark").val(),
	           	    "dto.order.vendorId":$('#vendorId').combobox('getValue'),
	           	    "dto.order.recLoc":$("#locId").combobox('getValue'),
	           	    "dto.order.recDestination":$("#recDestination").combobox('getValue'),
	           	    "dto.order.purLoc":$("#purId").combobox('getValue')
	            },
	            function(data){
	               if(data.dto.opFlg=="1"){
	            	   $("#saveOrUpdateBtn").show();
	            	   $CommonUI.alert("订单生成成功");
	            	   window.location.href=$WEB_ROOT_PATH+'/ord/orderCtrl!listInc.htm';
	               }else{
	            	   $("#saveOrUpdateBtn").show();
	            	   $CommonUI.alert("订单生成失败");
	               }
	            },
	            "json"
	    );
		
	});
	setTotal();
//	 function immediately(){
//		   obj=$('#vendorId').parents("td").children(".combo").children(".combo-text");
//		   if("\v"=="v") {
//			   obj.onpropertychange = webChange;
//		   }else{
//		  
//			   obj.addEventListener("input",webChange,false);
//		   }
//		   function webChange(){
//			   alert("2");
//		   }
//	   }
	
});


