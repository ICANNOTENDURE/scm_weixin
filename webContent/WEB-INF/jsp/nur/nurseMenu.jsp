<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/nur/jdmenu.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="menu">
		<div class="all-sort">
			<h2>
				<a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm">全部商品分类</a>
			</h2>
		</div>
		<div class="nav">
			<ul class="clearfix"
				style="margin-top: 0px; margin-bottom: 0px; padding-left: 0px">
				<li><a
					href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm">首页</a></li>
				<!-- 	
				<li><a href="#">服装城</a></li>
				<li><a href="#">京东超市</a></li>
				<li><a href="#">团购</a></li>
				<li><a href="#">拍卖</a></li>
				<li><a href="#">在线游戏</a></li>
				 -->
			</ul>
		</div>
	</div>
	<!-- 菜单 -->

	<div class="wrap" >
		<div class="all-sort-list ">
			<s:iterator value="dto.groups" id="groups">
				<div class="item">
					<h3>
						<span>${groups.sgDesc}</span><i
							style="float: right; padding-right: 10px; color:">></i>
					</h3>
					<div class="item-list ">
						<!-- 
						<div class="close">x</div>
						 -->
						<div class="subitem">
							<s:iterator value="#groups.catGroups" id="catGroups">
								<dl class="fore">
									<dt>
										<a href="#">${groupName} </a><i>></i>
									</dt>
									<dd>
										<s:iterator value="#catGroups.subCatGroups" id="subCatGroups">
											<a
												href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm?dto.incCatId=${subGroupID}">${subGroupName}</a>
										</s:iterator>
									</dd>
								</dl>
							</s:iterator>
						</div>
						<!-- 
						<div class="cat-right">
							<dl class="categorys-promotions"
								clstag="homepage|keycount|home2013|0601c">
								<dd>
									<ul>
										<li><a href="#" target="_blank"><img
												src="images/rBEhWFJTydgIAAAAAAAiD8_1J3AAAD5mAMC0SYAACIn230.jpg"
												width="194" height="40" title="特价书满减"></a></li>
									</ul>
								</dd>
							</dl>
							<dl class="categorys-brands"
								clstag="homepage|keycount|home2013|0601d">
								<dt>推荐品牌出版商</dt>
								<dd>
									<ul>
										<li><a href="#" target="_blank">中华书局</a></li>
										<li><a href="#" target="_blank">人民邮电出版社</a></li>
										<li><a href="#" target="_blank">上海世纪出版股份有限公司</a></li>
										<li><a href="#" target="_blank">电子工业出版社</a></li>
									</ul>
								</dd>
							</dl>
						</div>
						 -->
					</div>
				</div>
			</s:iterator>
		</div>
		
		
	</div>
</body>
</html>