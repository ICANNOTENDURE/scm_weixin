package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_HOP_INC database table.
 * 
 */
@Entity
@Table(name="T_HOP_INCALIAS")
public class HopIncAlias implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
//	@GenericGenerator(name="idGenerator",strategy="sequence",
//	parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_INCALIAS")})
//	@GeneratedValue(generator="idGenerator")	
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="INCALIAS_ID", unique=true, nullable=false)
	private String incAliasId;

	@Column(name="INCALIAS_TEXT")
	private String incAliasText;

	@Column(name="INCALIAS_INCID")
	private Long incAliaIncId;

	/**
	 * @return the incAliasId
	 */
	public String getIncAliasId() {
		return incAliasId;
	}

	/**
	 * @param incAliasId the incAliasId to set
	 */
	public void setIncAliasId(String incAliasId) {
		this.incAliasId = incAliasId;
	}

	/**
	 * @return the incAliasText
	 */
	public String getIncAliasText() {
		return incAliasText;
	}

	/**
	 * @param incAliasText the incAliasText to set
	 */
	public void setIncAliasText(String incAliasText) {
		this.incAliasText = incAliasText;
	}

	/**
	 * @return the incAliaIncId
	 */
	public Long getIncAliaIncId() {
		return incAliaIncId;
	}

	/**
	 * @param incAliaIncId the incAliaIncId to set
	 */
	public void setIncAliaIncId(Long incAliaIncId) {
		this.incAliaIncId = incAliaIncId;
	}

	

}