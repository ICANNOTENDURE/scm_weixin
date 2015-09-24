package com.dhcc.scm.entity.vo.ord;



public class ShopCartVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long inc;
	
	private Long qty;
	
	private String name;
	
	private Long rp;
	
	private String uom;
	
	
	
	

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the uom
	 */
	public String getUom() {
		return uom;
	}

	/**
	 * @param uom the uom to set
	 */
	public void setUom(String uom) {
		this.uom = uom;
	}

	

	/**
	 * @return the inc
	 */
	public Long getInc() {
		return inc;
	}

	/**
	 * @param inc the inc to set
	 */
	public void setInc(Long inc) {
		this.inc = inc;
	}

	/**
	 * @return the qty
	 */
	public Long getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(Long qty) {
		this.qty = qty;
	}



	/**
	 * @return the rp
	 */
	public Long getRp() {
		return rp;
	}

	/**
	 * @param rp the rp to set
	 */
	public void setRp(Long rp) {
		this.rp = rp;
	}

	
	
	
		
}
