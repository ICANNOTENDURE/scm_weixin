package com.dhcc.framework.common.quartz;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;



/**
 * Task上下文环境，包括任务配置，参数，执行信息等
 *
 */
@XmlRootElement
@JsonInclude(Include.NON_NULL)
public class TaskContext implements Serializable {
	private static final long serialVersionUID = 8284373915862080394L;
	private String taskName;
	private int taskId;
	private String jobGroup;
	private String jobDesc;
	private String triggerDescription;
	private String taskBeanId;
	private String cronExpress;
	private String triggerName;
	private String triggerGroup;
	private String repoEmail;
	private String repoMobile;
	private String quartzJob;
	private String quartzJobGroup;
	
	private String jobType;//需要在维护JOB的页面手动输入，或我们用下拉列表让用户选
	private String invokeUrl;//需要在维护JOB的页面手动输入 
	private String args;//需要在维护JOB的页面手动输入
	private String busiSystem; //不是远程调用时，不需要设置  ,需要在维护JOB的页面手动输入
	private int  restCondition ;//需要在维护JOB的页面手动输入 
	private int concurrExe ; //能否并能运行标记，1是可以，0是不可以  需要在维护job 时通过下拉列表来选择
	private Date lastStartTime;
	private Date lastfinishTime;
	private String userName;
	private String lastResult;
	
	private int logId;
	
	private int isRemoteAgent ;
	
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}



	public String getTriggerDescription() {
		return triggerDescription;
	}
	public void setTriggerDescription(String triggerDescription) {
		this.triggerDescription = triggerDescription;
	}
	public String getTaskBeanId() {
		return taskBeanId;
	}
	public void setTaskBeanId(String taskBeanId) {
		this.taskBeanId = taskBeanId;
	}

	public String getTriggerName() {
		return triggerName;
	}
	public void setTriggerName(String triggerName) {
		this.triggerName = triggerName;
	}
	public String getTriggerGroup() {
		return triggerGroup;
	}
	public void setTriggerGroup(String triggerGroup) {
		this.triggerGroup = triggerGroup;
	}
	public String getRepoEmail() {
		return repoEmail;
	}
	public void setRepoEmail(String repoEmail) {
		this.repoEmail = repoEmail;
	}
	public String getRepoMobile() {
		return repoMobile;
	}
	public void setRepoMobile(String repoMobile) {
		this.repoMobile = repoMobile;
	}
	public String getJobGroup() {
		return jobGroup;
	}
	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}
	public String getCronExpress() {
		return cronExpress;
	}
	public void setCronExpress(String cronExpress) {
		this.cronExpress = cronExpress;
	}
	public String getQuartzJob() {
		return quartzJob;
	}
	public void setQuartzJob(String quartzJob) {
		this.quartzJob = quartzJob;
	}
	public String getQuartzJobGroup() {
		return quartzJobGroup;
	}
	public void setQuartzJobGroup(String quartzJobGroup) {
		this.quartzJobGroup = quartzJobGroup;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getInvokeUrl() {
		return invokeUrl;
	}
	public void setInvokeUrl(String invokeUrl) {
		this.invokeUrl = invokeUrl;
	}
	public String getArgs() {
		return args;
	}
	public void setArgs(String args) {
		this.args = args;
	}
	public String getBusiSystem() {
		return busiSystem;
	}
	public void setBusiSystem(String busiSystem) {
		this.busiSystem = busiSystem;
	}
	public int getRestCondition() {
		return restCondition;
	}
	public void setRestCondition(int restCondition) {
		this.restCondition = restCondition;
	}
	public int getConcurrExe() {
		return concurrExe;
	}
	public void setConcurrExe(int concurrExe) {
		this.concurrExe = concurrExe;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}
	public int getIsRemoteAgent() {
		return isRemoteAgent;
	}
	public void setIsRemoteAgent(int isRemoteAgent) {
		this.isRemoteAgent = isRemoteAgent;
	}

	/**
	 * 页在维护JOB 时参数串  pra1:praValue1;pra2:praValue2 
	 * 把参数串按分号拆开 以map形式返回，key 为 pra1之类的参数,value 为praValue1之类的值
	 * @return
	 */
	@JsonIgnore
	public Map<String,String> getArgsMap() {
		if(args==null||"".equals(args.trim())){
			return new HashMap<String,String>(1);
		}
		String[] argArrs= args.trim().split(";");
		Map<String,String> map = new HashMap<String,String>(argArrs.length) ;
		for(String currArg:argArrs){
			String[] currArgArr = currArg.trim().split(":");
			map.put(currArgArr[0].trim(),currArgArr[1].trim());
		}
		return map;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getLastStartTime() {
		return lastStartTime;
	}
	public void setLastStartTime(Date lastStartTime) {
		this.lastStartTime = lastStartTime;
	}
	public Date getLastfinishTime() {
		return lastfinishTime;
	}
	public void setLastfinishTime(Date lastfinishTime) {
		this.lastfinishTime = lastfinishTime;
	}
	public String getLastResult() {
		return lastResult;
	}
	public void setLastResult(String lastResult) {
		this.lastResult = lastResult;
	}
	
}
