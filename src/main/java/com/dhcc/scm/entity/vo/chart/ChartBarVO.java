package com.dhcc.scm.entity.vo.chart;

import java.util.List;

public class ChartBarVO {
	
	private String legend;
	
	private List<String> category;
	
	private List<String> series;

	public String getLegend() {
		return legend;
	}

	public void setLegend(String legend) {
		this.legend = legend;
	}

	public List<String> getCategory() {
		return category;
	}

	public void setCategory(List<String> category) {
		this.category = category;
	}

	public List<String> getSeries() {
		return series;
	}

	public void setSeries(List<String> series) {
		this.series = series;
	}

	
	
	
	
}
