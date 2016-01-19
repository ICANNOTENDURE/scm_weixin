/**
 * 
 */
package com.dhcc.scm.entity.cat;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "T_CAT_GROUPPROPERTY")
public class CatGroupProperty implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_CAT_GROUPPROPERTY")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="GRP_PRO_ID", unique=true, nullable=false)
	private Long grpProId;

	@Column(name = "GRP_PARREFID")
	private Long grpParrefId;

	@Column(name = "GRP_PRO_PARREFID")
	private Long grpProParrefId;
	
	@Column(name = "GRP_PRO_DESC")
	private String grpProDesc;
	
	@Transient
	private String isCheck;
	
	
	
	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	public Long getGrpProId() {
		return grpProId;
	}

	public void setGrpProId(Long grpProId) {
		this.grpProId = grpProId;
	}

	public Long getGrpParrefId() {
		return grpParrefId;
	}

	public void setGrpParrefId(Long grpParrefId) {
		this.grpParrefId = grpParrefId;
	}

	public Long getGrpProParrefId() {
		return grpProParrefId;
	}

	public void setGrpProParrefId(Long grpProParrefId) {
		this.grpProParrefId = grpProParrefId;
	}

	public String getGrpProDesc() {
		return grpProDesc;
	}

	public void setGrpProDesc(String grpProDesc) {
		this.grpProDesc = grpProDesc;
	}
	
	
	

}
