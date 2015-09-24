<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/hopIncNews.js"></script>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />
<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-g am-container">
		<div class="am-g">
			<div class="am-u-lg-8 am-u-lg-offset-2 am-u-end"
				style="padding: 0px; margin-top: 10px">
				<s:if test="dto.operateResult.resultCode==1">
					<div class="am-alert am-alert-success" data-am-alert>
						<button type="button" class="am-close">&times;</button>
						<h3>
							<span class="am-icon-check"></span>&nbsp;&nbsp;&nbsp;操作成功
						</h3>
						<p>${dto.operateResult.resultContent}</p>
					</div>
				</s:if>
				<s:else>
					<div class="am-alert am-alert-danger" data-am-alert>
						<button type="button" class="am-close">&times;</button>
						<h3>
							<span class="am-icon-exclamation-triangle"></span>&nbsp;&nbsp;&nbsp;操作失败
						</h3>
						<p>${dto.operateResult.resultContent}</p>
					</div>
				</s:else>
			</div>
		</div>
		<div class="am-g">
			<div class="am-u-lg-8 am-u-lg-offset-2 am-u-end"
				style="padding: 0px; margin-top: 10px">

				<div class="am-btn-group am-btn-group-justify">
					<a class="am-btn am-btn-mt" role="button"
						href="<%=request.getContextPath()%>/${dto.backUrl}"><span
						class="am-icon-undo"></span>&nbsp;&nbsp;&nbsp;返回继续增加</a> <a
						class="am-btn am-btn-mt" role="button"
						href="<%=request.getContextPath()%>/${dto.listUrl}"><span
						class="am-icon-list"></span>&nbsp;&nbsp;&nbsp;查看以增加列表</a>
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