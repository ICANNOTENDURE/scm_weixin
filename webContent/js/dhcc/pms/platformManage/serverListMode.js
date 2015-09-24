$(function() {
	
	// 服务器类型下拉菜单监听函数：控制列表模式查询显示
	$CommonUI.getComboBox("#serverType").combobox({
		onSelect: function(record) {
			$CommonUI.getDataGrid("#datagrid").datagrid('load',{
				"serverDto.server.serverType":record.value
			});
		}
	});
	
});

// 服务器列表模式列表超连接按钮实现函数
function hyperlink(value, row, index) {
	return "<a href='#' target='_blank'>查看&nbsp;&nbsp;</a>"
		+"<a href='#' target='_blank'>&nbsp;&nbsp;停用&nbsp;&nbsp;</a>"
		+"<a href='serverCtrl!delServer.htm?serverDto.server.serverId="+row.serverId+"'>&nbsp;&nbsp;删除</a>";
}

function clear() {
	
}