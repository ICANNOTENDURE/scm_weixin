package com.dhcc.framework.common.entity.vo.fusioncharts;

import java.io.Serializable;
import java.util.ArrayList;
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
public class Categories implements Serializable {

	/**
	 * 字段: 字段名称
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	private List<Data> category = new ArrayList<Data>();
	

	/**
	 * @return category
	 */
	public List<Data> getCategory() {
		return category;
	}

	/**
	 * @param categorie
	 *            categorie
	 */
	public void setCategory(List<Data> category) {
		this.category = category;
	}
}
