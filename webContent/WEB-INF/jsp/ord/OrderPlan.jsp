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
	src="<%=request.getContextPath()%>/js/dhcc/pms/ord/OrderPlan.js"></script>


<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-g am-container">
		<!-- 
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">采购计划</strong> / <small></small>
			</div>
		</div>
		 -->
		<div class="am-g" style="margin-top: 20px">
			<form
				action="<%=request.getContextPath()%>/ord/orderPlanCtrl!listMain.htm"
				method="post">
				<input type="hidden" name="dto.planNo" value="${dto.planNo}">
				<div class="am-u-lg-6">
					<div class="am-alert am-alert-danger" id="my-alert"
						style="display: none">
						<p>开始日期应小于结束日期！</p>
					</div>
					<div class="am-g" style="padding: 0px">
						<div class="am-u-sm-6">
							<button type="button"
								class="am-btn am-btn-mt am-btn-xs am-margin-right"
								id="my-start">开始日期</button>
							<span id="my-startDate"></span> <input type="hidden"
								name="dto.starDate" id="startDate">
						</div>
						<div class="am-u-sm-6">
							<button type="button"
								class="am-btn am-btn-mt  am-btn-xs am-margin-right"
								id="my-end">结束日期</button>
							<span id="my-endDate"></span> <input type="hidden"
								name="dto.endDate" id="endDate">
						</div>
					</div>
				</div>


				<div class="am-u-lg-3 ">
					<div class="am-form-group am-form-icon" style="margin: 0px">
						<i class="am-icon-apple"></i> <input type="text"
							class="am-form-field" placeholder="单号" style="height: 35px"
							name="dto.planNo">
					</div>
				</div>
				<div class="am-u-lg-3">
					<button class="am-btn am-btn-xs am-btn-mt " id="searchBtn">搜索</button>
				</div>
			</form>
		</div>
		<div class="am-u-lg-12" style="padding: 0px; margin: 0px">
			<section data-am-widget="accordion"
				class="am-accordion dhcc-accordion-mt"
				data-am-accordion='{"multiple": true }'
				style="padding: 0px;margin: 0px" id="orderSection"> <s:iterator
				value="dto.planGrpByNos" id="planGrpByNos">
				<dl class="am-accordion-item am-active">
					<div data-am-sticky="{top:50}">
						<dt class="am-accordion-title">计划号:${planGrpByNos.planno}&nbsp;&nbsp;&nbsp;计划时间:
							${planGrpByNos.plandate}&nbsp;&nbsp;&nbsp;计划科室:
							${planGrpByNos.planctloc}</dt>
					</div>
					<dd class="am-accordion-bd am-collapse am-in">
						<!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
						<div class="am-accordion-content">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default "
										onclick="cmpOrderPlan(this);" data-id="${planGrpByNos.planno}">
										<span class="am-icon-archive"></span>提交订单
									</button>
									<button type="button" class="am-btn am-btn-default"
										onclick="deleteOrderPlan(this);"
										data-id="${planGrpByNos.planno}">
										<span class="am-icon-trash-o"></span> 删除
									</button>
								</div>
							</div>
							<table
								class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac"
								id="${planGrpByNos.planno}">
								<thead>
									<tr>
										<td style="width: 5px"><input type="checkbox"
											id="antiAll" onclick="checkSelect(this);" /></td>
										<th style="width: 20px">序号</th>
										<th style="width: 150px">商品</th>
										<th style="width: 50px">单价</th>
										<th style="width: 50px">数量</th>
										<th style="width: 150px">供应商</th>
										<th style="width: 150px">厂家</th>
										<th style="width: 150px">操作</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#planGrpByNos.planItmVOs" status="status"
										id="planItmVOs">
										<tr>
											<td><input type="checkbox" name="checkbox"
												data-state="${venincid}" data-id="${planid}" /></td>
											<TD>${status.count}</TD>
											<td>${incname}</td>
											<td>${price}</td>
											<td>
												<div
													class="am-input-group am-input-group-sm">
													<span class="am-input-group-label" name="minus"> <i
														class="am-icon-minus-square-o"> </i>
													</span><input type="text" class="am-form-field" value="${planqty}" name="qty">
													<span class="am-input-group-label" name="plus"><i
														class="am-icon-plus-square-o"></i></span>
												</div>
											</td>
											<td>${venname}</td>
											<td><s:set name="venincid" value="#planItmVOs.venincid" />
												${manfname}</td>
											<td><s:if test="#venincid==null">
													<div class="am-btn-group">
														<button type="button"
															class="am-btn am-btn-warning am-btn-xs am-text-warning"
															data-planno="${planGrpByNos.planno}" data-type="remove"
															onclick="saveQty(this)" data-hopincid="${hopincid}"
															data-planItmId="${planid}">
															<span class="am-icon-edit"></span>保存
														</button>
														<button type="button"
															class="am-btn am-btn-success am-btn-xs  am-text-success"
															data-planno="${planGrpByNos.planno}" data-type="remove"
															onclick="selectItem(this)" data-hopincid="${hopincid}"
															data-planItmId="${planid}">
															<span class="am-icon-trash-o"></span>选择
														</button>
													</div>
												</s:if>
												<s:else>
													<div class="am-btn-group">
														<button type="button"
															class="am-btn am-btn-warning am-btn-xs am-text-warning"
															data-planItmId="${planid}" data-type="remove"
															onclick="saveQty(this)"
															data-planno="${planGrpByNos.planno}">
															<span class="am-icon-edit"></span>保存
														</button>
														<button type="button"
															class="am-btn am-btn-danger am-btn-xs am-text-danger"
															data-planItmId="${planid}" data-type="remove"
															onclick="removeSelect(this)"
															data-planno="${planGrpByNos.planno}">
															<span class="am-icon-trash-o"></span>删除
														</button>
													</div>
												</s:else></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>

						</div>
					</dd>
				</dl>
			</s:iterator> </section>

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
				<h4 class="am-popup-title">评价一下</h4>
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