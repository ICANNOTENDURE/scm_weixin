<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导入</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/uploadify.css">
	
<script>
 	$(function (){
 		$("#upload").uploadify({
 	        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
 	        'uploader': $WEB_ROOT_PATH + '/ven/venDeliverCtrl!uploadAndroid.htm',
 	        //在浏览窗口底部的文件类型下拉菜单中显示的文本
 	        'buttonText':'Upload',
 	        'fileTypeDesc': '支持的格式：',
 	        'fileTypeExts': '*.xls',
 	        'fileSizeLimit': '30MB',
 	        'width': '60',
 	        'height': '20',
 	        'debug' : false,
 	        'fileObjName':'dto.upload',
 	        'auto': true,
 	        'removeCompleted':true,
 	        'onSelect': function(){  
 	        	$("#gg").dialog("open");	
            }, 
 	        //上传成功
 	        'onUploadSuccess':function(file, data, response){
 	        	$("#gg").dialog("close");	
 	        	var obj=eval('('+data+')');
 	        	if(obj.opFlg=="1"){
 	        		
 	        		$CommonUI.alert("上传成功");
 	        		$("#gg").dialog("close");	
 	        	}else{
 	        		$CommonUI.alert(obj.msg);
 	        		$("#gg").dialog("close");	
 	        	};
 	        },
 	        //检测FLASH失败调用
 	        'onFallback': function() {
 	        	$("#gg").dialog("close");	
 	            alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
 	        },
 	        //返回一个错误，选择文件的时候触发
 	        'onSelectError': function(file, errorCode, errorMsg) {
 	        	$("#gg").dialog("close");	
 	            switch (errorCode) {
 	            case - 100 : alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
 	                break;
 	            case - 110 : alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
 	                break;
 	            case - 120 : alert("文件 [" + file.name + "] 大小异常！");
 	                break;
 	            case - 130 : alert("文件 [" + file.name + "] 类型不正确！");
 	                break;
 	            }
 	        }
 	    });
 		
 		$('#impModel').html("");
 		$('#impModel').append("<td class='time'>模版 </td>");
 		$.post(
 			$WEB_ROOT_PATH+"/sys/sysImpModelCtrl!listImpModel.htm",
 			{
 				'dto.impModel.type':'VENINVBYORDER'
 			},
 			function(data){
 				$.each(data,function(i,dd){
 						$('#impModel').append("<td class='drop'><div class='item'>"+dd.name+"</div></td>");
 				});
 			},
 			"json"
 		);
 		
    });
 	 $(document).ready(function () {
     	$CommonUI.getDialog("#importDialog").dialog("center");
     	$CommonUI.getDialog("#importDialog").dialog("open");	
     	
     });
 	</script>
</head>
<body>
	<div id="importDialog" class="dialog" title="导入发票"
		style="width:800px;height: 400px; background-color: #F5FAFD;"
		data-options="
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">
			<table style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">导入Excel文件:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 250px;" class="validatebox" type="file"
						name="upload" id="upload"></input></td>
				</tr>
			</table>
			
			<table>
	    		<tr id="impModel">
	    			<td class="time">模版 </td>
	    		</tr>
	    	</table>
	</div>
	 <div id="gg" class="dialog" title="请等待"  style="width:800px;height:400px;padding:10px;"
				data-options="
				modal:true,
				draggable:false,
				closable:false,
				closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">
				
        		<p1>正在处理上传数据，请等待</p1>
    </div>
    <style type="text/css">

    .item{
	    text-align:center;
	    border:1px solid #499B33;
	    background:#fafafa;
	    color:#444;
	    width:90px;
    }
    </style>
</body>
</html>
