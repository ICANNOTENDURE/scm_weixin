<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                'echarts' : '<%=request.getContextPath()%>/js/esl/echarts',
                'echarts/chart/bar' : '<%=request.getContextPath()%>/js/esl/echarts'
			}
		});
		var startDate = new Date();
		dateAdd(startDate, 'D', -30);
		$('#my-startDate').text(startDate.format("yyyy-MM-dd"));
		$('#my-endDate').text(new Date().format("yyyy-MM-dd"));
		$('#startDate').val(startDate.format("yyyy-MM-dd"));
		$('#endDate').val(new Date().format("yyyy-MM-dd"));
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
						//alert($('#startDate').val())

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

		$('#searchBtn').click(function() {
			$("tr[name='tmp']").remove();
			$.post(path + "/chart/chartCtrl!listLocAMt.htm", {
				'dto.startDate' : $('#startDate').val(),
				'dto.endDate' : $('#endDate').val()
			}, function(json) {
				var sumamt = 0;
				var locNames = [];
				var locAmts = [];
				$.each(json, function(i) {
					html = "";
					html = "<tr name='tmp'>";
					html = html + "<td>" + json[i].name;
					html = html + "</td>";
					html = html + "<td>" + json[i].value;
					html = html + "</td>";
					html = html + "</tr>";
					$("#dataTable").append(html);
					sumamt = sumamt + parseFloat(json[i].value);
					locNames.push(json[i].name);
					locAmts.push(parseFloat(json[i].value));
				});
				html = "<tr name='tmp'>";
				html = html + "<td>合计:";
				html = html + "</td>";
				html = html + "<td>" + sumamt;
				html = html + "</td>";
				html = html + "</tr>";
				$("#dataTable").append(html);

				// 使用
				require([ 'echarts', 
				          'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
				          'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
				], function(ec) {
					// 基于准备好的dom，初始化echarts图表
					var barChart = ec.init(document.getElementById('bar'));
					var pieChart = ec.init(document.getElementById('pie'));
					option = {
						title : {
							text : '全院科室订单金额统计',
							subtext : '单位(元)'
						},
						tooltip : {
							trigger : 'axis'
						},
						legend : {
							data : [ '订单金额' ]
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
							name : '订单金额',
							type : 'bar',
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
					 //
	                option2 = {
	                	    title : {
	                	        text: '全院科室订单金额统计',
	                	        subtext: '单位(元)',
	                	        x:'center'
	                	    },
	                	    tooltip : {
	                	        trigger: 'item',
	                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	                	    },
	                	    legend: {
	                	        orient : 'vertical',
	                	        x : 'left',
	                	        data:locNames
	                	    },
	                	    toolbox: {
	                	        show : true,
	                	        feature : {
	                	            mark : {show: true},
	                	            dataView : {show: true, readOnly: false},
	                	            restore : {show: true},
	                	            saveAsImage : {show: true}
	                	        }
	                	    },
	                	    calculable : true,
	                	    series : [
	                	        {
	                	            name:'科室金额',
	                	            type:'pie',
	                	            radius : '45%',
	                	            center: ['50%', '60%'],
	                	            data:json,
	                	        }
	                	    ]
	                	};
					barChart.setOption(option);
					pieChart.setOption(option2);
				});
			}, 'json');
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
			class="am-accordion am-accordion-gapped"
			data-am-accordion='{ "multiple": true }'>
		<dl class="am-accordion-item am-active">
			<dt class="am-accordion-title">全院科室采购金额</dt>
			<dd class="am-accordion-bd am-collapse am-in">
				<!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
				<div class="am-accordion-content">
					<div class="am-g">
						<div class="am-u-lg-8">
							<div class="am-alert am-alert-danger" id="my-alert"
								style="display: none">
								<p>开始日期应小于结束日期！</p>
							</div>
							<div class="am-g">
								<div class="am-u-lg-6">
									<button type="button"
										class="am-btn am-btn-secondary am-margin-right am-btn-xs" id="my-start">开始日期</button>
									<span id="my-startDate"></span> <input type="hidden"
										name="dto.starDate" id="startDate">
								</div>
								<div class="am-u-lg-6">
									<button type="button"
										class="am-btn am-btn-secondary am-margin-right am-btn-xs" id="my-end">结束日期</button>
									<span id="my-endDate"></span> <input type="hidden"
										name="dto.endDate" id="endDate">
								</div>
							</div>
						</div>
						<div class="am-u-lg-4">
							<button class="am-btn am-btn-secondary am-btn-xs" id="searchBtn"
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
								<th style="width: 50%">金额</th>
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
			<dt class="am-accordion-title">饼状图</dt>
			<dd class="am-accordion-bd am-collapse am-in ">
			<div class="am-accordion-content">
					<div id="pie" style="height: 400px"></div>
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