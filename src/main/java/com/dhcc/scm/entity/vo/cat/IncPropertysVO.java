/**
 * 
 */
package com.dhcc.scm.entity.vo.cat;

import java.util.List;



public class IncPropertysVO {
	
	private String propertyName;
	
	private List<IncPropertyVO> incPropertyVOs;

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public List<IncPropertyVO> getIncPropertyVOs() {
		return incPropertyVOs;
	}

	public void setIncPropertyVOs(List<IncPropertyVO> incPropertyVOs) {
		this.incPropertyVOs = incPropertyVOs;
	}
	
	
	
	
}
