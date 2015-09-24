package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;


/**
 * 
* <p>标题: Maintain.java</p>
* <p>业务描述: 运维事件</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月9日
* @version V1.0
 */
@Entity
@Table(name="T_MAINTAIN", schema="PMS")
public class Maintain implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="MAINTAIN_ID", unique=true, nullable=false, length=32)
	private String maintainId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(length=4000)
	private String description;

	@Column(name="GATEWAY_ID", length=32)
	private String gatewayId;

	@Column(name="MAINTAIN_HANDLE", length=4000)
	private String maintainHandle;

	@Column(name="MAINTAIN_TIME", length=16)
	private String maintainTime;

	@Column(name="MAINTAIN_TYPE", length=16)
	private String maintainType;

	@Column(name="\"RESULT\"", length=4000)
	private String result;

	@Column(name="SERVER_ID", length=32)
	private String serverId;

	public Maintain() {
	}

	public String getMaintainId() {
		return this.maintainId;
	}

	public void setMaintainId(String maintainId) {
		this.maintainId = maintainId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGatewayId() {
		return this.gatewayId;
	}

	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}

	public String getMaintainHandle() {
		return this.maintainHandle;
	}

	public void setMaintainHandle(String maintainHandle) {
		this.maintainHandle = maintainHandle;
	}

	public String getMaintainTime() {
		return this.maintainTime;
	}

	public void setMaintainTime(String maintainTime) {
		this.maintainTime = maintainTime;
	}

	public String getMaintainType() {
		return this.maintainType;
	}

	public void setMaintainType(String maintainType) {
		this.maintainType = maintainType;
	}

	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getServerId() {
		return this.serverId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

}