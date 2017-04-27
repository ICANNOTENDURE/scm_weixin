/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.scm.entity.sys.SysMessageTo;
import com.dhcc.framework.transmission.dto.BaseDto;

public class SysMessageToDto extends BaseDto {
	
	private Long toMessageId;


	/**
	 * @return the toMessageId
	 */
	public Long getToMessageId() {
		return toMessageId;
	}


	/**
	 * @param toMessageId the toMessageId to set
	 */
	public void setToMessageId(Long toMessageId) {
		this.toMessageId = toMessageId;
	}


	private SysMessageTo sysMessageTo;

	
	public SysMessageTo getSysMessageTo() {
		return sysMessageTo;
	}

	
	public void setSysMessageTo(SysMessageTo sysMessageTo) {
		this.sysMessageTo = sysMessageTo;
	}
	
}
