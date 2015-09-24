
$(function(){
//将要添加的html元素；

function addmenu(ary){
var menucnt = "<div class=\"shopping_titlebar_opened shopping_titlebar\" dataid=\""+ary[0]+"\">";
menucnt += "<form class=\"shopform\" method=\"post\" name=\"shopform\">";
menucnt += "<div class=\"shoping_bar\"><div class=\"shopname\"><b>"+ary[1]+"</b><u>×</u></div><div class=\"lit_bar\"><u></u></div></div>";
menucnt += "<div class=\"shop_cnt\">";
menucnt += "<div class=\"table_title\">";
menucnt += "<table border=\"0px\" cellpadding=\"0px\" cellspacing=\"1px\" bordercolor=\"#fff\" style=\"border-bottom:#e1e1e1 1px solid\">";
menucnt += "<tr height=\"27px\" valign=\"middle\" align=\"center\" bgcolor=\"#f8f8f8\">";
menucnt += "<td width=\"94px\" align=\"left\" style=\"text-indent:5px\">商品</td>";
menucnt += "<td width=\"59px\">数量</td>";
menucnt += "<td width=\"52px\">小计</td>";
menucnt += "<td width=\"60px\">操作</td>";
menucnt += "</tr>";
menucnt += "</table>";
menucnt += "</div>";
menucnt += "<div class=\"shoping_list\">";
menucnt += "<table class=\"foodlist\" border=\"0px\" cellpadding=\"0px\" cellspacing=\"1px\" bordercolor=\"#fff\">";
		
var litmenu = "<tr dataid=\""+ ary[2]+"\" height=\"35px\" valign=\"middle\" align=\"center\" bgcolor=\"#fff\">"; 
litmenu += "<td width=\"94px\" align=\"left\" style=\"color:#6c6c6c;text-indent:5px\">"+ ary[3]+"</td>";
litmenu += "<td width=\"59px\">";
litmenu += "<span class=\"minus_btn add_btn\">-</span><u><input type=\"text\" class=\"txt\" value=\""+ ary[4]+"\"/></u><span class=\"plus_btn add_btn\">+</span>";
litmenu += "</td>";
litmenu += "<td width=\"52px\" style=\"color:#6c6c6c\">"+ ary[5]+"</td>";
litmenu += "<td width=\"44px\"><u class=\"fork\">×</u></td>";
litmenu += "</tr>";

var menuend = "</table>";
menuend += "</div>";
menuend += "<div class=\"pay_stat\">";
menuend += "<span class=\"bigfont\"><b>合计金额:</b><i>140.0</i><em>元</em></span>";
menuend += "<span><a href=\"#\">立即结算</a></span>";
menuend += "</div>";
menuend += "</div>";
menuend += "</form>";
menuend += "</div>";

var all_oderid = $("#plug_24_mytable_page .table_box .shopping_titlebar");
var all_dishid = $("#plug_24_mytable_page .table_box .shopping_titlebar .shoping_list table tr");
for(var i=0;i<all_oderid.length;i++){
	if(all_oderid.eq(i).attr("dataid") == ary[0]){//如果要插入的父元素已有；		
		for(var j=0;j<all_dishid.length;j++){//循环小元素；
			if(all_dishid.eq(j).attr("dataid") == ary[2]){//如果要插入的小元素已有；
				//该小元素的值加1,同时展开该小元素所在的大元素，并推出函数;
				var txtval = parseInt(all_dishid.eq(j).children("td").children("u").children(".txt").val());
				txtval += 1;
				all_dishid.eq(j).children("td").children("u").children(".txt").val(txtval).parents('.shopping_titlebar').addClass('shopping_titlebar_opened').siblings(".shopping_titlebar").removeClass('shopping_titlebar_opened');
				return false;
			}
	  	}
		//在该大元素中插入一个小元素，同时将大元素打开，将大元素的兄弟元素关闭，退出函数;
		var qobj = all_oderid.eq(i).children(".shopform").children(".shop_cnt").children(".shoping_list").children("table").prepend(litmenu).parents('.shopping_titlebar').addClass('shopping_titlebar_opened').siblings(".shopping_titlebar").removeClass('shopping_titlebar_opened');
		return false;				
	}
}
//如果该大元素不存在于餐桌上，则新插入一个打开的大元素；
$("#plug_24_mytable_page .table_box").prepend(menucnt+litmenu+menuend);
}

//点击菜单时在餐桌添加一个菜；
$("#shop_menu ul li").click(function(){
        var ary0 = $(this).attr("ary0");
        var ary1 = $(this).parents(".menu_list").siblings("h2").text();
        var ary2 = $(this).attr("ary2");
        var ary3 = $(this).text();
        var ary4 = $(this).attr("ary4");
        var ary5 = $(this).attr("ary5");
		$("#plug_24_mytable_page .table_box .shopping_titlebar").removeClass('shopping_titlebar_opened');
		addmenu([ary0,ary1,ary2,ary3,ary4,ary5]);
});

//点击加一个按钮时加一个1；点击减一个按钮时减一个1
$("#plug_24_mytable_page .table_box").on('click','.shopping_titlebar .shoping_list table tr td .add_btn',function(){
        var txtobj = $(this).siblings("u").children(".txt");
		var txtval = parseInt(txtobj.val());
		if($(this).hasClass("minus_btn")){if(txtval<2){txtval=2};txtval -= 1};
		if($(this).hasClass("plus_btn")){txtval += 1};
		txtobj.val(txtval);
});

//点击小叉删除一个菜；
$("#plug_24_mytable_page .table_box .shopping_titlebar .shoping_list table").on('click','tr td .fork',function(){
        var len = $(this).parents("tr").size();
		//var len=$(this).filter("tr").size()+1;//表格有多少个数据行;

		alert(len);
		if(len > 2){
			$(this).parents("tr").remove();	
		}else{
		  $(this).parents(".shopping_titlebar").remove();
		}
});
	
//我的餐桌：折叠当前所点击的订单
$("#plug_24_mytable_page .table_box").on('click','.shopping_titlebar .shoping_bar',function(){
	$(this).parents('.shopping_titlebar').addClass('shopping_titlebar_opened').siblings(".shopping_titlebar").removeClass('shopping_titlebar_opened');
});
	
//我的订单：点击小叉删除一个订单。如果要删除的订单是关闭状态，那么直接删除该订单；如果要删除的订单是展开状态，那么在删除该订单的同时展开下一个订单，当要展开的下一个订单不存在时，则展开上一个订单。
$("#plug_24_mytable_page .table_box").on('click','.shopping_titlebar .shoping_bar .shopname u',function(event){
if(confirm("是否删除该店铺订单？")){
  if($(this).parents('.shopping_titlebar').hasClass("shopping_titlebar_opened")==false){$(this).parents('.shopping_titlebar').remove();}else{
	var nxt=$(this).parents('.shopping_titlebar').next(".shopping_titlebar").css('display')=='none' || $(this).parents('.shopping_titlebar').next(".shopping_titlebar").css('display')==undefined;
  	if(nxt == false){
	 	$(this).parents('.shopping_titlebar').next(".shopping_titlebar").addClass('shopping_titlebar_opened').siblings(".shopping_titlebar").removeClass('shopping_titlebar_opened');
  	}else{
	 	$(this).parents('.shopping_titlebar').prev(".shopping_titlebar").addClass('shopping_titlebar_opened').siblings(".shopping_titlebar").removeClass('shopping_titlebar_opened')
  	}
  	$(this).parents('.shopping_titlebar').remove();	
  }
  	event.stopPropagation();//仅仅阻止事件冒泡；
}else{
  	return false;//不但阻止事件冒泡，而且阻止事件本身的发生；
}
});

	
});