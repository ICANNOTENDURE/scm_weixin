/**  
* @Title: Log.java
* @Package com.dhcc.pms.entity.sys
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年8月5日 上午9:29:48
* @version V1.0  
*/
package com.dhcc.scm.entity.sys;



import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name="T_SYS_APP_PARAM")
public class SysAppParam implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="T_SYS_APPPARAM_APPPARAMID_GENERATOR", sequenceName="SEQUENCE_SYS_APP_PARAM")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_SYS_APPPARAM_APPPARAMID_GENERATOR")
	@Column(name="APP_ID")
	private Long appId;
	
	@Column(name="APP_CODE")
	private String appCode;
	
	@Column(name="APP_DESCRIPTION")
	private String appDescription;
	

	@Column(name="APP_HOSPID")
	private Long appHopId;
	
	
	@Column(name="APP_VALUE")
	private String appValue;
	
	@Transient
	private String hopName;

	
	
	public String getHopName() {
		return hopName;
	}


	public void setHopName(String hopName) {
		this.hopName = hopName;
	}


	public Long getAppId() {
		return appId;
	}


	public void setAppId(Long appId) {
		this.appId = appId;
	}


	public String getAppCode() {
		return appCode;
	}


	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}


	public String getAppDescription() {
		return appDescription;
	}


	public void setAppDescription(String appDescription) {
		this.appDescription = appDescription;
	}


	public Long getAppHopId() {
		return appHopId;
	}


	public void setAppHopId(Long appHopId) {
		this.appHopId = appHopId;
	}


	public String getAppValue() {
		return appValue;
	}


	public void setAppValue(String appValue) {
		this.appValue = appValue;
	}


}
