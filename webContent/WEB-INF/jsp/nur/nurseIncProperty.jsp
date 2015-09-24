<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nur//jdproperty.css"
	media="all">
<script type="text/javascript">
	$(function() {
		$('.sl-ext').click(function() {
			if ($(this).parent().hasClass('extend')) {
				$(this).parent().removeClass('extend');
			} else {
				$(this).parent().addClass('extend');
			}
			if ($(this).children(".sl-e-more").html().indexOf('更多') == 0) {
				$(this).children(".sl-e-more").html("收起<i></i>");
			} else {
				$(this).children(".sl-e-more").html("更多<i></i>")
			}
		});
		$('.sl-b-letter').find('li').mouseover(function(){
			$('.sl-b-letter').find('li').removeClass('curr');
			$(this).addClass('curr');
			initial=$(this).attr('data-initial');
			$('#manUl').find('li').each(function(i){
				subinitial=$(this).attr('data-initial');
				if(initial==subinitial){
					$(this).css("display", "block");  
				}else{
					if(initial==0){
						$(this).css("display", "block");
					}else{
						$(this).css("display", "none");
					}
				}
			});
		});

	});
	function queryByProperty(properyId){
		$("#qurPropertyId").val(properyId);
		$("#subscribe-form").submit();
	}
	function removeSearch(qurRemovePropertyId){
		$("#qurRemovePropertyId").val(qurRemovePropertyId);
		$("#subscribe-form").submit();
	}
</script>
</head>
<body>

		<div>
			<div>
				<div class="selector">
					<div class="s-title">
						<h3>
							<em>&nbsp;商品筛选</em>
						</h3>
						<div class="st-ext">
							共&nbsp;<span>${dto.pageModel.totals}</span>个商品
						</div>
					</div>
					<div class=" s-brand">
					
						<s:if test="dto.selectMap!=null">
								<div class="sl-wrap">
									<div class="sl-key">
										<span>已选条件:</span>
									</div>
									<div class="selected-c">
										<div class="sl-value">
												<ul class="f-list" >
													<s:iterator value="dto.selectMap" id="selectMap">
														<li><s:property value="key" />：<a href="#" ><strong >${value.propertyName}</strong><span class="am-icon-remove" onclick="removeSearch(${value.propertyId})"></span></a></li>
													</s:iterator>
												</ul>
										</div>
									</div>
								</div>
							</s:if>
							<!--  -->
						<s:set var="incManfSize" name="incManfSize" value="dto.incManfs.size" />
						<s:if test="#incManfSize>0">	
							<div class="sl-wrap">
								<div class="sl-key">
									<span>品牌：</span>
								</div>
								<div class="f-list">
									<ul class="sl-b-letter">
										<li data-initial="0" class="curr">所有品牌</li>
										<li data-initial="a">A</li>
										<li data-initial="b">B</li>
										<li data-initial="c">C</li>
										<li data-initial="d">D</li>
										<li data-initial="e">E</li>
										<li data-initial="f">F</li>
										<li data-initial="g">G</li>
										<li data-initial="h">H</li>
										<li data-initial="i">I</li>
										<li data-initial="j">J</li>
										<li data-initial="k">K</li>
										<li data-initial="l">L</li>
										<li data-initial="m">M</li>
										<li data-initial="n">N</li>
										<li data-initial="o">O</li>
										<li data-initial="p">P</li>
										<li data-initial="q">Q</li>
										<li data-initial="r">R</li>
										<li data-initial="s">S</li>
										<li data-initial="t">T</li>
										<li data-initial="u">U</li>
										<li data-initial="v">V</li>
										<li data-initial="w">W</li>
										<li data-initial="x">X</li>
										<li data-initial="y">Y</li>
										<li data-initial="z">Z</li>
										<li data-initial="other" style="display: none;">其它</li>
									</ul>
									<div class="clr"></div>
									<div class="sl-v-list">
										<ul class="v-fixed" id="manUl">
											<s:iterator value="dto.incManfs" id="incManfs">
												<li data-initial="${incManfs.first}"><a
													href="javascript:queryByProperty(${incManfs.propertyId});"
													title="${incManfs.manfName}" rel="nofollow"><i></i>${incManfs.manfName}</a></li>
											</s:iterator>
										</ul>
									</div>
								</div>
								<s:set var="incManfstotal" name="incManfstotal"
									value="dto.incManfs.size" />
								<s:if test="#incManfstotal>5">
									<div class="sl-ext">
										<a href="javascript:showExt;" style="visibility: visible;"
											class="sl-e-more ">更多<i></i></a>
									</div>
								</s:if>
							</div>
						</s:if>
						<s:iterator value="dto.propertyMap" id="propertyMap">
							<div class="sl-wrap">
								<div class="sl-key">
									<span><s:property value="key" />:</span>
								</div>
								<div class="sl-value s-category">

									<div class="clr"></div>
									<div class="sl-v-list">
										<ul class="v-fixed" id="manUl">
											<s:iterator value="value" id="incProperty">
												<li data-initial="o"><a
													href="javascript:queryByProperty(${incProperty.propertyId})"
													title="${incProperty.propertyName}" rel="nofollow"><i></i>${incProperty.propertyName}</a></li>
											</s:iterator>
										</ul>
									</div>
								</div>
								<s:set var="total" name="total" value="#propertyMap.value.size" />
								<s:if test="#total>5">
									<div class="sl-ext">
										<a href="javascript:showExt;" style="visibility: visible;"
											class="sl-e-more ">更多<i></i></a>
									</div>
								</s:if>
							</div>
						</s:iterator>
					</div>
				</div>
			</div>
		</div>

</body>
</html>