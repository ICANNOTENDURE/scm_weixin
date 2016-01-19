package com.dhcc.scm.entity.sys;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the T_SYS_DICT database table.
 * 
 */
@Entity
@Table(name="T_SYS_DICT")
@NamedQuery(name="SysDict.findAll", query="SELECT s FROM SysDict s")
public class SysDict implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "DIC_ID")
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQ_SYSDIC")})
	//@GeneratedValue(generator="idGenerator")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name = "DIC_NAME")
	private String name;

	@Column(name="DIC_TYPE")
	private String type;

	@Column(name="DIC_VALUE")
	private BigDecimal value;

	public SysDict() {
	}	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getValue() {
		return this.value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

}