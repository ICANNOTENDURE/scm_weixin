/**
 * 
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.framework.transmission.dto.BaseDto;



public class QrCodeDto extends BaseDto {

	private static final long serialVersionUID = 1L;

	private String content;
	

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
