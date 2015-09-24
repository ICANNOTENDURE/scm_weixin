package com.dhcc.scm.dto.sys;

import java.util.Date;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.sys.SysLog;


public class LogDto extends BaseDto {

	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private SysLog tlog;
	
	private Date startDate;
	
	private Date endDate;
	

	

	/**
	 * @return the tlog
	 */
	public SysLog getTlog() {
		return tlog;
	}

	/**
	 * @param tlog the tlog to set
	 */
	public void setTlog(SysLog tlog) {
		this.tlog = tlog;
	}

	/**
	 * @return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the endDate
	 */
	public Date getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	
}