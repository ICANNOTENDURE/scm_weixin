package com.dhcc.scm.entity.vo.chart;

import java.util.List;



/**
 * 
 * @author Administrator
 *
 */
public class ChartResultVO {
	
	
	private List<ChartVO> chartVOs;
	
	private List<ChartResultSubVO> chartResultSubVOs;
	
	private Float maxPrice;
	
	
	
	public Float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public List<ChartVO> getChartVOs() {
		return chartVOs;
	}

	public void setChartVOs(List<ChartVO> chartVOs) {
		this.chartVOs = chartVOs;
	}

	public List<ChartResultSubVO> getChartResultSubVOs() {
		return chartResultSubVOs;
	}

	public void setChartResultSubVOs(List<ChartResultSubVO> chartResultSubVOs) {
		this.chartResultSubVOs = chartResultSubVOs;
	}



	
	
	
	
}
