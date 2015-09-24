
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;

/**
 * 
 * @author Administrator
 *
 */
public class HisIncLocQtyItmWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * his 商品科室标识
	 */
	private String locCode;
	/**
	 * his 商品标识
	 */
    private String locIncCode;
    /**
     * his 商品库存
     */
    private Float locIncQty;
    
    private Float locIncMaxQty;
    
    private Float locIncMinQty;
    
    private Float locIncStandQty;

	public String getLocCode() {
		return locCode;
	}

	public void setLocCode(String locCode) {
		this.locCode = locCode;
	}

	public String getLocIncCode() {
		return locIncCode;
	}

	public void setLocIncCode(String locIncCode) {
		this.locIncCode = locIncCode;
	}

	public Float getLocIncQty() {
		return locIncQty;
	}

	public void setLocIncQty(Float locIncQty) {
		this.locIncQty = locIncQty;
	}

	public Float getLocIncMaxQty() {
		return locIncMaxQty;
	}

	public void setLocIncMaxQty(Float locIncMaxQty) {
		this.locIncMaxQty = locIncMaxQty;
	}

	public Float getLocIncMinQty() {
		return locIncMinQty;
	}

	public void setLocIncMinQty(Float locIncMinQty) {
		this.locIncMinQty = locIncMinQty;
	}

	public Float getLocIncStandQty() {
		return locIncStandQty;
	}

	public void setLocIncStandQty(Float locIncStandQty) {
		this.locIncStandQty = locIncStandQty;
	}
	
	
}
