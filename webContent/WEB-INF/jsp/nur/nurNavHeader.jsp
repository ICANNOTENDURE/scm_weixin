<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华电子商务平台(SCI)</title>
<link href="<%=request.getContextPath()%>/css/nur/jdmenu.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.search-box__tabs-container {
	position: relative;
	float: left;
	width: 63px;
	height: 38px;
	border: 2px solid #2db8ad;
	border-right: none;
}

.search-box__button {
	float: left;
	width: 65px;
	margin: 0;
	height: 42px;
	line-height: 42px;
	border: none;
	color: #fff;
	background: #2bb8aa;
	cursor: pointer;
	-webkit-appearance: none;
	border-radius: 0;
}

.search-box__input {
	float: left;
	margin: 0;
	padding: 6px 5px;
	border: 2px solid #2db8ad;
	border-right: none;
	border-radius: 0;
	width: 488px;
	height: 26px;
	line-height: 26px;
}
</style>
<script type="text/javascript">
$(function(){
	$(".wrap").css('display', 'none');
});
</script>
</head>
<body>
	<!--查询框部分-->
	<form id="subscribe-form"
		action="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm"
		method="post">
		<div class="am-g" style="margin-top: 10px">

			<div class="am-u-lg-3 am-u-lg-offset-1 am-vertical-align"
				style="height: 42px">
				<a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm"
					style="color: #2bb8aa"> <span class="am-text-xl">东华电子商务(SCI)</span></a>
			</div>
			<div class="am-u-lg-7 am-u-end">

				<input tabindex="1" type="text" name="dto.queryStr"
					autocomplete="off" class="search-box__input"
					placeholder="请输入名称/别名/代码" style="height: 42px" id="queryStr">
				<input type="submit"
					class="s-submit search-box__button log-mod-viewed" hidefocus="true"
					value="搜索" data-mod="sr">
			</div>

		</div>
		</div>
	</form>

	<!-- main menu -->
	<div class="am-g">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<div class="menu">
				<div class="all-sort">
					<h2>
						<a
							href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm">全部商品分类<i class="am-icon-chevron-down am-fr" style="margin-top: 10px"></i></a>
							
					</h2>
				</div>
				<div class="nav">
					<ul class="clearfix"
						style="margin-top: 0px; margin-bottom: 0px; padding-left: 0px">
						<li><a
							href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm">首页</a></li>
						<!-- 	
				<li><a href="#">服装城</a></li>
				<li><a href="#">京东超市</a></li>
				<li><a href="#">团购</a></li>
				<li><a href="#">拍卖</a></li>
				<li><a href="#">在线游戏</a></li>
				 -->
					</ul>
				</div>
			</div>
			<!-- 菜单 -->

			<div class="wrap">
				<div class="all-sort-list ">
					<s:iterator value="dto.groups" id="groups">
						<div class="item">
							<h3>
								<span>${groups.sgDesc}</span><i
									style="float: right; padding-right: 10px; color:">></i>
							</h3>
							<div class="item-list ">
								<!-- 
						<div class="close">x</div>
						 -->
								<div class="subitem">
									<s:iterator value="#groups.catGroups" id="catGroups">
										<dl class="fore">
											<dt>
												<a href="#">${groupName} </a><i>></i>
											</dt>
											<dd>
												<s:iterator value="#catGroups.subCatGroups"
													id="subCatGroups">
													<a
														href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm?dto.incCatId=${subGroupID}">${subGroupName}</a>
												</s:iterator>
											</dd>
										</dl>
									</s:iterator>
								</div>
								<!-- 
						<div class="cat-right">
							<dl class="categorys-promotions"
								clstag="homepage|keycount|home2013|0601c">
								<dd>
									<ul>
										<li><a href="#" target="_blank"><img
												src="images/rBEhWFJTydgIAAAAAAAiD8_1J3AAAD5mAMC0SYAACIn230.jpg"
												width="194" height="40" title="特价书满减"></a></li>
									</ul>
								</dd>
							</dl>
							<dl class="categorys-brands"
								clstag="homepage|keycount|home2013|0601d">
								<dt>推荐品牌出版商</dt>
								<dd>
									<ul>
										<li><a href="#" target="_blank">中华书局</a></li>
										<li><a href="#" target="_blank">人民邮电出版社</a></li>
										<li><a href="#" target="_blank">上海世纪出版股份有限公司</a></li>
										<li><a href="#" target="_blank">电子工业出版社</a></li>
									</ul>
								</dd>
							</dl>
						</div>
						 -->
							</div>
						</div>
					</s:iterator>
				</div>


			</div>
		</div>
	</div>
	
		<script type="text/javascript">
		$('.menu > .all-sort').hover(function() {
			if($(this).find("i").hasClass("am-icon-chevron-down")){
				$(".wrap").css('display', 'block');
				$(this).find("i").removeClass("am-icon-chevron-down");
				$(this).find("i").addClass("am-icon-chevron-up");
			}else{
				$(".wrap").css('display', 'none');
				$(this).find("i").removeClass("am-icon-chevron-up");
				$(this).find("i").addClass("am-icon-chevron-down");
			}
			
		}, function() {
			//$(".wrap").css('display', 'none');
		});
		$('.all-sort-list > .item').hover(
				function() {
					var eq = $('.all-sort-list > .item').index(this), //获取当前滑过是第几个元素
					h = $('.all-sort-list').offset().top, //获取当前下拉菜单距离窗口多少像素
					s = $(window).scrollTop(), //获取游览器滚动了多少高度
					i = $(this).offset().top, //当前元素滑过距离窗口多少像素
					item = $(this).children('.item-list').height(), //下拉菜单子类内容容器的高度
					sort = $('.all-sort-list').height(); //父类分类列表容器的高度

					if (item < sort) { //如果子类的高度小于父类的高度
						if (eq == 0) {
							$(this).children('.item-list').css('top', (i - h));
						} else {
							$(this).children('.item-list').css('top',
									(i - h) + 1);
						}
					} else {
						if (s > h) { //判断子类的显示位置，如果滚动的高度大于所有分类列表容器的高度
							if (i - s > 0) { //则 继续判断当前滑过容器的位置 是否有一半超出窗口一半在窗口内显示的Bug,
								$(this).children('.item-list').css('top',
										(s - h) + 2);
							} else {
								$(this).children('.item-list').css('top',
										(s - h) - (-(i - s)) + 2);
							}
						} else {
							$(this).children('.item-list').css('top', 3);
						}
					}

					$(this).addClass('hover');
					$(this).children('.item-list').css('display', 'block');

				}, function() {
					//$(".wrap").css("z-index",auto);
					$(this).removeClass('hover');
					$(this).children('.item-list').css('display', 'none');
					
				});

		$('.item > .item-list > .close').click(function() {
			$(this).parent().parent().removeClass('hover');
			$(this).parent().hide();
		});
	</script>
</body>
</html>