package com.dhcc.framework.common.quartz;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;


@XmlRootElement
@JsonInclude(Include.NON_NULL)
public class JobResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int taskId;
	private String result;
	private String msg;
	private int logId;

	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}

}
