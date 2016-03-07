/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import com.dhcc.framework.transmission.dto.BaseDto;

public class MpInGdRecDto extends BaseDto {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String url;
	private String title;
	private String user;
	private String loc;
	private String date;
	
	
	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
