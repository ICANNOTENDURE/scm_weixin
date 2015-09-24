/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.framework.transmission.dto.BaseDto;

public class SysAppParamDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SysAppParam sysAppParam;

	
	public SysAppParam getSysAppParam() {
		return sysAppParam;
	}

	
	public void setSysAppParam(SysAppParam sysAppParam) {
		this.sysAppParam = sysAppParam;
	}
	
}
