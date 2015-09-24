package com.dhcc.framework.common.config.vo;
/**
 * @author daichao
 * 
 */
public class ConfItem implements Comparable<ConfItem> {

	private String key;
	private String value;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public int compareTo(ConfItem o) {
		
		return key.compareTo(o.key);
	}

}
