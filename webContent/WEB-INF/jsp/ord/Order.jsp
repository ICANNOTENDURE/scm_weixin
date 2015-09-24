<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/uploadify.css">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ord/Order.js"></script>		
</head>
<body>
	<div id="toolbar" class="toolbar">
	 	<div  style="margin-bottom:5px;margin-top:5px">
			
			<a  class="linkbutton" onclick="javascript:importOrder()"
				data-options="iconCls:'icon-add',plain:true">导入订单</a>
			<a  class="linkbutton" onclick="javascript:searchOrder()"
				data-options="iconCls:'icon-search',plain:true">查询</a>		
			<a  class="linkbutton" onclick="javascript:saveMain()"
				data-options="iconCls:'icon-save',plain:true">保存</a>	
			
			<a  class="linkbutton" onclick="javascript:complete()"
				data-options="iconCls:'icon-save',plain:true">确认完成</a>
			<a  class="linkbutton" onclick="javascript:canclecomplete()"
				data-options="iconCls:'icon-remove',plain:true" >取消完成状态</a>		
			<a  class="linkbutton" onclick="javascript:deleteOrder()"
				data-options="iconCls:'icon-cancel',plain:true" style="float: right">删除</a>
									
		 </div>
		 <div  style="margin-bottom:5px;margin-top:5px">
		 	<form id="saveOrUpdate">
		 	<table style="width: 100%;" >
		 		<tr style="display: none">
		 			<input type="hidden" id="orderId"/>
		 		</tr>
				<tr>
					<td class="textLabel">采购科室:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.ord.purLoc"
						data-options="required:true" id="purId"/></td>					

					<td class="textLabel">收货科室:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.ord.recLoc"
						data-options="required:true" id="locId"/></td>					
				</tr>
				<tr>
					<td class="textLabel">收货地址:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.order.recDestination"
						data-options="required:true" id="recDestination"/></td>					

					<td class="textLabel">供应商:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.order.vendorId"
						data-options="required:true" id="vendorId" "/><input type="hidden" id="vendor"></td>					
				</tr>
				<tr>
					<td class="textLabel">要求送达时间:</td>
					<td class="textParent"><input style="width: 250px;"
						class="datebox"  name="dto.order.deliveryDate"
						id="deliveryDate"/></td>					
	
					<td class="textLabel">是否加急:</td>
					<td class="textParent" style="float: left;"><input style="width: 30px;"
						 type="checkbox" name="dto.ord.emFlag"
						id="emFlag"/></td>					
				</tr>
				<tr>
					<td class="textLabel">his订单号:</td>
					<td class="textParent"><input style="width: 250px;"
						id="hisNO"/></td>					
					<td class="textLabel">状态:</td>
					<td class="textParent"><input readonly="readonly" id="orderState" style="width: 250px;"/></td>
				</tr>
				<tr>
					<td class="textLabel">备注:</td>
					<td class="textParent"><textarea  name="dto.ord.remark" style="width: 250px;height: 100px" id="remark"></textarea></td>					
				</tr>
			</table>
			</form>
		 </div>
		 <div>
		 	<a  class="linkbutton" onclick="javascript:append()"
				data-options="iconCls:'icon-add',plain:true">新增一行</a>
		 </div>
	</div>


	<table id="datagrid"  title="手工建立订单" class="datagrid"
		data-options="toolbar:'#toolbar',
		 			 fit:true,
					 fitColumns:true,
					 singleSelect:true,
					 pagination:true,
	    			 method:'post',
	    			 rownumbers:true,
	    			 onClickCell: onClickCell,
	    			 onAfterEdit:onAfterEdit,
	    			 striped:true,
	    			 url:'<%=request.getContextPath()%>/ord/orderStateCtrl!listOrdItm.htm'
					 ">
					 
		<thead>
			<tr>
				<th data-options="field:'orderitmid',hidden:true">IncId ID</th>
				<th data-options="field:'orderid',hidden:true">IncId ID</th>
				<th data-options="field:'hopincid',hidden:true">IncId ID</th>
				<th data-options="field:'inccode',width:90">代码</th>
				<th data-options="field:'incname',width:100,
							editor:{
								type:'combogrid',
								options:{
									required : true,
								    id:'INC',
								    fitColumns:true,
								    fit: true,//自动大小  
									pagination : true,
									panelWidth:500,
									idField:'incId',
									textField:'incName',
									mode:'remote',
									url:'<%=request.getContextPath()%>/ven/venIncCtrl!listContrantInc.htm',
									columns:[[
										{field:'hopincid',title:'代码',hidden:true},
										{field:'hopinccode',title:'代码',width:60},
										{field:'hopincname',title:'名称',width:140},
										{field:'uom',title:'单位',width:90},
										{field:'rp',title:'价格',width:90},
										{field:'manf',title:'产地',width:113}
									]],
									onSelect:function(rowIndex, rowData) {
                       					 fillValue(rowIndex, rowData);
                    				}	   
								}
							}">药品</th>
				<th data-options="field:'qty',width:80,align:'center',editor : {
							type : 'numberbox',
                            options : {
                                required : true
                            }
                        }
					,sortable:true">数量</th>
				<th data-options="field:'uom',width:80,align:'center',editor:'text',sortable:true">单位</th>
				<th data-options="field:'rp',width:80,align:'center',editor:'numberbox'">价格</th>
				<th data-options="field:'manf',width:90">产地</th>
				<th data-options="field:'delte',width:90,formatter:deleteR">编辑</th>
			</tr>
		</thead>
	</table>

	<div id="importDialog" class="dialog" title="导入订单"
		style="width:1000px;height: 400px; background-color: #F5FAFD;"
		data-options="
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:true">
			<table id="addFuncsTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">导入Excel文件:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 250px;" class="validatebox" type="file"
						name="upload" id="orderUpload"></input></td>
				</tr>
			</table>
		<table>
	    	<tr id="impModel">
	    		<td class="time">模版 </td>
	    	</tr>
	    </table>
	    <div id="err">
	    </div>
	</div>
    <style type="text/css">

    .item{
	    text-align:center;
	    border:1px solid #499B33;
	    background:#fafafa;
	    color:#444;
	    width:90px;
    }
    </style>

	
	<!-- 弹出查询订单 -->
	<div id="searchOrder" class="dialog" title="查询订单（双击选择）"
		data-options="modal:true,width:850,height:450,closed:true,maximizable:true"
		style="vertical-align: middle">
		<table id="searchOrderTable" />
	</div>
	<!-- 弹出查询订单toolbar-->
	<div id="searchtoolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			订单开始日期: <input class="datebox" style="width:100px" id="stdate">
			结束日期: <input class="datebox" style="width:100px" id="eddate">
			供应商:
			<input class="combobox" panelHeight="auto" style="width:250px" id="vendorSearch"/>
			加急:<input type="checkbox" id="emflag"/>
			已完成:<input type="checkbox" id="state"/>
		</div>
		 <div style="margin-bottom:5px">
			要求到达日期: <input class="datebox" style="width:100px" id="reqStDate">
			结束日期: <input class="datebox" style="width:100px" id="reqEdDate">
			
			入库科室:
			<input class="combobox" panelHeight="auto" style="width:250px" id="purlocSearch"/>
			<a href="#" class="linkbutton" iconCls="icon-search" id="search">查询</a>
		 </div>
		</div>
		 
		 
		 
		 <div id="gg" class="dialog" title="请等待"  style="width:1000px;height:400px;padding:10px;"
				data-options="
				modal:true,
				draggable:false,
				closable:false,
				closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">
				
        		<p1>正在处理上传数据，请等待</p1>
    	</div>			
</body>
</html>
