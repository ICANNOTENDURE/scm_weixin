/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import java.util.List;
import com.dhcc.scm.entity.sys.SysQualifType;
import com.dhcc.framework.transmission.dto.BaseDto;

public class SysQualifTypeDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	
	private SysQualifType sysQualifType;

	
	public SysQualifType getSysQualifType() {
		return sysQualifType;
	}

	
	public void setSysQualifType(SysQualifType sysQualifType) {
		this.sysQualifType = sysQualifType;
	}
	
//	//add hxy  以下都是
//	private List<SysQualifType> sysQualifTypes;
//
//
//	public List<SysQualifType> getSysQualifTypes() {
//		return sysQualifTypes;
//	}
//
//
//	public void setSysQualifTypes(List<SysQualifType> sysQualifTypes) {
//		this.sysQualifTypes = sysQualifTypes;
//	}
//
//
//	public static long getSerialversionuid() {
//		return serialVersionUID;
//	}
}
