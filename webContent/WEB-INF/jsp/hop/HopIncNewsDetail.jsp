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
						<span class="am-icon-newspaper-o"></span>&nbsp;&nbsp;&nbsp;医院新闻
					</h3>
				</div>
				<div class="am-panel-bd" style="min-height: 520px">
					<article class="am-article">
					<div class="am-article-hd">
						<h1 class="am-article-title">${dto.hopIncNews.incNewsTitle}</h1>
						<div class="am-g">
							<div class="am-u-lg-3">
								<p class="am-article-meta">作者:${dto.hopIncNews.userName}</p>
							</div>
							<div class="am-u-lg-3">
								<p class="am-article-meta">阅读:${dto.hopIncNews.readCount}</p>
							</div>
							<div class="am-u-lg-4">
								<p class="am-article-meta">
									时间:${dto.hopIncNews.incNewsDate}
									<s:if test="dto.hopIncNews.incNewsPath!=null">
									&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="<%=request.getContextPath()%>/uploadNews/${dto.hopIncNews.incNewsPath}">下载附件</a>
									</s:if>
								</p>
							</div>
							<div class="am-u-lg-2">
								<button type="button" class="am-btn am-btn-xs am-btn-mt"
									onclick="javascript:window.location.href='hopIncNewsCtrl!listNewsMain.htm';">
									<span class="am-icon-windows"></span>&nbsp;&nbsp;&nbsp;返回通知列表
								</button>
							</div>
						</div>

					</div>

					<div class="am-article-bd">
						<p class="am-article-lead" style="min-height: 350px">${dto.hopIncNews.incNewsContetnt}</p>
					</div>
					</article>
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