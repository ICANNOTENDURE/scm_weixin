package com.dhcc.scm.entity.userManage;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_VEN_INC database table.
 * 
 */
@Entity
@Table(name="T_SYS_ROLE_LOC")
public class RoleLoc implements Serializable {


	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="SYS_ROLE_LOC_ID", unique=true, nullable=false)
	private String sysRoleLocId;
	
	@Column(name="SYS_ROLE_ID")
	private Long sysRoleId;
	
	@Column(name="SYS_LOC_ID")
	private Long sysLocId;

	/**
	 * @return the sysRoleLocId
	 */
	public String getSysRoleLocId() {
		return sysRoleLocId;
	}

	/**
	 * @param sysRoleLocId the sysRoleLocId to set
	 */
	public void setSysRoleLocId(String sysRoleLocId) {
		this.sysRoleLocId = sysRoleLocId;
	}

	/**
	 * @return the sysRoleId
	 */
	public Long getSysRoleId() {
		return sysRoleId;
	}

	/**
	 * @param sysRoleId the sysRoleId to set
	 */
	public void setSysRoleId(Long sysRoleId) {
		this.sysRoleId = sysRoleId;
	}

	/**
	 * @return the sysLocId
	 */
	public Long getSysLocId() {
		return sysLocId;
	}

	/**
	 * @param sysLocId the sysLocId to set
	 */
	public void setSysLocId(Long sysLocId) {
		this.sysLocId = sysLocId;
	}

	

	
	
	
}