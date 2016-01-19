package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the T_VEN_DELIVERITM database table.
 * 
 */
@Entity
@Table(name="T_VEN_DELIVERITM")
public class VenDeliveritm implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long deliveritmId;
	private String deliveritmBatno;
	private Date deliveritmExpdate;
	private Long deliveritmHopincid;
	private String deliveritmInvnoe;
	private Long deliveritmOrderitmid;
	private Long deliveritmParentid;
	private Float deliveritmQty;
	private Float deliveritmRp;
	private Float deliveritmRpamt;
	private String deliveritmUom;
	private Long deliveritmVenincid;
    
	private String deliveritmHisUom;
	private Float deliveritmHisQty;
	private Float deliveritmHisRp;
	private Float deliveritmFac;
	private String deliveritmWpsId;
	private String deliveritmRecFlag;
	
	public VenDeliveritm() {
	}


	@Id
	//@SequenceGenerator(name="T_VEN_DELIVERITM_DELIVERITMID_GENERATOR", sequenceName="SEQUENCE_VEN_DELIVERITM")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_VEN_DELIVERITM_DELIVERITMID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="DELIVERITM_ID")
	public Long getDeliveritmId() {
		return this.deliveritmId;
	}

	public void setDeliveritmId(Long deliveritmId) {
		this.deliveritmId = deliveritmId;
	}


	@Column(name="DELIVERITM_BATNO")
	public String getDeliveritmBatno() {
		return this.deliveritmBatno;
	}

	public void setDeliveritmBatno(String deliveritmBatno) {
		this.deliveritmBatno = deliveritmBatno;
	}


	@Temporal(TemporalType.DATE)
	@Column(name="DELIVERITM_EXPDATE")
	public Date getDeliveritmExpdate() {
		return this.deliveritmExpdate;
	}

	public void setDeliveritmExpdate(Date deliveritmExpdate) {
		this.deliveritmExpdate = deliveritmExpdate;
	}


	@Column(name="DELIVERITM_HOPINCID")
	public Long getDeliveritmHopincid() {
		return this.deliveritmHopincid;
	}

	public void setDeliveritmHopincid(Long deliveritmHopincid) {
		this.deliveritmHopincid = deliveritmHopincid;
	}


	@Column(name="DELIVERITM_INVNOE")
	public String getDeliveritmInvnoe() {
		return this.deliveritmInvnoe;
	}

	public void setDeliveritmInvnoe(String deliveritmInvnoe) {
		this.deliveritmInvnoe = deliveritmInvnoe;
	}


	@Column(name="DELIVERITM_ORDERITMID")
	public Long getDeliveritmOrderitmid() {
		return this.deliveritmOrderitmid;
	}

	public void setDeliveritmOrderitmid(Long deliveritmOrderitmid) {
		this.deliveritmOrderitmid = deliveritmOrderitmid;
	}


	@Column(name="DELIVERITM_PARENTID")
	public Long getDeliveritmParentid() {
		return this.deliveritmParentid;
	}

	public void setDeliveritmParentid(Long deliveritmParentid) {
		this.deliveritmParentid = deliveritmParentid;
	}


	@Column(name="DELIVERITM_QTY")
	public Float getDeliveritmQty() {
		return this.deliveritmQty;
	}

	public void setDeliveritmQty(Float deliveritmQty) {
		this.deliveritmQty = deliveritmQty;
	}


	@Column(name="DELIVERITM_RP")
	public Float getDeliveritmRp() {
		return this.deliveritmRp;
	}

	public void setDeliveritmRp(Float deliveritmRp) {
		this.deliveritmRp = deliveritmRp;
	}


	@Column(name="DELIVERITM_RPAMT")
	public Float getDeliveritmRpamt() {
		return this.deliveritmRpamt;
	}

	public void setDeliveritmRpamt(Float deliveritmRpamt) {
		this.deliveritmRpamt = deliveritmRpamt;
	}


	@Column(name="DELIVERITM_UOM")
	public String getDeliveritmUom() {
		return this.deliveritmUom;
	}

	public void setDeliveritmUom(String deliveritmUom) {
		this.deliveritmUom = deliveritmUom;
	}


	@Column(name="DELIVERITM_VENINCID")
	public Long getDeliveritmVenincid() {
		return this.deliveritmVenincid;
	}

	public void setDeliveritmVenincid(Long deliveritmVenincid) {
		this.deliveritmVenincid = deliveritmVenincid;
	}


	/**
	 * @return the deliveritmHisUom
	 */
	@Column(name="DELIVERITM_HISUOM")
	public String getDeliveritmHisUom() {
		return deliveritmHisUom;
	}


	/**
	 * @param deliveritmHisUom the deliveritmHisUom to set
	 */
	public void setDeliveritmHisUom(String deliveritmHisUom) {
		this.deliveritmHisUom = deliveritmHisUom;
	}


	/**
	 * @return the deliveritmHisQty
	 */
	@Column(name="DELIVERITM_HISQTY")
	public Float getDeliveritmHisQty() {
		return deliveritmHisQty;
	}


	/**
	 * @param deliveritmHisQty the deliveritmHisQty to set
	 */
	public void setDeliveritmHisQty(Float deliveritmHisQty) {
		this.deliveritmHisQty = deliveritmHisQty;
	}


	/**
	 * @return the deliveritmHisRp
	 */
	@Column(name="DELIVERITM_HISRP")
	public Float getDeliveritmHisRp() {
		return deliveritmHisRp;
	}


	/**
	 * @param deliveritmHisRp the deliveritmHisRp to set
	 */
	public void setDeliveritmHisRp(Float deliveritmHisRp) {
		this.deliveritmHisRp = deliveritmHisRp;
	}


	/**
	 * @return the deliveritmFac
	 */
	@Column(name="DELIVERITM_FAC")
	public Float getDeliveritmFac() {
		return deliveritmFac;
	}


	/**
	 * @param deliveritmFac the deliveritmFac to set
	 */
	public void setDeliveritmFac(Float deliveritmFac) {
		this.deliveritmFac = deliveritmFac;
	}


	/**
	 * @return the deliveritmWpsId
	 */
	@Column(name="DELIVERITM_WPSID")
	public String getDeliveritmWpsId() {
		return deliveritmWpsId;
	}


	/**
	 * @param deliveritmWpsId the deliveritmWpsId to set
	 */
	public void setDeliveritmWpsId(String deliveritmWpsId) {
		this.deliveritmWpsId = deliveritmWpsId;
	}


	/**
	 * @return the deliveritmRecFlag
	 */
	@Column(name="DELIVERITM_RECFLAG")
	public String getDeliveritmRecFlag() {
		return deliveritmRecFlag;
	}


	/**
	 * @param deliveritmRecFlag the deliveritmRecFlag to set
	 */
	public void setDeliveritmRecFlag(String deliveritmRecFlag) {
		this.deliveritmRecFlag = deliveritmRecFlag;
	}
    
	
	
	
}