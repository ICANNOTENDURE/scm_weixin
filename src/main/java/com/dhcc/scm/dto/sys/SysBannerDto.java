/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.scm.entity.sys.SysBanner;
import com.dhcc.framework.transmission.dto.BaseDto;

public class SysBannerDto extends BaseDto {

	private SysBanner sysBanner;

	
	public SysBanner getSysBanner() {
		return sysBanner;
	}

	
	public void setSysBanner(SysBanner sysBanner) {
		this.sysBanner = sysBanner;
	}
	
}
