package com.dhcc.scm.entity.ord;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the T_ORD_ORDER database table.
 * 
 */
@Entity
@Table(name="T_ORD_PLAN")
public class OrderPlan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_ORD_ORDER_PLAN_GENERATOR", sequenceName="SEQUENCE_ORD_PLAN")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_ORD_ORDER_PLAN_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PLAN_ID")
	private Long planId;

	@Temporal(TemporalType.DATE)
	@Column(name="PLAN_DATE")
	private Date planDate;
	
	@Column(name="PLAN_FLAG")
	private String planFlag;

	@Column(name="PLAN_NO")
	private String planNo;

	@Column(name="PLAN_CTLOC")
	private Long planCtloc;

	@Column(name="PLAN_USERID")
	private Long planUserId;
	
	@Column(name="PLAN_INCID")
	private Long planIncId;
	
	@Column(name="PLAN_VENINCID")
	private Long planVenIncId;
	
	@Column(name="PLAN_VENDORID")
	private Long planVendorId;
	
	@Column(name="PLAN_QTY")
	private Float planQty;

	public Long getPlanId() {
		return planId;
	}

	public void setPlanId(Long planId) {
		this.planId = planId;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getPlanFlag() {
		return planFlag;
	}

	public void setPlanFlag(String planFlag) {
		this.planFlag = planFlag;
	}

	public String getPlanNo() {
		return planNo;
	}

	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}

	public Long getPlanCtloc() {
		return planCtloc;
	}

	public void setPlanCtloc(Long planCtloc) {
		this.planCtloc = planCtloc;
	}

	public Long getPlanUserId() {
		return planUserId;
	}

	public void setPlanUserId(Long planUserId) {
		this.planUserId = planUserId;
	}

	public Long getPlanIncId() {
		return planIncId;
	}

	public void setPlanIncId(Long planIncId) {
		this.planIncId = planIncId;
	}

	public Long getPlanVenIncId() {
		return planVenIncId;
	}

	public void setPlanVenIncId(Long planVenIncId) {
		this.planVenIncId = planVenIncId;
	}

	public Long getPlanVendorId() {
		return planVendorId;
	}

	public void setPlanVendorId(Long planVendorId) {
		this.planVendorId = planVendorId;
	}

	public Float getPlanQty() {
		return planQty;
	}

	public void setPlanQty(Float planQty) {
		this.planQty = planQty;
	}
	
	
}
