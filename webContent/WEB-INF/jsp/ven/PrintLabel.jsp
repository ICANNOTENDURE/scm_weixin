<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/qrcode/jquery.qrcode.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqprint/jquery.jqprint-0.3.js"></script>	
<script>
	
    $(function(){
    	$.ajaxSettings.async = false;	
    	$('#searchOrderTool').on('click',function(){
    		
			date=new Date();
			dateAdd(date,'D',-30);
			$('#ordStDate').datebox('setValue',date.format("yyyy-MM-dd"));
			$('#ordEdDate').datebox('setValue',new Date().format("yyyy-MM-dd"));
			$('#searchOrderTable').datagrid({
				url:$WEB_ROOT_PATH+'/ven/venDeliverCtrl!listDeliver.htm',
				queryParams: {
					'dto.stdate': $('#ordStDate').datebox('getValue'),
					'dto.eddate': $('#ordEdDate').datebox('getValue'),
					'dto.cmpFlag':1
				},
				onLoadSuccess: function (data) {
				 	$('#searchOrderTable').datagrid('selectRow', 0);
				 	$("#searchOrderTableItm").datagrid({
			 			url:$WEB_ROOT_PATH+'/ven/venDeliverCtrl!listDeliverItm.htm',
						queryParams: {
							'dto.venDeliver.deliverId': $('#searchOrderTable').datagrid('getRows')[0]['deliverid'],
							}
		 				}
				 	);
			 	 },
				onClickRow:function(rowIndex, rowData){
					$("#searchOrderTableItm").datagrid(
						{
						url:$WEB_ROOT_PATH+'/ven/venDeliverCtrl!listDeliverItm.htm',	
						queryParams: {
							'dto.venDeliver.deliverId': rowData.deliverid,
							}
		 				}
				 	);
				}
			});
			$('#searchOrder').dialog('open');			
		}	
		);
    	
             
    	
    	
    	$('#hopSearchOrder').combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName'	
		});
    	
    	//打印
    	$('#printBTN').on('click',function(){
    		//$('#qrcode').qrcode({width: 64,height: 64,text: toUtf8("中国热")});
    		//str="<img src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!encoderQrAndroid.htm?dto.content=dfghjkl'+"> </img>"
    		//$('#qrcode').html(str);
    		//alert($('#qrcode').html())
    		
    		var selected = $("#searchOrderTable").datagrid('getSelections');

    		if (selected.length == 0) {
    			$CommonUI.alert("请选择！");
                return;
            }

            $.each(selected, function (index, item) {
            	$("#qrCode"+item.deliverid).jqprint();
            });
    	});
    	
    	//打印
    	$('#printItmCheck').on('click',function(){
    		
    		var selected = $("#searchOrderTableItm").datagrid('getSelections');

    		if (selected.length == 0) {
    			$CommonUI.alert("请选择！");
                return;
            }

            $.each(selected, function (index, item) {
            	$("#qrCodeItm"+item.deliveritmid).jqprint();
            });
    	});
    	
    	//打印全部明细
    	$('#printItmAll').on('click',function(){
    		
    		var selected = $("#searchOrderTable").datagrid('getSelections');

    		if (selected.length == 0) {
    			$CommonUI.alert("请选择2！");
                return;
            }

            $.each(selected, function (index, item) {
            	//$("#qrCode"+item.deliverid).jqprint();
            	$.post(
            			$WEB_ROOT_PATH+'/ven/venDeliverCtrl!getDeliveritms.htm',
            			{
            				'dto.venDeliver.deliverId':item.deliverid
            			},
            			function(data){
            				$.each(data, function (index, item) {
            					//alert(item.deliverId)
            					//$('#qrcode').html("<img   src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!encoderQrAndroid.htm?dto.content='+item.deliverId+" style='height: 80;width: 80px'> </img>");
            					//alert($('#qrcode').html())
            					//$("#qrCode").jqprint();
            					//document.getElementById("WebBrowser").ExecWB(6,1);
            				});
            				$('#qrcode').html("");
            			},
            			'json'
            			
            	);
            });
    	});
    	
    });
 
function enCode(value,row,index){
	return "<img id=qrCode"+row.deliverid+"  src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!encoderQrAndroid.htm?dto.content='+row.hisno+" style='height: 80;width: 80px'> </img>";
}
function enCodeItm(value,row,index){
	return "<img id=qrCodeItm"+row.deliveritmid+"  src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!encoderQrAndroid.htm?dto.content='+row.deliveritmid+" style='height: 50;width: 50px'> </img>";
}
</script>	
</head>
<body>
		<OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0 height=0></OBJECT>
		<div id="qrcode" ></div>
		<div class="layout" data-options="fit:true,border:true" >
			 <div data-options="region:'center',iconCls:'icon-ok',split:true,title:'打印条码'" >
			 	<table id="searchOrderTable" class="datagrid" data-options="toolbar:'#searchOrdtoolbar',
			 															   pagination:true,
			 															   fit:true,
			 															   loadMsg:'加载数据中.....',
			 															   fitColumns:true,
			 															   method:'post',
			 															   nowrap:true,
			 															   striped:true,
			 															   pageSize: 2,
    																	   pageList: [2, 6, 10],
			 															   ">
			 		<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'deliverid',hidden:true"></th>
						<th data-options="field:'hisno',width:90">订单号</th>
						<th data-options="field:'qrcode',fixColumnSize:80,formatter:enCode,align:'center'">二维码</th>
						<th data-options="field:'hopname',width:90">医院</th>
						<th data-options="field:'statedesc',width:50">状态</th>
						<th data-options="field:'emflag',width:90">加急</th>
						<th data-options="field:'purloc',width:90">入库科室</th>
						<th data-options="field:'recloc',width:90">收货科室</th>
						<th data-options="field:'destination',width:200">收货地址</th>
						<th data-options="field:'deliverydate',width:100">发货时间</th>
						<th data-options="field:'deliveraccpectdate',width:100">接收时间</th>
			 	    </tr>
			 	    </thead>
			 	
			 	</table>
			 </div>
			 
			 <div data-options="region:'south',iconCls:'icon-ok',collapsible:true" style="height: 267px">
			 	<table id="searchOrderTableItm" class="datagrid" data-options="title:'发货明细',
			 																   pagination:true,
			 																   nowrap:true,				
			 																   fit:true,
			 																   loadMsg:'加载数据中.....',
			 																   fitColumns:true,
			 																   method:'post',
			 																   pageSize: 10,
    																		   pageList: [10, 15, 20],
    																		   striped:true,
    																		   rownumbers:true,
    																		   " >
			 		<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'deliveritmid',hidden:true">代码</th>
						<th data-options="field:'qrCodeItm',fixColumnSize:50,formatter:enCodeItm,align:'center'">二维码</th>
						<th data-options="field:'venincncode',width:90">代码</th>
						<th data-options="field:'venincname',width:150">名称</th>
						<th data-options="field:'deliverqty',width:90">数量</th>
						<th data-options="field:'rp',width:90">进价</th>
						<th data-options="field:'uom',width:100">单位</th>
						<th data-options="field:'batno',width:90">批号</th>
						<th data-options="field:'expdate',width:90">效期</th>
						<th data-options="field:'orderqty',width:90">订单数</th>
						<th data-options="field:'sendedqty',width:90">已发货数量</th>
						<th data-options="field:'manf',width:200">产地</th>
			 	    </tr>
			 	    </thead>
			 	</table>
			 </div>
		</div>

	
	
	<!-- 弹出查询发货toolbar-->
	<div id="searchOrdtoolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			开始: <input class="datebox" style="width:100px" id="ordStDate">
			结束: <input class="datebox" style="width:100px" id="ordEdDate">
			医院:
			<input class="combobox" panelHeight="auto" style="width:100px" id="hopSearchOrder"/>
		 	<a href="#" class="linkbutton" iconCls="icon-search" id="searchOrderTool">查询</a>
		 	<a href="#" class="linkbutton" iconCls="icon-print" id="printBTN" plain=true>打印随行单</a>
		 	<a href="#" class="linkbutton" iconCls="icon-print" id="printItmAll" plain=true>打印明细(全部)</a>
		 	<a href="#" class="linkbutton" iconCls="icon-print" id="printItmCheck" plain=true>打印明细(选择)</a>
		 	<div id="qrcode" ></div>
		 </div>
	</div>

						
</body>
</html>
