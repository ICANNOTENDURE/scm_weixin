<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximun-scale=1.0, user-scalable=no">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/weixin/ToDoTask.css"
	rel="stylesheet" type="text/css" />
<title>东华医疗供应链(SCI)</title>
<script type="text/javascript">
	$(function() {
		$(".deliver-history-list li").on('click',
						function() {
							window.location.href = $WEB_ROOT_PATH
									+ "/weixin/mpInGdRecCtrl!mpListInGdRecDetail.htm?dto.stInGdRec.ingdrecId="
									+ $(this).children().first().text();
						});
	});
	function goUrl(pageNo){
		$("#qurPageNo").val(pageNo);
		$("#subscribe-form").submit();
	} 
</script>
</head>
<body>

	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>

	<!--end-->
	
	<!-- 查询条件 -->
	<form id="subscribe-form"
		action="<%=request.getContextPath()%>/weixin/mpInGdRecCtrl!mpListInGdRec.htm"
		method="post">
		    <input type="hidden" name="dto.startDate" value="${dto.startDate}" id="qurStart"/>
		    <input type="hidden" name="dto.endDate" value="${dto.endDate}" id="qurEnd"/>	
			<input type="hidden" name="dto.pageModel.pageNo" value="${dto.pageModel.pageNo}" id="qurPageNo"/>
			<input type="hidden" name="dto.pageModel.pageSize" value="${dto.pageModel.pageSize}" />
	</form>
		
	<!-- end -->
	<!--折叠面板-->
	<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
		<ul class="am-tabs-nav am-cf">
			<li class="am-active"><a href="[data-tab-panel-0]">全部</a></li>
		</ul>
		<div class="am-tabs-bd">
			<div data-tab-panel-0 class="am-tab-panel am-active">
				<ul class="deliver-history-list">
					<s:iterator value="dto.gdRecVOs" status="status" id="pageData">
						<li ng-repeat="item in jobList"><header class="ellipsis">
								<h1 class="title ng-binding">${pageData.no}</h1>
							</header>
							<div class="status ng-binding">${pageData.user}</div>
							<p class="ellipsis ng-binding">
								<span class="salary ng-binding">${pageData.ven}</span>|
								${pageData.loc}
							</p>
							<p class="time ng-binding">${pageData.date}</p></li>
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
								<li id="firstPage"><a href="javascript:goUrl('1')">首页</a></li>
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
	<!--end-->
	<!--页脚-->
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
	<!--end-->
</body>

</body>
</html>
