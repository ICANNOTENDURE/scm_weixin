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
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/weixin/jssdk.js"></script>
<title>东华医疗供应链(SCI)</title>
<script type="text/javascript">
	$(function() {
		$('#common-modal-loading').modal({
			closeViaDimmer : false
		});
		$.post(
				$WEB_ROOT_PATH + "/weixin/mpInGdRecCtrl!getWxJsapiSignature.htm", {
					'dto.url' : window.document.location.href
				}, function(data) {
					$('#common-modal-loading').modal('close');
					wx.config({
						debug : false,
						appId : data.appId,
						timestamp : data.timestamp,
						nonceStr : data.noncestr,
						signature : data.signature,
						jsApiList : ['chooseImage','uploadImage']
					});
		}, 'json');
		$(".am-icon-chevron-left").on('click', function() {
			window.history.back();
		});
		$("#accpectFlagBTN").on('click', function() {
			$('#common-modal-loading').modal({closeViaDimmer:false});
			$.post(
					$WEB_ROOT_PATH + "/weixin/mpMessageCtrl!accpectOrder.htm", 
					{
						'dto.orderDetail.orderNo' : $("#orderNo").val()
					}, 
					function(data) {
						$('#common-modal-loading').modal('close');
						if(data.resultCode=="0"){
							$('#common-alert').modal();
							$("#accpectFlagBTN").remove();
						}else{
							  $('#common-confirm-bd').html(data.resultContent);
							  $('#common-confirm').modal({
								    closeViaDimmer:false,
							        relatedTarget: this,
							        onConfirm: function(options) {
							         	window.location.href=$WEB_ROOT_PATH + "/weixin/mpUserCtrl!MpSci.htm"
							        },
							        onCancel: function() {
							        }
							   });
						}
					},
					'json'
			);
			
		});
		
		$("#selectPicBTN").on('click', function() {
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
					        imghtml="<div id="+res2.serverId+"><img width='200' height='200' class='am-radius' src="+imgIds+" class='am-img-responsive' />";
							imghtml=imghtml+"<button type='button' class='am-btn am-btn-default am-radius am-btn-success am-btn-xs' onclick='viewPic(this)'>预览<i class='am-icon-picture-o'></i></button>";
							imghtml=imghtml+"<button type='button' class='am-btn am-btn-default am-radius am-btn-danger am-btn-xs' onclick='deletePic(this)'>删除<i class='am-icon-remove'></i></button></div>";
							$("#imglist").append(imghtml);
					    }
					});
					
				}
			});
		});
		
		
		//保存图片
		$("#savePicBTN").on('click', function() {
			
			if($("#imglist").find("img").size()==0){
				$('#common-alert-bd').html("请先上传照片");
				$('#common-alert').modal();
				return;
			}
            
			var imgIdStr=[];
			$("#imglist div").each(function(){
				imgIdStr.push($(this).attr("id"));
			})
			$('#common-modal-loading') .modal();
			$ .post(
						$WEB_ROOT_PATH + "/weixin/mpMessageCtrl!uploadOrdPic.htm",
						{
							'dto.orderno' : $("#orderNo").val(),
							'dto.imgIdStr' : imgIdStr.join(",")
						},
						function(data) {
								$('#common-modal-loading') .modal('close');
								if(data.resultCode==0){
									$("#common-alert-bd").html("操作成功!");
									$('#common-alert').modal('open');
								}else{
									$("#common-alert-bd").html("操作失败:");
									$('#common-alert').modal('open');
								}
				}, 'json');
		});
	});
	function viewPic(obj){
		wx.previewImage({
		    current: '', // 当前显示图片的http链接
		    urls: [$(obj).parent().find("img").attr("src")] // 需要预览的图片http链接列表
		});
	}
	function deletePic(objPic){
	   $('#common-confirm-bd').html("确认删除照片吗!");
	   $('#common-confirm').modal({
		   	relatedTarget: $(objPic).parent(),
	        onConfirm: function(options) {
	        	$(this.relatedTarget).remove();
	        	$("#imgMsg").html("您已经选择了"+$("#imglist").find("img").size()+"张照片");
	        }
	    });
	}
</script>

</head>
<body>
	
	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>
	
	<input type="hidden" id="orderNo" value="${dto.orderDetail.orderNo}"/>
	<table
		class="am-table am-table-bordered am-table-striped am-table-compact">
		<thead class="title">
			<tr>
				<th>名称</th>
				<th>单位</th>
				<th>数量</th>
				<th>规格</th>
				<th>型号</th>
				<th>价格</th>
				<th>请求科室</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="dto.orderDetails" status="status" id="detail">
				<tr>
					<td>${detail.incName}</td>
					<td>${detail.orderVenuom}</td>
					<td>${detail.orderVenQty}</td>
					<td>${detail.spec}</td>
					<td>${detail.form}</td>
					<td>${detail.orderRp}</td>
					<td>${detail.purloc}</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<s:if test="dto.accpectFlag==1">
		<button type="button" class="am-btn am-btn-danger am-btn-block" data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...', resetText: '加载过了'}" id="accpectFlagBTN">确认接收定单</button>
	</s:if>
	<ul data-am-widget="gallery"
		class="am-gallery am-avg-sm-2 am-gallery-imgbordered"
		data-am-gallery="{ pureview: true }">
		<s:iterator value="dto.orderDetailPics" status="status" id="orderDetailPics">
			<li>
				<div class="am-gallery-item">
					<a
						href="<%=request.getContextPath()%>/uploads/weixin/order/${orderDetailPics.ordPicPath}"><img
						src="<%=request.getContextPath()%>/uploads/weixin/order/${orderDetailPics.ordPicPath}" /></a>
				</div>
			</li>
		</s:iterator>
	</ul>
	<!--页脚-->
	<button type="button" class="am-btn am-btn-success am-btn-block" id="selectPicBTN">选择照片</button>
	<button type="button" class="am-btn am-btn-primary am-btn-block" id="savePicBTN">提交照片</button>
	<div id="imglist" class="am-form-group">
	</div>
<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>
