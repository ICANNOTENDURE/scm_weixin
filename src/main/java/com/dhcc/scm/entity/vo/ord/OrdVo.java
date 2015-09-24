package com.dhcc.scm.entity.vo.ord;




public class OrdVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long orderid;
	
	private Long orderitmid;
	
	private String inccode;
	
	private String incname;
	
	private Long qty;
	
	private String uom;
	
	private String manf;
	
	private Long rp;
	
	private String vendor;
	
	private String state;

	
	private String spec;
	
	



	/**
	 * @return the vendor
	 */
	public String getVendor() {
		return vendor;
	}

	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
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
	 * @return the orderitmid
	 */
	public Long getOrderitmid() {
		return orderitmid;
	}

	/**
	 * @param orderitmid the orderitmid to set
	 */
	public void setOrderitmid(Long orderitmid) {
		this.orderitmid = orderitmid;
	}



	/**
	 * @return the inccode
	 */
	public String getInccode() {
		return inccode;
	}

	/**
	 * @param inccode the inccode to set
	 */
	public void setInccode(String inccode) {
		this.inccode = inccode;
	}

	/**
	 * @return the incname
	 */
	public String getIncname() {
		return incname;
	}

	/**
	 * @param incname the incname to set
	 */
	public void setIncname(String incname) {
		this.incname = incname;
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
	 * @return the manf
	 */
	public String getManf() {
		return manf;
	}

	/**
	 * @param manf the manf to set
	 */
	public void setManf(String manf) {
		this.manf = manf;
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

	/**
	 * @return the spec
	 */
	public String getSpec() {
		return spec;
	}

	/**
	 * @param spec the spec to set
	 */
	public void setSpec(String spec) {
		this.spec = spec;
	}
	
	
	
	
		
}
