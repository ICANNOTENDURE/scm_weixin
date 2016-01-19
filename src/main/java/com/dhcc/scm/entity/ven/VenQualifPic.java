package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the T_VEN_QUALIF_PIC database table.
 * 
 */
@Entity
@Table(name="T_VEN_QUALIF_PIC")
public class VenQualifPic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_VEN_QUALIF_PIC_ID_GENERATOR", sequenceName="SEQUENCE_VEN_QUALIF_PIC")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_VEN_QUALIF_PIC_ID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="QUALIF_PIC_ID")
	private long id;

	@Column(name="PATH")
	private String path;

	@Column(name="QUALIFY_ID")
	private Long qualifyid;
	
	@Column(name="NAME")
	private String name;

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

	public VenQualifPic() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Long getQualifyid() {
		return this.qualifyid;
	}

	public void setQualifyid(Long qualifyid) {
		this.qualifyid = qualifyid;
	}

}