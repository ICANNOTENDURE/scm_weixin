package com.dhcc.scm.entity.vo.ws;

import java.util.Date;
import java.util.List;

import com.dhcc.framework.util.StringUtils;




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
	
	
	
	

	/**
	 * @return the planDate
	 */
	public Date getPlanDate() {
		return planDate;
	}

	/**
	 * @param planDate the planDate to set
	 */
	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	/**
	 * @return the vendorname
	 */
	public String getVendorname() {
		return vendorname;
	}

	/**
	 * @param vendorname the vendorname to set
	 */
	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	/**
	 * @return the hopname
	 */
	public String getHopname() {
		return hopname;
	}

	/**
	 * @param hopname the hopname to set
	 */
	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	/**
	 * @return the deliverdate
	 */
	public Date getDeliverdate() {
		return deliverdate;
	}

	/**
	 * @param deliverdate the deliverdate to set
	 */
	public void setDeliverdate(Date deliverdate) {
		this.deliverdate = deliverdate;
	}

	
	/**
	 * @return the hisOrderItmWebVos
	 */
	public List<HisOrderItmWebVo> getHisOrderItmWebVos() {
		return hisOrderItmWebVos;
	}

	/**
	 * @param hisOrderItmWebVos the hisOrderItmWebVos to set
	 */
	public void setHisOrderItmWebVos(List<HisOrderItmWebVo> hisOrderItmWebVos) {
		this.hisOrderItmWebVos = hisOrderItmWebVos;
	}

	/**
	 * @return the orderno
	 */
	public String getOrderno() {
		return orderno;
	}

	/**
	 * @param orderno the orderno to set
	 */
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}


	/**
	 * @return the purloc
	 */
	public String getPurloc() {
		return purloc;
	}

	/**
	 * @param purloc the purloc to set
	 */
	public void setPurloc(String purloc) {
		this.purloc = purloc;
	}

	/**
	 * @return the recloc
	 */
	public String getRecloc() {
		return recloc;
	}

	/**
	 * @param recloc the recloc to set
	 */
	public void setRecloc(String recloc) {
		this.recloc = recloc;
	}

	/**
	 * @return the desction
	 */
	public String getDesction() {
			return desction;
	}

	/**
	 * @param desction the desction to set
	 */
	public void setDesction(String desction) {
		this.desction = desction;
	}
	
	
	
	
	
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	

	/**
	 * @return the emflag
	 */
	public String getEmflag() {
		if(!StringUtils.isNullOrEmpty(emflag)){
			if(emflag.equals("checked")){
				emflag="Y";
			}
		}
		return emflag;
	}

	/**
	 * @param emflag the emflag to set
	 */
	public void setEmflag(String emflag) {
		this.emflag = emflag;
	}

	/**
	 * 
	 */
	public HisOrderWebVo() {
	}
	
	
	
}
