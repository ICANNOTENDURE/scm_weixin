/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.sys.SysQualifType;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;

public class SysQualifTypeDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	
	private SysQualifType sysQualifType;

	private Long venIncId;
	
	private Long catGroupId;
	
	private Long qualifyTypeId;
	
	private List<VenQualifTypeVO> qualifTypeVOs;
	
	

	public List<VenQualifTypeVO> getQualifTypeVOs() {
		return qualifTypeVOs;
	}


	public void setQualifTypeVOs(List<VenQualifTypeVO> qualifTypeVOs) {
		this.qualifTypeVOs = qualifTypeVOs;
	}


	public Long getQualifyTypeId() {
		return qualifyTypeId;
	}


	public void setQualifyTypeId(Long qualifyTypeId) {
		this.qualifyTypeId = qualifyTypeId;
	}


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
