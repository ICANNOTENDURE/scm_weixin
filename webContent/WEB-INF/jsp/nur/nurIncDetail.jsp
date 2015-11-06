<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/nur/scrollspy-nav.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/nur/replayBox.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurIncDetail.js"></script>
<title>东华医疗供应链(SCI)</title>
<style type="text/css">
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



.tips-list {
	width: 100%
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
	white-space: nowrap;
	color: #2BB8AA
}



.tips-list li.select {
	padding: 5px 8px;
	border: 2px solid #2BB8AA
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
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<%@include file="/WEB-INF/jsp/nur/nurNavHeader.jsp"%>

	<div class="am-g">
		<div class="am-u-lg-3 am-u-lg-offset-1">
			<div data-am-widget="slider" class="am-slider am-slider-default"
				data-am-slider="{&quot;animation&quot;:&quot;slide&quot;,&quot;controlNav&quot;:&quot;thumbnails&quot;}">
				<ul class="am-slides">

					<s:iterator value="dto.venIncPics" status="all" id="venIncPics">
						<li
							data-thumb="<%=request.getContextPath()%>/uploadPic/${venIncPics.venIncPicPath}">
							<img
							src="<%=request.getContextPath()%>/uploadPic/${venIncPics.venIncPicPath}" />
						</li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<div class="am-u-lg-3">
			<hr>
			<article class="blog-main">
			<h3 class="am-article-title blog-title">
				<a href="#">${dto.nurseIncDetailVo.incname}</a>
			</h3>
			<h4 class="am-article-meta blog-meta">
				<!-- by <a href="">admin</a> update on 2015/03/15 under
				 -->
			</h4>
			<div class="am-g">
				<div class="am-u-lg-2"></div>
				<div class="am-u-lg-10">
					<span><b>${dto.nurseIncDetailVo.rp}元</b></span>
				</div>
			</div>
			<br>
			<div class="am-g">
				<div class="am-u-lg-8 am-u-end">
					<div class="am-input-group">
						<span class="am-input-group-label" name="minus"><a href="#"><i
								class="am-icon-minus-square-o" id="minus"></i></a></span> <input
							type="text" class="am-form-field" value=1 id="shopQty"> <span
							class="am-input-group-label" name="plus"><a href="#"><i
								class="am-icon-plus-square-o" id="plus"></i></a></span>
					</div>
				</div>
			</div>
			<div style="margin-top: 10px">
				<button type="button" class="am-btn am-btn-mt am-btn-block"
					id="shopCart">
					<i class="am-icon-shopping-cart"></i>&nbsp;&nbsp;&nbsp;加入购物车
				</button>
			</div>
			</article>
		</div>
		<div class="am-u-lg-4 am-u-end">
			<div id="venInfo" style="height: 250px;"></div>
		</div>
	</div>

	<div class="am-g">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<nav class="scrollspy-nav" data-am-scrollspy-nav="{offsetTop: 40}"
				data-am-sticky="{top:50}">
			<ul>
				<li><a href="#team">商品介绍</a></li>
				<li><a href="#about" id="gotoAbout">评价</a></li>
				<li><a href="#ask">商品咨询</a></li>
				<li><a href="#sm">相关商品</a></li>
			</ul>
			</nav>
			<div class="am-panel am-panel-default" id="team">
				<div class="am-panel-hd">商品介绍</div>
				<div class="am-panel-bd">
					<div class="am-g">
						<div class="am-u-lg-12">
							<input type="hidden" id="incid"
								value="${dto.nurseIncDetailVo.incid}"> <input
								type="hidden" id="venincid"
								value="${dto.nurseIncDetailVo.venincid}"> <input
								type="hidden" id="showCommentFlag"
								value="${dto.showCommentFlag}">
							<ul class="am-list" style="margin-top: 0px; margin-bottom: 0px">
								<li style="border-top: none"><a style="color: black">代码:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.inccode}</a></li>
								<li><a style="color: black">名称:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.incname}</a></li>
								<li><a style="color: black">单位:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.incuom}</a></li>
								<li><a style="color: black">价格:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.rp}</a></li>
								<li><a style="color: black">规格:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.spec}</a></li>

								<li><a style="color: black">厂商:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.manf}</a></li>
								<li style="border-bottom: none"><a style="color: black">供应商:&nbsp;&nbsp;&nbsp;&nbsp;${dto.nurseIncDetailVo.venname}</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="am-panel am-panel-default" id="about">
				<div class="am-panel-hd">评价</div>
				<div class="am-panel-bd">
					<div class="am-panel-bd am-collapse am-in am-cf"
						id="collapse-panel-3" style="padding: 0, 0, 0, 0">
						<div class="item">
							<div>
								<ul class="tips-list">
									<li >标签：</li>
									<s:iterator value="dto.chartVOs"
										id="catGroupProperties">
										
										<li class="select">${catGroupProperties.name}</li>
									</s:iterator>
								</ul>
								<div class="clr"></div>
							</div>
						</div>

						<ul class="am-comments-list" id="commentList">
						</ul>
						<div id="commentPage"></div>
					</div>
				</div>
			</div>

			<div class="am-panel am-panel-default" id="ask">
				<div class="am-panel-hd">商品咨询</div>
				<div class="am-panel-bd am-collapse am-in am-cf"
					style="padding: 0, 0, 0, 0">
					<div class="ds-replybox">
						<a class="ds-avatar"><img
							src="http://static.duoshuo.com/images/noavatar_default.png"></a>
						<div class="ds-textarea-wrapper ds-rounded-top">
							<textarea name="dto.venIncAdvice.venIncAdviceAsk"
								title="Ctrl+Enter快捷提交" placeholder="说点什么吧…" id="venIncAdviceAsk"></textarea>
						</div>
						<div class="ds-post-toolbar">
							<div class="ds-post-options ds-gradient-bg"></div>
							<button class="ds-post-button" type="button">提问</button>
						</div>
					</div>
					<!-- 商品咨询历史 -->

					<div id="listAdvice"></div>
					<div id="AdvicePage"></div>
				</div>
				<!--  -->
			</div>
			<div class="am-panel am-panel-default" id="sm">
				<div class="am-panel-hd">相关商品</div>
				<div class="am-panel-bd">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-title">商品名称</th>
									<th class="table-author">规格</th>
									<th class="table-author am-hide-sm-only">价格</th>
									<th class="table-title am-hide-sm-only">产地</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="dto.nurseIncVos" status="all"
									id="nurseIncVos">
									<tr>
										<td><a
											href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseIncDetail.htm?dto.ordShopping.shopVenIncid=${nurseIncVos.venincid}&dto.ordShopping.shopIncid=${nurseIncVos.incid}&dto.ordShopping.shopRp=${nurseIncVos.rp}">${nurseIncVos.incname}</a></td>
										<td>${nurseIncVos.spec}</td>
										<td class="am-hide-sm-only">${nurseIncVos.rp}元</td>
										<td class="am-hide-sm-only">${nurseIncVos.manf}</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</form>
				</div>
			</div>

		</div>
	</div>

	<!-- foot-->

	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
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