<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurseOrder.js"></script>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.am-table-figure-default img{
	height: 50px
}
</style>	
<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-g am-container">
		<!-- 
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">我的订单</strong> / <small></small>
			</div>
		</div>
		 -->
		<div class="am-g" style="margin-top: 20px">
			<form
				action="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm"
				method="post">
				<div class="am-u-lg-6">
					<div class="am-alert am-alert-danger" id="my-alert"
						style="display: none">
						<p>开始日期应小于结束日期！</p>
					</div>
					<div class="am-g" style="padding: 0px">
						<div class="am-u-sm-6">
							<button type="button"
								class="am-btn am-btn-mt am-btn-xs am-margin-right" id="my-start">开始日期</button>
							<span id="my-startDate"></span> <input type="hidden"
								name="dto.starDate" id="startDate">
						</div>
						<div class="am-u-sm-6">
							<button type="button"
								class="am-btn am-btn-mt  am-btn-xs am-margin-right" id="my-end">结束日期</button>
							<span id="my-endDate"></span> <input type="hidden"
								name="dto.endDate" id="endDate">
						</div>
					</div>
				</div>


				<div class="am-u-lg-1 ">
					<select data-am-selected="{btnWidth: 100,btnSize: 'xs',btnStyle: 'mt'}" name="dto.ordState">
						<option value="0">状态</option>
						<s:iterator value="dto.states" status="all" id="states">
							<s:if test="#states.checkFlag==1">
								<option value="${states.stateSeq}" selected>${states.stateName}</option>
							</s:if>
							<s:else>
								<option value="${states.stateSeq}">${states.stateName}</option>
							</s:else>
							
						</s:iterator>
					</select>
				</div>
				<div class="am-u-lg-2 am-u-lg-offset-1" style="padding:0px">
					<select data-am-selected="{btnWidth: '250px',btnSize: 'xs',btnStyle: 'mt',searchBox: 1,maxHeight: 300,url:'<%=request.getContextPath()%>/hop/hopVendorCtrl!getHopVenComboxVos.htm'}" name="dto.vendorId">
						<option value="0">供应商</option>
						<s:iterator value="dto.vendors" status="all" id="vendors">
							<option value="${vendors.vendorId}">${vendors.name}</option>
						</s:iterator>
					</select>
				</div>
				<div class="am-u-lg-1">
					<button class="am-btn am-btn-xs am-btn-mt " id="searchBtn">搜索</button>
				</div>
			</form>
		</div>
		<div class="am-u-lg-12" style="padding: 0px;margin: 0px">
				<section data-am-widget="accordion" class="am-accordion dhcc-accordion-mt"
				data-am-accordion='{"multiple": true }' style="padding: 0px;margin: 0px" id="orderSection">
				
				<s:iterator value="dto.orderGrpByNos"  id="orderGrpByNos">
				 <dl class="am-accordion-item am-active">
				   <div data-am-sticky="{top:50}">
				   <dt class="am-accordion-title">订单号:${orderGrpByNos.orderno}&nbsp;&nbsp;&nbsp;供应商: ${orderGrpByNos.vendorName}&nbsp;&nbsp;&nbsp;订单日期: ${orderGrpByNos.orderTime}</dt>
				   </div>
				   <dd class="am-accordion-bd am-collapse am-in">
				     <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
				     <div class="am-accordion-content">
				     		<div class="am-btn-toolbar">
					          <div class="am-btn-group am-btn-group-xs">
					            <button type="button" class="am-btn am-btn-default " onclick="batOpSelect(this);" data-type="cmp" data-id="${orderGrpByNos.orderno}"><span class="am-icon-archive" ></span> 确认收货</button>
					            <button type="button" class="am-btn am-btn-default" onclick="batOpSelect(this);" data-id="${orderGrpByNos.orderno}" data-type="remove"><span class="am-icon-trash-o" ></span> 删除</button>
					            <button type="button" class="am-btn am-btn-default am-btn-xs" onclick="batOpSelect(this);" data-id="${orderGrpByNos.orderno}" data-type="close"><span class="am-icon-reply-all" ></span>撤销订单</button>
					          	<button type="button" class="am-btn am-btn-default am-btn-xs" onclick="batOpSelect(this);" data-id="${orderGrpByNos.orderno}" data-type="retreq"><span class="am-icon-truck" ></span>退货申请</button>
					          	<button type="button" class="am-btn am-btn-default am-btn-xs am-text-success" onclick="batOpSelect(this);" data-id="${orderGrpByNos.orderno}" data-type="buy"><span class="am-icon-cart-plus" ></span>再次购买</button>
					          </div>
					        </div>
				     		<table class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac"
								id="${orderGrpByNos.orderno}">
								<thead>
									<tr>
										<td style="width: 5px"><input type="checkbox"  id="antiAll" onclick="checkSelect(this);"/></td>
										<th style="width: 20px">序号</th>
										<!-- 
										<th style="width: 80px">订单号</th>
										 -->
										<th style="width: 150px">商品</th>
										<th style="width: 50px">单价</th>
										<th style="width: 60px">订单数</th>
										<th style="width: 60px">发货数</th>
										<th style="width: 50px">状态</th>
										<!-- 
										<th style="width: 80px">订单时间</th>
										 -->
										<th style="width: 50px" >操作</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#orderGrpByNos.orderDetails" status="status"
										id="orderDetails">
										<tr>
											<td><input type="checkbox" name="checkbox" data-state="${orderState}" data-id="${orderId}"/></td>	
											<TD>${status.count}</TD>
											<!--  
											<td>${orderNo}</td>
										   -->			
											<td><figure data-am-widget="figure"
													class="am am-figure am-table-figure-default "
													data-am-figure="{ pureview: 'true' }"> <img
													src="<%=request.getContextPath()%>/uploadPic/${picPath}"
													data-rel="<%=request.getContextPath()%>/uploadPic/${picPath}"
													alt="${incName}" />${incName}</figure></td>
											<td>${orderRp}</td>
											<td>${orderHopQty}</td>
											<td>${devQty}</td>
											<td><s:set name="state" value="#orderDetails.orderState" />
												${stateDesc}					
											 <!-- 
											<td>${orderDate}</td>
											 -->
											<td style="padding: 0px">
												<div>
													<button type="button"
														class="am-btn am-btn-secondary am-btn-xs am-text-secondary am-btn-block"
														id="${orderId}">
														<span class="am-icon-bus"></span>查看状态
													</button>
												   <s:if test="#state==1">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs  am-btn-block remove"
															id="${orderId}" data-type="remove">
															<span class="am-icon-trash-o"></span>删除明细
														</button>
													</s:if>						
													<s:if test="#state==2">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs  am-btn-block"
															id="${orderId}" data-type="close">
															<span class="am-icon-reply-all"></span>取消明细
														</button>
													</s:if>			
			
													<s:if test="#state==3">
														<button type="button"
															class="am-btn am-btn-danger am-btn-xs am-text-danger am-btn-block"
															id="${orderId}">
															<span class="am-icon-paypal"></span>确认收货
														</button>
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-btn-block"
															id="${orderId}" data-type="retreq">
															<span class="am-icon-truck"></span>退货申请
														</button>
													</s:if>
													<s:if test="#state==4">
														<button type="button"
															class="am-btn am-btn-warning am-btn-xs am-text-warning  am-btn-block"
															id="${orderId}">
															<span class="am-icon-paypal"></span>评价
														</button>
														<button type="button"
															class="am-btn am-btn-success am-btn-xs am-text-success  am-btn-block"
															id="${orderId}">
															<span class="am-icon-shopping-cart"></span>再次购买
														</button>
													</s:if>
													<s:if test="#state==5">
														<button type="button"
															class="am-btn am-btn-primary am-btn-xs am-text-primary  am-btn-block"
															id="${orderId}">
															<span class="am-icon-paypal"></span>查看评价
														</button>
													</s:if>
												</div>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							     
				     </div>
				   </dd>
				 </dl>
				 </s:iterator>
				</section>
				
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
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm?dto.pageModel.pageNo=1">首页</a></li>
						    <li class="am-disabled" id="prePage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo-1}">&laquo;上一页</a></li>
						</s:if>
						<s:else>
							<li id="firstPage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm?dto.pageModel.pageNo=1">首页</a></li>
							<li id="prePage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo-1}">&laquo;上一页</a></li>
						</s:else>
						<s:if test="#page==#pageCount">
							<li class="am-disabled" id="nextPage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo+1}">&raquo;下一页</a></li>
							<li class="am-disabled" id="lastPage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm?dto.pageModel.pageNo="
								${dto.pageCount}>尾页</a></li>
						</s:if>
						<s:else>
							<li id="nextPage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo+1}">&raquo;下一页</a></li>
							<li id="lastPage"><a
								href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm?dto.pageModel.pageNo=${dto.pageCount}">尾页</a></li>
						</s:else>
						<li><input id="skipVal" style="width: 30px"
							value="${dto.pageModel.pageNo}" /></li>
						<li><input id="skipTo" type="button" value="跳到"></li>
					</ol>
				</div>
		</div>
	</div>
	<!-- content end -->
	<div class="am-popup" id="dhcc-popup-comment">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">商品评价</h4>
				<span data-am-modal-close class="am-close">&times;</span>
			</div>
			<iframe id="commentFrame" style="width: 100%; height: 100%;"
				frameborder="0"></iframe>
		</div>
	</div>
	
	

	<!-- foot-->
	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team2.</p>
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