<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />
<script>
	var path="<%=request.getContextPath()%>";
	$(function() {
	   $.ajaxSettings.async = false;
	   require.config({
            paths:{ 
                'echarts' : "<%=request.getContextPath()%>/js/esl/echarts"
			}
		});
		var startDate = new Date();
		dateAdd(startDate, 'D', -30);
		var endDate= new Date();
		$('#my-startDate').text(startDate.format("yyyy-MM-dd"));
		$('#my-endDate').text(endDate.format("yyyy-MM-dd"));
		$('#startDate').val(startDate.format("yyyy-MM-dd"));
		$('#endDate').val(endDate.format("yyyy-MM-dd"));
		var $alert = $('#my-alert');
		$('#my-start').datepicker().on('changeDate.datepicker.amui',
				function(event) {
					if (event.date.valueOf() > endDate.valueOf()) {
						$alert.find('p').text('开始日期应小于结束日期！').end().show();
					} else {
						$alert.hide();
						startDate = new Date(event.date);
						$('#my-startDate').text($('#my-start').data('date'));
						$('#startDate').val($('#my-start').data('date'));
					}
					$(this).datepicker('close');
				});

		$('#my-end').datepicker().on('changeDate.datepicker.amui',
				function(event) {
					if (event.date.valueOf() < startDate.valueOf()) {
						$alert.find('p').text('结束日期应大于开始日期！').end().show();
					} else {
						$alert.hide();
						endDate = new Date(event.date);
						$('#my-endDate').text($('#my-end').data('date'));
						$('#endDate').val($('#my-end').data('date'));
					}
					$(this).datepicker('close');
				});
		
		
		//查询
		$('#searchBtn').click(
				function() {
					$("tr[name='tmp']").remove();
					$.post(path + "/chart/chartCtrl!listLocIncPrice.htm", {
						'dto.startDate' : $('#startDate').val(),
						'dto.endDate' : $('#endDate').val(),
						'dto.subCatId': $('#subGroupID').val()
					}, function(json) {
						var sumamt = 0;
						var locNames = [];
						var locAmts = [];
						chartVOs=json.chartVOs;
						$.each(chartVOs, function(i) {
							html = "";
							html = "<tr name='tmp'>";
							html = html + "<td>" + chartVOs[i].name;
							html = html + "</td>";
							html = html + "<td>" + chartVOs[i].value;
							html = html + "</td>";
							html = html + "</tr>";
							$("#dataTable").append(html);
							sumamt = sumamt + parseFloat(chartVOs[i].value);
							if(i%2==0){
								locNames.push(chartVOs[i].name);
							}else{
								locNames.push('\n'+chartVOs[i].name);	
							}
							locAmts.push(parseFloat(chartVOs[i].value));
						});
						
						// 加载echart
						require([ 'echarts', 'echarts/chart/bar', 'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
						], function(ec) {
							// 基于准备好的dom，初始化echarts图表
							var barChart = ec.init(document.getElementById('bar'));
							var timelineChart = ec.init(document.getElementById('timeline'));
							option = {
								title : {
									text : '各科室商品采购平均价',
									subtext : '单位(元)'
								},
								tooltip : {
									trigger : 'axis'
								},
								legend : {
									data : [ '平均采购单价' ]
								},
								toolbox : {
									show : true,
									feature : {
										mark : {
											show : true
										},
										dataView : {
											show : true,
											readOnly : false
										},
										magicType : {
											show : true,
											type : [ 'line', 'bar' ]
										},
										restore : {
											show : true
										},
										saveAsImage : {
											show : true
										}
									}
								},
								calculable : true,
								xAxis : [ {
									type : 'category',
									data : locNames
								} ],
								yAxis : [ {
									type : 'value'
								} ],
								series : [ {
									name : '平均采购单价',
									type : 'line',
									data : locAmts,
									markPoint : {
										data : [ {
											type : 'max',
											name : '最大值'
										}, {
											type : 'min',
											name : '最小值'
										} ]
									},
									markLine : {
										data : [ {
											type : 'average',
											name : '平均值'
										} ]
									}
								} ]
							};
							
							
							//时间轴
							var options=[];
							var monthArr=[];
							var locArr=[];
							chartResultSubVOs=json.chartResultSubVOs;
							$.each(chartResultSubVOs, function(j) {
								monthArr.push(chartResultSubVOs[j].month.toString());
								
								priceData=[];
								$.each(chartResultSubVOs[j].chartVOs, function(k) {
									priceData.push(Math.round(chartResultSubVOs[j].chartVOs[k].value));
									if(j==0){
										if(k%2==0){
											locArr.push(chartResultSubVOs[j].chartVOs[k].name);
										}else{
											locArr.push('\n'+chartResultSubVOs[j].chartVOs[k].name);	
										}
									}
								});
								if(j==0){
									options.push(
											{
								                 title : {
								                     'text':chartResultSubVOs[j].month+'商品平均采购单价'
								                 },
								                 tooltip : {'trigger':'axis'},
								                 legend : {
								                     x:'right',
								                     'data':['平均价']
								                 },
								                 toolbox : {
								                     'show':true, 
								                     orient : 'vertical',
								                     x: 'right', 
								                     y: 'center',
								                     'feature':{
								                         'mark':{'show':true},
								                         'dataView':{'show':true,'readOnly':false},
								                         'magicType':{'show':true,'type':['line','bar','stack','tiled']},
								                         'restore':{'show':true},
								                         'saveAsImage':{'show':true}
								                     }
								                 },
								                 calculable : true,
								                 grid : {'y':80,'y2':100},
								                 xAxis : [{
								                     'type':'category',
								                     'axisLabel':{'interval':0},
								                     'data':locArr
								                 }],
								                 yAxis : [
								                     {
								                         'type':'value',
								                         'name':'单位（元）',
								                         'max':json.maxPrice
								                     }
								                 ],
								                 series : [{
							                         'name':'平均价',
							                         'type':'line',
							                          'markPoint' : {
															data : [ {
																type : 'max',
																name : '最大值'
															}, {
																type : 'min',
																name : '最小值'
															} ]
														},
														'markLine' : {
															data : [ {
																type : 'average',
																name : '平均值'
															} ]
														},
							                           'data': priceData
							                 	}]
								           }		
									);
									
								}else{
									options.push({
										title : {'text':chartResultSubVOs[j].month+'商品平均采购单价'},
							            series : [{'data': priceData}]
				                	});
								}
								
							});
							
							
						  //alert(monthArr.join(","))	
						  option2 = {
							    timeline:{
							        data:monthArr,
							        label : {
							            formatter : function(s) {
							            	return s;
							            }
							        },
							        autoPlay : true,
							        playInterval : 1000
							    },
							    options:options
							};
	
							
							barChart.setOption(option);
							timelineChart.setOption(option2);
						});
					}, 
					'json'
				  );
				});
		$('#searchBtn').click();
	});

</script>
<style type="text/css">
.am-table tr td {
	padding: 0, 0, 0, 0;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-g am-container">



		<section data-am-widget="accordion"
			class="am-accordion dhcc-accordion-mt"
			data-am-accordion='{ "multiple": true }'>
		<dl class="am-accordion-item am-active">
			<dt class="am-accordion-title">全院科室采购金额</dt>
			<dd class="am-accordion-bd am-collapse am-in">
				<!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
				<div class="am-accordion-content">
					<div class="am-g">
						<div class="am-u-lg-6">
							<div class="am-alert am-alert-danger" id="my-alert"
								style="display: none">
								<p>开始日期应小于结束日期！</p>
							</div>
							<div class="am-g">
								<div class="am-u-lg-6">
									<button type="button"
										class="am-btn am-btn-mt am-margin-right am-btn-xs" id="my-start">开始日期</button>
									<span id="my-startDate"></span> <input type="hidden"
										name="dto.starDate" id="startDate">
								</div>
								<div class="am-u-lg-6">
									<button type="button"
										class="am-btn am-btn-mt am-margin-right am-btn-xs" id="my-end">结束日期</button>
									<span id="my-endDate"></span> <input type="hidden"
										name="dto.endDate" id="endDate">
								</div>
							</div>
						</div>
						<div class="am-u-lg-4">
						
							
							<select data-am-selected="{btnSize:'xs',searchBox: 1,maxHeight: 200,btnStyle: 'mt'}" id="subGroupID">
								<option value="0">商品名称</option>
									<s:iterator value="dto.subCatGroups" status="all" id="subCatGroups">
										<option value="${subCatGroups.subGroupID}">${subCatGroups.subGroupName}</option>
									</s:iterator>
							</select>
					    </div>
						<div class="am-u-lg-2">
							<button class="am-btn am-btn-mt am-btn-xs" id="searchBtn"
								type="button">搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</button>
						</div>
					</div>
					<br>
					<table
						class="am-table am-table-bordered am-table-striped am-table-compact am-table-hover"
						id="dataTable">
						<thead>
							<tr>
								<th style="width: 50%">科室</th>
								<th style="width: 50%">单价</th>
							</tr>
						</thead>
					</table>
				</div>

			</dd>
		</dl>
		<dl class="am-accordion-item am-active">
			<dt class="am-accordion-title">柱状图/(线性图)</dt>
			<dd class="am-accordion-bd am-collapse am-in">
				<!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
				<div class="am-accordion-content">
					<div id="bar" style="height: 400px"></div>
				</div>
			</dd>
		</dl>
		<dl class="am-accordion-item am-active">
			<dt class="am-accordion-title">搭配时间轴/(月)</dt>
			<dd class="am-accordion-bd am-collapse am-in ">
				<div class="am-accordion-content">
					<div id="timeline" style="height: 400px"></div>
				</div>
			</dd>
		</dl>
		</section>
	</div>

	<!-- content end -->



	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	<div id="xxx2" style="display: none;">
		<footer class="footer"
			style="bottom:0;width:100%;position:fixed;*position:relative;;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
</body>
</html>