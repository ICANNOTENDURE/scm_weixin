package com.dhcc.scm.entity.vo.ws;

import java.util.Date;




public class HisOrderWebItm implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String hisno;	
	
	private String purloc;
	
	private String recloc;
	
	private String desction;
	
	private String remark;
	
	private String emflag;
	
	private String vendorBarCode;
	
	private Date planDate;
	
	private String hopBarCode;
	
	private Float qty;
	
	private Float rp;
	
	private String hisId;
	
	
	
	
	public String getHisId() {
		return hisId;
	}

	public void setHisId(String hisId) {
		this.hisId = hisId;
	}

	public String getHisno() {
		return hisno;
	}

	public void setHisno(String hisno) {
		this.hisno = hisno;
	}

	public String getPurloc() {
		return purloc;
	}

	public void setPurloc(String purloc) {
		this.purloc = purloc;
	}

	public String getRecloc() {
		return recloc;
	}

	public void setRecloc(String recloc) {
		this.recloc = recloc;
	}

	public String getDesction() {
		return desction;
	}

	public void setDesction(String desction) {
		this.desction = desction;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getEmflag() {
		return emflag;
	}

	public void setEmflag(String emflag) {
		this.emflag = emflag;
	}

	

	public String getVendorBarCode() {
		return vendorBarCode;
	}

	public void setVendorBarCode(String vendorBarCode) {
		this.vendorBarCode = vendorBarCode;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getHopBarCode() {
		return hopBarCode;
	}

	public void setHopBarCode(String hopBarCode) {
		this.hopBarCode = hopBarCode;
	}

	public Float getQty() {
		return qty;
	}

	public void setQty(Float qty) {
		this.qty = qty;
	}

	public Float getRp() {
		return rp;
	}

	public void setRp(Float rp) {
		this.rp = rp;
	}
	
	
	

	
	
	
}