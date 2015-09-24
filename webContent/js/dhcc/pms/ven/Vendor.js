$(function() {
    $CommonUI.getDataGrid('#datagrid').datagrid({
        url: $WEB_ROOT_PATH + '/ven/vendorCtrl!list.htm',
        iconCls: 'icon-tip',
        // 图标
        method: 'post',
        fit: true,
        striped:true,
	    pageSize:20,
        columns: [[{
            field: 'ck1',
            checkbox: true
        },
        {
            field: 'code',
            title: '代码',
            width: 100
        },
        {
            field: 'name',
            title: '名称',
            width: 100
        }]]
    });

 

    // 点击查询的提交按钮
    $("#selectBt").on('click',
    function() {
        var json = $CommonUI.loopBlock('#selectWin');
        $("#datagrid").datagrid('load', json);
        $CommonUI.getDialog('#selectWin').dialog('close');
    });

    $('#title').css({
        width: 500,
        height: 60
    });

    $('#title1').css({
        width: 500,
        height: 60
    });
});

// 增加
function addClick() {
	
	$("#addFrame")[0].src=$WEB_ROOT_PATH+"/ven/vendorCtrl.htm?BLHMI=add";
    $CommonUI.getDialog("#addWin").dialog("setTitle", "增加供应商");
    $CommonUI.getDialog("#addWin").dialog("center");
    $CommonUI.getDialog("#addWin").dialog("open");
    $CommonUI.getForm('#addWin').form('clear');
}

// 編輯一行记录
function editRow() {
    if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
        $CommonUI.alert('请选一个修改');
        return;
    }
    var row = $("#datagrid").datagrid('getSelected');
    var Id = row.vendorId;
    $("#editFrame")[0].src= $WEB_ROOT_PATH + '/ven/vendorCtrl.htm?BLHMI=update&dto.vendor.vendorId=' + Id;
    $CommonUI.getDialog("#editWin").dialog("setTitle", "修改供应商");
    $CommonUI.getDialog("#editWin").dialog("center");
    $CommonUI.getDialog("#editWin").dialog("open");
}

// 取消按钮
function cancelClick() {
    $CommonUI.getWindow("#detailWin").dialog("close");
}

// 刪除記錄
function delRow() {
    if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
        $CommonUI.alert('请选一个删除');
        return;
    }
    $CommonUI.confirm('确定删除吗？', 'question', 0,
    function() {
        var row = $CommonUI.getDataGrid("#datagrid").datagrid('getSelected');
        $.post($WEB_ROOT_PATH + "/ven/vendorCtrl!delete.htm", {
            'dto.vendor.vendorId': row.vendorId
        },
        function() {
            $CommonUI.getDataGrid("#datagrid").datagrid('reload');
        });
    });
}

// 条件查询提交事件
function selectClick() {
    $CommonUI.getDialog("#selectWin").dialog("center");
    $CommonUI.getDialog("#selectWin").dialog("open");
    $("#title1").val('');
}

// 条件查询取消事件
function selectCanBtClick() {
    $CommonUI.getWindow("#selectWin").dialog("close");
}

// 清空表单方法
function clear() {
    $("#detail input").val("");
    $("#showTable input").val("");

    $CommonUI.getDialog('#normalAccountDialog').dialog({
        title: '添加普通用户账户'
    });

    $("#submitFuncBtn").show();
}