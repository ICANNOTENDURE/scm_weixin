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
import java.util.Date;

/**
 * @author Administrator
 *
 */
public class HisInvInfoItmWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long deliveritmid;
	
	private String batno;
	
	private Date expdate;
	
	private String hopinccode;
	
	private float rp;
	
	private float qty;
	
	private float rpamt;
	
	private String orderno;
	
	private String invno;
	
	private Date invdate;
	
	
	
	public String getInvno() {
		return invno;
	}

	public void setInvno(String invno) {
		this.invno = invno;
	}

	public Date getInvdate() {
		return invdate;
	}

	public void setInvdate(Date invdate) {
		this.invdate = invdate;
	}

	/**
	 * @return the batno
	 */
	public String getBatno() {
		return batno;
	}

	/**
	 * @param batno the batno to set
	 */
	public void setBatno(String batno) {
		this.batno = batno;
	}

	/**
	 * @return the expdate
	 */
	public Date getExpdate() {
		return expdate;
	}

	/**
	 * @param expdate the expdate to set
	 */
	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	/**
	 * @return the hopinccode
	 */
	public String getHopinccode() {
		return hopinccode;
	}

	/**
	 * @param hopinccode the hopinccode to set
	 */
	public void setHopinccode(String hopinccode) {
		this.hopinccode = hopinccode;
	}

	/**
	 * @return the rp
	 */
	public float getRp() {
		return rp;
	}

	/**
	 * @param rp the rp to set
	 */
	public void setRp(float rp) {
		this.rp = rp;
	}

	/**
	 * @return the qty
	 */
	public float getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(float qty) {
		this.qty = qty;
	}

	/**
	 * @return the rpamt
	 */
	public float getRpamt() {
		return rpamt;
	}

	/**
	 * @param rpamt the rpamt to set
	 */
	public void setRpamt(float rpamt) {
		this.rpamt = rpamt;
	}

	/**
	 * @return the deliveritmid
	 */
	public Long getDeliveritmid() {
		return deliveritmid;
	}

	/**
	 * @param deliveritmid the deliveritmid to set
	 */
	public void setDeliveritmid(Long deliveritmid) {
		this.deliveritmid = deliveritmid;
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
	
	
	
}
