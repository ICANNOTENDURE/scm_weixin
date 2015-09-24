package com.dhcc.scm.entity.sys;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;



@Entity
@Table(name="T_SYS_TASKCONFIG")
public class TaskConfig implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="TASK_ID")
	private String taskId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;

	@Column(name="ID_TYPE")
	private String idType;

	@Column(name="ID_VALUE")
	private String idValue;

	@Column(name="JOB_GROUP")
	private String jobGroup;

	@Column(name="JOB_NAME")
	private String jobName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME")
	private Date startTime;

	@Column(name="TASK_CLASS")
	private String taskClass;

	@Column(name="TASK_DESCRIPTION")
	private String taskDescription;

	@Column(name="TASK_STATUS")
	private String taskStatus;

	@Column(name="TIME_PERIOD")
	private String timePeriod;

	@Column(name="TIME_PERIOD_TYPE")
	private String timePeriodType;

	@Column(name="TRIGGER_GROUP")
	private String triggerGroup;

	@Column(name="TRIGGER_NAME")
	private String triggerName;

	public TaskConfig() {
	}

	public String getTaskId() {
		return this.taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getIdType() {
		return this.idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdValue() {
		return this.idValue;
	}

	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}

	public String getJobGroup() {
		return this.jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getJobName() {
		return this.jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getTaskClass() {
		return this.taskClass;
	}

	public void setTaskClass(String taskClass) {
		this.taskClass = taskClass;
	}

	public String getTaskDescription() {
		return this.taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	public String getTaskStatus() {
		return this.taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public String getTimePeriod() {
		return this.timePeriod;
	}

	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}

	public String getTimePeriodType() {
		return this.timePeriodType;
	}

	public void setTimePeriodType(String timePeriodType) {
		this.timePeriodType = timePeriodType;
	}

	public String getTriggerGroup() {
		return this.triggerGroup;
	}

	public void setTriggerGroup(String triggerGroup) {
		this.triggerGroup = triggerGroup;
	}

	public String getTriggerName() {
		return this.triggerName;
	}

	public void setTriggerName(String triggerName) {
		this.triggerName = triggerName;
	}

}