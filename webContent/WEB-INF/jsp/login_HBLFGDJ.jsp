<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华电子商务平台</title>
<!-- 引入amazecss,js文件 -->
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/login/fun.base.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/login/script.js"></script>

<style>
.get {
	color: #fff;
	text-align: center;
	padding: 50px 0;
}

.banner {
	text-align: center;
	height: 0px;
	width: 100%;
}
</style>
</head>
<body>
	<!--  -->
	<div class="banner" style="text-align: left; top: 0px">
		<!-- 
       <img src="images/logon_01.gif"  alt="" />
	 -->
	</div>

	<div class="get">
		<div class="am-g">
			<div class="am-u-lg-10 am-u-lg-offset-2 am-u-end" style="padding-left: 70px">
				<!-- 用户名，密码框 -->
				<div class="am-g"
					style="background: url(images/logon_bg.jpg); width: 779px; height: 492px;">
					<!-- 
					<div class="am-u-lg-7">
						<div style="width: 100px"></div>
						 
					<img src="images/login.png" height="382" width="100%" >
				
					</div>
					 -->
					<div class="am-u-lg-5 am-u-lg-offset-7 am-u-end" style="padding-top: 120px">
						<form method="post" class="am-form">

							<section class="am-panel dhcc-panel-mt"> <header
								class="am-panel-hd">
							<h3 class="am-panel-title">电子商务平台用户登录</h3>
							</header>
							<div class="am-panel-bd">
								<div class="am-input-group">
									<span class="am-input-group-label"><i
										class="am-icon-user"></i></span> <input type="text"
										name="mp_userName" id="mp_userName" value="nur123"
										placeholder="请输入用户名">
								</div>
								<span><hr></span>
								<div class="am-input-group">
									<span class="am-input-group-label"><i
										class="am-icon-lock"></i></span> <input type="password"
										name="mp_password" id="mp_password" value="1"
										placeholder="请输入密码">
								</div>
							</div>
							</section>
							<!--  
	      		<div class="am-input-group">
					<span class="am-input-group-label"><i class="am-icon-align-justify"></i></span>
		    		<select class="am-form-field" id="mp_userType">
		      			<option value="0">工作人员</option>
		      			<option value="1">医院用户</option>
		      			<option value="2">供应商用户</option>
		      			<option value="2">护士</option>
		   			</select>
		  		</div>
		  -->
							<div class="am-cf">
								<button type="button" class="am-btn am-btn-mt am-btn-block"
									onclick="javascript: SendAuthen();">登录</button>
								<a href="javascript:vendorRegist();"><span
									style='color: black'>供应商注册</span></a> &nbsp;&nbsp;&nbsp;&nbsp; <a
									href="javascript:auditResult();"><span
									style='color: black'>查询审核结果</span></a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="footer"></div>
</body>
<script src="<%=request.getContextPath()%>/js/security/aes.js"></script>
<script src="<%=request.getContextPath()%>/js/security/login.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/login/login.js"></script>
</html>