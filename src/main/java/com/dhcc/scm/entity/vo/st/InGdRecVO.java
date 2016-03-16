package com.dhcc.scm.entity.vo.st;

import java.util.Date;

public class InGdRecVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String no;
	
	private Long id;
	
	private String user;
	
	private String ven;
	
	private Date date;
	
	private String loc;
	
	
	
	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getVen() {
		return ven;
	}

	public void setVen(String ven) {
		this.ven = ven;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
