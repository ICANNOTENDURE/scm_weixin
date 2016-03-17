<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
 <script>
 

    </script>

</head>
<body >
	<div id="toolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			名称: <input id="venName" style="width: 100px;"
			type="text" />
			
			别名: <input id="venAlias" style="width: 100px;"
			type="text" />
			审核状态:
			<select class="combobox" panelHeight="auto" style="width:105px" id="venAuditFlag">
				<option value="0">空</option>
				<option value="1">已审核</option>
				<option value="2">审核不通过</option>
				<option value="3">未审核</option>
			</select>
			<br>
			邮箱/注册名/工商执照号: <input id="venInputStr" style="width: 200px;"
			type="text" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searchVen">查询</a>
			<br>
			<a href="#" class="linkbutton" iconCls="icon-save" id="queryZiZhi">查看供应商资质</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="queryTimeLine">查看供应商时间轴</a>
		 </div>
	</div>	
    <div id="toolbar2" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			名&nbsp;&nbsp;称: <input id="HopName" style="width: 100px;"
			type="text" />
			代&nbsp;&nbsp;码: <input id="HopCode" style="width: 100px;"
			type="text" />
			别&nbsp;&nbsp;名: <input id="HopAlias" style="width: 100px;"
			type="text" />
		  </div>
		  <div  style="margin-bottom:5px;margin-top:5px">	
			状&nbsp;&nbsp;态:
			<select class="combobox" panelHeight="auto" style="width:105px" id="flag">
				<option value="0">空</option>
				<option value="1">已对照</option>
				<option value="2">未对照</option>
			</select>
			资质审核:
			<select class="combobox" panelHeight="auto" style="width:105px" id="auditFlag">
				<option value="0">空</option>
				<option value="1">已审核</option>
				<option value="2">未审核</option>
			</select>
			医&nbsp;&nbsp;院:
			<input style="width: 105px;"
						class="combobox" type="text" 
						 id="hop" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searcHop">查询</a>
		 </div>
	</div>
  <div class="layout" data-options="fit:'true',border:true">
        
        <div data-options="region:'center',title:'医院供应商',iconCls:'icon-ok'" >
            <table id="datagrid" style="height: 250px"  class="datagrid"
					data-options="toolbar:'#toolbar',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 pageSize:15,
	    						 pageList:[15,30,45],
								 ">
								 
					<thead>
						<tr>
							<th data-options="field:'vendorid',hidden:true">IncId ID</th>
							<th data-options="field:'code',sortable:true">代码</th>
							<th data-options="field:'name',sortable:true">供应商</th>
							<th data-options="field:'taxation',sortable:true">工商执照号</th>
							<th data-options="field:'email',sortable:true">邮箱</th>
							<th data-options="field:'contact',sortable:true">联系人</th>
							<th data-options="field:'account',sortable:true">注册帐号</th>
							<th data-options="field:'tel',sortable:true">电话</th>
							<th data-options="field:'fax',sortable:true">传真</th>
							<th data-options="field:'address',sortable:true">联系地址</th>
						</tr>
					</thead>
				</table>
        </div>
    </div>  
   
</div> 
</body>
</html>