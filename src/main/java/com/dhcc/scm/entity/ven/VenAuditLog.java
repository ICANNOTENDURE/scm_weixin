package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="T_VEN_AUDIT_LOG")
public class VenAuditLog implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="AUDIT_LOG_ID")
	private Long auditlogid;
	@Column(name="AUDIT_LOG_VENID")
	private Long logvenid;
	@Column(name="AUDIT_LOG_USERID")
	private Long loguserid;
	@Column(name="AUDIT_LOG_DATE")
	private Date logdate;
	@Column(name="AUDIT_LOG_RESULT")
	private String logresult;
	@Column(name="AUDIT_LOG_CONTENT")
	private String logcontent;
	@Column(name="AUDIT_LOG_IP")
	private String logip;
	@Column(name="AUDIT_LOG_TYPE")
	private String logtype;
	public Long getAuditlogid() {
		return auditlogid;
	}
	public void setAuditlogid(Long auditlogid) {
		this.auditlogid = auditlogid;
	}
	public Long getLogvenid() {
		return logvenid;
	}
	public void setLogvenid(Long logvenid) {
		this.logvenid = logvenid;
	}
	public Long getLoguserid() {
		return loguserid;
	}
	public void setLoguserid(Long loguserid) {
		this.loguserid = loguserid;
	}
	public Date getLogdate() {
		return logdate;
	}
	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}
	public String getLogresult() {
		return logresult;
	}
	public void setLogresult(String logresult) {
		this.logresult = logresult;
	}
	public String getLogcontent() {
		return logcontent;
	}
	public void setLogcontent(String logcontent) {
		this.logcontent = logcontent;
	}
	public String getLogip() {
		return logip;
	}
	public void setLogip(String logip) {
		this.logip = logip;
	}
	public String getLogtype() {
		return logtype;
	}
	public void setLogtype(String logtype) {
		this.logtype = logtype;
	}
	
	
	
}
