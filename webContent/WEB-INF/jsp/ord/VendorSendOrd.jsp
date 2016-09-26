<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/js/easyui/themes/metro-blue/easyui.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/easyui/plugins/jquery.groupview.js"></script>	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common.js"></script>
<!--  -->
<link href="<%=request.getContextPath()%>/js/easyui/themes/icon.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		date = new Date();
		dateAdd(date, 'D', -7);
		$('#stdate').datetimebox('setValue', date.format("yyyy-MM-dd")+" 00:00:00");
		$('#eddate').datetimebox('setValue',new Date().format("yyyy-MM-dd")+" 23:59:59");
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
		   stateid=$('#datagrid').datagrid('getRows')[index]['stateid'];
		   if(stateid!=2){
			   //return;
		   }
		   $('#datagrid').datagrid('selectRow', index).datagrid('beginEdit', index);
		   
		}
		$('#datagrid').datagrid({
							title:'录入发票信息',
							url : 'orderStateCtrl!listVenSend.htm',
							iconCls : 'icon-edit',//图标
							method : 'post',
							fit : true,
							fitColumns : true,
							striped : true,
							loadMsg : '加载数据中.....',
							toolbar : '#toolbar',
							pagination : true,
							pageSize : 20,
							pageList : [ 20, 100, 1000 ],
							groupField:'orderno',
							queryParams : {
								'dto.state' : 2,
								"dto.stdate" : $("#stdate").datebox('getValue'),
								"dto.eddate" : $("#eddate").datebox('getValue'),
							},
							onClickRow:onClickRow,
			    			//onAfterEdit:onAfterEdit
			});
		
		//点击翻页事件
		var p = $('#datagrid').datagrid('getPager'); 
    	$(p).pagination({ 
    		onSelectPage:function(pageNumber, pageSize){
    			$(this).pagination('loaded');
    			var row=$('#datagrid').datagrid('getRows').length;
        		for(var i=0;i<row;i++){
        			if ($('#datagrid').datagrid('validateRow', i)){
        				$('#datagrid').datagrid('endEdit', i); 
        			}
        		}
        		
        		var changes=$('#datagrid').datagrid('getChanges');
        		
        		if(changes.length>0){
        			$.messager.alert("提示","本页面有未保存的记录，请先保存");
        			
        		}else{
        			$("#datagrid").datagrid('load', {
        				"dto.stdate" : $("#stdate").datebox('getValue'),
        				"dto.eddate" : $("#eddate").datebox('getValue'),
        				"dto.state" : $("#state").combobox('getValue'),
        				"dto.pageModel.pageNo" : pageNumber,
        				"dto.pageModel.pageSize" : pageSize,
        			});
        			return;
        		}
        		
    		}
    	}); 
		
		//编辑完就保存
		function onAfterEdit(rowIndex, rowData, changes){
			
			 var changes=$('#datagrid').datagrid('getChanges');
			 if(changes.length==0){
				 return
			 }

			 //$('#datagrid').datagrid('acceptChanges');
			 $.post(
					 getContextPath()+'/ord/orderStateCtrl!saveOrdSub.htm',
					 {
						 "dto.orderDetailSub.ordSubId":rowData.ordersubid,
			          	 "dto.orderDetailSub.ordSubBatNo":rowData.batno,
			          	 "dto.orderDetailSub.ordSubExpDate":rowData.expdate,
			          	 "dto.orderDetailSub.ordSubInvNo":rowData.invno, 
			          	 "dto.orderDetailSub.orderSubRp":rowData.rp, 
			          	 "dto.orderDetailSub.orderSubQty":rowData.devqty,
			          	 "dto.orderDetailSub.ordSubDetailId":rowData.orderid
					 },
					 function(data){
						 
						 if(data.resultCode=="1"){
							 $('#datagrid').datagrid('acceptChanges');
							 editIndex = undefined;
						 }else{
							 $.messager.alert("错误",data.resultContent);
							 $("#datagrid").datagrid('rejectChanges');
						 }	 
			        },
					 'json'
				 );
		}
		
		$("#search").on('click', function() {
			$("#datagrid").datagrid('load', {
				"dto.stdate" : $("#stdate").datebox('getValue'),
				"dto.eddate" : $("#eddate").datebox('getValue'),
				"dto.hopId" : $("#hop").combobox('getValue'),
				"dto.state" : $("#state").combobox('getValue'),
				"dto.recLoc" : $("#recloc").combobox('getValue')
			});

		});

		$('#recloc').combobox(
						{
							url : getContextPath()
									+ '/hop/hopCtlocCtrl!findHopLocComboxVos.htm?dto.type=2',
							valueField : 'id',
							textField : 'name'
						});
		$('#state').combobox({
			url : 'orderStateCtrl!getComboList.htm',
			valueField : 'stateSeq',
			textField : 'stateName'
		});
		$('#state').combobox('setValue', 2);
		$('#hop').combobox({
			url : getContextPath() + '/hop/hospitalCtrl!getHospInfo.htm',
			valueField : 'hospitalId',
			textField : 'hospitalName'
		});
		
		
		

	
	});
	
function deleteOrdSub(value,row,index){
	if ((row.ordersubid!=null)&&(row.stateid==2)){
		//if (row.editing){  
        //    var s= '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="saverow('+index+',this)"><span class="l-btn-left"><span class="l-btn-text icon-save l-btn-icon-left">保存</span></span></a>';
        //    var c= '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="cancelrow('+index+',this)"><span class="l-btn-left"><span class="l-btn-text icon-remove l-btn-icon-left">取消</span></span></a>';
        //    return s+c;  
        //}else{
        //	 var e = '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="editrow('+index+',this)"><span class="l-btn-left"><span class="l-btn-text icon-edit l-btn-icon-left">修改</span></span></a> ';  
        //     var d = '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="deleterow('+index+',this)"><span class="l-btn-left"><span class="l-btn-text icon-cancel l-btn-icon-left">删除</span></span></a>';  
        //     return e+d;  
        //}
		return '<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain"  data-options="iconCls:"icon-save" onclick="javascript:deleterow('+index+');"><span class="l-btn-left"><span class="l-btn-text icon-remove l-btn-icon-left">删除</span></span></a>';
	}
}
function deleterow(index){
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
	    if (r){    
	    	ordersubid=$('#datagrid').datagrid('getRows')[index]['ordersubid']; 
	    	$.post(
	    			getContextPath() + '/ord/orderStateCtrl!deleteOrdSub.htm', 
	    			{
	    				"dto.orderDetailSub.ordSubId" : ordersubid,
	    			}, 
	    			function(data) {
	    				if (data.resultCode == "1") {
	    					$.messager.alert("提示","删除成功");
	    					$('#datagrid').datagrid('load');
	    				} else {
	    					$.messager.alert("错误",data.resultContent);	
	    				}
	    			}, 
	    			'json'
	    	);	
	    }    
	});
}	
function addBatNoClick(){
	var rows=$("#datagrid").datagrid('getSelections');
	if (rows.length ==0) {
		$.messager.alert('警告','请先选择');    
		return;
	}
	orderid=rows[0].orderid;
	ordno=rows[0].orderno;
	veninccode=rows[0].veninccode;
	venincname=rows[0].venincname;
	ordqty=rows[0].ordqty;
	rp=rows[0].rp;
	$.post(
		getContextPath() + '/ord/orderStateCtrl!checkSendQty.htm', 
		{
			"dto.orderDetailSub.ordSubDetailId" : orderid,
		}, 
		function(data) {
			if (data.resultCode == "1") {
				addPropertyGrid(ordqty,data.resultContent,ordno,veninccode,venincname,rp);
			} else {
				$.messager.alert("错误","发货数不能大于订单数");
				$("#datagrid").datagrid('rejectChanges');
				
			}
		}, 
		'json'
	);	
}
function addPropertyGrid(ordqty,enableQty,ordno,veninccode,venincname,rp){
	
	$('#batgrid').propertygrid({
		fit:true,
		toolbar:'#propertytool',
	    showGroup: true,    
	    scrollbarSize: 0 ,
	    columns: [[
	                { field: 'name', title: '名称', width: 50 },
	                { field: 'value', title: '值', width: 100 }
	    ]]
	});
	var rows ={"total":4,"rows":[ 
								  {"name":"订单号","value":ordno,"group":"订单信息"},
								  {"name":"商品代码","value":veninccode,"group":"订单信息"},
	                              {"name":"商品名称","value":venincname,"group":"订单信息"},    
	                              {"name":"订单数量","value":ordqty,"group":"订单信息"},
	                              {"name":"未发货数","value":enableQty,"group":"订单信息"},    
	                              {"name":"发票号","value":"","group":"录入信息","editor":{    
	                                  "type":"validatebox",    
	                                  "options":{    
	                                      "required":"true"   
	                                  }    
	                              }},    
	                              {"name":"批号","value":"","group":"录入信息","editor":{    
	                                  "type":"validatebox",    
	                                  "options":{    
	                                      "required":"true"   
	                                  }    
	                              }},
	                              {"name":"效期","value":"","group":"录入信息","editor":{    
	                                  "type":"datebox",    
	                                  "options":{    
	                                      "required":"true"   
	                                  }    
	                              }},
	                              {"name":"进价","value":rp,"group":"订单信息"},
	                              {"name":"数量","value":"","group":"录入信息","editor":{    
	                                  "type":"numberbox",    
	                                  "options":{    
	                                      "precision":"0",
	                                      "required":"true",
	                                       "min":1,
	                                       "max":parseInt(enableQty)
	                                  }    
	                              }}    
	           ]}; 
	$('#batgrid').propertygrid('loadData', rows);
	$('#addBatNo').dialog(); 
	
}


function sendClick(){
		var rows=$("#datagrid").datagrid('getSelections');
		if (rows.length ==0) {
			$.messager.alert('警告','请先选择');    
			return;
		}
		var ordStr="";
		for(var i=0;i<rows.length;i++){
			if((rows[i].stateid==2)||(rows[i].stateid==10)){
				if(rows[i].ordersubid!=null){
					if(ordStr==""){
						ordStr=rows[i].ordersubid;
					}else{
						ordStr=ordStr+"^"+rows[i].ordersubid;
					}
				}
				
			}
		}
		if (ordStr=="") {
			$.messager.alert('警告','请完善订单信息');    
			return;
		}
		$.post(getContextPath() + '/ord/orderStateCtrl!sendOrd.htm', {
			"dto.orderIdStr" : ordStr,
		}, function(data) {
			if (data.resultCode == "1") {
				$('#datagrid').datagrid('load');
				$.messager.alert("提示","操作成功");
			} else {
				$.messager.alert("错误",data.resultContent);
			}
		}, 'json');
	}

function addBatNewClick(){
	//alert($("#propertyFrom").form('validate'))
	//alert($('#batgrid').propertygrid('validateRow',5))
	//return;
	invno=$("#batgrid").propertygrid('getRows')[6].value;
	batno=$("#batgrid").propertygrid('getRows')[7].value;
	expdate=$("#batgrid").propertygrid('getRows')[8].value;
	rp=$("#batgrid").propertygrid('getRows')[5].value;
	qty=$("#batgrid").propertygrid('getRows')[9].value;
	orderid=$("#datagrid").datagrid('getSelections')[0].orderid;
	if((invno=="")|(qty=="")||(rp=="")){
		$.messager.alert("提示","请填写必填项");
		return;
	}
	$.post(
			getContextPath() + '/ord/orderStateCtrl!saveOrdSub.htm', {
				"dto.orderDetailSub.ordSubInvNo" : invno,
				"dto.orderDetailSub.ordSubBatNo" : batno,
				"dto.orderDetailSub.ordSubExpDate" : expdate,
				"dto.orderDetailSub.orderSubRp" : rp,
				"dto.orderDetailSub.orderSubQty" : qty,
				"dto.orderDetailSub.ordSubDetailId":orderid
			}, function(data) {
				if (data.resultCode == "1") {
					$('#datagrid').datagrid('load');
					$.messager.alert("提示","操作成功");
					//alert(2)
					$('#addBatNo').dialog('close');
				} else {
					$.messager.alert("错误",data.resultContent);
				}
			}, 
			'json'
	);
}
function saveClick(){
	var row=$('#datagrid').datagrid('getRows').length;

	for(var i=0;i<row;i++){
		if ($('#datagrid').datagrid('validateRow', i)){
			$('#datagrid').datagrid('endEdit', i); 
		}
	}
	
	var changes=$('#datagrid').datagrid('getChanges');
	if(changes.length==0){
		$.messager.alert("提示","没有需要保存的信息");
		return;
	}
	par=[];
	for(var j=0;j<changes.length;j++){
		orderDetailSub= new Object();
		orderDetailSub.ordSubInvNo=changes[j]["invno"];
		orderDetailSub.ordSubBatNo=changes[j]["batno"];
		if(changes[j]["expdate"]!=""){
			orderDetailSub.ordSubExpDate=changes[j]["expdate"]+" 00:00:00";
		}
		if(changes[j]["arrivedate"]!=""){
			orderDetailSub.ordSubArriveDate=changes[j]["arrivedate"]+" 00:00:00";
		}
		if(changes[j]["invdate"]!=""){
			orderDetailSub.ordSubInvDate=changes[j]["invdate"]+" 00:00:00";
		}
		orderDetailSub.orderSubRp=changes[j]["rp"];
		orderDetailSub.orderSubQty=changes[j]["devqty"];
		orderDetailSub.ordSubDetailId=changes[j]["orderid"];
		orderDetailSub.ordSubId=changes[j]["ordersubid"];
		par.push(orderDetailSub);
	}

	
	$.post(
			getContextPath() + '/ord/orderStateCtrl!saveOrd.htm',
			{
				"dto.orderIdStr":jQuery.toJSON(par)
			}, 
			function(data) {
				if (data.resultCode == "1") {
					$('#datagrid').datagrid('load');
					$.messager.alert("提示","保存成功");
					$('#addBatNo').dialog('close');
				} else {
					$.messager.alert("错误",data.resultContent);
				}
			}, 
			'json'
	);
}
function updInvClick(){
	var row=$('#datagrid').datagrid('getRows').length;

	for(var i=0;i<row;i++){
		if ($('#datagrid').datagrid('validateRow', i)){
			$('#datagrid').datagrid('endEdit', i); 
		}
	}
	
	var changes=$('#datagrid').datagrid('getChanges');
	if(changes.length==0){
		$.messager.alert("提示","没有需要保存的信息");
		return;
	}
	par=[];
	for(var j=0;j<changes.length;j++){
		orderDetailSub= new Object();
		orderDetailSub.ordSubInvNo=changes[j]["invno"];
		orderDetailSub.ordSubId=changes[j]["ordersubid"];
		if(changes[j]["invdate"]!=""){
			orderDetailSub.ordSubInvDate=changes[j]["invdate"]+" 00:00:00";
		}
		par.push(orderDetailSub);
	}

	$.post(
			getContextPath() + '/ord/orderStateCtrl!updInv.htm',
			{
				"dto.orderIdStr":jQuery.toJSON(par)
			}, 
			function(data) {
				if (data.resultCode == "1") {
					$('#datagrid').datagrid('load');
					$.messager.alert("提示","保存成功");
				} else {
					$.messager.alert("错误",data.resultContent);
				}
			}, 
			'json'
	);
	
}
</script>
</head>
<body>

	<table id="datagrid">
		<thead>   
        <tr>  
        	<th data-options="field:'select',checkbox:true">选择</th> 
            <th data-options="field:'orderid',hidden:true">orderId</th>
            <th data-options="field:'ordersubid',hidden:true">orderSubId</th>
            <th data-options="field:'stateid',hidden:true">orderSubId</th>
            <th data-options="field:'orderno',width:50,sortable:true">订单号</th>
			<th data-options="field:'veninccode',width:50,sortable:true,hidden:true">药品代码</th>
			<th data-options="field:'venincname',width:150,sortable:true">药品名称</th>
			<th data-options="field:'purloc',sortable:true,fixColumnSize:100">请求科室</th>
			<th data-options="field:'spec',sortable:true,fixColumnSize:100">规格</th>
			<th data-options="field:'form',sortable:true,fixColumnSize:50">型号</th>
			<th data-options="field:'ordqty',sortable:true,width:50">订单数</th>
			<th data-options="field:'uom',sortable:true,width:100">单位</th>
			<th data-options="field:'rp',width:70,sortable:true">价格</th>
			
			<th data-options="field:'batno',width:70,sortable:true,editor : {
				type : 'validatebox'
                    	}">批号</th>
             <th data-options="field:'expdate',width:70,sortable:true,editor : {
						type : 'datebox',
						required : true
                	}">效期</th>
			 <th data-options="field:'arrivedate',width:70,sortable:true,editor : {
						type : 'datebox'
                	}">预计送达日期</th>	
               <th data-options="field:'devqty',width:40,sortable:true,editor : {
						type : 'numberbox',
                    	options : {
                        	required : true,
                        	min:1,
                        	precision: 2
                    	}
                	}">数量</th>  	   	
              <th data-options="field:'invno',width:70,sortable:true,editor : {
						type : 'validatebox'
                	}">发票</th>
              <th data-options="field:'invdate',width:70,sortable:true,editor : {
						type : 'datebox'
                	}">发票日期</th>	  	
			  <th data-options="field:'operatedate',sortable:true,fixColumnSize:100">录入时间</th>
			  <th data-options="field:'substatus',sortable:true,fixColumnSize:50">状态</th>
			  <th data-options="field:'operate',sortable:true,fixColumnSize:50,formatter:deleteOrdSub">操作</th>		
        </tr>   
    	</thead>
	</table>




	<div id="toolbar" style="height: auto">
		<div style="margin-bottom: 5px; margin-top: 5px">
			订单开始日期: <input class="datetimebox" style="width: 150px" id="stdate">
			结束日期: <input class="datetimebox" style="width:150px" id="eddate">
			状态: <input class="combobox" panelHeight="auto" style="width: 100px"
				id="state" /> 医院: <input class="combobox" panelHeight="auto"
				style="width: 100px" id="hop" /> 收货科室: <input class="combobox"
				panelHeight="auto" style="width: 150px" id="recloc" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="search">查询</a>
		</div>
		<div>
			<a
				 class="linkbutton" onclick="javascript:addBatNoClick()"
				data-options="iconCls:'icon-add',plain:true">增加批次信息</a>
			<a
				 class="linkbutton" onclick="javascript:saveClick()"
				data-options="iconCls:'icon-save',plain:true">保存</a>		
			<a
				 class="linkbutton" onclick="javascript:sendClick()"
				data-options="iconCls:'icon-ok',plain:true">发货</a>	
			<a
				 class="linkbutton" onclick="javascript:updInvClick()"
				data-options="iconCls:'icon-edit',plain:true">更新发票</a>		
		</div>

	</div>
	<div id="addBatNo" class="easyui-dialog" title="录入批号" style="width:400px;height:400px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true">
        
    	<table id="batgrid" ></table>
    	
	</div>
	<div id="propertytool" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addBatNewClick()"
			data-options="iconCls:'icon-save',plain:true">保存</a> 
	</div> 
</body>
</html>
