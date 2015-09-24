package com.dhcc.framework.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties({"pageDataJson","countProName","queryHql"})
public class PagerModel implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;

	private int pageNo = 1;

	private int pageSize = 5;

	private List<?> pageData;

	private int totals;

	private String queryHql;

	private String pageDataJson;
	
	private String countProName;

	/**
	 * @return totals
	 */
	public int getTotals() {
		return totals;
	}

	/**
	 * @param totals
	 *            totals
	 */
	public void setTotals(int totals) {
		this.totals = totals;
	}

	private Map<String, Object> hqlParamMap;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<?> getPageData() {
		return pageData;
	}

	public void setPageData(List<?> pageData) {
		this.pageData = pageData;
	}

	public String getQueryHql() {
		return queryHql;
	}

	public void setQueryHql(String queryHql) {
		this.queryHql = queryHql;
	}

	public Map<String, Object> getHqlParamMap() {
		return hqlParamMap;
	}

	public void setHqlParamMap(Map<String, Object> hqlParamMap) {
		this.hqlParamMap = hqlParamMap;
	}

	/**
	 * @return pageDataJson
	 */
	public String getPageDataJson() {
		return pageDataJson;
	}

	/**
	 * @param pageDataJson
	 *            pageDataJson
	 */
	public void setPageDataJson(String pageDataJson) {
		this.pageDataJson = pageDataJson;
	}

	public String getCountProName() {
		return countProName;
	}

	public void setCountProName(String countProName) {
		this.countProName = countProName;
	}
}
