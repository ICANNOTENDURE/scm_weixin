/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.framework.transmission.dto.BaseDto;

public class MpUserDto extends BaseDto {

	private MpUser mpUser;

	
	public MpUser getMpUser() {
		return mpUser;
	}

	
	public void setMpUser(MpUser mpUser) {
		this.mpUser = mpUser;
	}
	
}
