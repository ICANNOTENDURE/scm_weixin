<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>history</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/timeline/default.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/timeline/component.css" />
		<script src="<%=request.getContextPath()%>/js/timeline/modernizr.custom.js"></script>
		<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
</head>
<body>
	
	<div class="container">
			<header class="clearfix">
				<span>供应商资质修改历史</span>
				<h1><s:property value='vendor.name'/></h1>
				<nav>
					<a href="hopVendorCtrl!listDetail.htm" class="icon-drop" data-info="返回">返回</a>
				</nav>
			</header>	
			<div class="main">
				<ul class="cbp_tmtimeline">
					<s:iterator value="hopVendorLogs" status="all" id="log">
						<li>
						<time class="cbp_tmtime" > <span><s:property value='#log.operateTime'/></span><span><s:property value='#log.operateYMD'/></span></time>
						<div class="cbp_tmicon cbp_tmicon-phone"></div>
						<div class="cbp_tmlabel">
							<s:if test='#log.operateType=="P"'>  
							    <h2>
							    <figure data-am-widget="figure"
										class="am am-figure am-table-figure-default "
										data-am-figure="{ pureview: 'true' }">
							    <img src="<%=request.getContextPath()%>/uploads/<s:property value='#log.opContent'/>" style="width: 200px;height: 200px"
							    data-rel="<%=request.getContextPath()%>/uploads/<s:property value='#log.opContent'/>" alt=<s:property value='#log.optitle'/>>
							    <s:property value='#log.optitle'/>
							    </figure>
							    </h2>
							    <!-- 
								<p><s:property value='#log.optitle'/>上传图片</p>
								 -->
								<p>操作人:<s:property value='#log.opUserName'/>,操作Ip：<s:property value='#log.operateIp'/></p>
							</s:if>  
							<s:else>  
							    <h2><s:property value='#log.opContent'/></h2>
								<p>操作人:<s:property value='#log.opUserName'/>,操作Ip：<s:property value='#log.operateIp'/></p>
							</s:else> 
							</div>
						</li> 		 		
					</s:iterator>
				</ul>
			</div>
		</div>	
</body>
</html>
