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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/weixin/jssdk.js"></script>
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
						debug : true,
						appId : data.appId,
						timestamp : data.timestamp,
						nonceStr : data.noncestr,
						signature : data.signature,
						jsApiList : [ 'scanQRCode', 'chooseImage','uploadImage']
					});
				}, 'json');

		$("#scanpic").on( 'click', function() {
				wx .scanQRCode({
							needResult : 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
							scanType : [ "qrCode", "barCode" ], // 可以指定扫二维码还是一维码，默认二者都有
							success : function(res) {
								var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
								//$("#doc-ta-bak").html(result);
								$('#common-modal-loading') .modal();
								$ .post(
											$WEB_ROOT_PATH + "/weixin/mpInGdRecCtrl!getBarCodeInfo.htm",
											{
												'dto.barcode' : result
											},
											function(data) {
													$('#common-modal-loading') .modal('close');
													trhtml="";
													$ .each( data.gdRecItms, function( i, itm) {
																trhtml=trhtml+"<tr><td>"+itm.desc+"</td>";
																trhtml=trhtml+"<td>"+itm.qty+"</td>";
																trhtml=trhtml+"<td>"+itm.uom+"</td>";
																trhtml=trhtml+"<td>"+itm.rp+"</td>";
																trhtml=trhtml+"<td>"+itm.batno+"</td>";
																trhtml=trhtml+"<td>"+itm.expDate+"</td>";
																trhtml=trhtml+"<td>"+itm.invno+"</td>";
																trhtml=trhtml+"<td>"+itm.manf+"</td>";
																trhtml=trhtml+"<td>"+itm.vendor+"</td>";
																trhtml=trhtml+"<td hidden>"+itm.scmid+"</td></tr>";
													});
													$("#dataList").html(trhtml);
											}, 'json');

							}
						});
		});
		$("#uppic").on('click', function() {
			wx.chooseImage({
				count : 1, // 默认9
				sizeType : [ 'original', 'compressed' ], // 可以指定是原图还是压缩图，默认二者都有
				sourceType : [ 'album', 'camera' ], // 可以指定来源是相册还是相机，默认二者都有
				success : function(res) {
					wx.uploadImage({
					    localId: res.localIds, // 需要上传的图片的本地ID，由chooseImage接口获得
					    isShowProgressTips: 1, // 默认为1，显示进度提示
					    success: function (res) {
					        imghtml="<div id="+res.serverId;+"><img width='200' height='200' class='am-radius' src="+res.localIds+" class='am-img-responsive' />";
							imghtml=imghtml+"<button type='button' class='am-btn am-btn-default am-radius am-btn-success am-btn-xs' onclick='viewPic(this)'>预览<i class='am-icon-picture-o'></i></button>";
							imghtml=imghtml+"<button type='button' class='am-btn am-btn-default am-radius am-btn-danger am-btn-xs' onclick='deletePic(this)'>删除<i class='am-icon-remove'></i></button></div>";
							$("#imglist").append(imghtml);
							$("#imgMsg").html("您已经选择了"+$("#imglist").find("img").size()+"张照片");
					    }
					});
					
				}
			});
		});
		$("#save").on('click', function() {
			
			if($("#dataList").find("tr").size()==0){
				$('#common-alert-bd').html("没有要保存的数据");
				$('#common-alert').modal();
				return;
			}
			if($("#imglist").find("img").size()==0){
				$('#common-alert-bd').html("请先上传照片");
				$('#common-alert').modal();
				//return;
			}
			var subIdStr="";
			$('#dataList tr').each(function(){
				subIdStr=subIdStr+","+$.trim($(this).children().eq(9).html());
			});
			var imgIdStr="";
			$("#imglist div").each(function(){
				imgIdStr=imgIdStr+","+$(this).attr("id")
			})
			
			$('#common-modal-loading') .modal();
			$ .post(
						$WEB_ROOT_PATH + "/weixin/mpInGdRecCtrl!saveIngdRec.htm",
						{
							'dto.ordSubIdStr' : subIdStr,
							'dto.imgIdStr' : imgIdStr
						},
						function(data) {
								$('#common-modal-loading') .modal('close');
								if(data.resultCode=="0"){
									$("#common-alert-bd").html("操作成功!入库单号:"+data.resultContent);
									$('#common-alert').modal();
									$("#dataList").html("");
									$("#imglist").html("");
								}else{
									$("#common-alert-bd").html("操作失败:"+data.resultContent);
									$('#common-alert').modal();
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
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>
	<form class="am-form am-form-horizontal" action="">
		<fieldset>
			<input type="hidden" id="subIdStr" />
			<div class="am-form-group ">
				<label for="doc-ds-ipt-user">建单人:</label> <input type="text"
					id="doc-ds-ipt-user" class="am-form-field am-input-sm"
					value='<s:property value="dto.user"/>' disabled>
			</div>

			<div class="am-form-group">
				<label for="oc-ds-select-loc">入库科室：</label> <input type="text"
					id="doc-ds-ipt-loc" class="am-form-field am-input-sm"
					value='<s:property value="dto.loc"/>' disabled>
			</div>

			<div class="am-form-group">
				<label for="oc-ds-select-date">入库日期：</label> <input type="text"
					id="doc-ds-ipt-date" class="am-form-field am-input-sm"
					value='<s:property value="dto.date"/>' disabled>
			</div>
			<div class="am-form-group">
				<label for="doc-ta-bak">备注</label>
				<textarea class="" rows="1" id="doc-ta-bak"></textarea>
			</div>
			<div class="am-form-group">
				<button type="button" class="am-btn am-btn-primary"
					id="scanpic">扫码<i class="am-icon-camera"></i></button>
				<button type="button" class="am-btn am-btn-primary"
					id="uppic">上传照片<i class="am-icon-cloud-upload"></i></button>
				<button type="button" class="am-btn am-btn-primary"
					id="save">确认<i class="am-icon-save"></i></button>
			</div>
			<div id="imgMsg" class="am-form-group">
			</div>
			<div id="imglist" class="am-form-group">
			</div>
		</fieldset>
	</form>

	<div class="am-scrollable-horizontal">
	<table class="am-table am-table-bordered am-table-striped am-text-nowrap am-table-hover">
		<thead>
			<tr>
				<th>名称</th>
				<th>数量</th>
				<th>单位</th>
				<th>价格</th>
				<th>批号</th>
				<th>效期</th>
				<th>发票号</th>
				<th>厂商</th>
				<th>供应商</th>
				<th hidden>scmid</th>
			</tr>
		</thead>
		<tbody id="dataList">

		</tbody>
	</table>
	
	</div>

	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>
