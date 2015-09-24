<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华电子商务平台(SCI)</title>
<script type="text/javascript">
$(function(){
		//登录按钮
		$('#loginBtn').click(function () {
	  		window.location.href="<%=request.getContextPath()%>/login.htm";
		});
		//购物车结算
		$('#calculatorBtn').click(function () {
			window.location.href="<%=request.getContextPath()%>/nur/nurseCtrl!nursePay.htm";
		});
		//我的订单
		$('#myOrderBtn').click(function () {
			window.location.href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm";
		});
		$('#goToOrder').click(function () {
			window.location.href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseOrder.htm";
		});
		$('#jixuShop').click(function () {
			window.location.href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm";
		});
		//退出
		$('#safequit').click(function () {
			 $(".am-modal-bd").html("确认要退出吗");
			 $('#dhcc-confirm').modal({
			        relatedTarget: this,
			        onConfirm: function(options) {
			        	$.post(
			        			"<%=request.getContextPath()%>/authenTicket/authenTicketCtrl!logout.htm",
			    				function(data){
			    					window.location.href="../";
			    				}
			    		);
			        },
			        onCancel: function() {
			          
			        }
			 });
	  		
		});
		//加载大类
		$("#SelectCat").click(function(){
			$("#catGroup li").remove();
			$("#catGroup").append("<li><a  href='#' id="+0+">"+"全部"+"</a></li>");
			$.post("<%=request.getContextPath()%>/nur/nurseCtrl!catGroupList.htm",
											"",
											function(data) {
												for (var i = 0; i < data.total; i++) {
													if (i == 0) {
														$("#catGroup")
																.append(
																		"<li class='am-active'><a  href='#' id="+data.rows[i].subparrefgroupid+">"
																				+ data.rows[i].subparrefgroupname
																				+ "</a></li>");
													} else {
														$("#catGroup")
																.append(
																		"<li><a href='#' id="+data.rows[i].subparrefgroupid+">"
																				+ data.rows[i].subparrefgroupname
																				+ "</a></li>");
													}
													//默认取第一个选项卡的值
													if (i == 0) {
														$
																.post(
																		getContextPath()
																				+ "/nur/nurseCtrl!getSubGroupByID.htm",
																		{
																			'dto.catGroup.groupID' : data.rows[0].subparrefgroupid
																		},
																		function(
																				datas) {
																			$(
																					"#subcatgroup")
																					.html(
																							"");
																			var totals = datas.total;
																			var flag = 0;
																			if (datas.total == 0) {
																				totals = 1;
																				flag = 1;
																			}
																			for (var j = 0; j < totals; j++) {
																				if (flag == 0) {
																					$(
																							"#subcatgroup")
																							.append(
																									"<li><a href='#' id="+datas.rows[j].subcatgroupid+">"
																											+ datas.rows[j].subcatgroupname
																											+ "</a></li>");
																				}
																			}
																		},
																		"json");
													}
												}
											}, "json");
						});

		//点击大类
		$('#doc-my-tabs').click(
				function(e) {
					$("#subcatgroup").html("");
					var v_id = $(e.target).attr("id");
					$("#catGroup li").each(function(i) {
						$(this).removeClass();
					});

					if (v_id == 0) {
						window.location.href = getContextPath()
								+ "/nur/nurseCtrl!nurseManageMain.htm";
						return;
					}

					$(e.target).parent().addClass("am-active");
					$.post(getContextPath()
							+ "/nur/nurseCtrl!getSubGroupByID.htm", {
						'dto.catGroup.groupID' : v_id
					}, function(datas) {
						var totals = datas.total;
						var flag = 0;
						if (datas.total == 0) {
							totals = 1;
							flag = 1;
						}
						for (var j = 0; j < totals; j++) {
							if (flag == 0) {
								$("#subcatgroup").append(
										"<li><a href='#' id="+datas.rows[j].subcatgroupid+">"
												+ datas.rows[j].subcatgroupname
												+ "</a></li>");
							}
						}
					}, "json");
				});
		//点击小类查询
		$('#subcatgroup')
				.click(
						function(e) {
							var c_id = $(e.target).attr("id");
							window.location.href = getContextPath()
									+ "/nur/nurseCtrl!nurseManageMain.htm?dto.subCatGroup.subGroupID="
									+ c_id;
						});

		//查询条件显示,元素的id
		function addCondition(v_id, v_text) {
			var d_width = Number(v_text.length) * 27;
			$("#addconditions")
					.append(
							"<li><div class='am-alert  am-alert-warning' data-am-alert style='heigth:1px;width:"+d_width+"px;'><button type='button' class='am-close' id='"+v_id+"'>&times;</button><p>"
									+ v_text + "</p></div></li>");
		}
		
		
		if (document.body.clientHeight < document.documentElement.clientHeight) {
			$("#xxx2").removeAttr("style");
		} else {
			$("#xxx1").removeAttr("style");
		}
	
	});
</script>
</head>
<body>
	<!--导航菜单部分-->
	<header class="am-topbar am-topbar-fixed-top" style="height:50px">
	<div class="am-container am-cf">
		<h1 class="am-topbar-brand">
			<a
				href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm">东华电子商务(SCI)</a>
		</h1>
		<button
			class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-secondary am-show-sm-only"
			data-am-collapse="{target: '#collapse-head'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
		</button>
		<div class="am-collapse am-topbar-collapse" id="collapse-head">
			<ul class="am-nav am-nav-pills am-topbar-nav" style="margin: 0px">
				<li class="am-active"><a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm">首页</a></li>
				<li class="am-dropdown">
	
				</li>
			</ul>
			<div class="am-topbar-right">
				<div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
					<button
						class="am-btn am-btn-primary am-topbar-btn am-btn-xs am-dropdown-toggle"
						data-am-dropdown-toggle="">
						<i class="am-icon-line-chart"></i>&nbsp;&nbsp;&nbsp;报表 <span class="am-icon-caret-down"></span>
					</button>
					<ul class="am-dropdown-content">
					        科室
						<li class="am-divider"></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocIncPrice.htm">科室采购分类</a></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocIncPrice.htm">科室采购商品汇总</a></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocIncPrice.htm">科室采购商品明细</a></li>
						
						 全院
						<li class="am-divider"></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocAmt.htm">全院科室采购金额</a></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocIncPrice.htm">全院科室单品采购均价</a></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocIncPrice.htm">全院采购分类金额汇总</a></li>
					</ul>
				</div>
			</div>
			<div class="am-topbar-right">
				<div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
					<button
						class="am-btn am-btn-primary am-topbar-btn am-btn-xs am-dropdown-toggle"
						data-am-dropdown-toggle="">
						<i class="am-icon-bars"></i>&nbsp;&nbsp;&nbsp;常用 <span class="am-icon-caret-down"></span>
					</button>
					<ul class="am-dropdown-content">
						<li class="am-divider"></li>
						<li><a
							href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseInfomation.htm">收货地址</a></li>
						<li><a href="<%=request.getContextPath()%>/chart/chartCtrl!hopLocAmt.htm">科室库存</a></li>
					</ul>
				</div>
			</div>
			<div class="am-topbar-right">
				<button class="am-btn am-btn-primary am-topbar-btn am-btn-xs"
					id="calculatorBtn">
					<span class="am-icon-calculator"></span> 去购物车结算
				</button>
			</div>
			<div class="am-topbar-right">
				<button class="am-btn am-btn-primary am-topbar-btn am-btn-xs"
					id="myOrderBtn">
					<span class="am-icon-book"></span>我的订单
				</button>
			</div>
			<!--  
			<div class="am-topbar-right">
				<button class="am-btn am-btn-secondary am-topbar-btn am-btn-xs"
					id="loginBtn">
					<span class="am-icon-user"></span> 登录
				</button>
			</div>
			-->
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
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
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


	<div data-am-widget="gotop" class="am-gotop am-gotop-fixed">
		<a href="#top" title="回到顶部"> <span class="am-gotop-title">回到顶部</span>
			<i class="am-gotop-icon am-icon-chevron-up"></i>
		</a>
	</div>
</body>
</html>