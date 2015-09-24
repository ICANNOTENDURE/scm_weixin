package com.dhcc.framework.common.entity.vo.fusioncharts;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * <p>
 * 标题: JsonChart.java
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
 * @author 林则鹏
 * @date 2013年8月3日
 * @version V1.0
 */
//@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonInclude(Include.NON_NULL)
public class JsonChart implements Serializable {

	/**
	 * 字段: 字段名称
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	public JsonChart() {

	}

	private Chart chart;
	private List<Data> data ;
	private List<DataSet> dataset ;
	private List<Categories> categories ;
	private Colorrange colorrange;
	private Dials dials;
	private Annotations annotations;

	private LineSet lineset ;
	/**
	 * @return data
	 */
	public List<Data> getData() {
		return data;
	}

	/**
	 * @param data
	 *            data
	 */
	public void setData(List<Data> data) {
		this.data = data;
	}

	/**
	 * @return chart
	 */
	public Chart getChart() {
		return chart;
	}

	/**
	 * @param chart
	 *            chart
	 */
	public void setChart(Chart chart) {
		this.chart = chart;
	}


	/**
	 * @return categories
	 */
	public List<Categories> getCategories() {
		return categories;
	}

	/**
	 * @param categories
	 *            categories
	 */
	public void setCategories(List<Categories> categories) {
		this.categories = categories;
	}

	public List<DataSet> getDataset() {
		return dataset;
	}

	public void setDataset(List<DataSet> dataset) {
		this.dataset = dataset;
	}

	public LineSet getLineset() {
		return lineset;
	}

	public void setLineset(LineSet lineset) {
		this.lineset = lineset;
	}

	public Colorrange getColorrange() {
		return colorrange;
	}

	public void setColorrange(Colorrange colorrange) {
		this.colorrange = colorrange;
	}

	public Dials getDials() {
		return dials;
	}

	public void setDials(Dials dials) {
		this.dials = dials;
	}

	public Annotations getAnnotations() {
		return annotations;
	}

	public void setAnnotations(Annotations annotations) {
		this.annotations = annotations;
	}


}
