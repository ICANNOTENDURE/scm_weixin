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
@Table(name = "T_CAT_DRUGGROUP")
public class CatGroup implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_CAT_CATGROUP")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="SDG_ID", unique=true, nullable=false, precision=22)
	private Integer groupID;

	@Column(name = "SDG_CODE", nullable = false, length = 20)
	private String groupCode;

	@Column(name = "SDG_Desc", nullable = false, length = 20)
	private String groupName;

	@Column(name = "SDG_PARREF_ID")
	private Long parrefId;
	
	@Transient
	private List<SubCatGroup> subCatGroups;
	
	public CatGroup() {
	}
	
	
	
	public List<SubCatGroup> getSubCatGroups() {
		return subCatGroups;
	}



	public void setSubCatGroups(List<SubCatGroup> subCatGroups) {
		this.subCatGroups = subCatGroups;
	}



	/**
	 * @return the groupID
	 */
	public Integer getGroupID() {
		return groupID;
	}

	/**
	 * @param groupID the groupID to set
	 */
	public void setGroupID(Integer groupID) {
		this.groupID = groupID;
	}

	/**
	 * @return the groupCode
	 */
	public String getGroupCode() {
		return groupCode;
	}

	/**
	 * @param groupCode the groupCode to set
	 */
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	/**
	 * @return the groupName
	 */
	public String getGroupName() {
		return groupName;
	}

	/**
	 * @param groupName the groupName to set
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Long getParrefId() {
		return parrefId;
	}

	public void setParrefId(Long parrefId) {
		this.parrefId = parrefId;
	}

	

}
