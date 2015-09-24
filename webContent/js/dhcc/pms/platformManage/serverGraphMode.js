var tipContent = new Object();
var serverData = new Object();

$(document).ready(function() {
	loadGraphModeData();
});

function loadGraphModeData() {
	$.post(
		'serverCtrl!getServerGraph.htm',
		function(data) {
			var jsonData = eval(data);
			var onlineState = new Array("在线", "离线", "未知");
			var server = new Array("数据库服务器", "日志服务器", "应用服务器", "WEB服务器", "接收服务器", "前置机服务器");
			$("#serverImg h2").each(function() {
				var serverType = $(this).text();
				var shtml = '';
				var otherIp = new Object();
				var systemType = new Object();
				var orgName = new Object();
				
				for (var i=0; i<jsonData.length; i++) {
					systemType[jsonData[i].serverId] += '<br>&nbsp;&nbsp;'+jsonData[i].systemType+'&nbsp;&nbsp;'+jsonData[i].useState;
					orgName[jsonData[i].serverId] += '<br>&nbsp;&nbsp;'+jsonData[i].orgName;
					if (jsonData[i].ipType == "2"){
						otherIp[jsonData[i].serverId] += '<br>&nbsp;&nbsp;'+jsonData[i].ip;
					} else {
						if (jsonData[i].serverType == server[0]) {	
//							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>服务器IP:'+jsonData[i].ip+
//							'<br>运行状态:'+jsonData[i].onlineState;
							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>主IP:'+jsonData[i].ip+
							'<br>其他IP:'+otherIp[jsonData[i].serverId]+'<br>运行状态:'+jsonData[i].onlineState;	
						} else if (jsonData[i].serverType == server[1]) {
//							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>服务器IP:'+jsonData[i].ip+
//							'<br>运行状态:'+jsonData[i].onlineState;
							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>主IP:'+jsonData[i].ip+
							'<br>其他IP:'+otherIp[jsonData[i].serverId]+'<br>运行状态:'+jsonData[i].onlineState;	
						}else if (jsonData[i].serverType == server[2]) {
//							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>服务器IP:'+jsonData[i].ip+
//							'<br>运行状态:'+jsonData[i].onlineState+'<br>已安装的应用:<br>卫生综合管理系统&nbsp;&nbsp;正常<br>区域卫生商业智能&nbsp;&nbsp;停止<br>远程会诊&nbsp;&nbsp;正常<br>妇幼保健系统&nbsp;&nbsp;正常';//jsonData[i].systemType;
							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>主IP:'+jsonData[i].ip+
							'<br>其他IP:'+otherIp[jsonData[i].serverId]+'<br>运行状态:'+jsonData[i].onlineState+
							'<br>已安装的应用:'+systemType[jsonData[i].serverId];	
						}else if (jsonData[i].serverType == server[3]) {
//							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>服务器IP:'+jsonData[i].ip+
//							'<br>运行状态:'+jsonData[i].onlineState+'<br>已安装的应用:<br>统一运维及安全管理平台&nbsp;&nbsp;繁忙';//+jsonData[i].systemType;
							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>主IP:'+jsonData[i].ip+
							'<br>其他IP:'+otherIp[jsonData[i].serverId]+'<br>运行状态:'+jsonData[i].onlineState+
							'<br>已安装的应用:'+systemType[jsonData[i].serverId];	
						}else if (jsonData[i].serverType == server[4]) {
//							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>服务器IP:'+jsonData[i].ip+'<br>运行状态:'+
//							jsonData[i].onlineState+'<br>数据上传量:100000'+'<br>连接的前置机:<br>'+jsonData[i].ip;
							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>主IP:'+jsonData[i].ip+
							'<br>其他IP:'+otherIp[jsonData[i].serverId]+'<br>运行状态:'+jsonData[i].onlineState+
							'<br>数据上传量:'+jsonData[i].dataUpNum;	
						}else if (jsonData[i].serverType == server[5]) {
//							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>服务器IP:'+jsonData[i].ip+'<br>运行状态:'+
//							jsonData[i].onlineState+'<br>数据上传量:100000'+'<br>数据质量:良'+'<br>使用机构:<br>'+jsonData[i].orgName
//							+'<br>已安装的应用:<br>数据采集交换与共享平台&nbsp;&nbsp;繁忙<br>数据填报系统&nbsp;&nbsp;正常';
							tipContent[jsonData[i].serverId] = '服务器名:'+jsonData[i].serverName+'<br>主IP:'+jsonData[i].ip+
							'<br>其他IP:'+otherIp[jsonData[i].serverId]+'<br>运行状态:'+jsonData[i].onlineState+
							'<br>数据上传量:'+jsonData[i].dataUpNum+'<br>使用机构:'+orgName[jsonData[i].serverId]+
							'<br>已安装的应用:'+systemType[jsonData[i].serverId];	
						}	
					}
						
					serverData[jsonData[i].serverId] = jsonData[i];
					if (serverData[jsonData[i].serverId].serverType == serverType) {
						if (serverData[jsonData[i].serverId].onlineState == onlineState[0]) {
//							shtml += '<div><a href="#"><img id="'+serverData[jsonData[i].serverId].serverId+'" alt="'+serverData[jsonData[i].serverId].serverType+'" src="../images/serverManage/server_online.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/><p class="typeface">统一运维及安全管理平台</p></a><a href="#" class="character">'
//							    +jsonData[i].serverName+'</a></div>';
							shtml += '<div><a href="#"><img id="'+serverData[jsonData[i].serverId].serverId+'" alt="'+serverData[jsonData[i].serverId].serverType+'" src="../images/serverManage/server_online.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/></a><a href="#" class="character">'
						    +jsonData[i].serverName+'</a></div>';
						} else if (serverData[jsonData[i].serverId].onlineState == onlineState[1]) {
							shtml += '<div><a href="#"><img id="'+serverData[jsonData[i].serverId].serverId+'" alt="'+serverData[jsonData[i].serverId].serverType+'" src="../images/serverManage/server_offline.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/></a><a href="#" class="character">'
						    	+jsonData[i].serverName+'</a></div>';
						} else if (serverData[jsonData[i].serverId].onlineState == onlineState[2]) {
							shtml += '<div><a href="#"><img id="'+serverData[jsonData[i].serverId].serverId+'" alt="'+serverData[jsonData[i].serverId].serverType+'" src="../images/serverManage/server_busy.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/></a><a href="#" class="character">'
						    	+jsonData[i].serverName+'</a></div>';
						}
					}
//					if (jsonData[i].serverType == serverType) {
//						if (jsonData[i].onlineState == onlineState[0]) {
////							shtml += '<div><a href="#"><img id="'+jsonData[i].serverId+'" alt="'+jsonData[i].serverType+'" src="../images/serverManage/server_online.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/><p class="typeface">统一运维及安全管理平台</p></a><a href="#" class="character">'
////							    +jsonData[i].serverName+'</a></div>';
//							shtml += '<div><a href="#"><img id="'+jsonData[i].serverId+'" alt="'+jsonData[i].serverType+'" src="../images/serverManage/server_online.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/></a><a href="#" class="character">'
//						    +jsonData[i].serverName+'</a></div>';
//						} else if (jsonData[i].onlineState == onlineState[1]) {
//							shtml += '<div><a href="#"><img id="'+jsonData[i].serverId+'" alt="'+jsonData[i].serverType+'" src="../images/serverManage/server_offline.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/></a><a href="#" class="character">'
//						    	+jsonData[i].serverName+'</a></div>';
//						} else if (jsonData[i].onlineState == onlineState[2]) {
//							shtml += '<div><a href="#"><img id="'+jsonData[i].serverId+'" alt="'+jsonData[i].serverType+'" src="../images/serverManage/server_busy.png" onclick="singleClick(this)" onmousedown="rightClick(this)" onmouseover="myMouseOver(this)" onmouseleave="myMouseLeave(this)"/></a><a href="#" class="character">'
//						    	+jsonData[i].serverName+'</a></div>';
//						}
//					}
					
				}
				shtml += '</ul>';
				$(this).parents("tr").next().children().html(shtml);
			});
		}
	);
	
}

// 悬停事件
function myMouseOver(obj) {
	$CommonUI.poshytip(obj,tipContent[obj.id]);

}

// 悬停移除
function myMouseLeave(obj) {
	$CommonUI.destoryPoshytip(obj);
}

// 滚动按钮单击事件
function singleClick(obj) {
	$CommonUI.destoryPoshytip(obj);
	$('#'+obj.id).live('click', function(e){
	  e.preventDefault();
		$CommonUI.getMenu("#mm").menu('show', {
			left: e.pageX,
			top: e.pageY
		});
	});
	
	if (obj.alt == '数据库服务器') {
		$("#mm div").show();
		$("#mm-org").hide();
		$("#mm-systemVer").hide();
	} else if (obj.alt == '日志服务器') {
		$("#mm div").show();
		$("#mm-org").hide();
		$("#mm-systemVer").hide();
	} else if (obj.alt == '应用服务器') {
		$("#mm div").show();
		$("#mm-org").hide();
	} else if (obj.alt == 'WEB服务器') {
		$("#mm div").show();
		$("#mm-org").hide();
		$("#mm-systemVer").hide();
	} else if (obj.alt == '接收服务器') {
		$("#mm div").show();
		$("#mm-org").hide();
		$("#mm-systemVer").hide();
	} else if (obj.alt == '前置机服务器') {
		$("#mm div").show();
		$("#mm-systemVer").hide();
	}
	
	// 菜单按钮事件
	$CommonUI.getMenu("#mm").menu({
		onClick: function(item) {
			if (item.text == "服务器资源监控") {
				$CommonUI.getDialog("#rightClickMenuWin").dialog({
					title: serverData[obj.id].serverType+serverData[obj.id].serverName+'资源监控'
				});
		
			} else if (item.text == "服务器信息配置") {
				$CommonUI.getDialog("rightClickMenuWin").dialog({
					title: serverData[obj.id].serverType+serverData[obj.id].serverName+'信息配置'
				});
				if (serverData[obj.id]) {
					$("#rightClickMenuWin input[name='serverDto.server.serverId']").val(serverData[obj.id].serverId);
					$("#rightClickMenuWin input[name='serverDto.server.serverName']").val(serverData[obj.id].serverName);
					$CommonUI.getComboBox("#serverClass").combobox('setValue', serverData[obj.id].serverType);
					//$("#rightClickMenuWin input[name='serverDto.server.ip']").val(serverData[obj.id].ip);
					$("#rightClickMenuWin input[name='serverDto.server.port']").val(serverData[obj.id].port);
					$("#rightClickMenuWin input[name='serverDto.server.userName']").val(serverData[obj.id].userName);
					$("#rightClickMenuWin input[name='serverDto.server.password']").val(serverData[obj.id].password);
					$CommonUI.getComboBox("#on-offline").combobox('setValue', serverData[obj.id].onlineState);
				}
				$CommonUI.getDialog("#rightClickMenuWin").dialog("open");
				$("#rightClickMenuWin table").hide();
				$("#configInfo").show();
				$("#menuWinBtn a").hide();
				$("#menuSubmitBtn").show();
				$("#menuCancelBtn").show();
			} else if (item.text == "应用安装") {
				$CommonUI.getDialog("rightClickMenuInstallWin").dialog({
					title: serverData[obj.id].serverType+serverData[obj.id].serverName+'系统安装'
				});
				if (serverData[obj.id]) {
					$("#rightClickMenuInstallWin input[name='gatewayDto.gateway.serverId']").val(serverData[obj.id].serverId);
				}
				$CommonUI.getDialog("#rightClickMenuInstallWin").dialog("open");
				$("#rightClickMenuInstallWin table").show();
				$("#menuInstallWinBtn a").show();
			} else if (item.text == "网络测试") {
				$CommonUI.getDialog("#rightClickMenuWin").dialog({
					title: serverData[obj.id].serverType+serverData[obj.id].serverName+'网络状况测试'
				});
				$CommonUI.getDialog("#rightClickMenuWin").dialog("open");
				$("#rightClickMenuWin table").hide();
				$("#testNet").show();
				$("#menuWinBtn a").hide();
				$("#netTestBtn").show();
				$("#menuCancelBtn").show();
			}
		}
	});
}

// 右击事件
function rightClick(obj) {
	$('#'+obj.id).live('click', function(e){	
		if (3 == e.which) {
			$CommonUI.destoryPoshytip(obj);
			e.preventDefault();
			$CommonUI.getMenu("#mm").menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		}
	});
}

$(function() {
	
	// 图形模式右侧页面滚动按钮鼠标移动效果
	$("#dataBase").removeClass("unselectedBtn");
	$("#dataBase").addClass("selectedBtn");
	$("#serverBtn div").hover(
		function() {
			if ($(this).hasClass("selectedBtn")) {
				$(this).removeClass("mouseover");
			} else {
				$(this).addClass("mouseover");
			}	
		},
		function() {
			$(this).removeClass("mouseover");
		}
	);
	
	// 图形模式右侧页面滚动按钮鼠标单击效果
	$("#serverBtn div").click(function() {
		$("#serverBtn div").removeClass("selectedBtn");
		$("#serverBtn div").addClass("unselectedBtn");
		$(this).removeClass("unselectedBtn");
		$(this).removeClass("mouseover");
		$(this).addClass("selectedBtn");	
	});
	
	// 图形模式菜单弹窗提交按钮
	$("#menuSubmitBtn").on('click', function() {
		$CommonUI.getForm("#rightClickMenuForm").form("submit", {
			url:'serverCtrl!saveOrUpdate.htm',
			success : function() {
				$CommonUI.getWindow("#rightClickMenuWin").window('close');
				var msg = '';
				var id = $("#rightClickMenuWin input[name='serverDto.server.serverId']").val();
				if (id == '') {
					msg = '保存成功!';
				} else {
					msg = '更新成功!';
				}
				$CommonUI.alert(msg, "", "", "", function() {
					$CommonUI.datagrid("#datagrid").datagrid('reload');
					$("#rightClickMenuForm input").val('');
				});
			}
		});
	});
	
	// 图形模式菜单弹窗放弃按钮
	$("#menuCancelBtn").on('click', function() {
		$CommonUI.getDialog("#rightClickMenuWin").dialog('close');
	});
	
	// 图形模式菜单弹窗安装按钮
	$("#installBtn").on('click', function() {
		$CommonUI.getForm("#installForm").form("submit", {
			url:$WEB_ROOT_PATH+'/appSystemConfig/appSystemConfigCtrl!saveOrUpdate.htm',
			success : function() {
				$CommonUI.getDialog("#rightClickMenuInstallWin").dialog("close");
				var msg = '安装成功！';
				$CommonUI.alert(msg, "", "", "", function() {
					loadGraphModeData();
					$("#installForm input").val('');
				});
			}
		});
	});
	
	// 图形模式菜单弹窗放弃安装按钮
	$("#installCancelBtn").on('click', function() {
		$CommonUI.getDialog("#rightClickMenuInstallWin").dialog('close');
	});
});

function clear() {
	$("#rightClickMenuWin").val('');
	$("#rightClickMenuInstallWin").val('');
}