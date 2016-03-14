package com.dhcc.scm.entity.vo.ws;

import java.util.Date;
import java.util.List;




public class HisOrderWebVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String orderno;	
	
	private String purloc;
	
	private String recloc;
	
	private String desction;
	
	private String remark;
	
	private String emflag;
	
	private Date deliverdate;
	
	private String hopname;
	
	private String vendorname;
	
	private Date planDate;
	
	private List<HisOrderItmWebVo> hisOrderItmWebVos;

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
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

	public Date getDeliverdate() {
		return deliverdate;
	}

	public void setDeliverdate(Date deliverdate) {
		this.deliverdate = deliverdate;
	}

	public String getHopname() {
		return hopname;
	}

	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public List<HisOrderItmWebVo> getHisOrderItmWebVos() {
		return hisOrderItmWebVos;
	}

	public void setHisOrderItmWebVos(List<HisOrderItmWebVo> hisOrderItmWebVos) {
		this.hisOrderItmWebVos = hisOrderItmWebVos;
	}

	
	
	
	
}
