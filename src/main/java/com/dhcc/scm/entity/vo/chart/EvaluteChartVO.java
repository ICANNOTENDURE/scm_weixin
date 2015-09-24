package com.dhcc.scm.entity.vo.chart;



/**
 * 
* @ClassName: EvaluteChartVO 
* @Description: TODO(查询评价) 
* @author zhouxin
* @date 2015年2月5日 下午7:02:59 
*
 */
public class EvaluteChartVO {
	
	/**
	 * 供应商名称
	 */
	private String name="";
	/**
	 * 好评的个数
	 */
	private	Integer value=0;
	/**
	 * 中评的个数
	 */
	private Integer value1=0;
	/**
	 * 一般的个数
	 */
	private Integer value2=0;
	/**
	 * 差评的个数
	 */
	private Integer value3=0;
	/**
	 * 投诉的个数
	 */
	private Integer value4=0;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Integer getValue1() {
		return value1;
	}

	public void setValue1(Integer value1) {
		this.value1 = value1;
	}

	public Integer getValue2() {
		return value2;
	}

	public void setValue2(Integer value2) {
		this.value2 = value2;
	}

	public Integer getValue3() {
		return value3;
	}

	public void setValue3(Integer value3) {
		this.value3 = value3;
	}

	public Integer getValue4() {
		return value4;
	}

	public void setValue4(Integer value4) {
		this.value4 = value4;
	}
	
	
	
}
