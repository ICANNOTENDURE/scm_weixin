package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



/**
 * The persistent class for the T_VEN_QUALIF_TYPE database table.
 * 
 */
@Entity
@Table(name="T_VEN_QUALIF_TYPE")
public class VenQualifType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_VEN_QUALIF_TYPE_ID_GENERATOR", sequenceName="SEQUENCE_VEN_QUALIF_TYPE")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_VEN_QUALIF_TYPE_ID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="VENQUALIFTYPE_ID")
	private Long venQualifTypeId;
	
	@Column(name="code")
	private String code;
	
	@Column(name="name")
	private String name;
	
	@Column(name="type")
	private String type;
	
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

	@Column(name="seq")
	private Integer seq;
	
	
	
//	@OneToMany(cascade={CascadeType.REMOVE})
//	@JoinColumn(name="QUALIFICATION_ID",nullable=true)
//	private List<VenQualification> venQualifications;
//	
//	
//	
//	
//	/**
//	 * @return the venQualifications
//	 */
//	public List<VenQualification> getVenQualifications() {
//		return venQualifications;
//	}
//
//	/**
//	 * @param venQualifications the venQualifications to set
//	 */
//	public void setVenQualifications(List<VenQualification> venQualifications) {
//		this.venQualifications = venQualifications;
//	}

	@Transient
	private VenQualification venQualification;
	
	
	
	/**
	 * @return the venQualification
	 */
	public VenQualification getVenQualification() {
		return venQualification;
	}

	/**
	 * @param venQualification the venQualification to set
	 */
	public void setVenQualification(VenQualification venQualification) {
		this.venQualification = venQualification;
	}

	public VenQualifType() {
	}

	public Long getVenQualifTypeId() {
		return this.venQualifTypeId;
	}

	public void setVenQualifTypeId(Long venQualifTypeId) {
		this.venQualifTypeId = venQualifTypeId;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSeq() {
		return this.seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

}