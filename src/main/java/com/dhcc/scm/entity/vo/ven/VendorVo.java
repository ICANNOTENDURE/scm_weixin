/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;

import java.util.Date;




public class VendorVo {

	private Long vendorid;
	
	private String code;
	
	private String name;
	
	private String address;
	
	private String fax;
	
	private String tel;
	
	private String account;
	
	private String contact;
	
	private String email;

	private String taxation;
	
	private Long hopvendorid;
	
	private String auditflag;//add hxy
	
	//hxy 2016-03-30 历史查询 尝试
	private Long loguserid;
	private Date logdate;
	private String logresult;
	private String logip;
	private String logtype;
	
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
	//hxy 2016-03-30 历史查询
	
	public String getAuditflag() {
		return auditflag;
	}

	public void setAuditflag(String auditflag) {
		this.auditflag = auditflag;
	}

	public Long getHopvendorid() {
		return hopvendorid;
	}

	public void setHopvendorid(Long hopvendorid) {
		this.hopvendorid = hopvendorid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTaxation() {
		return taxation;
	}

	public void setTaxation(String taxation) {
		this.taxation = taxation;
	}

	public Long getVendorid() {
		return vendorid;
	}

	public void setVendorid(Long vendorid) {
		this.vendorid = vendorid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
