package com.dhcc.scm.entity.sys;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


/**
 * The persistent class for the T_SYS_DICT database table.
 * 
 */
@Entity
@Table(name="T_SYS_IMPMODEL")
public class ImpModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "IMPMODEL_ID")
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_SYS_IMPMODEL")})
	@GeneratedValue(generator="idGenerator")
	private Long impModelId;

	@Column(name = "IMPMODEL_TYPE")
	private String type;

	@Column(name="IMPMODEL_NAME")
	private String name;

	@Column(name="IMPMODEL_SEQ")
	private Long seq;

	@Column(name="IMPMODEL_CODE")
	private String code;
	

	/**
	 * @return the impModelId
	 */
	public Long getImpModelId() {
		return impModelId;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @param impModelId the impModelId to set
	 */
	public void setImpModelId(Long impModelId) {
		this.impModelId = impModelId;
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

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the seq
	 */
	public Long getSeq() {
		return seq;
	}

	/**
	 * @param seq the seq to set
	 */
	public void setSeq(Long seq) {
		this.seq = seq;
	}

	

}