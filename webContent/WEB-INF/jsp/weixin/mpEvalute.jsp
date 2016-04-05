<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximun-scale=1.0, user-scalable=no">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black">
<%@include file="/WEB-INF/jsp/common/bootstrap.jsp"%>
<link
	href="<%=request.getContextPath()%>/css/rating/star-rating.min.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/rating/star-rating.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common/commonTool.js"></script>
<title>东华医疗供应链(SCI)</title>
</head>
<body>
	<input type="hidden" id="ingdrecid" value="<s:property value='dto.stInGdRec.ingdrecId'/>" />
	<input type="hidden" id="venid" value="<s:property value='dto.stInGdRec.ingdrecVenId'/>" />
	<div class="panel panel-primary">
		<div class="panel-heading">我的评价</div>
		<div class="panel-body">
			<input class="total" data-clearButton="总体评价" id="result" value='<s:property value='dto.evalute.eleResult'/>'>
			<input class="total" data-clearButton="商品包装" id="description" value='<s:property value='dto.evalute.eleDescription'/>'>
			<input class="total" data-clearButton="发货速度" id="speed" value='<s:property value='dto.evalute.eleSpeed'/>'> 
			<input class="total" data-clearButton="服务态度" id="service" value='<s:property value='dto.evalute.eleService'/>'>
			<textarea class="form-control" rows="4" id="content"><s:property value='dto.evalute.eleContent'/></textarea>
			<div class="container-fluid" style="padding-top: 15px">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-7">
						<button type="button" class="btn btn-primary" id="commint">保存</button>
					</div>
					<div class="col-xs-3 ">
						<button type="button" class="btn btn-default">取消</button>
					</div>
				</div>
			</div>
		</div>

	</div>


	<script>
		$(function() {
			$(".total").each(function(obj, i) {
						$(this).rating(
								{
									clearCaption : '请选择评价',
									'clearButton' : "<p class='text-primary'>"
											+ $(this).attr("data-clearButton")
											+ "</p>",
									'min' : 0,
									'max' : 5,
									'step' : 1,
									'size' : 'xs',
									'starCaptions' : {
										1 : '很不满意',
										2 : '不满意',
										3 : '一般',
										4 : '好',
										5 : '很好,值得推荐'
									}
								});
					});
			
			$("#commint").on('click',function(){
				 var ingdrecid=$("#ingdrecid").val();
				 var venid=$("#venid").val(); 
				 var content=$("#content").val();
				 var result=$("#result").val();
				 var description=$("#description").val();
				 var speed=$("#speed").val();
				 var service=$("#service").val();
				 $.post(
						 getContextPath()+'/comment/CommentCtrl!saveMpEle.htm',
						 { 
							"dto.evalute.eleContent": content ,
							"dto.evalute.eleResult": result,
							"dto.evalute.eleDescription": description,
							"dto.evalute.eleService": service,
							"dto.evalute.eleSpeed": speed,
							"dto.evalute.eleIngdrecId": ingdrecid,
							"dto.evalute.eleVendorId": venid
						 },
						 function(data){
							 if(data.ResultCode=="1"){
								 alert('操作成功');
							 }else{
								 alert('操作失败');
							 }
			             }, 
			              "json"
			     );
			});
		});
	</script>
</body>
</html>
