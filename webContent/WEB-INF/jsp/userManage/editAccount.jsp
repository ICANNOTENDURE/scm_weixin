<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
 <script>
 	$(function (){
 		
	 	$.post(
	 			"<%=request.getContextPath()%>/normalAccount/normalAccountCtrl!getUserInfo.htm",
	 			function(data){
	 				$("#hop").val(data.hopName);
	 				$("#loc").val(data.locName);
	 				
	 				$("#accountAlias").val(data.normalAccount.accountAlias);
	 				$("#realName").val(data.normalAccount.normalUser.realName);
	 				$("#tel").val(data.normalAccount.normalUser.telephone);
	 				$("#mail").val(data.normalAccount.normalUser.email);
	 				$("#locId").val(data.normalAccount.normalUser.locId);
	 				
	 				$("#desLoc").val(data.locName);
	 				$("#contact").val(data.normalAccount.normalUser.realName);
	 				$("#desTel").val(data.normalAccount.normalUser.telephone);
	 				
	 				$("#recDestination").combobox({
						url:$WEB_ROOT_PATH+'/ord/orderCtrl!findLocDesctionComboList.htm?dto.loc='+data.normalAccount.normalUser.locId,
						valueField:'hopCtlocDestinationId',							
						textField:'destination',
						mode:'remote',
					});
	 				$("#recDestination").combobox('setValue',data.destinationId);
	 			},
	 			"json"
	 	);
	 	
	 	$("#addDes").on('click',function(){
	 		$("#destDestination").val('setValue','');
	 		$CommonUI.getDialog("#detailWin").dialog("open");
	 	});
	 	
		$("#setDeft").on('click',function(){
			recDestinationId=$("#recDestination").combobox('getValue');
			if(recDestinationId=""){
				$CommonUI.alert("请选择收货地址");
				return;
			}
			$.post(
				
				$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!setDefaut.htm',
				{
					'dto.id':$("#locId").val(),
					'dto.destionId':$("#recDestination").combobox('getValue')
				},
				function(data){
					if(data.dto.opFlg==1){
						$CommonUI.alert("操作成功");
					}
				},	
				'json'	
			);
	 	});
		$("#delDes").on('click',function(){
			recDestinationId=$("#recDestination").combobox('getValue');
			if(recDestinationId=""){
				$CommonUI.alert("请选择收货地址");
				return;
			}
			$.post(
				
				$WEB_ROOT_PATH+'/hop/hopCtlocDestinationCtrl!delete.htm',
				{
					'dto.hopCtlocDestination.hopCtlocDestinationId':$("#recDestination").combobox('getValue')
				},
				function(data){
						$CommonUI.alert("操作成功");
				},	
				'json'	
			);
	 	});
		$("#addCtlocDesBtn").on('click',function(){
			$.post(
				$WEB_ROOT_PATH+'/hop/hopCtlocDestinationCtrl!save.htm',
				{
					'dto.hopCtlocDestination.ctlocDr':$("#locId").val(),
					'dto.hopCtlocDestination.contact':$("#contact").val(),
					'dto.hopCtlocDestination.tel':$("#desTel").val(),
					'dto.hopCtlocDestination.destination':$("#destDestination").val()
				},
				function(data){
					if(data.dto.opFlg==1){
						$('#recDestination').combobox('reload'); 
						$('#recDestination').combobox('setValue',data.dto.hopCtlocDestination.hopCtlocDestinationId);
						$CommonUI.getDialog("#detailWin").dialog("close");
					}
				},
				'json'
			);
		});
		
		$("#submitBtn").on('click',function(){
			$.post(
				$WEB_ROOT_PATH+'/normalAccount/normalAccountCtrl!saveInfo.htm',
				{
					'normalAccountDto.normalAccount.normalUser.realName':$("#realName").val(),
					'normalAccountDto.normalAccount.normalUser.telephone':$("#tel").val(),
					'normalAccountDto.normalAccount.normalUser.email':$("#mail").val(),
				},
				function(data){
					if(data.opFlg==1){
						$CommonUI.alert("操作成功");
					}
				},
				'json'
			);
		});
 	});
    $(document).ready(function () {
    	$CommonUI.getDialog("#Dialog1").dialog("center");
    	$CommonUI.getDialog("#Dialog1").dialog("open");	
    	
    });
</script>
</head>
<body >
	
	<div id="Dialog1" class="dialog" title="修改个人资料"
		style="width: 900px;"
		data-options="
				toolbar:'#toolbar',
				buttons:'#Button',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:true,
				shadow:true">
		<form id="saveOrUpdateForm" method="post">

			<table id="saveOrUpdateTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">账户名:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" type="text" style="width: 200px;"
						data-options="
			      		validType:['accountAlias']
			      		" id="accountAlias" readonly="readonly"/>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">真实姓名:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.realName"
						class="validatebox" type="text" style="width: 200px;" id="realName"/></td>
				</tr>
				
				
				
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">医院:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					  id="hop" readonly="readonly"/></td>
					<td class="textLabel" style="text-align: right; width: 20%">科室:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					 id="loc" readonly="readonly"/></td>	
				</tr>
				

				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">手机号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.telephone"
						class="validatebox" type="text" style="width: 200px;"
						data-options="
					validType:['telphone']
			      " id="tel"/></td>
					<td class="textLabel" style="text-align: right; width: 20%">电子邮件:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.email"
						class="validatebox" type="text" style="width: 200px;"
						data-options="
					validType:['email']
			      " id="mail"/>
				</tr>

			   <tr>
					<td class="textLabel">收货地址(默认):</td>
					<td class="textParent">
						<input style="width: 348px;" class="combobox" type="text"  id="recDestination"/>
						
					</td>	 	
				</tr>
				<tr style="display: none;">
						<input type="hidden"  id="locId"/>
					 	
				</tr>
			</table>

		</form>
	</div>
	<div id="Button" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="submitBtn"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存</a></td>
			</tr>
		</table>
	</div>

	<div id="toolbar" align="left">
		<a id="addDes" href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-add',plain:true">增加收货地址</a>
		<a id="setDeft"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存当前收货地址为默认</a>
		<a id="delDes"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-remove',plain:true">删除当前收货地址</a>			
	</div>
	
	
	
	<div id="detailWin" class="dialog" title="新增收货信息"
		data-options="modal:true,width:400,closed:true,toolbar:'#btnDiv1'"
		>
			<table style="width: 100%;" >
	
				<tr>
					<td class="textLabel">科室:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" id="desLoc" readonly="readonly"/></td>					
				</tr>
				<tr>
					<td class="textLabel">联系人员:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text"id="contact" /></td>					
				</tr>
				<tr>
					<td class="textLabel">联系电话:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text"" id="desTel" /></td>					
				</tr>
				<tr>
					<td class="textLabel">地址:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtlocDestination.destination"
						data-options="required:true" id="destDestination" /></td>					
				</tr>
			</table>			
			<div id="btnDiv1" >
				<a id="addCtlocDesBtn" class="linkbutton"
							data-options="iconCls:'icon-save',plain:true">保存</a> 
			</div>
	</div>
</body>
</html>