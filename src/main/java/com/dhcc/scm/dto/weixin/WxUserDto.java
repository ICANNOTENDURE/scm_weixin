/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import me.chanjar.weixin.cp.bean.WxCpUser;

import com.dhcc.scm.entity.weixin.WxUser;
import com.dhcc.framework.transmission.dto.BaseDto;

public class WxUserDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private WxUser wxUser;
	
	private WxCpUser wxCpUser;
	
	
	
	public WxCpUser getWxCpUser() {
		return wxCpUser;
	}


	public void setWxCpUser(WxCpUser wxCpUser) {
		this.wxCpUser = wxCpUser;
	}


	public WxUser getWxUser() {
		return wxUser;
	}

	
	public void setWxUser(WxUser wxUser) {
		this.wxUser = wxUser;
	}
	
}
