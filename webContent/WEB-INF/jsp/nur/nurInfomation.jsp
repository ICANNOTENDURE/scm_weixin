<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css"/>
<% request.setCharacterEncoding("utf-8");%>
<title>东华电子商务平台(SCI)</title>
<link rel="stylesheet"	rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurseInfomation.js"></script>
</head>
<body>
<!-- Header公共部分 -->
<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>

<!-- content start -->
		
	    <div class="am-g am-container">
	    	<section class="am-panel dhcc-panel-mt">
				  <header class="am-panel-hd">
				    <h3 class="am-panel-title">个人资料维护</h3>
			</header>
	        <form class="am-form am-form-horizontal">
	        <div class="am-panel-bd">
		          <div class="am-u-sm-9">
				      <div class="am-input-group" style="left:15%">
				            <span class="am-input-group-label">用户帐号:</span>
							 <input type="text" id="accountAlias" placeholder="用户帐号 /UserName" readonly='true'>	
				      </div>
			      </div>
			      <br><br>
			      <div class="am-u-sm-9">
			      	<div class="am-input-group" style="left:15%">
			      		<span class="am-input-group-label">用户姓名:</span>
			            <input type="text" id="realName" placeholder="用户姓名/ Name">	
			      	</div>
			      </div>
			      <br><br>
			      <div class="am-u-sm-9">
		          	<div class="am-input-group" style="left:15%">
		              <span class="am-input-group-label">所在科室:</span>
		              <input type="text" id="loc" placeholder="所在科室/Department" readonly='true'>
		              <input type="text" id="locID" style="display:none">		
		            </div>
		          </div>
		          <br><br>
				<div class="am-u-sm-9">
		          <div class="am-input-group" style="left:15%">
		              <span class="am-input-group-label">电子邮件:</span>
		              <input type="email" id="mail" placeholder="输入你的电子邮件 / Email">
		            </div>
		        </div>
		        <br><br>
				<div class="am-u-sm-9">
		          <div class="am-input-group" style="left:15%">
		              <span class="am-input-group-label">手机号码:</span>
		              <input type="text" id="tel" placeholder="输入你的电话号码 / Telephone">
		            </div>
		          </div>
		          <br><br>
		          <!--  
				 <div class="am-u-sm-9">
		          	<div class="am-input-group" style="left:15%" >
		          	<span class="am-input-group-label">收获地址:</span>
		          	<input type="text" id="destnation" placeholder="收获地址" readonly='true'>
					<button type="button" class="am-btn am-btn-warning" id="editDestination">维护地址</button>
						
		            </div>
		          </div>
		           <br><br>
		          --> 
		          <div class="am-u-sm-9">
			          	<div class="am-input-group" style="left:15%">
			            	<span class="am-input-group-label">旧&nbsp;&nbsp;密&nbsp;&nbsp;码:</span>
			             	<input type="password" id="desLoc" placeholder="输入旧密码">
			            </div>
		          </div>
		          <div class="am-u-sm-9">
			          	<div class="am-input-group" style="left:15%">
			            	<span class="am-input-group-label">新&nbsp;&nbsp;密&nbsp;&nbsp;码:</span>
			             	<input type="password" id="desLoc" placeholder="输入新密码">
			            </div>
		          </div>
		          <div class="am-u-sm-9">
			          	<div class="am-input-group" style="left:15%">
			            	<span class="am-input-group-label">确认修改:</span>
			             	<input type="password" id="desLoc" placeholder="输入新密码">
			            </div>
		          </div>
		           <br><br>
				
		          <div class="am-form-group">
		            <div class="am-u-sm-9 am-u-sm-push-3">
		              <button type="button" class="am-btn am-btn-mt" id="submitBtn">保存修改</button>
		            </div>
		          </div>
	          </div>
	        </form>
	        </section>
	    </div>

  <!-- content end -->




<div id="xxx1" style="display:none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
			<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	<div id="xxx2" style="display:none;">
		<footer class="footer" style="bottom:0;width:100%;position:fixed;*position:relative;;">
			<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
</body>
</html>