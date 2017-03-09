/**
 * 
 */
package com.dhcc.scm.dto.ord;

import java.util.Date;

import com.dhcc.framework.transmission.dto.BaseDto;

/**
 * @author Administrator
 *
 */
public class PutShippSumDto extends BaseDto{
	
	private Long vendor;
	
	private String venname;
	
	private float rpamt;
	
	private String invno;
	
	private Date date;
	
	private Date stdate;
	
	private Date eddate;
	
	public Date getDate() {
		return date;
	}

	public String getVenname() {
		return venname;
	}


	public void setVenname(String venname) {
		this.venname = venname;
	}


	public void setDate(Date date) {
		this.date = date;
	}

	public Date getStdate() {
		return stdate;
	}

	public void setStdate(Date stdate) {
		this.stdate = stdate;
	}

	public Date getEddate() {
		return eddate;
	}

	public void setEddate(Date eddate) {
		this.eddate = eddate;
	}

	public Long getVendor() {
		return vendor;
	}

	public void setVendor(Long vendor) {
		this.vendor = vendor;
	}

	public float getRpamt() {
		return rpamt;
	}

	public void setRpamt(float rpamt) {
		this.rpamt = rpamt;
	}

	public String getInvno() {
		return invno;
	}

	public void setInvno(String invno) {
		this.invno = invno;
	}
	
	
}
