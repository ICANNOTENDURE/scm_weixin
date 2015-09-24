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
 * The persistent class for the T_ORD_ORDER database table.
 * 
 */
@Entity
@Table(name="T_ORD_ORD")
public class Ord implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="ord_id", unique=true, nullable=false)
	private String ordId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ORD_DATE")
	private Date ordDate;
	
	@Column(name="ORD_HOP_ID")
	private Long ordHopId;

	@Column(name="ORD_LOC_ID")
	private Long ordLocId;
	
	@Column(name="ORD_No")
	private String ordNo;
	
	@Column(name="ORD_CMPFLAG")
	private String ordCmpFlag;
	
	
	
	public String getOrdCmpFlag() {
		return ordCmpFlag;
	}

	public void setOrdCmpFlag(String ordCmpFlag) {
		this.ordCmpFlag = ordCmpFlag;
	}

	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	/**
	 * @return the ordId
	 */
	public String getOrdId() {
		return ordId;
	}

	/**
	 * @param ordId the ordId to set
	 */
	public void setOrdId(String ordId) {
		this.ordId = ordId;
	}

	/**
	 * @return the ordDate
	 */
	public Date getOrdDate() {
		return ordDate;
	}

	/**
	 * @param ordDate the ordDate to set
	 */
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}

	/**
	 * @return the ordHopId
	 */
	public Long getOrdHopId() {
		return ordHopId;
	}

	/**
	 * @param ordHopId the ordHopId to set
	 */
	public void setOrdHopId(Long ordHopId) {
		this.ordHopId = ordHopId;
	}

	/**
	 * @return the ordLocId
	 */
	public Long getOrdLocId() {
		return ordLocId;
	}

	/**
	 * @param ordLocId the ordLocId to set
	 */
	public void setOrdLocId(Long ordLocId) {
		this.ordLocId = ordLocId;
	}

	

}
