package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_SYS_CTLOC database table.
 * 
 */
@Entity
@Table(name="T_SYS_CTLOC")
@NamedQuery(name="HopCtloc.findAll", query="SELECT h FROM HopCtloc h")
public class HopCtloc implements Serializable {
	private static final long serialVersionUID = 1L;	
	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence",parameters={@Parameter(name="sequence",value="SEQUENCE_SYS_CTLOC")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")
	@Column(name="CTLOC_ID")
	private Long hopCtlocId;

	@Column(name="CTLOC_CODE")
	private String code;

	@Column(name="CTLOC_HISID")
	private Long hisid;

	@Column(name="CTLOC_HOSPID")
	private Long hospid;

	@Column(name="CTLOC_NAME")
	private String name;
	
	
	@Column(name="CTLOC_TYPE")
	private String type;
	//1:入库科室，2:收货科室,3:全部
	
	@Column(name="CTLOC_DEST")		
	private Long ctlocDest;
	
	
	
	public HopCtloc() {
	}
	
	public HopCtloc(Long hopCtlocId, String name) {
		super();
		this.hopCtlocId = hopCtlocId;
		this.name = name;
	}


	
	
	
	/**
	 * @return the ctlocDest
	 */
	public Long getCtlocDest() {
		return ctlocDest;
	}

	/**
	 * @param ctlocDest the ctlocDest to set
	 */
	public void setCtlocDest(Long ctlocDest) {
		this.ctlocDest = ctlocDest;
	}

	public Long getHopCtlocId() {
		return hopCtlocId;
	}



	public void setHopCtlocId(Long hopCtlocId) {
		this.hopCtlocId = hopCtlocId;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public Long getHisid() {
		return hisid;
	}



	public void setHisid(Long hisid) {
		this.hisid = hisid;
	}



	public Long getHospid() {
		return hospid;
	}



	public void setHospid(Long hospid) {
		this.hospid = hospid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}


 
	

}