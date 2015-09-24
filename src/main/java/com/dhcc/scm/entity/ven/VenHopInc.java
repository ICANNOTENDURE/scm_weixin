package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_VEN_INC database table.
 * 
 */
@Entity
@Table(name="T_VEN_HOP_INC")
public class VenHopInc implements Serializable {


	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="ven_hop_inc_ID", unique=true, nullable=false)
	private String venHopIncId;
	
	@Column(name="HOP_INC_ID")
	private Long hopIncId;
	
	@Column(name="VEN_INC_ID")
	private Long venIncId;

	@Column(name="VEN_INC_FAC")
	private Float venIncFac;
	
	@Column(name="VEN_FAC")
	private Float venFac;
	
	@Column(name="HOP_FAC")
	private Float hopFac;
	
	@Column(name="VEN_HOP_AUDITFLAG")
	private String venHopAuditflag;
	
	
	
	
	public String getVenHopAuditflag() {

		return venHopAuditflag;
	}

	public void setVenHopAuditflag(String venHopAuditflag) {

		this.venHopAuditflag = venHopAuditflag;
	}

	/**
	 * @return the venFac
	 */
	public Float getVenFac() {
		return venFac;
	}

	/**
	 * @param venFac the venFac to set
	 */
	public void setVenFac(Float venFac) {
		this.venFac = venFac;
	}

	/**
	 * @return the hopFac
	 */
	public Float getHopFac() {
		
		return hopFac;
	}

	/**
	 * @param hopFac the hopFac to set
	 */
	public void setHopFac(Float hopFac) {
		this.hopFac = hopFac;
	}

	/**
	 * @return the venHopIncId
	 */
	public String getVenHopIncId() {
		return venHopIncId;
	}

	/**
	 * @param venHopIncId the venHopIncId to set
	 */
	public void setVenHopIncId(String venHopIncId) {
		this.venHopIncId = venHopIncId;
	}

	/**
	 * @return the hopIncId
	 */
	public Long getHopIncId() {
		return hopIncId;
	}

	/**
	 * @param hopIncId the hopIncId to set
	 */
	public void setHopIncId(Long hopIncId) {
		this.hopIncId = hopIncId;
	}

	/**
	 * @return the venIncId
	 */
	public Long getVenIncId() {
		return venIncId;
	}

	/**
	 * @param venIncId the venIncId to set
	 */
	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}

	/**
	 * @return the venIncFac
	 */
	public Float getVenIncFac() {
		this.venIncFac=this.venFac/this.hopFac;
		return venIncFac;
	}

	/**
	 * @param venIncFac the venIncFac to set
	 */
	public void setVenIncFac(Float venIncFac) {
		this.venIncFac = venIncFac;
	}
	
	
	
	
}