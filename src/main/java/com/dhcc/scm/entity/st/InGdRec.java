package com.dhcc.scm.entity.st;

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


@Entity
@Table(name="t_st_ingdrec")
public class InGdRec implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ingdrec_id", unique=true, nullable=false)
	private Long ingdrecId;
	
	@Column(name="ingdrec_locid")
	private Long ingdrecLocId;
	
	@Column(name="ingdrec_venid")
	private Long ingdrecVenId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ingdrec_date")
	private Date wxMpUnionid;
	
	@Column(name="ingdrec_status")
	private String ingdrecStatus;
	
	@Column(name="ingdrec_remark")
	private String ingdrecRemark;

	public Long getIngdrecId() {
		return ingdrecId;
	}

	public void setIngdrecId(Long ingdrecId) {
		this.ingdrecId = ingdrecId;
	}

	public Long getIngdrecLocId() {
		return ingdrecLocId;
	}

	public void setIngdrecLocId(Long ingdrecLocId) {
		this.ingdrecLocId = ingdrecLocId;
	}

	public Long getIngdrecVenId() {
		return ingdrecVenId;
	}

	public void setIngdrecVenId(Long ingdrecVenId) {
		this.ingdrecVenId = ingdrecVenId;
	}

	public Date getWxMpUnionid() {
		return wxMpUnionid;
	}

	public void setWxMpUnionid(Date wxMpUnionid) {
		this.wxMpUnionid = wxMpUnionid;
	}

	public String getIngdrecStatus() {
		return ingdrecStatus;
	}

	public void setIngdrecStatus(String ingdrecStatus) {
		this.ingdrecStatus = ingdrecStatus;
	}

	public String getIngdrecRemark() {
		return ingdrecRemark;
	}

	public void setIngdrecRemark(String ingdrecRemark) {
		this.ingdrecRemark = ingdrecRemark;
	}
	
	
	
}