<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<%@include file="/WEB-INF/jsp/common/kindeditor.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/hop/HopIncNews.js"></script>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />
<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-g am-container">
		<div class="am-u-lg-12" style="padding: 0px; margin-top: 10px">
			<div class="am-panel dhcc-panel-mt">
				<div class="am-panel-hd">
					<h3 class="am-panel-title">
						<span class="am-icon-newspaper-o"></span>&nbsp;&nbsp;&nbsp;发布新闻
					</h3>
				</div>
				<div class="am-panel-bd" style="min-height: 470px">
					<form class="am-form am-form-horizontal"
						action="<%=request.getContextPath()%>/hop/hopIncNewsCtrl!save.htm"
						method="post"  enctype="multipart/form-data">
						<div class="am-form-group am-form-mt">
							<label for="doc-ipt-3" class="am-u-lg-2 am-form-label">标题</label>
							<div class="am-u-lg-8 am-u-end">
								<input class="am-form-field am-input-sm" id="doc-ipt-3"
									placeholder="输入你的标题" name="dto.hopIncNews.incNewsTitle"
									required>
							</div>
						</div>
						<div class="am-form-group am-form-mt">
							<label for="doc-ipt-3" class="am-u-lg-2 am-form-label">类型</label>
							<div class="am-u-lg-6 am-u-end">
								<select
									data-am-selected="{btnWidth: 300, btnSize: 'sm', btnStyle: 'mt'}"
									name="dto.hopIncNews.incNewsType">
									<option value="1">供应商通知</option>
									<option value="2">院内通知</option>
								</select>
							</div>
						</div>
						<!-- 
						<div class="am-form-group am-form-mt">
							<label for="doc-ipt-3" class="am-u-lg-2 am-form-label">附件</label>
							<div class="am-u-lg-6 am-u-end">
								<div class="am-form-group am-form-file">
								  <button type="button" class="am-btn am-btn-default am-btn-sm">
								    <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
								  <input type="file"  name="dto.upload" multiple style="display: none;">
								</div>
							</div>
						</div>
						 -->
						<div class="am-form-group am-form-mt">
							<label for="doc-ipt-3" class="am-u-lg-2 am-form-label">内容</label>
							<div class="am-u-lg-10 am-u-end">
								<textarea rows="10" cols="" class="am-form-field"
									name="dto.hopIncNews.incNewsContetnt">
								</textarea>
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-lg-10 am-u-sm-offset-2">
								<button type="submit" class="am-btn am-btn-mt">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<!-- foot-->
	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team2.</p>
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