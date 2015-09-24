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
<script type="text/javascript">
	function savePlanByLocQty(obj){
		$.post(
				$WEB_ROOT_PATH+ '/hop/hopIncLocCtrl!savePlanByLocQty.htm',
				{
					"dto.minFlag":$("#min").val(),
					"dto.standFlag":$("#stand").val()
				},
				function(data){
					if (data.resultCode == "1") {
						add_message("am-btn-success","已成功生成计划!计划单号:"+data.resultContent,$WEB_ROOT_PATH+ "/ord/orderPlanCtrl!listMain.htm?dto.planNo="+data.resultContent);
					} else {
						add_message("am-btn-danger","操作失败!"+data.resultContent,"");
					}
				},
				'json'
		
		)
	}
</script>
<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-g am-container">
		<div class="am-u-lg-12" style="padding: 0px; margin-top: 10px">
			<div class="am-panel dhcc-panel-mt">
				<div class="am-panel-hd">
					<h3 class="am-panel-title">
						<span class="am-icon-cubes"></span>&nbsp;&nbsp;&nbsp;科室库存上下限
					</h3>
				</div>
				<div class="am-panel-bd">
					<div class="am-g">
						<form
							action="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm"
							method="post" class="am-form-inline" style="padding-left: 20px">

							<div class="am-checkbox">
								<label> <input type="checkbox" name="dto.minFlag" id="min">低于库存下限
								</label>
							</div>

							<div class="am-checkbox">
								<label> <input type="checkbox" name="dto.standFlag" id="stand">低于标准库存
								</label>
							</div>
							<div class="am-form-group" style="padding-left: 20px">
								<button type="submit" class="am-btn  am-btn-xs am-btn-default"><span class="am-icon-search"></span>查询</button>
							</div>
						</form>
					</div>
					<div class="am-btn-toolbar"
						style="margin-top: 5px; margin-bottom: 5px">
						<div class="am-btn-group am-btn-group-xs">
							<button type="button" class="am-btn am-btn-xs am-btn-default "
								onclick="savePlanByLocQty(this);" >
								<span class="am-icon-cart-plus"></span>生成采购计划
							</button>
						</div>
					</div>
					<table
						class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac">
						<thead>
							<tr>
								<!-- 
								<td style="width: 5px"><input type="checkbox" id="antiAll"
									onclick="checkSelect(this);" /></td>
								 -->
								<th style="width: 20px">序号</th>
								<th style="width: 150px">商品</th>
								<th style="width: 50px">单位</th>
								<th style="width: 60px">库存</th>
								<th style="width: 60px">库存上限</th>
								<th style="width: 50px">库存下限</th>
								<th style="width: 50px">标准库存</th>
								<!-- 
								<th style="width: 50px">操作</th>
								 -->
							</tr>
						</thead>
						<tbody>
							<s:iterator value="dto.hopIncLocs" status="status"
								id="hopIncLocs">
								<tr>
									<!-- 
									<td><input type="checkbox" name="checkbox"
										data-state="${orderState}" data-id="${orderId}" /></td>
									 -->
									<TD>${status.count}</TD>
									<!--  
											<td>${orderNo}</td>
										   -->
									<td>${hopIncLocs.incname}</td>
									<td>${hopIncLocs.uom}</td>
									<td>${hopIncLocs.incLocQty}</td>
									<td>${hopIncLocs.incLocMaxQty}</td>
									<td>${hopIncLocs.incLocMinQty}</td>
									<td style="padding: 0px">${hopIncLocs.incLocStandQty}</td>
									<!-- 
									<td style="padding: 0px">
										<div class="am-btn-group am-btn-group-xs">
											<s:set name="state" value="#orderDetails.orderState" />
											<s:if test="#state==1">
												<button type="button"
													class="am-btn am-btn-success am-btn-xs am-text-success">
													<span class="am-icon-check-square-o"></span>已选
												</button>
											</s:if>
											<s:if test="#state==2">
												<button type="button"
													class="am-btn am-btn-danger am-btn-xs am-text-danger">
													<span class="am-icon-square-o"></span>未选
												</button>
											</s:if>


											<button type="button"
												class="am-btn am-btn-success am-btn-xs am-text-success">
												<span class="am-icon-cart-plus"></span>选购
											</button>
										</div>
									</td>
									 -->
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<div class="am-margin am-cf">
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
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=1">首页</a></li>
						    <li class="am-disabled" id="prePage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo-1}">&laquo;上一页</a></li>
						</s:if>
						<s:else>
							<li id="firstPage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=1">首页</a></li>
							<li id="prePage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo-1}">&laquo;上一页</a></li>
						</s:else>
						<s:if test="#page==#pageCount">
							<li class="am-disabled" id="nextPage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo+1}">&raquo;下一页</a></li>
							<li class="am-disabled" id="lastPage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo="
								${dto.pageCount}>尾页</a></li>
						</s:if>
						<s:else>
							<li id="nextPage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=${dto.pageModel.pageNo+1}">&raquo;下一页</a></li>
							<li id="lastPage"><a
								href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm?dto.pageModel.pageNo=${dto.pageCount}">尾页</a></li>
						</s:else>
						<li><input id="skipVal" style="width: 30px"
							value="${dto.pageModel.pageNo}" /></li>
						<li><input id="skipTo" type="button" value="跳到"></li>
					</ol>
				</div>
			</div>
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