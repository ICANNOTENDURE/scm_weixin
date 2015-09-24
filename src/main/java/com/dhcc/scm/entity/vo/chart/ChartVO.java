package com.dhcc.scm.entity.vo.chart;



/**
 * 
 * @author Administrator
 *
 */
public class ChartVO {
	
	
	private String name="";
	
	private	String value="0";
	
	private String value1="0";
	
	
	
	/**
	 * @return the value1
	 */
	public String getValue1() {
		return value1;
	}

	/**
	 * @param value1 the value1 to set
	 */
	public void setValue1(String value1) {
		this.value1 = value1;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		if(name.indexOf("-")>0){
			//name=name.substring(name.indexOf("-"), name.length());
		}
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		//return value;
		return String.format("%g %n", Float.valueOf(value).floatValue());
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	
	
	
}
