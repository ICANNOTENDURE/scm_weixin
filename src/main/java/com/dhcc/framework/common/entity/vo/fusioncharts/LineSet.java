package com.dhcc.framework.common.entity.vo.fusioncharts;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class LineSet  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8089532595821551403L;
	private String seriesname ;
	private List<Data> data ;
	public String getSeriesname() {
		return seriesname;
	}
	public void setSeriesname(String seriesname) {
		this.seriesname = seriesname;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}
}
