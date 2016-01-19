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
@Table(name="T_HOP_INC")
public class HopInc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_INC")})
	@GeneratedValue(generator="idGenerator")	
//	@GenericGenerator(name="idGenerator",strategy="uuid")
//	@GeneratedValue(generator="idGenerator")
	@GenericGenerator(name="idGenerator",strategy="identity")
	@Column(name="INC_ID", unique=true, nullable=false, precision=22)
	private Long incId;

	@Column(name="INC_BUOMCODE", length=50)
	private String incBuomcode;

	@Column(name="INC_BUOMNAME", length=50)
	private String incBuomname;

	@Column(name="INC_CODE", length=50)
	private String incCode;

	@Column(name="INC_FAC", precision=22)
	private Long incFac;

	@Column(name="INC_HISSYSID", precision=22)
	private Long incHissysid;

	@Column(name="INC_NAME", length=50)
	private String incName;

	@Column(name="INC_UOMCODE", length=50)
	private String incUomcode;

	@Column(name="INC_UOMNAME", length=50)
	private String incUomname;
	
	@Column(name="INC_MANFID")
	private Long incManfid;
	
	@Column(name="INC_HOSPID")
	private Long incHospid;

	@Column(name="INC_RP")
	private Float incRp;
	
	@Column(name="INC_SPEC")
	private String incSpec;
	
	@Column(name="INC_CAT")
	private String incCat;
	
	
	@Column(name="INC_SP")
	private Float incSp;
	
	@Column(name="INC_AUDITFLAG")
	private Float incAuditFlag;
	
	@Transient
	private String incAliaS;
	
	
	
	
	
	public Float getIncAuditFlag() {
		return incAuditFlag;
	}


	public void setIncAuditFlag(Float incAuditFlag) {
		this.incAuditFlag = incAuditFlag;
	}


	/**
	 * @return the incAliaS
	 */
	public String getIncAliaS() {
		return incAliaS;
	}


	/**
	 * @param incAliaS the incAliaS to set
	 */
	public void setIncAliaS(String incAliaS) {
		this.incAliaS = incAliaS;
	}




	/**
	 * @return the incSpec
	 */
	public String getIncSpec() {
		return incSpec;
	}


	/**
	 * @param incSpec the incSpec to set
	 */
	public void setIncSpec(String incSpec) {
		this.incSpec = incSpec;
	}

	
	

	/**
	 * @return the incRp
	 */
	public Float getIncRp() {
		return incRp;
	}


	/**
	 * @param incRp the incRp to set
	 */
	public void setIncRp(Float incRp) {
		this.incRp = incRp;
	}


	/**
	 * @return the incSp
	 */
	public Float getIncSp() {
		return incSp;
	}


	/**
	 * @param incSp the incSp to set
	 */
	public void setIncSp(Float incSp) {
		this.incSp = incSp;
	}


	public HopInc() {
	}
	
	
	public HopInc(Long incId,String incCode,String incName, String incUomname,
			String incBuomname, Long incHissysid,Long incManfid,
			Long incHospid ) {
		super();
		this.incId = incId;
		this.incCode=incCode;
		this.incName = incName;
		this.incUomname = incUomname;
		this.incBuomname = incBuomname;	
		this.incHissysid = incHissysid;				
		this.incManfid = incManfid;
		this.incHospid = incHospid;
	}


	public Long getIncManfid() {
		return incManfid;
	}

	public void setIncManfid(Long incManfid) {
		this.incManfid = incManfid;
	}

	public Long getIncHospid() {
		return incHospid;
	}

	public void setIncHospid(Long incHospid) {
		this.incHospid = incHospid;
	}

	public Long getIncId() {
		return this.incId;
	}

	public void setIncId(Long incId) {
		this.incId = incId;
	}

	public String getIncBuomcode() {
		return this.incBuomcode;
	}

	public void setIncBuomcode(String incBuomcode) {
		this.incBuomcode = incBuomcode;
	}

	public String getIncBuomname() {
		return this.incBuomname;
	}

	public void setIncBuomname(String incBuomname) {
		this.incBuomname = incBuomname;
	}

	public String getIncCode() {
		return this.incCode;
	}

	public void setIncCode(String incCode) {
		this.incCode = incCode;
	}

	public Long getIncFac() {
		return this.incFac;
	}

	public void setIncFac(Long incFac) {
		this.incFac = incFac;
	}

	public Long getIncHissysid() {
		return this.incHissysid;
	}

	public void setIncHissysid(Long incHissysid) {
		this.incHissysid = incHissysid;
	}

	public String getIncName() {
		return this.incName;
	}

	public void setIncName(String incName) {
		this.incName = incName;
	}

	public String getIncUomcode() {
		return this.incUomcode;
	}

	public void setIncUomcode(String incUomcode) {
		this.incUomcode = incUomcode;
	}

	public String getIncUomname() {
		return this.incUomname;
	}

	public void setIncUomname(String incUomname) {
		this.incUomname = incUomname;
	}


	/**
	 * @return the incCat
	 */
	public String getIncCat() {
		return incCat;
	}


	/**
	 * @param incCat the incCat to set
	 */
	public void setIncCat(String incCat) {
		this.incCat = incCat;
	}
	
	

}