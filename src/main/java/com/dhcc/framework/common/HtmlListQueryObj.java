package com.dhcc.framework.common;

import java.util.Map;

public class HtmlListQueryObj {
	
	//key 属性名
	private String keyPropertyName;
	//value 属性名
	private String valuePropertyName;
	//实体类名
	private String hqlObjName;
	// ajax方法时，把列表数据存入request时的Attribute名称	
	private String listName;
	// 含where 的ＨＱＬ命名参数绑定如 where companyID:=companyID
	private String conditions;
	
	// key 为属性名即conditions中命名参数，value为属性值?
	public Map<String, Object> paraValues; 

	public String getKeyPropertyName() {
		return keyPropertyName;
	}

	public void setKeyPropertyName(String keyPropertyName) {
		this.keyPropertyName = keyPropertyName;
	}

	public String getValuePropertyName() {
		return valuePropertyName;
	}

	public void setValuePropertyName(String valuePropertyName) {
		this.valuePropertyName = valuePropertyName;
	}

	public String getHqlObjName() {
		return hqlObjName;
	}

	public void setHqlObjName(String hqlObjName) {
		this.hqlObjName = hqlObjName;
	}

	public String getListName() {
		return listName;
	}

	public void setListName(String listName) {
		this.listName = listName;
	}

	public Map<String, Object> getParaValues() {
		return paraValues;
	}

	public void setParaValues(Map<String, Object> paraValues) {
		this.paraValues = paraValues;
	}

	public String getConditions() {
		return conditions;
	}

	public void setConditions(String conditions) {
		this.conditions = conditions;
	}

	public HtmlListQueryObj copy() {
		HtmlListQueryObj obj = new HtmlListQueryObj();
		obj.conditions = this.conditions;
		obj.keyPropertyName = this.keyPropertyName;
		obj.valuePropertyName = this.valuePropertyName;
		obj.hqlObjName = this.hqlObjName;
		obj.listName = this.listName;
		obj.conditions = this.conditions;
		obj.paraValues = this.paraValues;
		return obj;
	}


}
