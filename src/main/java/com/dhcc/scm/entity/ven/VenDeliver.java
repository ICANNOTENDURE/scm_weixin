package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;


/**
 * The persistent class for the T_VEN_DELIVER database table.
 * 
 */
@Entity
@Table(name="T_VEN_DELIVER")
public class VenDeliver implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long deliverId;
	private Timestamp deliverArrdate;
	private Timestamp deliverDate;
	private Long deliverDestinationid;
	private Long deliverExestateid;
	private Long deliverHopid;
	private Long deliverOrderid;
	private Long deliverPurloc;
	private Timestamp deliverRecdate;
	private Long deliverRecloc;
	private Long deliverRecuserid;
	private String deliverRemark;
	private Long deliverUserid;
	private Long deliverVendorid;
	private Timestamp deliverAccpecctDate;
	private Long deliverAccpUserId;
	private Long hopVendorId;
	private String deliverWpsId;
	private String deliverNo;
	
	public VenDeliver() {
	}


	@Id
	//@SequenceGenerator(name="T_VEN_DELIVER_DELIVERID_GENERATOR", sequenceName="SEQUENCE_VEN_DELIVER")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_VEN_DELIVER_DELIVERID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="DELIVER_ROWID")
	public Long getDeliverId() {
		return this.deliverId;
	}

	public void setDeliverId(Long deliverId) {
		this.deliverId = deliverId;
	}


	@Column(name="DELIVER_ARRDATE")
	public Timestamp getDeliverArrdate() {
		return this.deliverArrdate;
	}

	public void setDeliverArrdate(Timestamp deliverArrdate) {
		this.deliverArrdate = deliverArrdate;
	}


	@Column(name="DELIVER_DATE")
	public Timestamp getDeliverDate() {
		return this.deliverDate;
	}

	public void setDeliverDate(Timestamp deliverDate) {
		this.deliverDate = deliverDate;
	}


	@Column(name="DELIVER_DESTINATIONID")
	public Long getDeliverDestinationid() {
		return this.deliverDestinationid;
	}

	public void setDeliverDestinationid(Long deliverDestinationid) {
		this.deliverDestinationid = deliverDestinationid;
	}


	@Column(name="DELIVER_EXESTATEID")
	public Long getDeliverExestateid() {
		return this.deliverExestateid;
	}

	public void setDeliverExestateid(Long deliverExestateid) {
		this.deliverExestateid = deliverExestateid;
	}


	@Column(name="DELIVER_HOPID")
	public Long getDeliverHopid() {
		return this.deliverHopid;
	}

	public void setDeliverHopid(Long deliverHopid) {
		this.deliverHopid = deliverHopid;
	}


	@Column(name="DELIVER_ORDERID")
	public Long getDeliverOrderid() {
		return this.deliverOrderid;
	}

	public void setDeliverOrderid(Long deliverOrderid) {
		this.deliverOrderid = deliverOrderid;
	}


	@Column(name="DELIVER_PURLOC")
	public Long getDeliverPurloc() {
		return this.deliverPurloc;
	}

	public void setDeliverPurloc(Long deliverPurloc) {
		this.deliverPurloc = deliverPurloc;
	}


	@Column(name="DELIVER_RECDATE")
	public Timestamp getDeliverRecdate() {
		return this.deliverRecdate;
	}

	public void setDeliverRecdate(Timestamp deliverRecdate) {
		this.deliverRecdate = deliverRecdate;
	}


	@Column(name="DELIVER_RECLOC")
	public Long getDeliverRecloc() {
		return this.deliverRecloc;
	}

	public void setDeliverRecloc(Long deliverRecloc) {
		this.deliverRecloc = deliverRecloc;
	}


	@Column(name="DELIVER_RECUSERID")
	public Long getDeliverRecuserid() {
		return this.deliverRecuserid;
	}

	public void setDeliverRecuserid(Long deliverRecuserid) {
		this.deliverRecuserid = deliverRecuserid;
	}


	@Column(name="DELIVER_REMARK")
	public String getDeliverRemark() {
		return this.deliverRemark;
	}

	public void setDeliverRemark(String deliverRemark) {
		this.deliverRemark = deliverRemark;
	}


	@Column(name="DELIVER_USERID")
	public Long getDeliverUserid() {
		return this.deliverUserid;
	}

	public void setDeliverUserid(Long deliverUserid) {
		this.deliverUserid = deliverUserid;
	}


	@Column(name="DELIVER_VENDORID")
	public Long getDeliverVendorid() {
		return this.deliverVendorid;
	}

	public void setDeliverVendorid(Long deliverVendorid) {
		this.deliverVendorid = deliverVendorid;
	}


	/**
	 * @return the deliverAccpecctDate
	 */
	@Column(name="DELIVER_ACCPECTDATE")
	public Timestamp getDeliverAccpecctDate() {
		return deliverAccpecctDate;
	}


	/**
	 * @param deliverAccpecctDate the deliverAccpecctDate to set
	 */
	public void setDeliverAccpecctDate(Timestamp deliverAccpecctDate) {
		this.deliverAccpecctDate = deliverAccpecctDate;
	}


	/**
	 * @return the deliverAccpUserId
	 */
	@Column(name="DELIVER_ACCPUSERID")
	public Long getDeliverAccpUserId() {
		return deliverAccpUserId;
	}


	/**
	 * @param deliverAccpUserId the deliverAccpUserId to set
	 */
	public void setDeliverAccpUserId(Long deliverAccpUserId) {
		this.deliverAccpUserId = deliverAccpUserId;
	}


	/**
	 * @return the hopVendorId
	 */
	@Column(name="DELIVER_HOPVENDORID")
	public Long getHopVendorId() {
		return hopVendorId;
	}


	/**
	 * @param hopVendorId the hopVendorId to set
	 */
	public void setHopVendorId(Long hopVendorId) {
		this.hopVendorId = hopVendorId;
	}


	/**
	 * @return the deliverWpsId
	 */
	@Column(name="DELIVER_WPSID")
	public String getDeliverWpsId() {
		return deliverWpsId;
	}


	/**
	 * @param deliverWpsId the deliverWpsId to set
	 */
	public void setDeliverWpsId(String deliverWpsId) {
		this.deliverWpsId = deliverWpsId;
	}


	/**
	 * @return the deliverNo
	 */
	@Column(name="DELIVER_NO")
	public String getDeliverNo() {
		return deliverNo;
	}


	/**
	 * @param deliverNo the deliverNo to set
	 */
	public void setDeliverNo(String deliverNo) {
		this.deliverNo = deliverNo;
	}
	
	
	
}