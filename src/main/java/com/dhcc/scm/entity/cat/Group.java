/**
 * 
 */
package com.dhcc.scm.entity.cat;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author duyadong
 * 
 */
@Entity
@Table(name = "T_CAT_GROUP")
public class Group implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_CAT_GROUP")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="SG_ID", unique=true, nullable=false, precision=22)
	private Long sgId;

	@Column(name = "SG_CODE")
	private String sgCode;

	@Column(name = "SG_Desc")
	private String sgDesc;
	
	@Transient
	private List<CatGroup> catGroups;
	
	public Group() {
	}

	

	public List<CatGroup> getCatGroups() {
		return catGroups;
	}



	public void setCatGroups(List<CatGroup> catGroups) {
		this.catGroups = catGroups;
	}



	public Long getSgId() {
		return sgId;
	}


	public void setSgId(Long sgId) {
		this.sgId = sgId;
	}


	public String getSgCode() {
		return sgCode;
	}


	public void setSgCode(String sgCode) {
		this.sgCode = sgCode;
	}


	public String getSgDesc() {
		return sgDesc;
	}


	public void setSgDesc(String sgDesc) {
		this.sgDesc = sgDesc;
	}

	
	
	

}
