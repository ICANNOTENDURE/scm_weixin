/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.framework.transmission.dto.BaseDto;

public class MpUserDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7740804080322441235L;

	private MpUser mpUser;

	private String username;
	
	private String passwd;
	
	private String depart;
	
	
	
	public String getDepart() {
		return depart;
	}


	public void setDepart(String depart) {
		this.depart = depart;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public MpUser getMpUser() {
		return mpUser;
	}

	
	public void setMpUser(MpUser mpUser) {
		this.mpUser = mpUser;
	}
	
}
