package com.dhcc.scm.entity.vo.platformManage;

import java.io.Serializable;


public class UserVo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long userid;
	
	private Long accountid;
	
	private String loc;
	
	private String ven;
	
	private String type;
	
	private String account;
	
	private String state;
	
	private String hop;
	
	
	
	public String getHop() {
		return hop;
	}

	public void setHop(String hop) {
		this.hop = hop;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getVen() {
		return ven;
	}

	public void setVen(String ven) {
		this.ven = ven;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getAccountid() {
		return accountid;
	}

	public void setAccountid(Long accountid) {
		this.accountid = accountid;
	}
	
	
}
