<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js pxajs" lang="zh-cmn-Hans-CN">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<title>东华电子商务后台管理</title>

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/logo_small.png">
<link href="<%=request.getContextPath()%>/css/uiengine.css"
	rel="stylesheet">
<!--  -->
<!-- -->	
<script src="<%=request.getContextPath()%>/js/uiengine.js"></script>
 
<script type="text/javascript">
$(function(){
	$.ajaxSettings.async = false;
	var navigationHTML="";
	$(".navigation").html("");
    $.getJSON("authenTicket/authenTicketCtrl!GetMainMeun.htm", function (json) {
        $.each(json, function (i) {
        		if(json[i].children.length>0){
        			navigationHTML=navigationHTML+"<li class='mm-dropdown mm-dropdown-root'><a tabindex='-1' href='#'><i class='menu-icon "+json[i].imgUrl+"'></i><span class='mm-text mmc-dropdown-delay animated'>"+json[i].funcName+"</span></a>";
        			navigationHTML=navigationHTML+"<ul class='mmc-dropdown-delay animated'>";
        		}else{
        			navigationHTML=navigationHTML+"<li class='active'><a tabindex='-1' href='#'><i class='menu-icon "+json[i].imgUrl+"'></i><span class='mm-text mmc-dropdown-delay animated'>"+json[i].funcName+"</span></a>";
        		}
        		$.each(json[i].children, function (j) {
                    
                    if(json[i].children[j].children.length>0){
            			navigationHTML=navigationHTML+"<li class='mm-dropdown'><a tabindex='-1' href='#'><i class='menu-icon "+json[i].children[j].imgUrl+"'></i><span class='mm-text mmc-dropdown-delay animated'>"+json[i].children[j].funcName+"</span></a>";
            			navigationHTML=navigationHTML+"<ul '>";
            		}else{
            			navigationHTML=navigationHTML+"<li class='active'><a tabindex='-1' id='"+json[i].children[j].secutiryUrl+"' class='forURL'><i class='menu-icon "+json[i].children[j].imgUrl+"'></i><span class='mm-text mmc-dropdown-delay animated'>"+json[i].children[j].funcName+"</span></a>";
            		}
                    $.each(json[i].children[j].children, function (k) {
                    	
                    	
                    	navigationHTML=navigationHTML+"<li><a tabindex='-1' id='"+json[i].children[j].children[k].secutiryUrl+"' class='forURL')'><i class='menu-icon "+json[i].children[j].children[k].imgUrl+"'></i><span class='mm-text'>"+json[i].children[j].children[k].funcName+"</span></a></li>";        		
            			
                    });
                    if(json[i].children[j].children.length>0){
            			navigationHTML=navigationHTML+"</ul>";
            		}
        		});
        		if(json[i].children.length>0){
        			navigationHTML=navigationHTML+"</ul>";
        		}
                navigationHTML=navigationHTML+"</li>";
        });
 		
    });
    $(".navigation").html(navigationHTML);
    $(".forURL").click(function(){
		$("#content-wrapper").stop(true, true);
		$("#content-wrapper iframe").attr("src","");
	    var src = $(this).attr("id");
	    $("#content-wrapper iframe").attr("src",src);
	});
    
	//退出登录 
	$("#quitBTN").click(function(){
		$.post(
				'authenTicket/authenTicketCtrl!logout.htm',
				function(data){
					window.location.href="./";
				}
		);
	});
	//修改个人信息
	$(".editinfo").click(function(){
		$("#content-wrapper iframe").attr("src","./normalAccount/normalAccountCtrl!editInfo.htm");
	});
	//修改个人信息
	$(".editpassword").click(function(){
		$("#content-wrapper iframe").attr("src","./normalAccount/normalAccountCtrl!editPassword.htm");
	});
	$.post(
			'authenTicket/authenTicketCtrl!getLoginInfo.htm',
			function(data){
				$(".text-semibold").html(data.userName);
				$("#loginInfo").html(data.userName);
			},
			"json"
	);
	$("#content-wrapper iframe").attr("src","./chart/chartCtrl!index.htm");
}); 

</script>

</head>
<body
	class="theme-clean main-menu-animated animate-mm-sm animate-mm-md animate-mm-lg mmc">

	<script>
		var init = [];
	</script>
	<!-- Demo script -->
	<script src="<%=request.getContextPath()%>/js/demo.js"></script>
	<!-- / Demo script -->

	<div id="main-wrapper">


		<div id="main-navbar" class="navbar navbar-inverse" role="navigation">
			<!-- Main menu toggle -->
			<button type="button" id="main-menu-toggle">
				<i class="navbar-icon fa fa-bars icon"></i><span
					class="hide-menu-text"></span>
			</button>

			<div class="navbar-inner">

				<!-- navbar-header start-->
				<div class="navbar-header" style="height: 46px">
					<!-- Logo -->
					<a href="javascript:void(0);" class="navbar-brand" style="padding-left: 0px">
						<div>
							<img
								src="images/logo.png">
						</div> <!--TinyAdmin-->
					</a>

					<!-- navbar-toggle start -->
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#main-navbar-collapse">
						<i class="navbar-icon fa fa-bars"></i>
					</button>
					<!-- navbar-toggle end -->
				</div>

				<div id="main-navbar-collapse"
					class="collapse navbar-collapse main-navbar-collapse">
					<div>


						<ul class="nav navbar-nav">


							<li><a href="#">首页</a></li>
							<li><a href="<%=request.getContextPath()%>/index.htm">win8</a></li>
						</ul>


						<div class="right clearfix">
							<ul class="nav navbar-nav pull-right right-navbar-nav">

								<li class="nav-icon-btn nav-icon-btn-danger dropdown"><a
									href="javascript:void(0);notifications" class="dropdown-toggle"
									data-toggle="dropdown"> <span class="label">5</span> <i
										class="nav-icon fa fa-bullhorn" style="margin-top: 5px"></i> <span
										class="small-screen-text">通知</span>
								</a> <!-- NOTIFICATIONS --> <!-- Javascript --> <script>
									init.push(function() {
										$('#main-navbar-notifications')
												.slimScroll({
													height : 250
												});
									});
								</script> <!-- / Javascript -->

									<div class="dropdown-menu widget-notifications no-padding"
										style="width: 300px">
										<div class="slimScrollDiv"
											style="position: relative; width: auto; height: 250px;">
											<div class="notifications-list"
												id="main-navbar-notifications"
												style="width: auto; height: 250px;">



												<div class="notification">
													<div class="notification-title text-danger">系统</div>
													<div class="notification-description">
														<strong>500错误</strong>: 语法错误在索引××行 <strong>461</strong>.
													</div>
													<div class="notification-ago">12小时前</div>
													<div class="notification-icon fa fa-hdd-o bg-danger"></div>
												</div>


												<div class="notification">
													<div class="notification-title text-info">仓库</div>
													<div class="notification-description">
														你有 <strong>9</strong> 新订单。
													</div>
													<div class="notification-ago">12小时前</div>
													<div class="notification-icon fa fa-truck bg-info"></div>
												</div>


												<div class="notification">
													<div class="notification-title text-default">进程</div>
													<div class="notification-description">
														工作 <strong>"清理"</strong> 完成。
													</div>
													<div class="notification-ago">12小时前</div>
													<div class="notification-icon fa fa-clock-o bg-default"></div>
												</div>


												<div class="notification">
													<div class="notification-title text-success">体系</div>
													<div class="notification-description">
														服务器 <strong>内存已满。</strong>.
													</div>
													<div class="notification-ago">11小时前</div>
													<div class="notification-icon fa fa-hdd-o bg-success"></div>
												</div>


												<div class="notification">
													<div class="notification-title text-warning">系统</div>
													<div class="notification-description">
														服务器 <strong>内存已满。</strong>.
													</div>
													<div class="notification-ago">10小时前</div>
													<div class="notification-icon fa fa-hdd-o bg-warning"></div>
												</div>



											</div>
											<div class="slimScrollBar"
												style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
											<div class="slimScrollRail"
												style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
										</div>
										<!-- / .notifications-list -->
										<a href="javascript:void(0);" class="notifications-link">更多的通知</a>
									</div> <!-- / .dropdown-menu --></li>
	

									
								<li>
									<form class="navbar-form pull-left">
										<input type="text" class="form-control" placeholder="查找更多...">
										<span style="left: -27px; top: 3px; position: relative;"><i
											class="fa fa-search"></i></span>
									</form>
								</li>

								<li class="dropdown"><a href="javascript:void(0);"
									class="dropdown-toggle user-menu" data-toggle="dropdown"><span id="loginInfo"></span>
								</a>
									<ul class="dropdown-menu">
										<li class="editinfo"><a href="javascript:void(0);"><span
												class="badge badge-primary pull-right ">新的</span>个人中心</a></li>
										<li class="editpassword"><a href="javascript:void(0);"><i
												class="dropdown-icon fa fa-cog"></i>&nbsp;&nbsp;设置</a></li>
										<li class="divider"></li>
										<li><a  data-toggle="modal"href="#quitModal" ><i
												class="dropdown-icon fa fa-power-off" ></i>&nbsp;&nbsp;退出</a></li>
									</ul></li>

							</ul>
						</div>


					</div>
				</div>
				<!-- main-navbar-collapse end -->
			</div>
			<!-- navbar-inner end -->
		</div>
		<!-- main-navbar end -->


		<div id="main-menu" role="navigation">
			<div class="slimScrollDiv"
				style="position: relative; width: auto; height: 100%;">
				<div id="main-menu-inner" style="width: auto; height: 100%;">


					<div class="menu-content top animated" id="menu-content-demo">
						<div>
							<div class="text-bg">
								<span class="text-slim">欢迎您,</span> <span class="text-semibold">ddc</span>
							</div>
							<img src="images/login.png" alt="" class="">
							<div class="btn-group">

									<a href="javascript:void(0);" class="btn btn-xs btn-primary btn-outline editinfo">
									<i class="fa fa-user" style="margin-top: 5px"></i></a> 
									<a href="javascript:void(0);" class="btn btn-xs btn-primary btn-outline editpassword">
									<i class="fa fa-cog" style="margin-top: 5px"></i></a> 
									<a data-toggle="modal" href="#quitModal" class="btn btn-xs btn-danger btn-outline">
									<i class="fa fa-power-off" style="margin-top: 5px"></i></a>

							</div>
						</div>
					</div>

					<ul class="navigation">

					</ul>
					<!-- navigation end -->



				</div>
				<div class="slimScrollBar"
					style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 517px; background: rgb(0, 0, 0);"></div>
				<div class="slimScrollRail"
					style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
			</div>
		</div>
		<div id="main-menu-bg"></div>


		<div id="content-wrapper" style="height: 600px">

			<!-- 
			<div class="postion-nav">
				<ul class="breadcrumb">
					<li class="text-light-gray">所在位置：</li>
					<li><a href="/tinyuiweb">首页</a></li>

					<li class="active">概述</li>

				</ul>
			</div>
			 -->
			<!-- 主体 start -->

				<iframe name="mainIframe" frameborder="0" src=""
			style="width: 100%; height: 600px;"></iframe>

			
		</div>
	</div>


	<script type="text/javascript">
		init.push(function() {
			// Javascript code here
			//setPostiionNav();
		})
		window.TinyAdmin.start(init);
		function setPostiionNav() {
			var currenttxt = $(".navigation ul>li.active>a:first>span:first")
					.html();
			//$(document).attr("title", currenttxt + "--" + "TinyUiEnterprise展示");
			if (currenttxt == undefined) {
				$('.postion-nav .active').css("display", "inline")
				return;
			}
			var reg = /[0-9]|\./g;
			currenttxt = currenttxt.replace(reg, "");
			//$('.postion-nav .active').html(currenttxt);

			$('.postion-nav .active').css("display", "inline")
		}
	</script>


	<a href="javascript:void(0)" class="toTop" title="返回顶部"
		alt="backToTopTxt" style="display: none;">返回顶部</a>
	<div id="small-screen-width-point"
		style="position: absolute; top: -10000px; width: 10px; height: 10px; background: #fff;"></div>
	<div id="tablet-screen-width-point"
		style="position: absolute; top: -10000px; width: 10px; height: 10px; background: #fff;"></div>
	
			
			
			
	<div id="quitModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	 <div class="modal-header">
	    <h3 id="myModalLabel">系统提示</h3><a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
	 </div>
	  <div class="modal-body">
	 <p>确认要退出系统吗?</p>
	 </div>
	  <div class="modal-footer">
	 <button class="btn btn-primary" id="quitBTN">确定</button> <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	 </div>
	</div>	
</body>
</html>