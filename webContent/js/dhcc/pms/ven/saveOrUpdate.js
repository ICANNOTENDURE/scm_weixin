$(function() {
	//动态加载供应商下拉列表
	$.ajaxSettings.async = false;


    $('#parentId').combobox({
    	url:$WEB_ROOT_PATH +"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=",
    	panelHeight:"auto",
        valueField:'vendorId',  
        textField:'name',  
        onChange:function (newValue, oldValue){
            if(newValue !=null){  
                var urlStr =$WEB_ROOT_PATH +"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=" + encodeURIComponent(newValue);  
                $("#parentId").combobox("reload",urlStr);  
            }  
        },
    	onSelect:function(rec){
    		$('#parentId').combobox('setText',rec.name);
    	}
    });  
	
	//注册上传文件
    if ($("#subDetail tr").length >= 1) {
        $("#subDetail tr").each((function() {
        	var uploadid=$(this).find("input[name='upload']").attr("id");
        	var  venQualifyTypeId=$(this).find("input[name='dto.venQualificationList.venQualification.venQualifyTypeId']").attr("id");
        	var  venQualificationId=$(this).find("input[name='dto.venQualificationList.venQualification.venQualificationId']").attr("id");
  
        	$(this).find("input[name='upload']").uploadify({
                'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
                'uploader': $WEB_ROOT_PATH + '/ven/vendorCtrl!upload.htm',
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'buttonText':'<i class="icon-upload-alt "></i>',
                'fileTypeDesc': '支持的格式：',
                'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
                'fileSizeLimit': '3MB',
                'width': '20',
                'height': '15',
                'debug' : false,
                'fileObjName':'dto.upload',
                'auto': true,
                'removeCompleted':true,
                //开始上传时传递参数
                'onUploadStart': function(file) {
                	$("#"+uploadid).uploadify("settings", 'formData', {'dto.vendor.vendorId':$("#detail input[name='dto.vendor.vendorId']").val(),'dto.uploadFileName': file.name,'dto.venQualifTypeVO.qualif' : venQualificationId,'dto.venQualifTypeVO.type' : venQualifyTypeId});
                },
                //取消上传
                'onCancel':function(){
//                	$.post($WEB_ROOT_PATH + "/ven/vendorCtrl!deleteUpload.htm", {
//                        'dto.venQualifPicId': $('#detail input[name="dto.vendor.vendorId"]').val()
//                    });
                },
                //上传成功
                'onUploadSuccess':function(file, data, response){
                	$('#detail input[name="dto.vendor.vendorId"]').val(data);
                	document.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl.htm?BLHMI=update&dto.vendor.vendorId=' + $('#detail input[name="dto.vendor.vendorId"]').val();
                },
                //检测FLASH失败调用
                'onFallback': function() {
                    alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function(file, errorCode, errorMsg) {
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
        }));
    }
   
    // 新增和修改
    $("#submitBtn").on('click',
    function() {
        //		var isValid = $CommonUI.formValidation('#detail');
        //		alert(isValid)
        //		if(!isValid){
        //			return isValid;
        //		}
        //供应商资质数组
    	$("#submitBtn").hide();
        var venQualifTypeList = [];
        if ($("#subDetail tr").length >= 1) {
            $("#subDetail tr").each((function() {
                exp = $(this).find("input[name='dto.venQualificationList.venQualification.expdate']").val();
                description = $(this).find("input[name='dto.venQualificationList.venQualification.description']").val();
                venQualificationId = $(this).find("input[name='dto.venQualificationList.venQualification.venQualificationId']").val();
                venQualifTypeId = $(this).find("input[name='dto.venQualificationList.venQualification.venQualifyTypeId']").attr("id");
                textType=$(this).attr("data-id");
                jsonObj = new Object();
                jsonObj.venQualificationId = venQualificationId;
                if(textType=="日期"){
	                if((jQuery.trim(exp)!="")){
	                	jsonObj.expdate = exp+" 00:00:00";
	                }
                }else{
                	jsonObj.description=description;
                }
                jsonObj.venQualifTypeId = venQualifTypeId;
                jsonObj.vendorid = $("#detail input[name='dto.vendor.vendorId']").val();
                if ((exp != "") || (venQualificationId != "")) {
                    venQualifTypeList.push(jsonObj);
                }
            }));
        }
        $.post($WEB_ROOT_PATH + "/ven/vendorCtrl!save.htm", {
            "dto.vendor.vendorId": $("#detail input[name='dto.vendor.vendorId']").val(),
            "dto.vendor.code": $("#detail input[name='dto.vendor.code']").val(),
            "dto.vendor.name": $("#detail input[name='dto.vendor.name']").val(),
            "dto.vendor.address": $("#detail input[name='dto.vendor.address']").val(),
            "dto.vendor.fax": $("#detail input[name='dto.vendor.fax']").val(),
            "dto.vendor.tel": $("#detail input[name='dto.vendor.tel']").val(),
            "dto.vendor.account": $("#detail input[name='dto.vendor.account']").val(),
            "dto.vendor.contact": $("#detail input[name='dto.vendor.contact']").val(),
            "dto.vendor.parentId": $("#detail input[name='dto.vendor.parentId']").val(),
            "dto.vendor.hisId": $("#detail input[name='dto.vendor.hisId']").val(),
            "dto.vendor.email": $("#detail input[name='dto.vendor.email']").val(),
            "dto.venQualificationList": jQuery.toJSON(venQualifTypeList)
        },
        function(data) {
            $CommonUI.alert(data.dto.message, "", "", "", null);
            if (data.dto.success) {
            	$("#submitBtn").show();
            	
            } else {
                $("#submitBtn").show();
            }
        },
        "json");
    });
    
    

});

//重置表单
$("#cancelBtn").click(function(){
	$("#detail input").val("");
});
//刪除記錄
function deletePic(id) {
    $CommonUI.confirm('确定删除吗？', 'question', 0,
    function() {
        $.post($WEB_ROOT_PATH + "/ven/vendorCtrl!deleteUpload.htm", {
            'dto.venQualifPicId': id
        },
        function(data) {
        	//$CommonUI.alert(data.message, "", "", "","");
        	document.location.href=$WEB_ROOT_PATH + '/ven/vendorCtrl.htm?BLHMI=update&dto.vendor.vendorId=' + $('#detail input[name="dto.vendor.vendorId"]').val();
        },
        "json");
    });
}
//预览图片
function viewPic(id) {
	 if ($("#idContainer"+id).is(":visible")==false){
		 var img = new Image();
		 img.src =$("#idContainer"+id).find("img").attr("src") ;
		 var w = img.width;
		 var h = img.height;
		 $("#idContainer"+id).find("img").css("top",(250-w)/2);
		 $("#idContainer"+id).find("img").css("left",(300-h)/2);
		 $("#idContainer"+id).show();
	}else{
	
		$("#idContainer"+id).hide();
	}	
}
//预览图片
function closePic(id) {
		$("#idContainer"+id).hide();
}

(function($){
	var initLayout = function() {
	  	$(".toRegister").each(function() {
			//alert($(this).html());
			$(this).zoomimage();
		});
	};
  	EYE.register(initLayout, 'init');
})(jQuery);	