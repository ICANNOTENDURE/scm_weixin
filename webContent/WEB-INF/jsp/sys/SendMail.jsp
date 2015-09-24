<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>send mail</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/kindeditor.jsp"%>
<link href="../css/ord/shopping.css" rel="stylesheet" type="text/css" />
 <script>
    $(function(){
    	$CommonUI.getDialog("#sendMail").dialog("open");
    	
    	$("#submitBtn").on('click',function(){
    		var isValid = $CommonUI.getForm('#fromSendMail').form('validate');
    		if(!isValid){
    			return isValid;
    		}
    		
    		KE.sync('content');
    		postReq($WEB_ROOT_PATH+'/sys/sendMailCtrl!send.htm',"#fromSendMail",succ,err,{skipHidden:false});
    		
    	});
    	
    	var KE=KindEditor.create('textarea[name="dto.content"]', {
    		uploadJson : $WEB_ROOT_PATH+'../jsp/upload_json.jsp'
    	});
    });
function succ(){
	$CommonUI.alert("发送成功");
}
function err(){
	$CommonUI.alert("发送失败");
}  
 </script>
</head>
<body>
	

	<div id="sendMail" class="dialog" title="发送邮件"
		data-options="modal:true,width:800,height:550,closed:true,buttons:'#sendBTN'"
		style="vertical-align: middle;">
		<form id="fromSendMail">
		<table id="saveOrUpdateTable" style="width: 100%;">
				<tr >
					<td class="textLabel" style="text-align: right;">收件人:</td>
					<td class="textParent" style="text-align: left;"><input
						style="width: 350px;" class="validatebox" type="text"
						name="dto.recUser" data-options="required:true"></input>
					</td>
				</tr>
				<tr >
					<td class="textLabel" style="text-align: right;">主题:</td>
					<td class="textParent" style="text-align: left;"><input
						style="width: 600px;" class="validatebox" type="text"
						name="dto.sub" data-options="required:true"></input>
					</td>
				</tr>
				<tr >
					<td class="textLabel" style="text-align: right;">内容:</td>
					<td class="textParent" style="text-align: left;">
					<textarea  name="dto.content" rows="25" id="content"></textarea>
					</td>
				</tr>
		</table>
		</form>
		
	</div>
	
	
	<div id="sendBTN" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="submitBtn"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-save'">发送</a> <a
					id="canceBtn" href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-cancel'">重置</a></td>
			</tr>
		</table>
	</div>
</body>
</html>