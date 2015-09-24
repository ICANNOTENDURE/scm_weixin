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
@Table(name="T_SYS_VEN_ROLE")
public class RoleVendor implements Serializable {


	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="SYS_VEN_ROLE_ID", unique=true, nullable=false)
	private String sysVenRoleId;
	
	@Column(name="SYS_VEN_ID")
	private Long sysVenId;
	
	@Column(name="SYS_ROLE_ID")
	private Long sysRoleId;

	/**
	 * @return the sysVenRoleId
	 */
	public String getSysVenRoleId() {
		return sysVenRoleId;
	}

	/**
	 * @param sysVenRoleId the sysVenRoleId to set
	 */
	public void setSysVenRoleId(String sysVenRoleId) {
		this.sysVenRoleId = sysVenRoleId;
	}

	/**
	 * @return the sysVenId
	 */
	public Long getSysVenId() {
		return sysVenId;
	}

	/**
	 * @param sysVenId the sysVenId to set
	 */
	public void setSysVenId(Long sysVenId) {
		this.sysVenId = sysVenId;
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

	
	
	
}