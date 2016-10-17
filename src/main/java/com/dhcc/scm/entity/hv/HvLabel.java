package com.dhcc.scm.entity.hv;

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

@Entity
@Table(name="t_hv_label")
public class HvLabel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="hv_id", unique=true, nullable=false, precision=22)
	private Long hvId;
	
	@Temporal(TemporalType.DATE)
	@Column(name="hv_orddate")
	private Date hvOrdDate;
	
	@Column(name="hv_label")
	private String hvLabel;
	
	@Column(name="hv_venincid")
	private Long hvVenIncId;
	
	@Column(name="hv_hopid")
	private Long hvHopId;
	
	@Column(name="hv_invno")
	private String hvInvNo;
	
	@Column(name="hv_invnodate")
	private Date hvInvNoDate;
	
	@Column(name="hv_qty")
	private Float hvQty;
	
	@Column(name="hv_flag")
	private String hvFlag;
	
	@Column(name="hv_vendorid")
	private Long hvVendorId;
	
	@Column(name="hv_rp")
	private Float hvRp;
	
	@Column(name="hv_recno")
	private String hvRecNo;
	
	
	
	public String getHvRecNo() {
		return hvRecNo;
	}

	public void setHvRecNo(String hvRecNo) {
		this.hvRecNo = hvRecNo;
	}

	public Float getHvRp() {
		return hvRp;
	}

	public void setHvRp(Float hvRp) {
		this.hvRp = hvRp;
	}

	public Long getHvVenIncId() {
		return hvVenIncId;
	}

	public void setHvVenIncId(Long hvVenIncId) {
		this.hvVenIncId = hvVenIncId;
	}

	public Long getHvVendorId() {
		return hvVendorId;
	}

	public void setHvVendorId(Long hvVendorId) {
		this.hvVendorId = hvVendorId;
	}

	public String getHvFlag() {
		return hvFlag;
	}

	public void setHvFlag(String hvFlag) {
		this.hvFlag = hvFlag;
	}

	public Long getHvId() {
		return hvId;
	}

	public void setHvId(Long hvId) {
		this.hvId = hvId;
	}

	public Date getHvOrdDate() {
		return hvOrdDate;
	}

	public void setHvOrdDate(Date hvOrdDate) {
		this.hvOrdDate = hvOrdDate;
	}

	public String getHvLabel() {
		return hvLabel;
	}

	public void setHvLabel(String hvLabel) {
		this.hvLabel = hvLabel;
	}



	public Long getHvHopId() {
		return hvHopId;
	}

	public void setHvHopId(Long hvHopId) {
		this.hvHopId = hvHopId;
	}

	public String getHvInvNo() {
		return hvInvNo;
	}

	public void setHvInvNo(String hvInvNo) {
		this.hvInvNo = hvInvNo;
	}

	public Date getHvInvNoDate() {
		return hvInvNoDate;
	}

	public void setHvInvNoDate(Date hvInvNoDate) {
		this.hvInvNoDate = hvInvNoDate;
	}

	public Float getHvQty() {
		return hvQty;
	}

	public void setHvQty(Float hvQty) {
		this.hvQty = hvQty;
	}
	
	
	
}
