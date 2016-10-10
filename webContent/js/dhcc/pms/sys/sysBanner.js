// zxx 2014-04-19
$(function (){

	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/sys/sysBannerCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    columns:[
            [{"title":"bannerId","field":"bannerId","width":50,"sortable":false,"hidden":true},
             {"title":"图片","field":"bannerPath","width":250,"sortable":false,"hidden":false,
               "formatter":function(value,row,index){return '<img src="'+$WEB_ROOT_PATH+'/uploadPic/'+row.bannerPath+'" width=100 height=100/>';}	
             },
             {"title":"序号","field":"bannerSeq","width":50,"sortable":false,"hidden":false},
             {"title":"状态","field":"bannerStatus","width":50,"sortable":false,"hidden":false,
              "formatter":function(value,row,index){if(row.bannerStatus==0){return "使用"}else{return "停用"}}	 
             }]
	    ]	 
	});
	
	//新增或更新成功的回调函数
	function succ(data){
		var Id=$('#detail input[name="dto.sysBanner.sysBannerId"]').val();	
		if(Id){
			$CommonUI.alert("修改成功");
		}else{
			$CommonUI.alert("增加成功");
		}
		 $("#datagrid").datagrid('reload');
		 $("#detailWin").dialog('close');
	}
	
	//新增或更新失败的回调函数
	function err(xhr,textStatus,errorThrown){
		$CommonUI.alert("faile");	
	}
	
	// 新增和修改
	$("#submitBtn").on('click', function() {
		var isValid = $CommonUI.getForm('#detail').form('validate');
		if(!isValid){
			return isValid;
		}
		postReq($WEB_ROOT_PATH+'/sys/sysBannerCtrl!save.htm',"#detail",succ,err,{skipHidden:false});
	});
	
	
	// 点击查询的提交按钮
	$("#selectBt").on('click', function() {
		 var json=$CommonUI.loopBlock('#selectWin');
		 $("#datagrid").datagrid('load', json);
		 $CommonUI.getDialog('#selectWin').dialog('close');
	});
	
	$("#upload").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/sys/uploadFileAction!upload.htm',
        //在浏览窗口底部的文件类型下拉菜单中显示的文本
        'buttonText':'上传图片',
        'fileTypeDesc': '支持的格式：',
        'fileTypeExts': '*.jpg;*.jpeg;*.png',
        'fileSizeLimit': '500',
        'width': '60',
        'height': '20',
        'debug' : false,
        'fileObjName':'dto.upload',
        'auto': true,
        'removeCompleted':true,
        //上传成功
        'onUploadSuccess':function(file, data, response){
        	    $("tr[name='trPic']").remove();
        		setPic(data);
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
});

//增加
function addClick() {
	$("tr[name='trPic']").remove();
	$CommonUI.getDialog("#detailWin").dialog("setTitle","新增图片");
	$CommonUI.getDialog("#detailWin").dialog("center");
	$CommonUI.getDialog("#detailWin").dialog("open");
	$CommonUI.getForm('#detail').form('clear');
}

//編輯一行记录
function editRow() {
	$("tr[name='trPic']").remove();
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个修改');
		return;
	}
	$CommonUI.getForm('#detail').form('clear');
	
	var row =$("#datagrid").datagrid('getSelected');
	var Id=row.bannerId;
	var url = $WEB_ROOT_PATH+'/sys/sysBannerCtrl.htm?BLHMI=findById&dto.sysBanner.bannerId='+Id;
	$("#detailWin").dialog("open");
	$CommonUI.getDialog("#detailWin").dialog("setTitle","修改");
	$.getJSON(url, function(data){
		$CommonUI.fillBlock('#detailWin',data);
		setPic(row.bannerPath);
	});
}


function setPic(data){
		$("#path").val(data);
		imgUrl=$WEB_ROOT_PATH +"/uploadPic/"+data;
	 	html="<tr  name='trPic'><td class='textLabel'>图片:</td><td ><img src='"+imgUrl+"' width=105px></img>";
	 	html=html+"<div><a class='dhc-linkbutton l-btn l-btn-plain'  onclick='javascript:viewPic();' ><span class='l-btn-left'><span class='l-btn-text icon-search l-btn-icon-left'>预览</span></span></a></div>";
	 	html=html+"<div  src='"+imgUrl+"' style='float:left'></div></td></tr>";
	 	$('#saveOrUpdateTable').append(html);
}
// 取消按钮
function cancelClick() {
	$CommonUI.getWindow("#detailWin").dialog("close");
}

//刪除記錄
function delRow() {
	if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
		$CommonUI.alert('请选一个删除');
		return;
	}
	$CommonUI.confirm('确定删除吗？', 'question', 0, function(){
		var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
		$.post($WEB_ROOT_PATH+"/sys/sysBannerCtrl!delete.htm", {'dto.sysBanner.bannerId':row.bannerId},function(){
			$CommonUI.getDataGrid("#datagrid").datagrid('reload');
		} );
	});
}

function viewPic(){
	 imgurl=$WEB_ROOT_PATH +"/uploadPic/"+$("#path").val();
	 layer.photos({
		    photos:{
		    	  "data": [   //相册包含的图片，数组格式
		    	    {
		    	      "src": imgurl, //原图地址
		    	      "thumb":imgurl //缩略图地址
		    	    }
		    	  ]
		    },
			shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
	 });
}
