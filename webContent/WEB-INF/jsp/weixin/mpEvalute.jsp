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
<link href="<%=request.getContextPath()%>/css/comment/star.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/comment/comment.js"></script>
<title>东华医疗供应链(SCI)</title>

<script type="text/javascript">
	$(function() {
		for(var i=1;i<5;i++){
			var kk="";
		
			var options	= {
					defaultTips:false,	
					max	: 5,
					title_format	: function(value) {
						var title = '';
						switch (value) {
							case 1 : 
								title	= '很不满意';
								break;
							case 2 : 
								title	= '不满意';
								break;
							case 3 : 
								title	= '一般';
								break;
							case 4 : 
								title	= '满意';
								break;
							case 5 : 
								title	= '非常满意';
								break;
							default :
								title = value;
								break;
						}
						return title;
					},
				value:kk		
			};
			$('#rate-comm-'+i).rater(options);
		}
	});
</script>
</head>
<body>

	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>

	<!--end-->
	<div class="quiz">
		<h3>我的评价</h3>
		<div class="quiz_content">
			<form action="" id="" method="post">
				<div class="goods-comm">
					<div class="goods-comm-stars">
						<span class="star_l">&nbsp;&nbsp;&nbsp;&nbsp;满意度：</span>
						<div id="rate-comm-1" class="rate-comm"></div>
						<input id="StarNum1" type="hidden" name="StarNum"></input>
					</div>
				</div>
				<div class="goods-comm">
					<div class="goods-comm-stars">
						<span class="star_l">商品描述：</span>
						<div id="rate-comm-2" class="rate-comm"></div>
						<input id="StarNum2" type="hidden" name="StarNum"></input>
					</div>
				</div>
				<div class="goods-comm">
					<div class="goods-comm-stars">
						<span class="star_l">服务态度：</span>
						<div id="rate-comm-3" class="rate-comm"></div>
						<input id="StarNum3" type="hidden" name="StarNum"></input>
					</div>
				</div>
				<div class="goods-comm">
					<div class="goods-comm-stars">
						<span class="star_l">发货速度：</span>
						<div id="rate-comm-4" class="rate-comm"></div>
						<input id="StarNum4" type="hidden" name="StarNum"></input>
					</div>
				</div>

				<div style="float: left;">
					<div class="item">
						<div class="item">
							<span class="label">心得(商品是否给力？快分享你的购买心得吧~)：</span>
							<div class="cont">
								<textarea id="content" class="area"
									><s:property value="dto.evalute.eleContent" /></textarea>
								<div class="clr"></div>
								<span class="msg-error-01 hide">麻烦填写10-500个字呦</span>
								<div class="msg-text ftx-03">10-500字</div>
							</div>
							<div class="clr"></div>
						</div>
						<input type="hidden" id="orderId"
							value="<s:property value="dto.evalute.orderId" />" /> <input
							type="hidden" id="eveId"
							value="<s:property value="dto.evalute.evaluteId" />" /> <input
							type="hidden" id="eleResult"
							value="<s:property value="dto.evalute.eleResult" />" /> <input
							type="hidden" id="eleSpeed"
							value="<s:property value="dto.evalute.eleSpeed" />" /> <input
							type="hidden" id="eleService"
							value="<s:property value="dto.evalute.eleService" />" /> <input
							type="hidden" id="eleDescription"
							value="<s:property value="dto.evalute.eleDescription" />" />
						<s:set name="state" value="dto.id" />
						<s:if test="#state==0">
							<button type="button" class="am-btn am-btn-primary">主色按钮</button>
						</s:if>
					</div>
			</form>
		</div>
		<!--quiz_content end-->
	</div>
	
	<!--end-->
	<!--页脚-->
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
	<!--end-->
</body>

</body>
</html>
