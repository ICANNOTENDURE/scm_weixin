$(function() {
	
	// 添加服务器弹窗提交按钮
	$("#submitBtn").on('click', function() {
		$CommonUI.getForm("#addServerForm").form("submit", {
			url:'serverCtrl!saveOrUpdate.htm',
			success : function() {
				$("#addServerWin").window("close");
				var msg = '';
				var id = $("#addServerWin input[name='serverDto.server.serverId']").val();
				if (id == '') {
					msg = '保存成功!';
				} else {
					msg = '更新成功!';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					//$CommonUI.datagrid("#datagrid").datagrid('reload');
					//$("#addServerForm input").val('');
				});
			}
		});
	});
	
	// 添加服务器弹窗放弃按钮
	$("#cancelBtn").on('click', function() {
		$CommonUI.getWindow("#addServerWin").window('close');
	});
	
});

// 服务器管理拓扑界面切换
function topoModeFrame() {
	var src = "serverCtrl!serverTopoMode.htm";
	$("#serverPanel iframe").attr("src", src);
}

// 服务器管理图形模式界面切换
function graphModeFrame() {
	var src = "serverCtrl!serverGraphMode.htm";
	$("#serverPanel iframe").attr("src", src);
//	$(".hide").hide();
//	$(".show").show();
}

// 服务器管理列表模式界面切换 
function listModeFrame() {
	var src = "serverCtrl!serverListMode.htm";
	$("#serverPanel iframe").attr("src", src);
//	$(".hide").show();
//	$(".show").hide();
}

// 服务器管理打开添加服务器弹窗按钮
function addServerWin() {
	$("#addServerWin").window({
		title:"添加服务器"
	});
	$CommonUI.getWindow("#addServerWin").window("open");
		
	$("#addServerForm input").val('');
}

// 服务器管理添加服务器弹窗增加IP输入条目
function addIp() {
	shtml = "<tr align='right'>" +
			"<td>服务器IP:</td>" +
			"<td style='text-align:left'>" +
			"<input class='combobox' name='serverDto.server.serverIps.ipType' style='width:100px;'" +
			" data-options='dict:'ip_type',valueField:'value',textField:'desc',multiple:false,required:true,panelHeight:'auto'' /></td>" +
			"<td style='text-align:left'>" +
			"<input class='validatebox' name='serverDto.server.serverIps.ip' style='width:140px;' data-options='required:true'/></td>" +
			"<td><a id='addIpBtn' class='linkbutton' data-options='iconCls:'icon-add',plain:true' onclick='javascript:addIp()' disabled='false'></a></td></tr>" +
			"<tr align='right'>" +
			"<td>IP使用状态:</td>" +
			"<td colspan='3' style='text-align:left'>" +
			"<input class='combobox' name='serverDto.server.serverIps.useState' style='width:276px;'" +
			" data-options='dict:'use_state',valueField:'value',textField:'desc',multiple:false,required:false,panelHeight:'auto''/></td></tr>";
	$(this).parents("#newIp").next().after(shtml);
	$(this).attr("disabled",false);
	$(this).attr("disabled","disabled");
	$(this).hide();
	$("#addServerWin").load();
}

function clear() {
	$("#addServerWin").val('');
}