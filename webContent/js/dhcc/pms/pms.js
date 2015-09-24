$(function(){
	//默认选中运维管理
	$("#platformManage").addClass("divClick");
	
	//主菜单鼠标悬停样式
	$("#mainToolBar div").hover(
      function(){
	    $(this).addClass("divOver");
	  },
	  function(){
	    $(this).removeClass("divOver");
	  }
	);
	//主菜单鼠标单击样式
	$("#mainToolBar div").click(function(){
		$("#mainToolBar div").removeClass("divClick");
		$(this).addClass("divClick");
		$(".pmsMenu").hide();
		var menuIdString = $(this).attr("id")+"Menu";
		$("#"+menuIdString).show();
		var src = $("#"+menuIdString+">div:first a").attr("src");
		$("#mainPanel iframe").attr("src",src);
	});
	
	//子菜单鼠标悬停样式
	$(".pmsMenu div").hover(
      function(){
	    $(this).addClass("divOver");
	  },
	  function(){
	    $(this).removeClass("divOver");
	  }
	);
	//子菜单鼠标单击样式
	$(".pmsMenu div").click(function(){
		if($(this).hasClass("divClick")){
			$(this).removeClass("divClick");
			var id = "#"+$(this).parent().attr("id");
			var src = $(id+">div:first a").attr("src");
			$("#mainPanel iframe").attr("src",src);
		}else{
			$(".pmsMenu div").removeClass("divClick");
			$(this).addClass("divClick");
			var src = $(".divClick a").attr("src");
			$("#mainPanel iframe").attr("src",src);
		}
	});
	
});