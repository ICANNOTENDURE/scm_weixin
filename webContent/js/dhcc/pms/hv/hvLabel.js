// zxx 2014-04-19
$(function() {

	$CommonUI.getDataGrid('#datagrid').datagrid({
		url : $WEB_ROOT_PATH + '/hv/hvLabelCtrl!list.htm',
		iconCls : 'icon-edit',// 图标
		method : 'post',
		fit : true,
		pageSize:50,
		pageList:[50,100,200],
		onClickRow:onClickRow,
		onLoadSuccess: compute,//加载完毕后执行计算
		columns : [ [ {
			"title" : "序列号",
			"field" : "rowId",
			"sortable" : false,
			"hidden" : false,
			"formatter":function(value,row,index){
				if(value=="<b>合计：</b>"){
					return value;
				}else{
					return index+1;
				}
			}
		},{
			"title" : "id",
			"field" : "id",
			"sortable" : false,
			"hidden" : true
		}, {
			"title" : "医嘱日期",
			"field" : "orddate",
			"sortable" : true,
			"hidden" : false,
			"width":100
		}, {
			"title" : "条码",
			"field" : "label",
			"sortable" : false,
			"hidden" : false,
			"width":200
		}, {
			"title" : "商品名称",
			"field" : "venincname",
			"sortable" : true,
			"hidden" : false,
			"width":200
		}, {
			"title" : "规格",
			"field" : "spec",
			"sortable" : true,
			"hidden" : false,
			"width":100
		}, {
			"title" : "发票号",
			"field" : "invno",
			"sortable" : false,
			"hidden" : false,
			"width":100,
			"editor":{    
                "type":"validatebox"   
            }
		}, {
			"title" : "发票日期",
			"field" : "invnodate",
			"sortable" : false,
			"hidden" : false,
			"width":100,
			"editor":{    
                "type":"datebox"   
            }
		}, {
			"title" : "数量",
			"field" : "qty",
			"sortable" : false,
			"hidden" : false,
			"width":50
		}, {
			"title" : "单价",
			"field" : "rp",
			"sortable" : false,
			"hidden" : false,
			"width":50
		} , {
			"title" : "医院",
			"field" : "hosp",
			"sortable" : false,
			"hidden" : false,
			"width":100
		}, {
			"title" : "同步标志",
			"field" : "flag",
			"sortable" : false,
			"hidden" : false,
			"width":50
		}, {
			"title" : "入库单号",
			"field" : "recno",
			"hidden" : false,
			"width":100
		}] ]
	});

	
	$("#down").on('click',function(){
	  	window.location.href="downLoadCtrl!downLoad.htm?stDate="+$("#StDate").datebox('getValue')+"&edDate="+$("#EdDate").datebox('getValue')+"&sort="+$('#datagrid').datagrid("options").sortName+"&order="+$('#datagrid').datagrid("options").sortOrder+"&incname="+$("input[name='dto.incname']").val();   
	});
	
	$("#auto").on('click',function(){
		
		ff=$(this).attr("checked");
		if(ff==undefined){
			//$('#datagrid').datagrid('rejectChanges');
			return;
		}
		$('#datagrid').datagrid('endEdit', 0);
		editIndex = undefined;
		invno=$('#datagrid').datagrid('getRows')[0].invno;
		invnodate=$('#datagrid').datagrid('getRows')[0].invnodate;
		
		for(var i=1;i<$('#datagrid').datagrid('getRows').length;i++){
			
			tmpinvno=$('#datagrid').datagrid('getRows')[i].invno;
			tmpinvnodate=$('#datagrid').datagrid('getRows')[i].invnodate;

			if((tmpinvno==undefined)||(tmpinvno=="")){
				$('#datagrid').datagrid('updateRow',{
					index: i,
					row: {
						invno: invno
					}
				});
			}

			if((tmpinvnodate==undefined)||(tmpinvnodate=="")){
				$('#datagrid').datagrid('updateRow',{
					index: i,
					row: {
						invnodate:invnodate
					}
				});
				
			}

			


		}



	})
});


var editIndex = undefined;
function endEditing(){
    if (editIndex == undefined){return true;}
    if ($('#datagrid').datagrid('validateRow', editIndex)){
        $('#datagrid').datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}
function onClickRow(index){
		if(endEditing()){
			   flag=$('#datagrid').datagrid('getRows')[index]['flag'];
			   if(flag=="Y"){
				   $CommonUI.alert("his已同步，不能修改");
				   return;
			   }
			   $('#datagrid').datagrid('selectRow', index).datagrid('beginEdit', index);
			   editIndex=index;
		}
	}


function save(){
	
	if(!endEditing()){
		 $CommonUI.alert("有未修改完的行");
		return;
	}
	
	 var changes=$('#datagrid').datagrid('getRows'); //$('#datagrid').datagrid('getChanges');
	 if(changes.length==0){
		 $CommonUI.alert("没有修改记录");
		 return
	 }
	par=[];
	for(var j=0;j<changes.length;j++){
		if(changes[j]["id"]==undefined){continue;}
		InvNoObj= new Object();
		InvNoObj.hvInvNo=changes[j]["invno"];
		if((changes[j]["invnodate"]!="")&&(changes[j]["invnodate"]!=null)){
			InvNoObj.hvInvNoDate=changes[j]["invnodate"]+" 00:00:00";
		}
		InvNoObj.hvId=changes[j]["id"];
		par.push(InvNoObj);
	}

	 $.post(
			 $WEB_ROOT_PATH+'/hv/hvLabelCtrl!save.htm',
			 {
				 "dto.parStr":jQuery.toJSON(par)
			 },
			 function(data){
				 if(data.resultCode=="0"){
					 $('#datagrid').datagrid('acceptChanges');
					 editIndex = undefined;
					 $CommonUI.alert("保存成功");
				 }else{
					 $CommonUI.alert("错误",data.resultContent);
					 $("#datagrid").datagrid('rejectChanges');
				 }	 
	        },
			 'json'
		 );
}


// 条件查询提交事件
function selectClick() {
	var json = $CommonUI.loopBlock('#toolbar');
	$("#datagrid").datagrid('load', json);
}

//指定列求和
function compute() {//计算函数
    var rows = $('#datagrid').datagrid('getRows')//获取当前的数据行
    var qtotal = 0//计算qty的总和
    ,rtotal=0;//统计rp的总和
    for (var i = 0; i < rows.length; i++) {
        qtotal += rows[i]['qty'];
        rtotal += rows[i]['rp'];
    }
    //新增一行显示统计信息
    $('#datagrid').datagrid('appendRow', { rowId: '<b>合计：</b>', qty: qtotal, rp: rtotal });
}



