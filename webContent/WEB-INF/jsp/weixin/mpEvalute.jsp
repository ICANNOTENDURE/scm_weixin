<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=1.0, user-scalable=no">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black">
<%@include file="/WEB-INF/jsp/common/bootstrap.jsp"%>
<link href="<%=request.getContextPath()%>/css/rating/star-rating.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rating/star-rating.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/commonTool.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/weixin/jssdk.js"></script>
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
			<textarea class="form-control" rows="4" id="content" style="margin-bottom: 10px"><s:property value='dto.evalute.eleContent'/></textarea>
			<div id="imglist">
					<s:iterator value="dto.evalutePics" status="status" id="evalutePics">
					     <div  class='row'>
						        <div class='col-sm-12'>
						       		<div class='thumbnail'>
						        		<img width='200' height='200'  src="<%=request.getContextPath()%>/uploads/weixin/${evalutePics.picpath}" >
						      			<div class='caption'>
											<p><button type='button' class='btn btn-success' onclick='viewPic(this)'>预览</button>
											<button type='button' class='btn btn-danger' onclick='deletePic(this)'>删除</button></p>
										</div>
									</div>
								</div>
							</div>	
					</s:iterator>
			</div>
			<s:set name="eleId" value="dto.evalute.evaluteId" />
			<s:if test="#eleId<=0">
					<div class="row">
						<div class="col-xs-5 col-xs-offset-7">
							<button type="button" class="btn btn-success" id="uppic">上传照片</button>
						</div>
					</div>
					<div class="row" style="margin-top: 10px">
						<div class="col-xs-2 col-xs-offset-7">
							<button type="button" class="btn btn-primary" id="saveBtn">保存</button>
						</div>
						<div class="col-xs-3 ">
							<button type="button" class="btn btn-default">取消</button>
						</div>
					</div>
			</s:if>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {
			$.post(
					getContextPath() + "/weixin/mpInGdRecCtrl!getWxJsapiSignature.htm", {
						'dto.url' : window.document.location.href
					}, function(data) {
						wx.config({
							debug : false,
							appId : data.appId,
							timestamp : data.timestamp,
							nonceStr : data.noncestr,
							signature : data.signature,
							jsApiList : [ 'chooseImage','uploadImage']
						});
					}, 
					'json'
			 );
			
			
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
			
			$("#uppic").on('click', function() {
				wx.chooseImage({
					count : 1, // 默认9
					sizeType : [ 'original', 'compressed' ], // 可以指定是原图还是压缩图，默认二者都有
					sourceType : [ 'album', 'camera' ], // 可以指定来源是相册还是相机，默认二者都有
					success : function(res) {
						var imgIds=res.localIds.toString();
						wx.uploadImage({
						    localId: imgIds, // 需要上传的图片的本地ID，由chooseImage接口获得
						    isShowProgressTips: 1, // 默认为1，显示进度提示
						    success: function (res2) {
						        imghtml="<div  class='row'>";
						        imghtml=imghtml+"<div class='col-sm-12'>";
						        imghtml=imghtml+"	<div class='thumbnail'>";
						        imghtml=imghtml+"		<img width='200' height='200'  src="+imgIds+" id="+res2.serverId+">";
						        imghtml=imghtml+"		<div class='caption'>";
								imghtml=imghtml+"			<p><button type='button' class='btn btn-success' onclick='viewPic(this)'>预览</button>";
								imghtml=imghtml+"			<button type='button' class='btn btn-danger' onclick='deletePic(this)'>删除</button></p>";
								imghtml=imghtml+"		</div>";
								imghtml=imghtml+"	</div>";
								imghtml=imghtml+"</div>";
								$("#imglist").append(imghtml);
						    }
						});
						
					}
				});
			});

			$("#saveBtn").on('click',function(){
				 var ingdrecid=$("#ingdrecid").val();
				 var venid=$("#venid").val(); 
				 var content=$("#content").val();
				 var result=$("#result").val();
				 var description=$("#description").val();
				 var speed=$("#speed").val();
				 var service=$("#service").val();
				 var imgIdStr="";
				 $("#imglist").find("img").each(function(){
					imgIdStr=imgIdStr+","+$(this).attr("id")
				 });
				 $.post(
						 getContextPath()+'/comment/CommentCtrl!saveMpEle.htm',
						 { 
							"dto.evalute.eleContent": content ,
							"dto.evalute.eleResult": result,
							"dto.evalute.eleDescription": description,
							"dto.evalute.eleService": service,
							"dto.evalute.eleSpeed": speed,
							"dto.evalute.eleIngdrecId": ingdrecid,
							"dto.evalute.eleVendorId": venid,
							"dto.imgIdStr":imgIdStr
						 },
						 function(data){
							 alert(data.ResultCode)
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
		
		
		//预览图片
		function viewPic(obj){
			wx.previewImage({
			    current: '', // 当前显示图片的http链接
			    urls: [$(obj).parent().parent().parent().find("img").attr("src")] // 需要预览的图片http链接列表
			});
		}
		function deletePic(objPic){
			 $(objPic).parent().parent().parent().remove();
		}
	</script>
</body>
</html>
