package com.dhcc.scm.entity.vo.comment;




/**
 * 
 * @author Administrator
 *
 */
public class CommentVenVO {
	
	private Long id;
	
	private String name2;
	/**
	 * 供应商名称
	 */
	private String name="";
	/**
	 * 非常满意
	 */
	private	Integer value5=0;
	/**
	 * 满意
	 */
	private Integer value4=0;
	/**
	 * 一般
	 */
	private Integer value3=0;
	/**
	 * 不满意
	 */
	private Integer value2=0;
	/**
	 * 很不满意
	 */
	private Integer value1=0;
	
	/**
	 * 评价总数
	 */
	private Integer totals;
	
	private float pec1;
	
	private float pec2;
	
	private float pec3;
	
	private float pec4;
	
	private float pec5;
	
	private float avgspeed;
	
	private float avgservice;
	
	private float avgdescription;
	
	private float avgresult;
	
	
	
	public float getAvgspeed() {
		return avgspeed;
	}

	public void setAvgspeed(float avgspeed) {
		this.avgspeed = avgspeed;
	}

	public float getAvgservice() {
		return avgservice;
	}

	public void setAvgservice(float avgservice) {
		this.avgservice = avgservice;
	}

	public float getAvgdescription() {
		return avgdescription;
	}

	public void setAvgdescription(float avgdescription) {
		this.avgdescription = avgdescription;
	}

	public float getAvgresult() {
		return avgresult;
	}

	public void setAvgresult(float avgresult) {
		this.avgresult = avgresult;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public float getPec1() {
		return (float)(Math.round(pec1*100)/100);
	}

	public void setPec1(float pec1) {
		this.pec1 = pec1;
	}

	public float getPec2() {
		return (float)(Math.round(pec2*100)/100);
	}

	public void setPec2(float pec2) {
		this.pec2 = pec2;
	}

	public float getPec3() {
		return (float)(Math.round(pec3*100)/100);
	}

	public void setPec3(float pec3) {
		this.pec3 = pec3;
	}

	public float getPec4() {
		return (float)(Math.round(pec4*100)/100);
	}

	public void setPec4(float pec4) {
		this.pec4 = pec4;
	}

	public float getPec5() {
		return (float)(Math.round(pec5*100)/100);
	}

	public void setPec5(float pec5) {
		this.pec5 = pec5;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getValue5() {
		return value5;
	}

	public void setValue5(Integer value5) {
		this.value5 = value5;
	}

	public Integer getValue4() {
		return value4;
	}

	public void setValue4(Integer value4) {
		this.value4 = value4;
	}

	public Integer getValue3() {
		return value3;
	}

	public void setValue3(Integer value3) {
		this.value3 = value3;
	}

	public Integer getValue2() {
		return value2;
	}

	public void setValue2(Integer value2) {
		this.value2 = value2;
	}

	public Integer getValue1() {
		return value1;
	}

	public void setValue1(Integer value1) {
		this.value1 = value1;
	}

	public Integer getTotals() {
		return totals;
	}

	public void setTotals(Integer totals) {
		this.totals = totals;
	}

	
	
	
}
