/**  
* @Title: OperateResult.java
* @Package com.dhcc.pms.entity.vo.ws
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年7月9日 上午9:22:21
* @version V1.0  
*/
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.Date;


public class HisHvLabelWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Date ordDate;
	
	private String hopIncCode;
	
	private String hopVendorCode;
	
	private Float rp;
	
	private Float qty;
	
	private String label;

	public Date getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}

	public String getHopIncCode() {
		return hopIncCode;
	}

	public void setHopIncCode(String hopIncCode) {
		this.hopIncCode = hopIncCode;
	}

	public String getHopVendorCode() {
		return hopVendorCode;
	}

	public void setHopVendorCode(String hopVendorCode) {
		this.hopVendorCode = hopVendorCode;
	}

	public Float getRp() {
		return rp;
	}

	public void setRp(Float rp) {
		this.rp = rp;
	}

	public Float getQty() {
		return qty;
	}

	public void setQty(Float qty) {
		this.qty = qty;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
	
}
