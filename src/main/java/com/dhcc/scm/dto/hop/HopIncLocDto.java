/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hop.HopIncLoc;

public class HopIncLocDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private HopIncLoc hopIncLoc;
	
	private List<HopIncLoc> hopIncLocs;
	
	private String minFlag;
	
	private String standFlag;
	
	
	
	public String getMinFlag() {
		return minFlag;
	}

	public void setMinFlag(String minFlag) {
		this.minFlag = minFlag;
	}

	public String getStandFlag() {
		return standFlag;
	}

	public void setStandFlag(String standFlag) {
		this.standFlag = standFlag;
	}

	public List<HopIncLoc> getHopIncLocs() {
		return hopIncLocs;
	}

	public void setHopIncLocs(List<HopIncLoc> hopIncLocs) {
		this.hopIncLocs = hopIncLocs;
	}


	/*
	 * pageCount分页时候使用
	 */
	private int pageCount;
	
	
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	public HopIncLoc getHopIncLoc() {
		return hopIncLoc;
	}

	
	public void setHopIncLoc(HopIncLoc hopIncLoc) {
		this.hopIncLoc = hopIncLoc;
	}
	
}
