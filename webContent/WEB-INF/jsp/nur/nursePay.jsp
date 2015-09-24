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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nursePay.js"></script>
<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>

	<div class="am-g">
		<div class="am-u-lg-8 am-u-lg-offset-2 am-u-end"
			style="padding: 0px; margin-top: 10px">
			<div class="am-panel dhcc-panel-mt">
				<div class="am-panel-hd">
					<h3 class="am-panel-title">
						<span class="am-icon-credit-card"></span>&nbsp;&nbsp;&nbsp;结算
					</h3>
				</div>
				<div class="am-panel-bd">
					<form class="am-form">

						<table
							class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac"
							id="payTable">
							<thead>
								<tr>
									<th class="table-check"><input type="checkbox"
										id="selectAll" /></th>
									<th class="table-id">序号</th>
									<th class="table-title">商品</th>
									<th class="table-uom">单位</th>
									<th class="table-price">单价</th>
									<th class="table-qty">数量</th>
									<th class="table-sum">小计</th>
									<th class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="dto.ordShoppings" status="status"
									id="ordShoppings">
									<tr>
										<td><input type="checkbox" id="${ordShoppings.shopId}"
											class="selectItm" /></td>
										<td>${status.count}</td>
										<td><a
											href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${ordShoppings.shopVenIncid}&dto.ordShopping.shopIncid=${ordShoppings.shopIncid}&dto.ordShopping.shopRp=${ordShoppings.shopRp}">${ordShoppings.shopIncName}</a></td>
										<td>${ordShoppings.shopUom}</td>
										<td>${ordShoppings.shopRp}</td>
										<td>
											<div class="am-input-group" name="${ordShoppings.shopId}">
												<span class="am-input-group-label" name="minus"><a><i
														class="am-icon-minus-square-o"></i></a></span> <input type="text"
													value="${ordShoppings.shopQty}"> <span
													class="am-input-group-label" name="plus"><a><i
														class="am-icon-plus-square-o"></i></a></span>
											</div>
										</td>
										<td class="tdamt">${ordShoppings.sumAmt}</td>
										<td>
											<div class="am-fr">
												<button
													class="am-btn am-btn-default am-btn-xs am-text-danger"
													id="${ordShoppings.shopId}" type="button">
													<span class="am-icon-trash-o"></span> 删除
												</button>
											</div>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</form>

					<!-- content end -->

					<HR>
					<div class="am-cf" style="padding-right: 0px">
						<div class="am-u-lg-3">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default"
										onclick="deleteSelect();">
										<span class="am-icon-trash-o"></span> 删除
									</button>
								</div>
							</div>
						</div>
						<div class="am-u-lg-9" style="padding-right: 5px">
							<div class="am-input-group am-input-group-sm">
								<span class="am-input-group-label"><i
									class="am-icon-plus" title="增加收货地址" style="cursor: pointer;" id="addAddress">新增</i>&nbsp;&nbsp;&nbsp;<i
									class="am-icon-user"></i>收货地址</span> <select
									data-am-selected="{btnWidth: 475,  btnStyle: 'mt',btnSize: 'sm'}"
									id="destion">


									<s:iterator value="dto.hopCtlocDestinations" status="all"
										id="hopCtlocDestinations">
										<s:if test="#hopCtlocDestinations.isDefault==Y">
											<option value="${hopCtlocDestinations.hopCtlocDestinationId}">${hopCtlocDestinations.destination}</option>
										</s:if>
										<s:else>
											<option value="${hopCtlocDestinations.hopCtlocDestinationId}"
												selected>${hopCtlocDestinations.destination}</option>
										</s:else>

									</s:iterator>
								</select>
							</div>
						</div>
					</div>
					<div class="am-g" style="margin-bottom: 10px; margin-top: 10px">
						<div class="am-u-lg-3  am-u-lg-offset-4">
							<h2 id="totalAmt">合计:元</h2>
						</div>
						<div class="am-u-lg-5">
							<div class="am-btn-group am-fr">
								<button type="button" class="am-btn am-btn-danger" id="pay">
									<i class="am-icon-paypal"></i>结&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;算
								</button>
								<button type="button" class="am-btn" id="goback">
									<i class="am-icon-reply"></i>返回继续购物
								</button>
							</div>
						</div>
					</div>
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
</body>
</html>