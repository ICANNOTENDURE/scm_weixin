<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>东华医疗供应链(sci)</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo_small.png">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/skins/_all-skins.min.css">
<!-- jQuery 2.1.4 -->
<script src="<%=request.getContextPath()%>/js/jquery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajaxSettings.async = false;
		var navigationHTML = "";

		$(".sidebar-menu").html("");
	    $.getJSON("authenTicket/authenTicketCtrl!GetMainMeun.htm", function (json) {
	        $.each(json, function (i) {
	        		if(json[i].children.length>0){
	        			navigationHTML=navigationHTML+"<li class='treeview'>"
	        										 +"<a>"
	        							             +"<i class='fa "+json[i].imgUrl+"'></i><span>"+json[i].funcName+"</span>"
	        							             +"<i class='fa fa-angle-left pull-right'></i>"
	        							             +"</a>"
	        										 +"<ul class='treeview-menu'>";
	        		}else{
	        			navigationHTML=navigationHTML+"<li >";
						 							 +"<a class='forURL' id="+json[i].secutiryUrl+">"
			             							 +"<i class='fa "+json[i].imgUrl+"'></i><span>"+json[i].funcName+"</span>"
			             							 +"</i>"
			             							 +"</a>";	        		
	        		}
	        		$.each(json[i].children, function (j) {
	                    
	                    if(json[i].children[j].children.length>0){
	                    	navigationHTML=navigationHTML
	                    								 +"<li>"
	                    								 +"<a>"
	                    								 +"<i class='fa "+json[i].children[j].imgUrl+"'></i>"+json[i].children[j].funcName
	                    								 +"<i class='fa fa-angle-left pull-right'></i>"
	                    								 +"</a>"
	                    								 +"<ul class='treeview-menu'>";
	            		}else{
	            			navigationHTML=navigationHTML+"<li>"
														 +"<a class='forURL' id="+json[i].children[j].secutiryUrl+">"
														 +"<i class='fa "+json[i].children[j].imgUrl+"'></i>"+json[i].children[j].funcName
														 +"</a>"
														 +"</li>";		            		
						}
	                    $.each(json[i].children[j].children, function (k) {
	                    	navigationHTML=navigationHTML+"<li >"
														 +"<a class='forURL' id="+json[i].children[j].children[k].secutiryUrl+">"
														 +"<i class='fa "+json[i].children[j].children[k].imgUrl+"'></i>"+json[i].children[j].children[k].funcName
														 +"</a>"
														 +"</li>";		
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
	    $(".sidebar-menu").html(navigationHTML);
		$(".forURL").click(function() {
			$("#content-wrapper iframe").attr("src", "");
			var src = $(this).attr("id");
			$("#content-wrapper iframe").attr("src", src);
		});
		$(".sidebar-menu").css("cursor","pointer")
		//退出登录 
		$("#quitBTN").click(function() {
			$.post('authenTicket/authenTicketCtrl!logout.htm', function(data) {
				window.location.href = "./";
			});
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
<body class="hold-transition skin-green sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>S</b>CI</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>东华医疗供应链</b>SCI</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<img src="dist/img/user2-160x160.jpg" class="user-image"
								alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">Alexander Pierce</span>
						</a>
							<ul class="dropdown-menu">
								<!-- Menu Body -->
								<li class="user-body">
									<div class="col-xs-4 text-center">
										<a href="#">Followers</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Friends</a>
									</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat" id="quitBTN">Sign out</a>
									</div>
								</li>
							</ul>
						</li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>Alexander Pierce</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- /.search form -->

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" id="content-wrapper">
			<!-- Content Header (Page header) -->



				<!-- Your Page Content Here -->
				<iframe name="mainIframe" frameborder="0" src="" style="width: 100%; height: 600px;"></iframe>
		
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">By the Dhcc Pharmacy Team</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2015 <a href="#">东华软件股份公司</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>

		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->


	<!-- REQUIRED JS SCRIPTS -->
	
	<!-- Bootstrap 3.3.5 -->
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/dist/js/demo.js"></script>
</body>
</html>