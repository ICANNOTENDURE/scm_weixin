/**
 * 
 */
package com.dhcc.scm.entity.vo.sys;

import java.util.Date;

/**
 * @author Administrator
 *
 */
public class SysMessageToVo {
	private String retype;
	
	private String typedesc;
	
	private Long toId;
	
	private Long tomessageid;
	
	private String toReadFlag;
	
	private Date toReaDate;
	
	private Long toWxOpenId;

	/**
	 * @return the retype
	 */
	public String getRetype() {
		return retype;
	}

	/**
	 * @param retype the retype to set
	 */
	public void setRetype(String retype) {
		this.retype = retype;
	}

	/**
	 * @return the typedesc
	 */
	public String getTypedesc() {
		return typedesc;
	}

	/**
	 * @param typedesc the typedesc to set
	 */
	public void setTypedesc(String typedesc) {
		this.typedesc = typedesc;
	}

	/**
	 * @return the toId
	 */
	public Long getToId() {
		return toId;
	}

	/**
	 * @param toId the toId to set
	 */
	public void setToId(Long toId) {
		this.toId = toId;
	}

	

	

	

	/**
	 * @return the tomessageid
	 */
	public Long getTomessageid() {
		return tomessageid;
	}

	/**
	 * @param tomessageid the tomessageid to set
	 */
	public void setTomessageid(Long tomessageid) {
		this.tomessageid = tomessageid;
	}

	/**
	 * @return the toReadFlag
	 */
	public String getToReadFlag() {
		return toReadFlag;
	}

	/**
	 * @param toReadFlag the toReadFlag to set
	 */
	public void setToReadFlag(String toReadFlag) {
		this.toReadFlag = toReadFlag;
	}

	/**
	 * @return the toReaDate
	 */
	public Date getToReaDate() {
		return toReaDate;
	}

	/**
	 * @param toReaDate the toReaDate to set
	 */
	public void setToReaDate(Date toReaDate) {
		this.toReaDate = toReaDate;
	}

	/**
	 * @return the toWxOpenId
	 */
	public Long getToWxOpenId() {
		return toWxOpenId;
	}

	/**
	 * @param toWxOpenId the toWxOpenId to set
	 */
	public void setToWxOpenId(Long toWxOpenId) {
		this.toWxOpenId = toWxOpenId;
	}
	
	

}
