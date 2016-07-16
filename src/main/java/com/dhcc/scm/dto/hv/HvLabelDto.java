/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hv;

import java.util.Date;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hv.HvLabel;

public class HvLabelDto extends BaseDto {



	/**
	 * 
	 */
	private static final long serialVersionUID = 6024133413038097628L;

	private HvLabel hvLabel;
	
	private String parStr;
	
	private Date ordStart;
	
	private Date ordEnd;
	
	private String flag;
	
	
	
	
	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}


	public Date getOrdStart() {
		return ordStart;
	}


	public void setOrdStart(Date ordStart) {
		this.ordStart = ordStart;
	}


	public Date getOrdEnd() {
		return ordEnd;
	}


	public void setOrdEnd(Date ordEnd) {
		this.ordEnd = ordEnd;
	}


	public String getParStr() {
		return parStr;
	}


	public void setParStr(String parStr) {
		this.parStr = parStr;
	}


	public HvLabel getHvLabel() {
		return hvLabel;
	}

	
	public void setHvLabel(HvLabel hvLabel) {
		this.hvLabel = hvLabel;
	}
	
}
