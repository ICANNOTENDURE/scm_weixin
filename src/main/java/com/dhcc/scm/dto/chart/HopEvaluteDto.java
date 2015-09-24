

package com.dhcc.scm.dto.chart;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.chart.EvaluteChartVO;
/**
 * 
* @ClassName: HopEvaluteDto 
* @Description: TODO(取评价结果) 
* @author zhouxin
* @date 2015年2月5日 下午7:04:30 
*
 */
public class HopEvaluteDto extends BaseDto {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<ChartVO> chartVOs;
	
	private List<EvaluteChartVO> evaluteChartVOs;
	
	private List<String> names;
	
	private List<Integer> values; 
	
	private List<Integer> value1s;
	
	private List<Integer> value2s;
	
	private List<Integer> value3s;
	
	private List<Integer> value4s;
	
	public List<EvaluteChartVO> getEvaluteChartVOs() {
		return evaluteChartVOs;
	}

	public void setEvaluteChartVOs(List<EvaluteChartVO> evaluteChartVOs) {
		this.evaluteChartVOs = evaluteChartVOs;
	}

	public List<ChartVO> getChartVOs() {
		return chartVOs;
	}

	public void setChartVOs(List<ChartVO> chartVOs) {
		this.chartVOs = chartVOs;
	}

	public List<String> getNames() {
		return names;
	}

	public void setNames(List<String> names) {
		this.names = names;
	}

	public List<Integer> getValues() {
		return values;
	}

	public void setValues(List<Integer> values) {
		this.values = values;
	}

	public List<Integer> getValue1s() {
		return value1s;
	}

	public void setValue1s(List<Integer> value1s) {
		this.value1s = value1s;
	}

	public List<Integer> getValue2s() {
		return value2s;
	}

	public void setValue2s(List<Integer> value2s) {
		this.value2s = value2s;
	}

	public List<Integer> getValue3s() {
		return value3s;
	}

	public void setValue3s(List<Integer> value3s) {
		this.value3s = value3s;
	}

	public List<Integer> getValue4s() {
		return value4s;
	}

	public void setValue4s(List<Integer> value4s) {
		this.value4s = value4s;
	}

	
	
}
