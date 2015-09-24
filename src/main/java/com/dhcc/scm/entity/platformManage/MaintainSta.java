package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;


/**
 * 
* <p>标题: MaintainSta.java</p>
* <p>业务描述: 运维事件统计分析</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月9日
* @version V1.0
 */
@Entity
@Table(name="T_MAINTAIN_STA", schema="PMS")
public class MaintainSta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="STA_ID", unique=true, nullable=false, length=32)
	private String staId;

	@Column(length=4000)
	private String description;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;

	@Column(name="GATEWAY_ID", length=32)
	private String gatewayId;

	@Column(name="MAINTAIN_NUM", length=4000)
	private String maintainNum;

	@Column(name="MAINTAIN_TYPE", length=16)
	private String maintainType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME")
	private Date startTime;

	public MaintainSta() {
	}

	public String getStaId() {
		return this.staId;
	}

	public void setStaId(String staId) {
		this.staId = staId;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getGatewayId() {
		return this.gatewayId;
	}

	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}

	public String getMaintainNum() {
		return this.maintainNum;
	}

	public void setMaintainNum(String maintainNum) {
		this.maintainNum = maintainNum;
	}

	public String getMaintainType() {
		return this.maintainType;
	}

	public void setMaintainType(String maintainType) {
		this.maintainType = maintainType;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

}