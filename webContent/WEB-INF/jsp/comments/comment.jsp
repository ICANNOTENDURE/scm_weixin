<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/jquery.jsp"%>
<script src="<%=request.getContextPath()%>/js/comment/comment.js"></script>
<script src="<%=request.getContextPath()%>/js/comment/saveComment.js"></script>


<style type="text/css">
* {
	margin: 0;
	list-style-type: none;
}

a,img {
	border: 0;
}

body {
	font: 12px/180% Arial, Helvetica, sans-serif;
}
/*quiz style*/
.quiz {
	border: solid 1px #ccc;
	height: 550px;
	width: 620px;
	padding-left: 5px
}

.quiz h3 {
	font-size: 14px;
	line-height: 35px;
	height: 35px;
	border-bottom: solid 1px #e8e8e8;
	padding-left: 20px;
	background: #f8f8f8;
	color: #666;
	position: relative;
}

.quiz_content {
	padding-top: 10px;
	padding-left: 20px;
	position: relative;
	height: 205px;
}

.quiz_content .btm {
	border: none;
	width: 100px;
	height: 33px;
	background: url(../images/comment/btn.png) no-repeat;
	margin: 30px 0 0 64px;
	display: inline;
	cursor: pointer;
}

.quiz_content li.full-comment {
	position: relative;
	z-index: 99;
	height: 41px;
}

.quiz_content li.cate_l {
	height: 24px;
	line-height: 24px;
	padding-bottom: 10px;
}

.quiz_content li.cate_l dl dt {
	float: left;
}

.quiz_content li.cate_l dl dd {
	float: left;
	padding-right: 15px;
}

.quiz_content li.cate_l dl dd label {
	cursor: pointer;
}

/*goods-comm-stars style*/
.goods-comm {
	height: 41px;
	position: relative;
	z-index: 7;
}

.goods-comm-stars {
	line-height: 25px;
	padding-left: 12px;
	height: 41px;
	position: absolute;
	top: 0px;
	left: 0;
	width: 400px;
}

.goods-comm-stars .star_l {
	float: left;
	display: inline-block;
	margin-right: 5px;
	display: inline;
}

.goods-comm-stars .star_choose {
	float: left;
	display: inline-block;
}
/* rater star */
.rater-star {
	position: relative;
	list-style: none;
	margin: 0;
	padding: 0;
	background-repeat: repeat-x;
	background-position: left top;
	float: left;
}

.rater-star-item,.rater-star-item-current,.rater-star-item-hover {
	position: absolute;
	top: 0;
	left: 0;
	background-repeat: repeat-x;
}

.rater-star-item {
	background-position: -100% -100%;
}

.rater-star-item-hover {
	background-position: 0 -48px;
	cursor: pointer;
}

.rater-star-item-current {
	background-position: 0 -48px;
	cursor: pointer;
}

.rater-star-item-current.rater-star-happy {
	background-position: 0 -25px;
}

.rater-star-item-hover.rater-star-happy {
	background-position: 0 -25px;
}

.rater-star-item-current.rater-star-full {
	background-position: 0 -72px;
}
/* popinfo */
.popinfo {
	display: none;
	position: absolute;
	top: 30px;
	background: url(../images/comment/infobox-bg.gif) no-repeat;
	padding-top: 8px;
	width: 192px;
	margin-left: -14px;
	z-index: 999 !important;
}

.popinfo .info-box {
	border: 1px solid #f00;
	border-top: 0;
	padding: 0 5px;
	color: #F60;
	background: #FFF;
	z-index: 999
}

.popinfo .info-box div {
	color: #333;
	z-index: 999
}

.rater-click-tips {
	font: 12px/25px;
	color: #333;
	margin-left: 10px;
	background: url(../images/comment/infobox-bg-l.gif) no-repeat 0 0;
	width: 125px;
	height: 34px;
	padding-left: 16px;
	overflow: hidden;
}

.rater-click-tips span {
	display: block;
	background: #FFF9DD url(../images/comment/infobox-bg-l-r.gif) no-repeat
		100% 0;
	height: 34px;
	line-height: 34px;
	padding-right: 5px;
}

.rater-star-item-tips {
	background: url(../images/comment/star-tips.gif) no-repeat 0 0;
	height: 41px;
	overflow: hidden;
}

.cur.rater-star-item-tips {
	display: block;
}

.rater-star-result {
	color: #FF6600;
	font-weight: bold;
	padding-left: 10px;
	float: left;
}

/*商品标签*/
.msg-text {
	float: right
}

.item {
	margin-bottom: 10px
}

.item .label em {
	padding-right: 3px;
	padding-top: 5px;
	vertical-align: middle;
	font-size: 16px
}

.area {
	width: 590px;
	height: 88px
}

.area01 {
	color: #ccc
}

.tips-list {
	width: 550px
}

.tips-list li {
	margin-right: 5px;
	float: left;
	cursor: pointer;
	line-height: 18px;
	padding: 6px 9px;
	background: #fff;
	border: 1px solid #ccc;
	margin-bottom: 5px;
	white-space: nowrap
}

.tips-list li s.f-check {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: middle;
	width: 13px;
	height: 13px;
	overflow: hidden;
	background:
		url(http://misc.360buyimg.com/user/myjd-2015/css/i/cicon.png) -38px 0;
	margin-right: 5px
}

.tips-list li s.f-input {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: middle;
	width: 12px;
	height: 14px;
	overflow: hidden;
	background:
		url(http://misc.360buyimg.com/user/myjd-2015/css/i/cicon.png) -53px 0;
	margin-right: 5px
}

.tips-list li.select {
	padding: 5px 8px;
	border: 2px solid #c00
}

.tips-list li.select s.f-check {
	background-position: -23px 0
}

.tips-list li .fore1 {
	float: left
}

.tips-list li .fore2 {
	position: relative;
	width: 90px
}

.tips-list li.list-last {
	position: relative
}

.tips-list li.list-last span {
	position: absolute;
	left: 95px;
	top: 5px;
	cursor: default
}

.tips-list li.list-last .itxt {
	padding: 5px;
	width: 86px
}

.tips-list li.list-last-input {
	padding: 0;
	border: 2px solid #c00
}

.tips-list li.list-last-input .itxt {
	border: 0;
	width: 80px
}

.itxt2 {
	width: 58px
}

.hide {
	display: none
}

.clr {
	display: block;
	overflow: hidden;
	clear: both;
	height: 0;
	line-height: 0;
	font-size: 0;
}
</style>
</head>
<body>
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
						<span class="label">标签：</span>
						<div>
							<ul class="tips-list">
								<s:iterator value="dto.catGroupProperties"
									id="catGroupProperties">
									<s:if test="#catGroupProperties.isCheck==Y">
										<li data-id="${catGroupProperties.grpProId}"><s
											class="f-check"></s>${catGroupProperties.grpProDesc}</li>
									</s:if>
									<s:else>
										<li data-id="${catGroupProperties.grpProId}" class="select"><s
											class="f-check"></s>${catGroupProperties.grpProDesc}</li>
									</s:else>
								</s:iterator>
								<s:set name="state" value="dto.id" />
								<s:if test="#state==0">
									<li class="list-last">
										<div class="fore1">
											<s class="f-input"></s>自定义
										</div>
										<div class="fore2 hide">
											<input type="text" maxlength="12" class="itxt">
											<!-- 
											<span
												class="" style="display: none;">按回车提交</span>
											 -->
										</div>
									</li>
								</s:if>
							</ul>
							<div class="clr"></div>
						</div>

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
							<input class="btm" id="commint"></input>
						</s:if>
					</div>
			</form>
		</div>
		<!--quiz_content end-->
	</div>

</body>
</html>