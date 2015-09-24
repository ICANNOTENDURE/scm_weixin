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

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * @author duyadong
 * 
 */
@Entity
@Table(name = "T_CAT_DRUGGROUPITM")
public class SubCatGroup implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "sequence", parameters = { @Parameter(name = "sequence", value = "SEQUENCE_CAT_CATGROUPITM") })
	@GeneratedValue(generator = "idGenerator")
	@Column(name = "SDGI_ID", unique = true, nullable = false, precision = 22)
	private Integer subGroupID;

	@Column(name = "SDGI_Parref_ID", nullable = true, precision = 22)
	private Integer subParrefGroupID;

	@Column(name = "SDGI_CODE", nullable = false, unique = true, length = 20)
	private String subGroupCode;

	@Column(name = "SDGI_Desc", nullable = false, unique = true, length = 20)
	private String subGroupName;

	/**
	 * @return the subGroupID
	 */
	public Integer getSubGroupID() {
		return subGroupID;
	}

	public SubCatGroup(Integer subGroupID, Integer subParrefGroupID,
			String subGroupCode, String subGroupName) {
		this.subGroupID = subGroupID;
		this.subParrefGroupID = subParrefGroupID;
		this.subGroupCode = subGroupCode;
		this.subGroupName = subGroupName;
	}

	public SubCatGroup(Integer subGroupID, String subGroupName) {
		this.subGroupID = subGroupID;
		this.subGroupName = subGroupName;
	}

	public SubCatGroup() {
	}

	/**
	 * @param subGroupID
	 *            the subGroupID to set
	 */
	public void setSubGroupID(Integer subGroupID) {
		this.subGroupID = subGroupID;
	}

	/**
	 * @return the subParrefGroupID
	 */
	public Integer getSubParrefGroupID() {
		return subParrefGroupID;
	}

	/**
	 * @param subParrefGroupID
	 *            the subParrefGroupID to set
	 */
	public void setSubParrefGroupID(Integer subParrefGroupID) {
		this.subParrefGroupID = subParrefGroupID;
	}

	/**
	 * @return the subGroupCode
	 */
	public String getSubGroupCode() {
		return subGroupCode;
	}

	/**
	 * @param subGroupCode
	 *            the subGroupCode to set
	 */
	public void setSubGroupCode(String subGroupCode) {
		this.subGroupCode = subGroupCode;
	}

	/**
	 * @return the subGroupName
	 */
	public String getSubGroupName() {
		return subGroupName;
	}

	/**
	 * @param subGroupName
	 *            the subGroupName to set
	 */
	public void setSubGroupName(String subGroupName) {
		this.subGroupName = subGroupName;
	}

}
