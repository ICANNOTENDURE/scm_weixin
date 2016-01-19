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

@Entity
@Table(name="T_APP_LOG")
public class AppLog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="LOG_ID", unique=true, nullable=false, length=32)
	private String logId;

	@Column(name="AUDIT_ROOT_DEAL_CODE", length=32)
	private String auditRootDealCode;

	@Column(name="CURRENT_DEAL_CODE", length=32)
	private String currentDealCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DEAL_END_TIME")
	private Date dealEndTime;

	@Column(name="DEAL_MODE", length=16)
	private String dealMode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DEAL_START_TIME")
	private Date dealStartTime;

	@Column(name="DEAL_STATUS", length=16)
	private String dealStatus;

	@Column(name="INPUT_CONTENT", length=4000)
	private String inputContent;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOG_END_TIME")
	private Date logEndTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOG_START_TIME")
	private Date logStartTime;

	@Column(name="LOG_TYPE", length=16)
	private String logType;

	@Column(name="OPERATE_ACCOUNT", length=64)
	private String operateAccount;

	@Column(name="OPERATE_DESCRIPTION", length=4000)
	private String operateDescription;

	@Column(name="OPERATE_GATEWAY_ID", length=32)
	private String operateGatewayId;

	@Column(name="OPERATE_IP", length=24)
	private String operateIp;

	@Column(name="OPERATE_ORG_CODE", length=64)
	private String operateOrgCode;

	@Column(name="OPERATE_ROLE", length=64)
	private String operateRole;

	@Column(name="OPERATE_TABLE", length=256)
	private String operateTable;

	@Column(name="OUTPUT_CONTENT", length=4000)
	private String outputContent;

	@Column(name="PARENT_DEAL_CODE", length=32)
	private String parentDealCode;

	@Column(name="RECORD_GATEWAY_ID", length=32)
	private String recordGatewayId;

	@Column(name="ROOT_DEAL_CODE", length=32)
	private String rootDealCode;

	public AppLog() {
		//super();
	}
	
	public String getLogId() {
		return this.logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getAuditRootDealCode() {
		return this.auditRootDealCode;
	}

	public void setAuditRootDealCode(String auditRootDealCode) {
		this.auditRootDealCode = auditRootDealCode;
	}

	public String getCurrentDealCode() {
		return this.currentDealCode;
	}

	public void setCurrentDealCode(String currentDealCode) {
		this.currentDealCode = currentDealCode;
	}

	public Date getDealEndTime() {
		return this.dealEndTime;
	}

	public void setDealEndTime(Date dealEndTime) {
		this.dealEndTime = dealEndTime;
	}

	public String getDealMode() {
		return this.dealMode;
	}

	public void setDealMode(String dealMode) {
		this.dealMode = dealMode;
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

	public String getInputContent() {
		return this.inputContent;
	}

	public void setInputContent(String inputContent) {
		this.inputContent = inputContent;
	}

	public Date getLogEndTime() {
		return this.logEndTime;
	}

	public void setLogEndTime(Date logEndTime) {
		this.logEndTime = logEndTime;
	}

	public Date getLogStartTime() {
		return this.logStartTime;
	}

	public void setLogStartTime(Date logStartTime) {
		this.logStartTime = logStartTime;
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

	public String getOperateGatewayId() {
		return this.operateGatewayId;
	}

	public void setOperateGatewayId(String operateGatewayId) {
		this.operateGatewayId = operateGatewayId;
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

	public String getOperateTable() {
		return this.operateTable;
	}

	public void setOperateTable(String operateTable) {
		this.operateTable = operateTable;
	}

	public String getOutputContent() {
		return this.outputContent;
	}

	public void setOutputContent(String outputContent) {
		this.outputContent = outputContent;
	}

	public String getParentDealCode() {
		return this.parentDealCode;
	}

	public void setParentDealCode(String parentDealCode) {
		this.parentDealCode = parentDealCode;
	}

	public String getRecordGatewayId() {
		return this.recordGatewayId;
	}

	public void setRecordGatewayId(String recordGatewayId) {
		this.recordGatewayId = recordGatewayId;
	}

	public String getRootDealCode() {
		return this.rootDealCode;
	}

	public void setRootDealCode(String rootDealCode) {
		this.rootDealCode = rootDealCode;
	}

}