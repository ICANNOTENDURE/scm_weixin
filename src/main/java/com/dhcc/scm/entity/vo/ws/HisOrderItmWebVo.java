package com.dhcc.scm.entity.vo.ws;





public class HisOrderItmWebVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String hopIncCode;
	
	private Float qty;
	
	private Float rp;

	/**
	 * @return the hopIncCode
	 */
	public String getHopIncCode() {
		return hopIncCode;
	}

	/**
	 * @param hopIncCode the hopIncCode to set
	 */
	public void setHopIncCode(String hopIncCode) {
		this.hopIncCode = hopIncCode;
	}

	/**
	 * @return the qty
	 */
	public Float getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(Float qty) {
		this.qty = qty;
	}

	/**
	 * @return the rp
	 */
	public Float getRp() {
		return rp;
	}

	/**
	 * @param rp the rp to set
	 */
	public void setRp(Float rp) {
		this.rp = rp;
	}
	
	
	
}
