<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />

<title>东华电子商务平台(SCI)</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurseMain.js"></script>
</head>
<body>
	<!-- Header公共部分 -->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<!--查询框部分-->
	<form id="subscribe-form"
		action="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm"
		method="post">
		<div class="am-g" style="margin-top: 10px">
			<!-- 所有查询参数 -->
			<!-- 商品属性id -->
			<input type="hidden" name="dto.propertyId" value="${dto.propertyId}" id="qurPropertyId"/>
			<input type="hidden" name="dto.propertyIdStr" value="${dto.propertyIdStr}" id="qurPropertyIdStr"/>
			<input type="hidden" name="dto.removePropertyId" value="${dto.removePropertyId}" id="qurRemovePropertyId"/>
			<!-- 商品分类id -->
			<input type="hidden" name="dto.incCatId" value="${dto.incCatId}" id="qurIncCatId" />
			<input type="hidden" name="dto.sortOrder" value="${dto.sortOrder}" id="qurSortOrder"/>
			<input type="hidden" name="dto.sort" value="${dto.sort}" id="qurSort"/>
			<input type="hidden" name="dto.pageModel.pageNo" value="${dto.pageModel.pageNo}" id="qurPageNo"/>
			<div class="am-u-lg-3 am-u-lg-offset-1 am-vertical-align"
				style="height: 42px">
				<a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm"
					style="color: #2bb8aa"> <span class="am-text-xl">东华医疗供应链平台</span></a>
			</div>
			<div class="am-u-lg-7 am-u-end">

				<input tabindex="1" type="text" name="dto.queryStr"
					autocomplete="off" class="search-box__input"
					placeholder="请输入名称/别名/代码" style="height: 42px" id="queryStr" value="${dto.queryStr}">
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
			<%@include file="/WEB-INF/jsp/nur/nurseMenu.jsp"%>
		</div>
	</div>
	<!-- my workstation -->
	<div class="am-g" style="margin-top: 10px">
		<div class="am-u-lg-8 am-u-lg-offset-1 ">
			<%@include file="/WEB-INF/jsp/nur/nurWorkStation.jsp"%>
		</div>
		<div class="am-u-lg-2 am-u-end"
			style="padding-left: 0px; max-height: 210px">
			<%@include file="/WEB-INF/jsp/nur/nurNews.jsp"%>
		</div>
	</div>

	<!-- 商品信息 -->
	<div class="am-g">
		<div class="am-u-lg-2 am-u-lg-offset-1">
			<!-- 导航 -->
			<hr>
			<div class="am-panel-group" id="accordion" style="width: 200px">
				<div class="am-panel dhcc-panel-mt" id="fastShop">
					<div class="am-panel-hd">
						<h4 class="am-panel-title"
							data-am-collapse="{parent: '#accordion', target: '#do-not-say-1'}">
							<span class="am-icon-search"></span>&nbsp;&nbsp;&nbsp;快速购物
						</h4>
					</div>
					<!--am-in-->
					<div id="do-not-say-1" class="am-panel-collapse am-collapse ">
						<div class="am-panel-bd">
							<div data-am-widget="list_news"
								class="am-list-news am-list-news-default">
								<!--列表标题-->
								<div class="am-list-news-hd am-cf">
									<!--带更多链接-->
									<a
										href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm">
										<h2>我的历史订单</h2> <span class="am-list-news-more am-fr">更多
											&raquo;</span>
									</a>
								</div>
								<div class="am-list-news-bd">
									<ul class="am-list">
										<!--缩略图在标题左边-->
										<s:iterator value="dto.orderDetails" status="status"
											id="orderDetails">
											<li
												class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
												<div class="am-u-sm-4 am-list-thumb">
													<a
														href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${orderDetails.orderVenIncId}&dto.ordShopping.shopIncid=${orderDetails.orderHopIncId}&dto.ordShopping.shopRp=${nurseIncVos.orderRp}">
														<img
														src="<%=request.getContextPath()%>/uploadPic/${orderDetails.picPath}" />
													</a>
												</div>
												<div class=" am-u-sm-8 am-list-main">
													<a
														href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${orderDetails.orderVenIncId}&dto.ordShopping.shopIncid=${orderDetails.orderHopIncId}&dto.ordShopping.shopRp=${nurseIncVos.orderRp}"
														" class="" style="font-size: 1.2rem">${orderDetails.incName}&nbsp;&nbsp;<span>${orderDetails.orderRp}元</span></a>


													<div>
														<span
															class="am-badge am-badge-success am-round dhcc-addToShop"
															id="${orderDetails.orderVenIncId}"
															name="${orderDetails.orderHopIncId}">购买</span>
													</div>
												</div>
											</li>
										</s:iterator>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="am-panel dhcc-panel-mt" id="myShopCart">
					<div class="am-panel-hd">
						<h4 class="am-panel-title"
							data-am-collapse="{parent: '#accordion', target: '#do-not-say-2'}">
							<span class="am-icon-cart-arrow-down"></span>&nbsp;&nbsp;&nbsp;我的购物车
						</h4>
					</div>
					<div id="do-not-say-2" class="am-panel-collapse am-collapse">
						<div class="am-panel-bd">
							<a class="am-btn am-btn-success am-btn-xs"
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nursePay.htm">去结算→</a>
						</div>
						<div data-am-widget="list_news"
							class="am-list-news am-list-news-default">
							<div class="am-list-news-bd">
								<ul class="am-list">
									<!--缩略图在标题左边-->
									<s:iterator value="dto.ordShoppings" status="status"
										id="ordShoppings">
										<li
											class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left"
											id="shopCartList${ordShoppings.shopId}">
											<div class="am-u-sm-4 am-list-thumb">
												<a
													href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${ordShoppings.shopVenIncid}&dto.ordShopping.shopIncid=${ordShoppings.shopIncid}&dto.ordShopping.shopRp=${ordShoppings.shopRp}">
													<img
													src="<%=request.getContextPath()%>/uploadPic/${ordShoppings.picpath}" />
												</a>
											</div>
											<div class=" am-u-sm-8 am-list-main">
												<a
													href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${ordShoppings.shopVenIncid}&dto.ordShopping.shopIncid=${ordShoppings.shopIncid}&dto.ordShopping.shopRp=${ordShoppings.shopRp}"
													" class="" style="font-size: 1.2rem">${ordShoppings.shopIncName}&nbsp;&nbsp;&nbsp;&nbsp;${ordShoppings.shopRp}元</a>
												<div class="am-list-item-text">
													${ordShoppings.shopQty}${ordShoppings.shopUom} <a
														class="am-close am-close-alt am-close-spin am-icon-times"
														href="javascript:deleteShop(${ordShoppings.shopId})"></a>
												</div>
											</div>
										</li>
									</s:iterator>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="am-panel dhcc-panel-mt" id="vistHistory">
					<div class="am-panel-hd">
						<h4 class="am-panel-title"
							data-am-collapse="{parent: '#accordion', target: '#do-not-say-3'}">
							<span class="am-icon-history"></span>&nbsp;&nbsp;&nbsp;浏览记录
						</h4>
					</div>
					<div id="do-not-say-3" class="am-panel-collapse am-collapse am-in">
						<div class="am-panel-bd">
							<div data-am-widget="list_news"
								class="am-list-news am-list-news-default">
								<div class="am-list-news-bd">
									<ul class="am-list" id="myHistory">
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="am-u-lg-8 am-u-end">

			<div id="mainInc">
				<!-- 商品属性查询条件 -->
				<%@include file="/WEB-INF/jsp/nur/nurseIncProperty.jsp"%>
				<div class="am-btn-group" style="padding-left: 10px">
					<button type="button" class="am-btn am-btn-xs am-btn-default"
						id="orderByQty">
						<i class="am-icon-arrow-down"></i> 按销量
					</button>
					<button type="button" class="am-btn am-btn-xs am-btn-default"
						id="orderByComment">
						<i class="am-icon-arrow-down"></i> 按评价
					</button>
					<button type="button" class="am-btn am-btn-xs am-btn-default"
						id="orderByPrice">
						<i class="am-icon-arrow-down"></i> 按价格
					</button>
					<button type="button" class="am-btn am-btn-xs am-btn-default"
						id="orderByDate" style="display: none">
						<i class="am-icon-arrow-down"></i> 按上架时间
					</button>
				</div>
				<ul data-am-widget="gallery"
					class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-5 am-gallery-bordered"
					data-am-gallery="{}" style="padding: 0">
					<s:iterator value="dto.nurseIncVos" status="all" id="nurseIncVos">

						<li>
							<div class="am-gallery-item">
								<a
									href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${nurseIncVos.venincid}&dto.ordShopping.shopIncid=${nurseIncVos.incid}&dto.ordShopping.shopRp=${nurseIncVos.rp}">
									<img
									src="<%=request.getContextPath()%>/uploadPic/${nurseIncVos.picpath}"
									onclick="javascript:addLocalCookies('${nurseIncVos.venincid}','${nurseIncVos.incid}','${nurseIncVos.rp}','${nurseIncVos.incname}')"
									title="${nurseIncVos.incname}" />
									<div class="gallery-title am-text-truncate"
										title="${nurseIncVos.incname}">${nurseIncVos.incname}</div>
									<div class="gallery-desc" style="color: red;font-size: 16px">${nurseIncVos.rp}元
										${nurseIncVos.incuom}</div>
									<div class="gallery-desc">销量:${nurseIncVos.orderqty}<a href="#"><!--  库存:${nurseIncVos.qty}--></a></div>	
									<div class="gallery-desc">已有<a href="javascript:shouwComment('${nurseIncVos.venincid}','${nurseIncVos.incid}','${nurseIncVos.rp}')">${nurseIncVos.commentnum}</a>人评价</div>	
								</a>



								<div class="am-input-group">
									<span class="am-input-group-label" name="minus"> <a>
											<i class="am-icon-minus-square-o"> </i>
									</a></span> <input type="text" class="am-form-field" value=1> <span
										class="am-input-group-label" name="plus"><a><i
											class="am-icon-plus-square-o"></i></a></span>
								</div>
								<button class="am-btn am-btn-success am-btn-block"
									id="${nurseIncVos.venincid}" name="${nurseIncVos.incid}">
									<i class="am-icon-shopping-cart"></i>加入购物车
								</button>
							</div>
						</li>
					</s:iterator>
				</ul>
				<div class="am-margin am-cf">
					<hr />
					<ol class="am-pagination am-fr">
						<s:iterator value="dto.pageModel" status="all" id="aaa">
							<s:set name="page" value="#aaa.pageNo" />
							<s:set name="pageCount" value="#aaa.pageNo" />
						</s:iterator>
						<s:iterator value="dto.pageCount" status="all" id="bbb">
							<s:set name="pageCount" value="#bbb" />
						</s:iterator>
						<li><a href="">共${dto.pageModel.totals}条数据/共${dto.pageCount}页</a></li>
						<s:if test="#page==1">
							<li class="am-disabled" id="firstPage"><a
								href="javascript:void(0)">首页</a></li>
						    <li class="am-disabled" id="prePage"><a
								href="javascript:void(0)">&laquo;上一页</a></li>
						</s:if>
						<s:else>
							<li id="firstPage"><a
								href="javascript:goUrl('1')">首页</a></li>
							<li id="prePage"><a
								href="javascript:goUrl(${dto.pageModel.pageNo-1})">&laquo;上一页</a></li>
						</s:else>
						<s:if test="#page==#pageCount">
							<li class="am-disabled" id="nextPage"><a
								href="javascript:void(0)">&raquo;下一页</a></li>
							<li class="am-disabled" id="lastPage"><a
								href="javascript:void(0)">尾页</a></li>
						</s:if>
						<s:else>
							<li id="nextPage"><a
								href="javascript:goUrl(${dto.pageModel.pageNo+1})">&raquo;下一页</a></li>
							<li id="lastPage"><a
								href="javascript:goUrl(${dto.pageCount})">尾页</a></li>
						</s:else>
						<li><input id="skipVal" style="width: 30px"
							value="${dto.pageModel.pageNo}" /></li>
						<li><input id="skipTo" type="button" value="跳到"></li>
					</ol>
				</div>
			</div>

		</div>
	</div>

	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	<div id="xxx2" style="display: none;">
		<footer class="footer"
			style="bottom:0;width:100%;position:fixed;*position:relative;;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>

	<script type="text/javascript">
		$('.menu > .all-sort').hover(function() {
			$(".wrap").css('display', 'block');
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
					//$(".wrap").css("z-index",100);
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