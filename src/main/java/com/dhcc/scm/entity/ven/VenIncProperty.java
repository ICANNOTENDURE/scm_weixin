package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


/**
 * The persistent class for the T_VEN_INC database table.
 * 
 */
@Entity
@Table(name="T_VEN_INC_PROPERTY")
public class VenIncProperty implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_VEN_INC_PROPERTY")})
	@GeneratedValue(generator="idGenerator")	
	@Column(name="INCPRO_ID", unique=true, nullable=false)
	private Long incProId;
	
	@Column(name="INCPRO_INC_ID")
	private Long incProIncId;

	@Column(name="INC_PRO_CATPRO_ID")
	private Long incProCatProId;

	public Long getIncProId() {
		return incProId;
	}

	public void setIncProId(Long incProId) {
		this.incProId = incProId;
	}

	public Long getIncProIncId() {
		return incProIncId;
	}

	public void setIncProIncId(Long incProIncId) {
		this.incProIncId = incProIncId;
	}

	public Long getIncProCatProId() {
		return incProCatProId;
	}

	public void setIncProCatProId(Long incProCatProId) {
		this.incProCatProId = incProCatProId;
	}
	
	
}