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

/**
 * @author Administrator
 *
 */
public class VenIncItmWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String venIncCode;
	
	private String venIncName;
	
	private Float venIncPrice;
	
	private String venIncSpec;
	
	private Float venIncSp;
	
	private String venIncManf;
	
	private String venIncUom;
	
	private String venIncCat;

	/**
	 * @return the venIncCode
	 */
	public String getVenIncCode() {
		return venIncCode;
	}

	/**
	 * @param venIncCode the venIncCode to set
	 */
	public void setVenIncCode(String venIncCode) {
		this.venIncCode = venIncCode;
	}

	/**
	 * @return the venIncName
	 */
	public String getVenIncName() {
		return venIncName;
	}

	/**
	 * @param venIncName the venIncName to set
	 */
	public void setVenIncName(String venIncName) {
		this.venIncName = venIncName;
	}

	/**
	 * @return the venIncPrice
	 */
	public Float getVenIncPrice() {
		return venIncPrice;
	}

	/**
	 * @param venIncPrice the venIncPrice to set
	 */
	public void setVenIncPrice(Float venIncPrice) {
		this.venIncPrice = venIncPrice;
	}

	/**
	 * @return the venIncSpec
	 */
	public String getVenIncSpec() {
		return venIncSpec;
	}

	/**
	 * @param venIncSpec the venIncSpec to set
	 */
	public void setVenIncSpec(String venIncSpec) {
		this.venIncSpec = venIncSpec;
	}

	/**
	 * @return the venIncSp
	 */
	public Float getVenIncSp() {
		return venIncSp;
	}

	/**
	 * @param venIncSp the venIncSp to set
	 */
	public void setVenIncSp(Float venIncSp) {
		this.venIncSp = venIncSp;
	}

	/**
	 * @return the venIncManf
	 */
	public String getVenIncManf() {
		return venIncManf;
	}

	/**
	 * @param venIncManf the venIncManf to set
	 */
	public void setVenIncManf(String venIncManf) {
		this.venIncManf = venIncManf;
	}

	/**
	 * @return the venIncUom
	 */
	public String getVenIncUom() {
		return venIncUom;
	}

	/**
	 * @param venIncUom the venIncUom to set
	 */
	public void setVenIncUom(String venIncUom) {
		this.venIncUom = venIncUom;
	}

	/**
	 * @return the venIncCat
	 */
	public String getVenIncCat() {
		return venIncCat;
	}

	/**
	 * @param venIncCat the venIncCat to set
	 */
	public void setVenIncCat(String venIncCat) {
		this.venIncCat = venIncCat;
	}
	
	

}
