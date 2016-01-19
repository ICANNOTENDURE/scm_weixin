package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_HOP_INC database table.
 * 
 */
@Entity
@Table(name="T_HOP_INC_LOC")
public class HopIncLoc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_INC_LOC")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="INCLOC_ID", unique=true, nullable=false)
	private Long incLocId;
	
	
	@Column(name="INCLOC_PARREFID")
	private Long incLocParrefId;
	
	@Column(name="INCLOC_LOCID")
	private Long incLocLocId;

	@Column(name="INCLOC_QTY")
	private Float incLocQty;
	
	@Column(name="INCLOC_MAXQTY")
	private Float incLocMaxQty;
	
	@Column(name="INCLOC_MINQTY")
	private Float incLocMinQty;
	
	@Column(name="INCLOC_StandQTY")
	private Float incLocStandQty;
	
	@Transient
	private String incname;
	
	@Transient
	private String uom;
	
	
	
	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getIncname() {
		return incname;
	}

	public void setIncname(String incname) {
		this.incname = incname;
	}

	public Long getIncLocId() {
		return incLocId;
	}

	public void setIncLocId(Long incLocId) {
		this.incLocId = incLocId;
	}

	public Long getIncLocParrefId() {
		return incLocParrefId;
	}

	public void setIncLocParrefId(Long incLocParrefId) {
		this.incLocParrefId = incLocParrefId;
	}

	public Long getIncLocLocId() {
		return incLocLocId;
	}

	public void setIncLocLocId(Long incLocLocId) {
		this.incLocLocId = incLocLocId;
	}

	public Float getIncLocQty() {
		return incLocQty;
	}

	public void setIncLocQty(Float incLocQty) {
		this.incLocQty = incLocQty;
	}

	public Float getIncLocMaxQty() {
		return incLocMaxQty;
	}

	public void setIncLocMaxQty(Float incLocMaxQty) {
		this.incLocMaxQty = incLocMaxQty;
	}

	public Float getIncLocMinQty() {
		return incLocMinQty;
	}

	public void setIncLocMinQty(Float incLocMinQty) {
		this.incLocMinQty = incLocMinQty;
	}

	public Float getIncLocStandQty() {
		return incLocStandQty;
	}

	public void setIncLocStandQty(Float incLocStandQty) {
		this.incLocStandQty = incLocStandQty;
	}
	
	
}