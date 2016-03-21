/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ven;

import com.dhcc.framework.transmission.dto.BaseDto;

public class VenIncContranstDto extends BaseDto {
	
	private static final long serialVersionUID = 1L;

	
	private String incName;
	
	private String incCode;
	
	private Long hopId;
	
	private Long venId;
	
	private String flag;
	
	private String auditflag;
	
	private String hopIncName;
	
	private String hopIncCode;
	
	private String hopIncAlias;
	
	
	
	
	public String getHopIncAlias() {
		return hopIncAlias;
	}

	public void setHopIncAlias(String hopIncAlias) {
		this.hopIncAlias = hopIncAlias;
	}

	public String getHopIncName() {
		return hopIncName;
	}

	public void setHopIncName(String hopIncName) {
		this.hopIncName = hopIncName;
	}

	public String getHopIncCode() {
		return hopIncCode;
	}

	public void setHopIncCode(String hopIncCode) {
		this.hopIncCode = hopIncCode;
	}

	public String getAuditflag() {
		return auditflag;
	}

	public void setAuditflag(String auditflag) {
		this.auditflag = auditflag;
	}

	/**
	 * @return the incCode
	 */
	public String getIncCode() {
		return incCode;
	}

	/**
	 * @param incCode the incCode to set
	 */
	public void setIncCode(String incCode) {
		this.incCode = incCode;
	}

	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * @return the incName
	 */
	public String getIncName() {
		return incName;
	}

	/**
	 * @param incName the incName to set
	 */
	public void setIncName(String incName) {
		this.incName = incName;
	}

	/**
	 * @return the hopId
	 */
	public Long getHopId() {
		return hopId;
	}

	/**
	 * @param hopId the hopId to set
	 */
	public void setHopId(Long hopId) {
		this.hopId = hopId;
	}

	/**
	 * @return the venId
	 */
	public Long getVenId() {
		return venId;
	}

	/**
	 * @param venId the venId to set
	 */
	public void setVenId(Long venId) {
		this.venId = venId;
	}
	
	
	
}
