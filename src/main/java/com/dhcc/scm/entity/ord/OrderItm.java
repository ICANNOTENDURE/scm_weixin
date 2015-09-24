package com.dhcc.scm.entity.ord;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


/**
 * The persistent class for the T_ORD_ORDERITM database table.
 * 
 */
@Entity
@Table(name="T_ORD_ORDERITM")
public class OrderItm implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="T_ORD_ORDERITM_ORDERITMID_GENERATOR", sequenceName="SEQUENCE_ORD_ORDERITM")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_ORD_ORDERITM_ORDERITMID_GENERATOR")
	@Column(name="ORDERITM_ID")
	private Long orderitmId;
	
	@Column(name="DELIVERQTY")
	private Float deliverqty;

	@Column(name="INC_ID")
	private Long incId;

	@Column(name="ORD_ID")
	private Long ordId;
	
	@Column(name="RECDESTINATION")
	private Long recdestination;
	
	@Column(name="RECLOC")
	private Long recloc;
	
	@Column(name="REQQTY")
	private Float reqqty;
	
	@Column(name="RP")
	private Float rp;
	
	@Column(name="UOM")
	private String uom;
	
	@Column(name="flag")
	private Long flag;
	
	
	@Column(name="VENUOMREQQTY")
	private Float venuomreqqty;
	
	@Column(name="VENUOMRP")
	private Float venrp;
	
	@Column(name="VENUOM")
	private String venuom;
	
	@Column(name="FAC")
	private Float fac;
	
	

	public OrderItm() {
	}

	public Long getOrderitmId() {
		return this.orderitmId;
	}

	public void setOrderitmId(Long orderitmId) {
		this.orderitmId = orderitmId;
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

	public Long getIncId() {
		return this.incId;
	}

	public void setIncId(Long incId) {
		this.incId = incId;
	}

	public Long getOrdId() {
		return this.ordId;
	}

	public void setOrdId(Long ordId) {
		this.ordId = ordId;
	}

	public Long getRecdestination() {
		return this.recdestination;
	}

	public void setRecdestination(Long recdestination) {
		this.recdestination = recdestination;
	}

	public Long getRecloc() {
		return this.recloc;
	}

	public void setRecloc(Long recloc) {
		this.recloc = recloc;
	}
	
	

	/**
	 * @return the reqqty
	 */
	public Float getReqqty() {
		return reqqty;
	}

	/**
	 * @param reqqty the reqqty to set
	 */
	public void setReqqty(Float reqqty) {
		this.reqqty = reqqty;
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
	 * @return the flag
	 */
	public Long getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(Long flag) {
		this.flag = flag;
	}

	public String getUom() {
		return this.uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}



	/**
	 * @return the venuomreqqty
	 */
	public Float getVenuomreqqty() {
		return venuomreqqty;
	}



	/**
	 * @param venuomreqqty the venuomreqqty to set
	 */
	public void setVenuomreqqty(Float venuomreqqty) {
		this.venuomreqqty = venuomreqqty;
	}



	/**
	 * @return the venrp
	 */
	public Float getVenrp() {
		return venrp;
	}



	/**
	 * @param venrp the venrp to set
	 */
	public void setVenrp(Float venrp) {
		this.venrp = venrp;
	}



	/**
	 * @return the venuom
	 */
	public String getVenuom() {
		return venuom;
	}



	/**
	 * @param venuom the venuom to set
	 */
	public void setVenuom(String venuom) {
		this.venuom = venuom;
	}



	/**
	 * @return the fac
	 */
	public Float getFac() {
		return fac;
	}



	/**
	 * @param fac the fac to set
	 */
	public void setFac(Float fac) {
		this.fac = fac;
	}
	
	
}
