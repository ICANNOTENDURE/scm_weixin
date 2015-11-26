package com.dhcc.scm.entity.ord;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_ORD_ORDERITM database table.
 * 
 */
@Entity
@Table(name="T_ORD_ORDERDETAILSUB")
public class OrderDetailSub implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="ORDSUB_ID", unique=true, nullable=false)
	private String ordSubId;
	
	@Column(name="ordsub_detail_id")
	private Long ordSubDetailId;

	@Column(name="ordsub_invno")
	private String ordSubInvNo;

	@Column(name="ordsub_batno")
	private String ordSubBatNo;
	
	@Temporal(TemporalType.DATE)
	@Column(name="ordsub_expdate")
	private Date ordSubExpDate;
		
	@Column(name="ordsub_userid")
	private Long ordSubUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ordsub_date")
	private Date ordSubDate;
	
	//Y: 发货
	//T:入库
	@Column(name="ordsub_status")
	private String ordSubStatus;
	
	@Column(name="ordsub_qty")
	private Float orderSubQty;
	
	@Column(name="ordsub_rp")
	private Float orderSubRp;
	
	@Column(name="ORDSUB_PRINTFLAG")
	private String orderSubPrintFlag;
	
	@Column(name="ORDSUB_HIS_QTY")
	private Float orderSubHisQty;
	
	@Column(name="ORDSUB_HIS_RP")
	private Float orderSubHisRp;
	
	@Column(name="ORDSUB_RPAMT")
	private Float orderSubRpAmt;
	
	
	@Column(name="ORDSUB_IMP_ID")
	private String orderSubImpId;
	
	
	
	public String getOrderSubImpId() {
		return orderSubImpId;
	}

	public void setOrderSubImpId(String orderSubImpId) {
		this.orderSubImpId = orderSubImpId;
	}

	public Float getOrderSubRpAmt() {
		return orderSubRpAmt;
	}

	public void setOrderSubRpAmt(Float orderSubRpAmt) {
		this.orderSubRpAmt = orderSubRpAmt;
	}

	public Float getOrderSubHisQty() {
		return orderSubHisQty;
	}

	public void setOrderSubHisQty(Float orderSubHisQty) {
		this.orderSubHisQty = orderSubHisQty;
	}

	public Float getOrderSubHisRp() {
		return orderSubHisRp;
	}

	public void setOrderSubHisRp(Float orderSubHisRp) {
		this.orderSubHisRp = orderSubHisRp;
	}

	public String getOrderSubPrintFlag() {
		return orderSubPrintFlag;
	}

	public void setOrderSubPrintFlag(String orderSubPrintFlag) {
		this.orderSubPrintFlag = orderSubPrintFlag;
	}

	public String getOrdSubId() {
		return ordSubId;
	}

	public void setOrdSubId(String ordSubId) {
		this.ordSubId = ordSubId;
	}

	public Long getOrdSubDetailId() {
		return ordSubDetailId;
	}

	public void setOrdSubDetailId(Long ordSubDetailId) {
		this.ordSubDetailId = ordSubDetailId;
	}

	public String getOrdSubInvNo() {
		return ordSubInvNo;
	}

	public void setOrdSubInvNo(String ordSubInvNo) {
		this.ordSubInvNo = ordSubInvNo;
	}

	public String getOrdSubBatNo() {
		return ordSubBatNo;
	}

	public void setOrdSubBatNo(String ordSubBatNo) {
		this.ordSubBatNo = ordSubBatNo;
	}

	public Date getOrdSubExpDate() {
		return ordSubExpDate;
	}

	public void setOrdSubExpDate(Date ordSubExpDate) {
		this.ordSubExpDate = ordSubExpDate;
	}

	public Long getOrdSubUserId() {
		return ordSubUserId;
	}

	public void setOrdSubUserId(Long ordSubUserId) {
		this.ordSubUserId = ordSubUserId;
	}

	public Date getOrdSubDate() {
		return ordSubDate;
	}

	public void setOrdSubDate(Date ordSubDate) {
		this.ordSubDate = ordSubDate;
	}

	public String getOrdSubStatus() {
		return ordSubStatus;
	}

	public void setOrdSubStatus(String ordSubStatus) {
		this.ordSubStatus = ordSubStatus;
	}

	public Float getOrderSubQty() {
		return orderSubQty;
	}

	public void setOrderSubQty(Float orderSubQty) {
		this.orderSubQty = orderSubQty;
	}

	public Float getOrderSubRp() {
		return orderSubRp;
	}

	public void setOrderSubRp(Float orderSubRp) {
		this.orderSubRp = orderSubRp;
	}


}
