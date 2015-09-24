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
<script type="text/javascript">
	$(function() {
		//加入到购物车
		$("#mainInc")
				.find('.am-btn-success')
				.click(
						function() {
							$btn = $(this);
							$btn.button('loading');
							venincId = $(this).attr("id");
							planItmId = $("#planItmId").val();
							$
									.post(
											getContextPath()
													+ '/ord/orderPlanCtrl!updateOrderPlan.htm',
											{
												'dto.planItmId' : planItmId,
												'dto.venIncId' : venincId
											},
											function(data) {
												if (data.resultCode == "1") {
													url = getContextPath()
															+ '/ord/orderPlanCtrl!listMain.htm?dto.planNo='
															+ data.resultContent;
													add_message(
															"am-btn-success",
															"操作成功!", url);
												} else {
													add_message(
															"am-btn-danger",
															"操作失败!", "");
												}
											}, "json");
						});
	});
	
	
</script>
</head>
<body>
	<!-- Header公共部分 -->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<input id="sort" type="hidden" value="${dto.sort}">
	<input id="sortOrder" type="hidden" value="${dto.sortOrder}">
	<input id="planItmId" type="hidden" value="${dto.planItmId}">
	<div class="am-g am-container">

		<div class="am-u-lg-12">
			<div class="am-panel am-panel-primary">
				<div class="am-panel-hd">
					<h3 class="am-panel-title">
						<span class="am-icon-cubes"></span>&nbsp;&nbsp;&nbsp;科室库存上下线
					</h3>
				</div>
				<div class="am-panel-bd">
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
								id="orderByDate">
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
											href="javascript:window.open('<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${nurseIncVos.venincid}&dto.ordShopping.shopIncid=${nurseIncVos.incid}&dto.ordShopping.shopRp=${nurseIncVos.rp}')">
											<img
											src="<%=request.getContextPath()%>/uploadPic/${nurseIncVos.picpath}"
											onclick="javascript:addLocalCookies('${nurseIncVos.venincid}','${nurseIncVos.incid}','${nurseIncVos.rp}','${nurseIncVos.incname}')" />
											<div class="gallery-title">${nurseIncVos.incname}</div>
											<div class="gallery-desc">${nurseIncVos.rp}元
												${nurseIncVos.incuom}</div>
										</a>


										<!-- 
								<div class="am-input-group">
									<span class="am-input-group-label" name="minus"> <a>
											<i class="am-icon-minus-square-o"> </i>
									</a></span> <input type="text" class="am-form-field" value=1> <span
										class="am-input-group-label" name="plus"><a><i
											class="am-icon-plus-square-o"></i></a></span>
								</div>
								 -->
										<button class="am-btn am-btn-success am-btn-block"
											id="${nurseIncVos.venincid}" name="${nurseIncVos.incid}">
											<i class="am-icon-shopping-cart"></i>选择
										</button>
									</div>
								</li>
							</s:iterator>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- foot-->
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

</body>
</html>