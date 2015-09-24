/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.chart;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.vo.chart.BarVO;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.chart.ChartVenHotSaleVO;
import com.dhcc.scm.entity.vo.chart.EvaluteChartVO;

public class OrdVenDistributionDto extends BaseDto {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<ChartVO> chartVOs;
	
	private List<String> names= new ArrayList<String>();
	
	private List<String> values=new ArrayList<String>();

	private List<String> value1s=new ArrayList<String>();
	
	private List<String> value2s=new ArrayList<String>();
	
	private List<String> value3s=new ArrayList<String>();
	
	private List<String> value4s=new ArrayList<String>();
	
	private Integer MaxQty;
	
	private String maxQtyMonth;
	
	private Integer minQty;
	
	private String minQtyMonth;
	
	private List<EvaluteChartVO> evaluteChartVOs;
	
	
	private Date startDate;
	
	private Date endDate;

	private Long subCatId;
	
	private List<SubCatGroup> subCatGroups;
	
	private List<ChartVenHotSaleVO> chartVenHotSaleVOs;
	
	private String queryType;
	
	private List<BarVO> barVOs;
	
	private String hopIncId;
	
	
	

	public String getHopIncId() {
		return hopIncId;
	}

	public void setHopIncId(String hopIncId) {
		this.hopIncId = hopIncId;
	}

	public List<BarVO> getBarVOs() {
		return barVOs;
	}

	public void setBarVOs(List<BarVO> barVOs) {
		this.barVOs = barVOs;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public List<ChartVenHotSaleVO> getChartVenHotSaleVOs() {
		return chartVenHotSaleVOs;
	}

	public void setChartVenHotSaleVOs(List<ChartVenHotSaleVO> chartVenHotSaleVOs) {
		this.chartVenHotSaleVOs = chartVenHotSaleVOs;
	}

	public List<SubCatGroup> getSubCatGroups() {
		return subCatGroups;
	}

	public void setSubCatGroups(List<SubCatGroup> subCatGroups) {
		this.subCatGroups = subCatGroups;
	}

	public Long getSubCatId() {
		return subCatId;
	}

	public void setSubCatId(Long subCatId) {
		this.subCatId = subCatId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return the maxQty
	 */
	public Integer getMaxQty() {
		return MaxQty;
	}

	/**
	 * @param maxQty the maxQty to set
	 */
	public void setMaxQty(Integer maxQty) {
		MaxQty = maxQty;
	}

	/**
	 * @return the maxQtyMonth
	 */
	public String getMaxQtyMonth() {
		return maxQtyMonth;
	}

	/**
	 * @param maxQtyMonth the maxQtyMonth to set
	 */
	public void setMaxQtyMonth(String maxQtyMonth) {
		this.maxQtyMonth = maxQtyMonth;
	}

	/**
	 * @return the minQty
	 */
	public Integer getMinQty() {
		return minQty;
	}

	/**
	 * @param minQty the minQty to set
	 */
	public void setMinQty(Integer minQty) {
		this.minQty = minQty;
	}

	/**
	 * @return the minQtyMonth
	 */
	public String getMinQtyMonth() {
		return minQtyMonth;
	}

	/**
	 * @param minQtyMonth the minQtyMonth to set
	 */
	public void setMinQtyMonth(String minQtyMonth) {
		this.minQtyMonth = minQtyMonth;
	}

	/**
	 * @return the values
	 */
	public List<String> getValues() {
		return values;
	}

	/**
	 * @param values the values to set
	 */
	public void setValues(List<String> values) {
		this.values = values;
	}

	/**
	 * @return the value1s
	 */
	public List<String> getValue1s() {
		return value1s;
	}

	/**
	 * @param value1s the value1s to set
	 */
	public void setValue1s(List<String> value1s) {
		this.value1s = value1s;
	}

	/**
	 * @return the names
	 */
	public List<String> getNames() {
		return names;
	}

	/**
	 * @param names the names to set
	 */
	public void setNames(List<String> names) {
		this.names = names;
	}

	/**
	 * @return the chartVOs
	 */
	public List<ChartVO> getChartVOs() {
		return chartVOs;
	}

	/**
	 * @param chartVOs the chartVOs to set
	 */
	public void setChartVOs(List<ChartVO> chartVOs) {
		this.chartVOs = chartVOs;
	}

	public List<String> getValue2s() {
		return value2s;
	}

	public void setValue2s(List<String> value2s) {
		this.value2s = value2s;
	}

	public List<String> getValue3s() {
		return value3s;
	}

	public void setValue3s(List<String> value3s) {
		this.value3s = value3s;
	}

	public List<String> getValue4s() {
		return value4s;
	}

	public void setValue4s(List<String> value4s) {
		this.value4s = value4s;
	}

	public List<EvaluteChartVO> getEvaluteChartVOs() {
		return evaluteChartVOs;
	}

	public void setEvaluteChartVOs(List<EvaluteChartVO> evaluteChartVOs) {
		this.evaluteChartVOs = evaluteChartVOs;
	}


	
	
	
	
}
