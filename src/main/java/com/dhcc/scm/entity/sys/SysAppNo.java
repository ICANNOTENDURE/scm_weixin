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
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="T_SYS_APPNO")
public class SysAppNo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_SYS_APPNO_APPNOID_GENERATOR", sequenceName="SEQUENCE_SYS_APPNO")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_SYS_APPNO_APPNOID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="APPNO_ID")
	private Long appId;
	
	@Column(name="APPNO_PRE")
	private String appPre;
	
	@Column(name="APPNO_COUNT")
	private Long appCount;
	
	@Temporal(TemporalType.DATE)
	@Column(name="APPNO_DATE")
	private Date appDate;
	

	public Long getAppCount() {
		return appCount;
	}


	public void setAppCount(Long appCount) {
		this.appCount = appCount;
	}


	public Date getAppDate() {
		return appDate;
	}


	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}


	public Long getAppId() {
		return appId;
	}


	public void setAppId(Long appId) {
		this.appId = appId;
	}


	public String getAppPre() {
		return appPre;
	}


	public void setAppPre(String appPre) {
		this.appPre = appPre;
	}

	
	
	
	
	

}
