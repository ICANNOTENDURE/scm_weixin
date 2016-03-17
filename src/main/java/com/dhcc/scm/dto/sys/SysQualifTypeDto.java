/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.sys.SysQualifType;

public class SysQualifTypeDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	
	private SysQualifType sysQualifType;

	private Long venIncId;
	
	private Long catGroupId;
	
	
	



	public Long getVenIncId() {
		return venIncId;
	}


	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}


	public Long getCatGroupId() {
		return catGroupId;
	}


	public void setCatGroupId(Long catGroupId) {
		this.catGroupId = catGroupId;
	}


	public SysQualifType getSysQualifType() {
		return sysQualifType;
	}

	
	public void setSysQualifType(SysQualifType sysQualifType) {
		this.sysQualifType = sysQualifType;
	}
	

}
