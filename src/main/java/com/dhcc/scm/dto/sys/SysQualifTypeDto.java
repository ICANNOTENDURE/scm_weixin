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

	private Long vendorId;
	
	private Long catGroupId;
	
	
	
	public Long getVendorId() {
		return vendorId;
	}


	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
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
