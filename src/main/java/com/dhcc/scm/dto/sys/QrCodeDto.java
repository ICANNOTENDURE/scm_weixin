/**
 * 
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.framework.transmission.dto.BaseDto;



public class QrCodeDto extends BaseDto {

	private static final long serialVersionUID = 1L;

	private String content;
	
	private String codeType;
	
	private int seq;
	
	private String code128;
	
	private String text;
	
	
	

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCode128() {
		return code128;
	}

	public void setCode128(String code128) {
		this.code128 = code128;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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
