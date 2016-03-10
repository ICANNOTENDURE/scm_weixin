$(function(){	
	
	// 扩展validatebox的validType属性
	$.extend($.fn.validatebox.defaults.rules, {
	  //添加自己的表单验证规则
	  //扩展validatebox的validType属性
		idCard: {
	    	validator: function(value, param){ 
		    	if (/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '身份证格式有误'
	    },
	    telphone:{
	    	validator: function(value, param){ 
		    	if (/^[1]([3][0-9]{1}|59|58|88|89|55|57)[0-9]{8}$/.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '手机号格式有误'
	    },
	    accountAlias:{
	    	validator: function(value, param){ 
		    	if (/[^0-9](.)*/.test(value)&&/^((?!@).)+$/.test(value)&&/^.{6,20}$/.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '账户名不能以数字开头，不能包含"@",长度为6-20位'
	    },
	    mail:{
	    	validator: function(value, param){ 
	    		var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		    	if (filter.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '邮箱格式有误'
	    }
	});
	
	//下一步
	$("#nextPage").on('click',
		    function() {
				
				step=1;
				if($("#step1").css("display")=='block'){
					var isValid = $CommonUI.getForm('#step1').form('validate');
					if(!isValid){
						return isValid;
					}
					step=1;
				}
				if($("#step2").css("display")=='block'){
					var isValid = $CommonUI.getForm('#step2').form('validate');
					if(!isValid){
						return isValid;
					}
					step=2;
				}
				if($("#step3").css("display")=='block'){
					step=3;
				}
				switch (step) {
		        	case 1:
                    	$("#step1").css("display","none");
		        		$("#step2").css("display","block");
		        		$("#stepTitle1").addClass("complete");
		        		$("#stepTitle2").addClass("active");
		        		break;
		        	case 2:
		        		$("#step2").css("display","none");
		        		$("#step3").css("display","block");
		        		$("#stepTitle2").addClass("complete");
		        		$("#stepTitle3").addClass("active");
		        		saveReq();
		        		break;
				}
			}
	);
	//上一步
	$("#prePage").on('click',
		    function() {
				step=1;
				if($("#step1").css("display")=='block'){
					step=1;
				}
				if($("#step2").css("display")=='block'){
					step=2;
				}
				if($("#step3").css("display")=='block'){
					step=3;
				}
				switch (step) {
		        	case 1:

		        		break;
		        	case 2:
		        		$("#step2").css("display","none");
		        		$("#step1").css("display","block");
		        		$("#stepTitle1").removeClass("complete");
		        		$("#stepTitle2").removeClass("active");
		        		break;
		        	case 3:
		        		$("#step3").css("display","none");
		        		$("#step2").css("display","block");
		        		$("#stepTitle2").removeClass("complete");
		        		$("#stepTitle3").removeClass("active");
		        		break;	
				}
			}
	);
	$("#step1").find("input").on('blur',function(){
		//var isValid = $CommonUI.getForm('#detailsForm').form('validate');
		//if(!isValid){
		//	return isValid;
		//}
	});
	
	// 新增和修改
 
    function saveReq() {
    	var isValid = $CommonUI.getForm('#step1').form('validate');
		if(!isValid){
			return isValid;
		}
		var isValidzz = $CommonUI.getForm('#step2').form('validate');
		if(!isValidzz){
			return isValidzz;
		}
        //供应商资质数组
    	//$("#submitBtn").hide();
        var venQualifTypeList = [];
        if ($("#step2 tr").length >= 1) {
            $("#step2 tr").each((function() {
                exp = $(this).find("input[name='dto.vendorDto.venQualificationList.venQualification.expdate']").val();
                desc=  $(this).find("input[name='dto.vendorDto.venQualificationList.venQualification.description']").val();
                venQualificationId = $(this).find("input[name='dto.vendorDto.venQualificationList.venQualification.venQualificationId']").val();
                venQualifTypeId = $(this).find("input[name='dto.vendorDto.venQualificationList.venQualification.venQualifyTypeId']").attr("id");
                jsonObj = new Object();
                jsonObj.venQualificationId = venQualificationId;
                if((jQuery.trim(exp)!="")){
                	jsonObj.expdate = exp+" 00:00:00";
                }
                if((jQuery.trim(desc)!="")){
                	jsonObj.description = desc;
                }
                jsonObj.venQualifTypeId = venQualifTypeId;
                jsonObj.vendorid = $("#step1 input[name='dto.vendorDto.vendor.vendorId']").val();
                if ((exp != "") ||(description != "")) {
                    venQualifTypeList.push(jsonObj);
                }
            }));
        }
        $.post($WEB_ROOT_PATH + "/nur/nurseCtrl!saveVendor.htm", {
            "dto.vendorDto.vendor.vendorId": $("#subDetails input[name='dto.vendorDto.vendor.vendorId']").val(),
            "dto.vendorDto.vendor.code": $("#subDetails input[name='dto.vendorDto.vendor.code']").val(),
            "dto.vendorDto.vendor.name": $("#subDetails input[name='dto.vendorDto.vendor.name']").val(),
            "dto.vendorDto.vendor.address": $("#subDetails input[name='dto.vendorDto.vendor.address']").val(),
            "dto.vendorDto.vendor.fax": $("#subDetails input[name='dto.vendorDto.vendor.fax']").val(),
            "dto.vendorDto.vendor.tel": $("#subDetails input[name='dto.vendorDto.vendor.tel']").val(),
            "dto.vendorDto.vendor.account": $("#subDetails input[name='dto.vendorDto.vendor.account']").val(),
            "dto.vendorDto.vendor.contact": $("#subDetails input[name='dto.vendorDto.vendor.contact']").val(),
            "dto.vendorDto.vendor.taxation": $("#subDetails input[name='dto.vendorDto.vendor.taxation']").val(),
            "dto.vendorDto.vendor.email": $("#subDetails input[name='dto.vendorDto.vendor.email']").val(),
            "dto.hopStr":$("#reghopid").val(),//在多选下拉显示医院string
            "dto.vendorDto.venQualificationList": jQuery.toJSON(venQualifTypeList)
        },
        function(data) {
            if (data.success) {
            	//add_message("am-btn-success","注册成功",$WEB_ROOT_PATH +"/nur/nurseCtrl!registSucess.htm");
            	$("#step2").css("display","none");
        		$("#step3").css("display","block");
        		$("#stepTitle2").addClass("complete");
        		$("#stepTitle3").addClass("complete");
        		$("#prePage").css("display","none");
        		$("#nextPage").css("display","none");
            } else {
            	add_message("am-btn-danger","注册失败","");
            }
        },
        "json");
    }
   
  //注册上传文件
    if ($("#step2 tr").length >= 1) {
        $("#step2 tr").each((function() {
        	var uploadid=$(this).find("input[name='upload']").attr("id");
        	var venQualifyTypeId=$(this).find("input[name='dto.vendorDto.venQualificationList.venQualification.venQualifyTypeId']").attr("id");
        	var venQualificationId=$(this).find("input[name='dto.vendorDto.venQualificationList.venQualification.venQualificationId'][id='"+venQualifyTypeId+"']").val();;
        	$(this).find("input[name='upload']").uploadify({
                'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
                'uploader': $WEB_ROOT_PATH + '/nur/nurseCtrl!upload.htm',
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'buttonText':'<i class="am-icon-upload"></i>&nbsp;&nbsp;&nbsp;上传图片',
                'fileTypeDesc': '支持的格式：',
                'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
                'fileSizeLimit': '3MB',
                'width': '100',
                'height': '30',
                'debug' : false,
                'fileObjName':'dto.vendorDto.upload',
                'auto': true,
                'removeCompleted':true,
                //开始上传时传递参数
                'onUploadStart': function(file) {
                	$("#"+uploadid).uploadify("settings", 'formData', {'dto.vendorDto.vendor.vendorId':$("#subDetails input[name='dto.vendorDto.vendor.vendorId']").val(),'dto.uploadFileName': file.name,'dto.vendorDto.venQualifTypeVO.qualif' : venQualificationId,'dto.vendorDto.venQualifTypeVO.type' : venQualifyTypeId});
                },
                //取消上传
                'onCancel':function(){
//                	$.post($WEB_ROOT_PATH + "/ven/vendorCtrl!deleteUpload.htm", {
//                        'dto.venQualifPicId': $('#detail input[name="dto.vendor.vendorId"]').val()
//                    });
                },
                //上传成功
                'onUploadSuccess':function(file, data, response){
                	//$('#step1 input[name="dto.vendorDto.vendor.vendorId"]').val(data.split(",")[1]);
                	//$('#step2 input[name="dto.vendorDto.venQualificationList.venQualification.venQualificationId"][id='+venQualifyTypeId+']').val(data.split(",")[0]);
                	var obj=eval('('+data+')');
                
                	if(obj.opFlg=="1"){
                		
                		$('#subDetails input[name="dto.vendorDto.vendor.vendorId"]').val(obj.vendor.vendorId);
                		dd=obj.venQualifPic;
                		imgUrl=$WEB_ROOT_PATH +"/uploads/"+dd.path;
        			 	imgId="item"+dd.id;
	                	html="<li id=img"+dd.id+">";
	                	html=html+"<div class='am-gallery-item'>";
	                	html=html+"<img src='"+imgUrl+"'";
	                	html=html+"data-rel='"+imgUrl+"'";
	                	html=html+"style='width: 100px; height: 100px' />";
	                	html=html+"<h3 class='am-gallery-title'>"+dd.name+"</h3>";
	                	html=html+"<a class='am-btn am-btn-link' onclick='deletePic("+dd.id+")'>删除<span class='am-icon-remove'></span></a>";
	                	html=html+"</div>";
	                	html=html+"</li>";
	                	var picTypeId="picType"+obj.venQualifTypeVO.type;
	                	$("#"+picTypeId).append(html);
                	}else{
                		
                	}
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
    
  //验证税务号的唯一性
  $("#taxation").on('blur',function(){
	  var val=this.value;
	  $.post($WEB_ROOT_PATH + "/nur/nurseCtrl!checkVenUnique.htm", {
		  'dto.vendorDto.vendor.taxation': val,
	  },function(data){
		  if(data){
			  add_message("am-btn-warning","税务号("+val+")已经存在!","");
			  $("#taxation").val("");
			  $("#taxation").focus();
			}
	  },'json');
  });
//验证供应商唯一性
  $("#name").on('blur',function(){
	  var val=this.value;
	  $.post($WEB_ROOT_PATH + "/nur/nurseCtrl!checkVenUnique.htm", {
		  'dto.vendorDto.vendor.name': val
	  },function(data){
			if(data){
				add_message("am-btn-warning","供应商("+val+")已经存在!","");
				$("#name").val("");
				$("#name").focus();
			}
	  },'json');
  });
//验证注册帐号的唯一性
  $("#account").on('blur',function(){
	  var val=this.value;
	  $.post($WEB_ROOT_PATH + "/nur/nurseCtrl!checkVenUnique.htm", {
		  'dto.vendorDto.vendor.account': val
	  },function(data){
		  if(data){
			  add_message("am-btn-warning","注册帐号("+val+")已经存在!","");
			  $("#account").val("");
			  $("#account").focus();
		  }
	  },'json');
  });
  
	//单独加载页脚
	if(document.body.clientHeight<document.documentElement.clientHeight){
		$("#xxx2").removeAttr("style");
	}else{
		$("#xxx1").removeAttr("style");
	}	
});

function deletePic(id){
	   $.post($WEB_ROOT_PATH + "/ven/vendorCtrl!deleteUpload.htm", {
           'dto.venQualifPicId': id
       },
       function(data) {
    	   add_message("am-btn-success","删除成功!","");
    	   $("#img"+data).remove();
       });
}

function goBack(){
	window.location.href="../";
}