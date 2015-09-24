/**
 * 
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.framework.transmission.dto.BaseDto;



public class SendMailDto extends BaseDto {

	private static final long serialVersionUID = 1L;

	private String recUser;
	
	private String sub;
	
	private String content;

	/**
	 * @return the recUser
	 */
	public String getRecUser() {
		return recUser;
	}

	/**
	 * @param recUser the recUser to set
	 */
	public void setRecUser(String recUser) {
		this.recUser = recUser;
	}

	/**
	 * @return the sub
	 */
	public String getSub() {
		return sub;
	}

	/**
	 * @param sub the sub to set
	 */
	public void setSub(String sub) {
		this.sub = sub;
	}

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
