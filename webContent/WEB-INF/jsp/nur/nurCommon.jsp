<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华电子商务平台(SCI)</title>
<script type="text/javascript">
	$(function() {
		$.ajaxSettings.async = false;
	    $.getJSON($WEB_ROOT_PATH+"/authenTicket/authenTicketCtrl!GetMainMeun.htm", function (json) {
	    	var html="";
	        $.each(json, function (i) {
					if(json[i].children.length==0){
						html=html+"<li data-am-dropdown>";
						html=html+"<a href='"+$WEB_ROOT_PATH+"/"+json[i].secutiryUrl+"'>";
						html=html+"<span class='"+json[i].imgUrl+"' ></span>"+json[i].funcName+"</a>";
						html=html+"</li>";
					}else{
						html=html+"<li class='am-dropdown am-dropdown-flip' data-am-dropdown onclick='displaySub(this)'>";
						html=html+"<a href='javascript:;' class='am-dropdown-toggle' data-am-dropdown-toggle ><span class="+json[i].imgUrl+"></span>"+json[i].funcName+"<span class='am-icon-caret-down'></span></a>";
						html=html+"<ul class='am-dropdown-content'>";
						
						$.each(json[i].children, function (j) {
		                    html=html+"<li><a href='"+$WEB_ROOT_PATH+"/"+json[i].children[j].secutiryUrl+"'><span class='"+json[i].children[j].imgUrl+"'></span>&nbsp;&nbsp;"+json[i].children[j].funcName+"</a></li>";
							html=html+"<li>";
						});
						html=html+"</ul>";
						html=html+"</li>";
					}
	        });
	        //html=html+"<li class='am-hide-sm-only'><a href='javascript:;' id='admin-fullscreen'><span class='am-icon-arrows-alt'></span> <span class='admin-fullText' title='开启全屏'>全屏</span></a></li>";
	        $("#headerMenu").append(html);
	 
	    });
		//登录按钮
		$('#loginBtn').click(function() {
			window.location.href = $WEB_ROOT_PATH + "/login.htm";
		});
		//购物车结算
		$('#calculatorBtn').click(
				function() {
					window.location.href = $WEB_ROOT_PATH
							+ "/nur/nurseCtrl!nursePay.htm";
				});
		//我的订单
		$('#myOrderBtn').click(
				function() {
					window.location.href = $WEB_ROOT_PATH
							+ "/nur/nurseCtrl!nurseOrder.htm";
				});
		$('#goToOrder').click(
				function() {
					window.location.href = $WEB_ROOT_PATH
							+ "/nur/nurseCtrl!nurseOrder.htm";
				});
		$('#jixuShop').click(
				function() {
					window.location.href = $WEB_ROOT_PATH
							+ "/nur/nurseCtrl!nurseManageMain.htm";
				});
		//退出
		$('#safequit')
				.click(
						function() {
							$(".am-modal-bd").html("确认要退出吗");
							$('#dhcc-confirm')
									.modal(
											{
												relatedTarget : this,
												onConfirm : function(options) {
													$
															.post(
																	$WEB_ROOT_PATH
																			+ "/authenTicket/authenTicketCtrl!logout.htm",
																	function(
																			data) {
																		window.location.href = "../";
																	});
												}
											});

						});

		if (document.body.clientHeight < document.documentElement.clientHeight) {
			$("#xxx2").removeAttr("style");
		} else {
			$("#xxx1").removeAttr("style");
		}
		var $fullText = $('.admin-fullText');
		$('#admin-fullscreen').on('click', function() {
			$.AMUI.fullscreen.toggle();
		});

		$(document).on(
				$.AMUI.fullscreen.raw.fullscreenchange,
				function() {
					$.AMUI.fullscreen.isFullscreen ? $fullText.text('关闭全屏')
							: $fullText.text('开启全屏');
				});

	});
	function addAdress() {
		$("#dhcc-popup-address").modal('toggle');
		$("#addressFrame")[0].src = getContextPath()
				+ '/nur/nurseCtrl!nurseDestination.htm';
	}
	function displaySub(obj){
		dis=$(obj).find(".am-dropdown-content");
		if(dis.css('display')=='none'){
			$(".am-dropdown-content").css('display','none');
			dis.css('display','block');
		}else{
			$(".am-dropdown-content").css('display','none');
			dis.css('display','none');
		}
	}
</script>
<style type="text/css">
.admin-header {
	font-size: 1.4rem;
}

.admin-header-list a:hover :after {
	content: none;
}

.admin-main {
	background: #f3f3f3;
}

.admin-menu {
	position: fixed;
	bottom: 30px;
	right: 20px;
}
</style>
</head>
<body>
	<!--导航菜单部分-->
	<header class="am-topbar am-topbar-fixed-top admin-header">
	<div class="am-g">
		<div class="am-u-lg-3 am-u-lg-offset-1">
			<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list"
				style="margin-top: 0px">
				<li><a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm"><span
						class="am-icon-home am-icon-md"></span>首页</a></li>

				<li data-am-dropdown><a href="#" id="loginBtn"><span
						class="am-icon-user"></span>登录</a></li>

				<li data-am-dropdown><a href="#" id="safequit"><span
						class="am-icon-power-off"></span>注销</a></li>
			</ul>
		</div>
		<div class="am-u-lg-8">
			<ul
				class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list"
				style="margin-top: 0px" id="headerMenu">
				<!--  
				<li data-am-dropdown><a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurOrdImp.htm"><span
						class="am-icon-upload" ></span>上传订单</a></li>
				<li>
				
				<li data-am-dropdown><a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm"><span
						class="am-icon-book" id="myOrderBtn"></span>我的订单</a></li>
				<li><a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nursePay.htm"><span
						class="am-icon-calculator"></span>购物车结算</a></li>
						
				<li class="am-dropdown" data-am-dropdown><a
					class="am-dropdown-toggle" data-am-dropdown-toggle
					href="javascript:;"><span class="am-icon-line-chart"></span>报表<span
						class="am-icon-caret-down"></span></a>

					<ul class="am-dropdown-content">
						科室
						<li class="am-divider"></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!listLocGroupAmt.htm"><span class="am-icon-tag"></span>&nbsp;&nbsp;科室采购分类</a></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!listLocIncAmt.htm"><span class="am-icon-tag"></span>&nbsp;&nbsp;科室采购商品汇总</a></li>
						
						<li><a href="#"><span class="am-icon-tag"></span>&nbsp;&nbsp;科室采购商品明细</a></li>
						
						全院
						<li class="am-divider"></li>
						<li><a
							href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocAmt.htm"><span
								class="am-icon-tag"></span>&nbsp;&nbsp;全院科室采购金额</a></li>
						<li><a
							href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocIncPrice.htm"><span
								class="am-icon-tag"></span>&nbsp;&nbsp;全院科室单品采购均价</a></li>
						<li><a
							href="<%=request.getContextPath()%>/chart/chartCtrl!listLocAmtGrpByDate.htm"><span
								class="am-icon-tag"></span>&nbsp;&nbsp;全院科室采购金额环比</a></li>
						<li><a
							href="<%=request.getContextPath()%>/chart/chartCtrl!listLocPriceGrpByDate.htm"><span
								class="am-icon-tag"></span>&nbsp;&nbsp;全院科室采购单价环比</a></li>		
					</ul></li>
				<li class="am-dropdown" data-am-dropdown><a
					class="am-dropdown-toggle" data-am-dropdown-toggle
					href="javascript:;"><span class="am-icon-bars"></span>常用<span
						class="am-icon-caret-down"></span></a>

					<ul class="am-dropdown-content">
						<li><a
							href="<%=request.getContextPath()%>/comment/CommentCtrl!venIncEval.htm"><span
								class="am-icon-comments-o"></span>&nbsp;&nbsp;供应商商品牌评价</a></li>
						<li>
						<li><a
							href="<%=request.getContextPath()%>/comment/CommentCtrl!venEval.htm"><span
								class="am-icon-comment-o"></span>&nbsp;&nbsp;供应商评价</a></li>
						<li>
						<li><a
							href="<%=request.getContextPath()%>/hop/hopIncNewsCtrl!listMain.htm"><span
								class="am-icon-newspaper-o"></span>&nbsp;&nbsp;新闻发布</a></li>
						<li>
						<li><a
							href="<%=request.getContextPath()%>/hop/hopIncNewsCtrl!listNewsMain.htm"><span
								class="am-icon-bars"></span>&nbsp;&nbsp;查看新闻</a></li>
						<li><a
							href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseInfomation.htm"><span
								class="am-icon-user"></span>&nbsp;&nbsp;个人信息</a></li>
						<li><a href="#" onclick="addAdress()"><span
								class="am-icon-bicycle"></span>&nbsp;&nbsp;收货地址</a></li>
						<li><a
							href="<%=request.getContextPath()%>/hop/hopIncLocCtrl!listMain.htm"><span
								class="am-icon-cubes"></span>&nbsp;&nbsp;科室库存</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ord/orderPlanCtrl!listMain.htm"><span
								class="am-icon-eyedropper"></span>&nbsp;&nbsp;采购计划</a></li>
					
					</ul></li>
					

				<li class="am-hide-sm-only"><a href="javascript:;"
					id="admin-fullscreen"><span class="am-icon-arrows-alt"></span>
						<span class="admin-fullText" title="开启全屏">全屏</span></a></li>
				-->		
			</ul>
		</div>
	</div>
	</header>





	<!--  confirm-->

	<div class="am-modal am-modal-confirm" tabindex="-1" id="dhcc-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">提示</div>
			<div class="am-modal-bd">你，确定要删除这条记录吗？</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<!-- alert -->
	<div class="am-modal am-modal-alert" tabindex="-1" id="dhcc-alert">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">提示</div>
			<div class="am-modal-bd" id="alert-message">提示</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn">确定</span>
			</div>
		</div>
	</div>
	<div class="am-modal" tabindex="-1" id="dhcc-popup">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				成功 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<hr data-am-widget="divider" style=""
				class="am-divider am-divider-default" />
			<div class="am-modal-bd">
				<i class="am-icon-check-square"></i>以成功加入购物车
			</div>
			<button type="button" class="am-btn am-btn-success am-btn-block"
				id="jixu">
				<i class="am-icon-shopping-cart"></i>&nbsp;&nbsp;&nbsp;继续购物
			</button>
			<button type="button" class="am-btn am-btn-danger am-btn-block"
				id="jiesuan">
				<i class="am-icon-calculator"></i>&nbsp;&nbsp;&nbsp;结算
			</button>
		</div>
	</div>

	<div class="am-modal" tabindex="-1" id="dhcc-popup-2">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				成功 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<hr data-am-widget="divider" style=""
				class="am-divider am-divider-default" />
			<div class="am-modal-bd">
				<i class="am-icon-check-square"></i>
			</div>
			<button type="button" class="am-btn am-btn-success am-btn-block"
				id="jixuShop">
				<i class="am-icon-shopping-cart"></i>&nbsp;&nbsp;&nbsp;继续购物
			</button>
			<button type="button" class="am-btn am-btn-danger am-btn-block"
				id="goToOrder">
				<i class="am-icon-cubes"></i>&nbsp;&nbsp;&nbsp;查看订单
			</button>
		</div>
	</div>


	<!-- prompt -->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="dhcc-prompt">
		<div class="am-modal-dialog">
			<div class="am-modal-hd"></div>
			<div class="am-modal-bd">
				<input type="text" class="am-modal-prompt-input">
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>提交</span>
			</div>
		</div>
	</div>
	<!-- loading -->
	<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1"
		id="dhcc-modal-loading">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">正在载入...</div>
			<div class="am-modal-bd">
				<span class="am-icon-spinner am-icon-spin"></span>
			</div>
		</div>
	</div>


	<div class="am-popup" id="dhcc-popup-address">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">收货地址</h4>
				<span data-am-modal-close class="am-close">&times;</span>
			</div>
			<iframe id="addressFrame" style="width: 100%; height: 100%;"
				frameborder="0"></iframe>
		</div>
	</div>

	<div data-am-widget="gotop" class="am-gotop am-gotop-fixed">
		<a href="#top" title=""> <img class="am-gotop-icon-custom"
			src="<%=request.getContextPath()%>/images/goTop.gif" />
		</a>
	</div>
</body>
</html>