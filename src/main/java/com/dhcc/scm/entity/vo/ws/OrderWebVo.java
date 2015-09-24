package com.dhcc.scm.entity.vo.ws;

import com.dhcc.framework.util.StringUtils;




public class OrderWebVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String orderno;
	
	private Long orderid;
	
	private String hopname;
	
	private String purloc;
	
	private String recloc;
	
	private String desction;
	
	private String remark;
	
	private String emflag;	
	
	private String veninccode;
	
	private String venincname;
	
	private Float hisqty;
	
	private String hisuom;
	
	private Float hisrp;
	
	private Float venqty;
	
	private String venuom;
	
	private Float venrp;
	
	private Float fac;
	
	private String hopincname;
	
	private String spec;
	
	private String manf;
	
	
	
	
	//private Date deliverdate;
	
	//private List<OrderItmWebVo> orderItmWSVos;
	
	//private String operateresuslt;
	
	//private String operateContent;
	
	


	public String getVeninccode() {
		return veninccode;
	}

	public void setVeninccode(String veninccode) {
		this.veninccode = veninccode;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	public Float getHisqty() {
		return hisqty;
	}

	public void setHisqty(Float hisqty) {
		this.hisqty = hisqty;
	}

	public String getHisuom() {
		return hisuom;
	}

	public void setHisuom(String hisuom) {
		this.hisuom = hisuom;
	}

	public Float getHisrp() {
		return hisrp;
	}

	public void setHisrp(Float hisrp) {
		this.hisrp = hisrp;
	}

	public Float getVenqty() {
		return venqty;
	}

	public void setVenqty(Float venqty) {
		this.venqty = venqty;
	}

	public String getVenuom() {
		return venuom;
	}

	public void setVenuom(String venuom) {
		this.venuom = venuom;
	}

	public Float getVenrp() {
		return venrp;
	}

	public void setVenrp(Float venrp) {
		this.venrp = venrp;
	}

	public Float getFac() {
		return fac;
	}

	public void setFac(Float fac) {
		this.fac = fac;
	}

	public String getHopincname() {
		return hopincname;
	}

	public void setHopincname(String hopincname) {
		this.hopincname = hopincname;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getManf() {
		return manf;
	}

	public void setManf(String manf) {
		this.manf = manf;
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
	 * @return the orderid
	 */
	public Long getOrderid() {
		return orderid;
	}

	/**
	 * @param orderid the orderid to set
	 */
	public void setOrderid(Long orderid) {
		this.orderid = orderid;
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
	public OrderWebVo() {
	}
	
	
	
}
