/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import com.dhcc.scm.entity.weixin.WxDepart;
import com.dhcc.scm.entity.weixin.WxUser;
import com.dhcc.framework.transmission.dto.BaseDto;

public class WxDepartDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private WxDepart wxDepart;

	private WxUser wxUser;
	
	
	
	public WxUser getWxUser() {
		return wxUser;
	}


	public void setWxUser(WxUser wxUser) {
		this.wxUser = wxUser;
	}


	public WxDepart getWxDepart() {
		return wxDepart;
	}

	
	public void setWxDepart(WxDepart wxDepart) {
		this.wxDepart = wxDepart;
	}
	
}
