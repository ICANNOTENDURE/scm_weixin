/**
 * 
 */
package com.dhcc.scm.entity.vo.mobile;




public class QrCode {
	
private String content;

	private String codeType;
	
	private int seq;
	
	
	public QrCode(){
		super();
	}
	public QrCode(String content, String codeType, int seq) {
		super();
		this.content = content;
		this.codeType = codeType;
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
}
