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
