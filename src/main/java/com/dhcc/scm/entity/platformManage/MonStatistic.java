package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

/**
 * 
* <p>标题: MonStatistic.java</p>
* <p>业务描述: 系统资源监控统计</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年10月31日
* @version V1.0
 */
@Entity
@Table(name="T_MON_STATISTIC",schema="PMS")
public class MonStatistic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="STATISTICS_ID")
	private String statisticsId;

	@Column(name="CPU_IDLE")
	private String cpuIdle;

	@Column(name="CPU_SYSTEM")
	private String cpuSystem;

	@Column(name="CPU_TOTAL")
	private String cpuTotal;

	@Column(name="CPU_USER")
	private String cpuUser;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;

	@Column(name="SERVER_ID")
	private String serverId;

	@Column(name="MEM_FREE")
	private String memFree;

	@Column(name="MEM_USED")
	private String memUsed;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME")
	private Date startTime;

	public MonStatistic() {
	}

	public String getStatisticsId() {
		return this.statisticsId;
	}

	public void setStatisticsId(String statisticsId) {
		this.statisticsId = statisticsId;
	}

	public String getCpuIdle() {
		return this.cpuIdle;
	}

	public void setCpuIdle(String cpuIdle) {
		this.cpuIdle = cpuIdle;
	}

	public String getCpuSystem() {
		return this.cpuSystem;
	}

	public void setCpuSystem(String cpuSystem) {
		this.cpuSystem = cpuSystem;
	}

	public String getCpuTotal() {
		return this.cpuTotal;
	}

	public void setCpuTotal(String cpuTotal) {
		this.cpuTotal = cpuTotal;
	}

	public String getCpuUser() {
		return this.cpuUser;
	}

	public void setCpuUser(String cpuUser) {
		this.cpuUser = cpuUser;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getServerId() {
		return this.serverId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	public String getMemFree() {
		return this.memFree;
	}

	public void setMemFree(String memFree) {
		this.memFree = memFree;
	}

	public String getMemUsed() {
		return this.memUsed;
	}

	public void setMemUsed(String memUsed) {
		this.memUsed = memUsed;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

}