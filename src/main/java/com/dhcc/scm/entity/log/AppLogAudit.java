package com.dhcc.scm.entity.log;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;


/**
 * 
* <p>标题: AppLogAudit.java</p>
* <p>业务描述:日志审计类</p>
* <p>公司:东华软件股份公司</p>
* <p>版权:dhcc2013</p>
* @author 于鸿
* @date 2013年9月2日
* @version V1.0
 */
@Entity
@Table(name="T_APP_LOG_AUDIT",schema="PMS")
public class AppLogAudit implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="AUDIT_ID", unique=true, nullable=false, length=32)
	private String auditId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DEAL_END_TIME")
	private Date dealEndTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DEAL_START_TIME")
	private Date dealStartTime;

	@Column(name="DEAL_STATUS", length=64)
	private String dealStatus;

	@Column(name="LOG_NUM", length=16)
	private String logNum;

	@Column(name="LOG_TYPE", length=64)
	private String logType;

	@Column(name="OPERATE_ACCOUNT", length=64)
	private String operateAccount;

	@Column(name="OPERATE_DESCRIPTION", length=256)
	private String operateDescription;

	@Column(name="OPERATE_IP", length=24)
	private String operateIp;

	@Column(name="OPERATE_ORG_CODE", length=64)
	private String operateOrgCode;

	@Column(name="OPERATE_ROLE", length=64)
	private String operateRole;

	@Column(name="ROOT_DEAL_CODE", length=32)
	private String rootDealCode;

	public AppLogAudit() {
	}

	public String getAuditId() {
		return this.auditId;
	}

	public void setAuditId(String auditId) {
		this.auditId = auditId;
	}

	public Date getDealEndTime() {
		return this.dealEndTime;
	}

	public void setDealEndTime(Date dealEndTime) {
		this.dealEndTime = dealEndTime;
	}

	public Date getDealStartTime() {
		return this.dealStartTime;
	}

	public void setDealStartTime(Date dealStartTime) {
		this.dealStartTime = dealStartTime;
	}

	public String getDealStatus() {
		return this.dealStatus;
	}

	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}

	public String getLogNum() {
		return this.logNum;
	}

	public void setLogNum(String logNum) {
		this.logNum = logNum;
	}

	public String getLogType() {
		return this.logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}

	public String getOperateAccount() {
		return this.operateAccount;
	}

	public void setOperateAccount(String operateAccount) {
		this.operateAccount = operateAccount;
	}

	public String getOperateDescription() {
		return this.operateDescription;
	}

	public void setOperateDescription(String operateDescription) {
		this.operateDescription = operateDescription;
	}

	public String getOperateIp() {
		return this.operateIp;
	}

	public void setOperateIp(String operateIp) {
		this.operateIp = operateIp;
	}

	public String getOperateOrgCode() {
		return this.operateOrgCode;
	}

	public void setOperateOrgCode(String operateOrgCode) {
		this.operateOrgCode = operateOrgCode;
	}

	public String getOperateRole() {
		return this.operateRole;
	}

	public void setOperateRole(String operateRole) {
		this.operateRole = operateRole;
	}

	public String getRootDealCode() {
		return this.rootDealCode;
	}

	public void setRootDealCode(String rootDealCode) {
		this.rootDealCode = rootDealCode;
	}

}