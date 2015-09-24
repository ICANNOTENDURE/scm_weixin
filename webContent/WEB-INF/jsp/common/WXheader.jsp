<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<header data-am-widget="header" class="am-header am-header-default">
	<div class="am-header-left am-header-nav">
		<!---->  
		<a href="#left-link" class=""> <i
			class="am-header-icon am-icon-home"></i>
		</a>
	</div>
	<h1 class="am-header-title"><s:property value="dto.title"/></h1>
	<nav data-am-widget="menu" class="am-menu  am-menu-dropdown1"
		data-am-menu-collapse>
		<a href="javascript: void(0)" class="am-menu-toggle"> <i
			class="am-menu-toggle-icon am-icon-list"></i>
		</a>
		<ul class="am-menu-nav am-avg-sm-1 am-collapse">
			<li><a href="<%=request.getContextPath()%>/weixin/wxMessageCtrl!listToDoTask.htm" class="">代办任务</a></li>
			<li><a href="<%=request.getContextPath()%>/weixin/wxMessageCtrl!searchOrder.htm" class="">订单查询</a></li>
			<li class="am-parent"><a href="#c3" class="">设置</a>
				<ul class="am-menu-sub am-collapse  am-avg-sm-4 ">
					<li class=""><a href="##" class="">个人信息</a></li>
					<li class=""><a href="##" class="">关于</a></li>
					<li class="am-menu-nav-channel"><a href="#c3" class=""
						title="退出">退出 &raquo;</a></li>
				</ul></li>
		</ul>
	</nav>
</header>