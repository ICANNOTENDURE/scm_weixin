/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.manf;

import java.util.List;

import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.framework.transmission.dto.BaseDto;

public class HopManfDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private HopManf hopManf;
	private List<HopManf> hopManfs;
	
	public List<HopManf> getHopManfs() {
		return hopManfs;
	}


	public void setHopManfs(List<HopManf> hopManfs) {
		this.hopManfs = hopManfs;
	}


	public HopManf getHopManf() {
		return hopManf;
	}

	
	public void setHopManf(HopManf hopManf) {
		this.hopManf = hopManf;
	}
	
}
