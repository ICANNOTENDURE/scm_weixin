package com.dhcc.framework.common.entity.vo.fusioncharts;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * <p>
 * 标题: Data.java
 * </p>
 * <p>
 * 业务描述:封装fusionCharts对象data属性
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
@JsonInclude(Include.NON_NULL)
public class Data implements Serializable {

	/**
	 * 字段: 字段名称
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	private String label;
	private String color;
	private String value;
	private String link;
	private String displayValue;
	/**
	 * @return label
	 */
	public String getLabel() {
		return label;
	}

	/**
	 * @param link
	 *            link
	 */
	public void setLink(String link) {
		this.link = link;
	}
	/**
	 * @return link
	 */
	public String getLink() {
		return link;
	}

	/**
	 * @param label
	 *            label
	 */
	public void setLabel(String label) {
		this.label = label;
	}
	/**
	 * @return color
	 */
	public String getColor() {
		return color;
	}

	/**
	 * @param color
	 *            color
	 */
	public void setColor(String color) {
		this.color = color;
	}

	/**
	 * @return value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value
	 *            value
	 */
	public void setValue(String value) {
		this.value = value;
	}

	public String getDisplayValue() {
		return displayValue;
	}

	public void setDisplayValue(String displayValue) {
		this.displayValue = displayValue;
	}

}
