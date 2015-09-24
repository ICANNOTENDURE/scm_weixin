package com.dhcc.scm.entity.vo.ven;

import java.util.Date;




public class DeliverItmVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String deliveritmid;
	
	private String venincncode;
	
	private String venincname;
	
	private String hopincname;
	
	private Long hopincid;
	
	private String uom;
	
	private Float deliverqty;
	
	private Float orderqty;
	
	private Float sendedqty;
	
	private String batno;
	
	private String invno;
	
	private Date expdate;
	
	private Float rp;
	
	private Float rpamt;
	
	private String manf;
	
	private Long orderitmid;
	
	private String hopname;
	
	private Long state;

	public Long getState() {
		return state;
	}

	public void setState(Long state) {
		this.state = state;
	}

	public String getHopname() {
		return hopname;
	}

	public void setHopname(String hopname) {
		this.hopname = hopname;
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
	 * @return the hopincid
	 */
	public Long getHopincid() {
		return hopincid;
	}

	/**
	 * @param hopincid the hopincid to set
	 */
	public void setHopincid(Long hopincid) {
		this.hopincid = hopincid;
	}

	/**
	 * @return the deliveritmid
	 */
	public String getDeliveritmid() {
		return deliveritmid;
	}

	/**
	 * @param deliveritmid the deliveritmid to set
	 */
	public void setDeliveritmid(String deliveritmid) {
		this.deliveritmid = deliveritmid;
	}

	/**
	 * @return the venincncode
	 */
	public String getVenincncode() {
		return venincncode;
	}

	/**
	 * @param venincncode the venincncode to set
	 */
	public void setVenincncode(String venincncode) {
		this.venincncode = venincncode;
	}

	/**
	 * @return the venincname
	 */
	public String getVenincname() {
		return venincname;
	}

	/**
	 * @param venincname the venincname to set
	 */
	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	/**
	 * @return the hopincname
	 */
	public String getHopincname() {
		return hopincname;
	}

	/**
	 * @param hopincname the hopincname to set
	 */
	public void setHopincname(String hopincname) {
		this.hopincname = hopincname;
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
	 * @return the invno
	 */
	public String getInvno() {
		return invno;
	}

	/**
	 * @param invno the invno to set
	 */
	public void setInvno(String invno) {
		this.invno = invno;
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
	 * @return the deliverqty
	 */
	public Float getDeliverqty() {
		return deliverqty;
	}

	/**
	 * @param deliverqty the deliverqty to set
	 */
	public void setDeliverqty(Float deliverqty) {
		this.deliverqty = deliverqty;
	}

	/**
	 * @return the orderqty
	 */
	public Float getOrderqty() {
		return orderqty;
	}

	/**
	 * @param orderqty the orderqty to set
	 */
	public void setOrderqty(Float orderqty) {
		this.orderqty = orderqty;
	}

	/**
	 * @return the sendedqty
	 */
	public Float getSendedqty() {
		return sendedqty;
	}

	/**
	 * @param sendedqty the sendedqty to set
	 */
	public void setSendedqty(Float sendedqty) {
		this.sendedqty = sendedqty;
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

	/**
	 * @return the rpamt
	 */
	public Float getRpamt() {
		return rpamt;
	}

	/**
	 * @param rpamt the rpamt to set
	 */
	public void setRpamt(Float rpamt) {
		this.rpamt = rpamt;
	}
	
	
	
}
