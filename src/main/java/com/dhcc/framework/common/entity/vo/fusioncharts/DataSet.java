package com.dhcc.framework.common.entity.vo.fusioncharts;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * <p>
 * 标题: categories.java
 * </p>
 * <p>
 * 业务描述:封装fusionCharts对象
 * </p>
 * <p>
 * 公司:东华软件股份公司
 * </p>
 * <p>
 * 版权:dhcc2013
 * </p>
 * 
 * @author L
 * @date 2013年8月3日
 * @version V1.0
 */
@JsonInclude(Include.NON_NULL)
public class DataSet implements Serializable {

	/**
	 * 字段: 字段名称
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	private String seriesname;
	private List<Data> data ;
	private String renderas;
	private String color;
	private List<DataSet> dataset ;
	private String parentyaxis;
	/**
	 * @return data
	 */
	public List<Data> getData() {
		return data;
	}



	/**
	 * @return seriesname
	 */
	public String getSeriesname() {
		return seriesname;
	}

	/**
	 * @param seriesname
	 *            seriesname
	 */
	public void setSeriesname(String Seriesname) {
		this.seriesname = Seriesname;
	}
	/**
	 * @param seriesname
	 *            seriesname
	 */

	public String getRenderas() {
		return renderas;
	}

	public void setRenderas(String renderas) {
		this.renderas = renderas;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setData(List<Data> data) {
		this.data = data;
	}



	public List<DataSet> getDataset() {
		return dataset;
	}



	public void setDataset(List<DataSet> dataset) {
		this.dataset = dataset;
	}



	public String getParentyaxis() {
		return parentyaxis;
	}



	public void setParentyaxis(String parentyaxis) {
		this.parentyaxis = parentyaxis;
	}
}
