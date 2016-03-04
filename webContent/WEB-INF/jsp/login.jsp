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
	background: #eee;
	color: #fff;
	text-align: center;
	padding: 50px 0;
}

.banner {
	text-align: center;
	height: 120px;
	width: 100%;
}

.pf {
	position: fixed;
}
</style>
</head>
<body style="background-color: #eee;">
	<!--  -->
	<div class="banner" style="text-align: left; top: 0px">
		<!--  <img src="images/logon_01.gif" width="458" height="140" alt="" />
	-->
	</div>

	<div class="get">
		<div class="am-g">
			<div class="am-u-lg-12">
				<!-- 用户名，密码框 -->
				<div class="am-g">
					<div class="am-u-lg-7">
						<img src="images/login.png" height="382">
					</div>
					<div class="am-u-lg-4 am-u-end">
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
									style='color: #09aa83'>供应商注册</span></a> &nbsp;&nbsp;&nbsp;&nbsp; <a
									href="javascript:auditResult();"><span
									style='color: #09aa83'>查询审核结果</span></a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>

		<div class="pf" style="right: 10px; top: 70%; z-index: 9999;">
				<img src="<%=request.getContextPath()%>/images/weixinMP.jpg" width="150" height="150">
		</div>
	</div>
	<div class="footer"></div>
</body>
<script src="<%=request.getContextPath()%>/js/security/aes.js"></script>
<script src="<%=request.getContextPath()%>/js/security/login.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/login/login.js"></script>
</html>