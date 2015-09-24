package com.dhcc.scm.entity.vo.ord;



public class ShopCartPicVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long shop;
	
	private Long inc;
	
	private Long qty;
	
	private String name;
	
	private Long rp;
	
	private String uom;
	
	private String path;
	
	
	

	/**
	 * @return the shop
	 */
	public Long getShop() {
		return shop;
	}

	/**
	 * @param shop the shop to set
	 */
	public void setShop(Long shop) {
		this.shop = shop;
	}

	/**
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}

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
