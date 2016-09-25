$(document).ready(function(){

	$(window).resize(function(){

		/* 轮播图片高度 DY */
		$(".carousel_200 .carousel-inner .item div").css("height",$("#carousel-example-generic").height()+'px');

		/* LOGO字体竖直居中 CQ */
		$(".hospital").css("padding-top",(($(".login_header").height())/2-23)+'px');
	});
	$(window).resize();

	/* IE8下图片自适应兼容 CQ */
	$(".in_img").backgroundcover();

});
