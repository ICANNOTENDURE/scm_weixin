<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/HopIncNewsList.js"></script>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />
<title>东华电子商务平台(SCI)</title>
<style type="text/css">
.am-list-item-hd a {
	color: rgb(43, 184, 170)
}

.am-list-item-hd a:hover {
	color: #09aa83
}

.am-list li:first-child {
	border-top: none
}
</style>
</head>
<body>
	<!--am-topbar-inverse-->
	<s:if test="dto.userType==3">
		<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	</s:if>
	<s:else>
		<%@include file="/WEB-INF/jsp/venPortal/venCommon.jsp"%>
	</s:else>
	<div class="am-g am-container">
		<div class="am-u-lg-12"
			style="padding: 0px; margin-top: 10px; margin-bottom: 10px">
			<div class="am-panel dhcc-panel-mt">
				<div class="am-panel-hd">
					<h3 class="am-panel-title">
						<span class="am-icon-newspaper-o"></span>&nbsp;&nbsp;&nbsp;医院新闻列表
					</h3>
				</div>
				<div class="am-panel-bd" style="min-height: 450px;padding-top: 0px;margin-top: 0px;padding-top: 0px;padding-bottom: 0px">
					<div data-am-widget="list_news"
						class="am-list-news am-list-news-default">
						<div class="am-list-news-bd am-cf">
							<ul class="am-list" id="newsList" >

							</ul>
						</div>
					</div>
					<div id="page" style="margin-top: 0;margin-bottom: 0px"></div>
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