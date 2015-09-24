package com.dhcc.scm.entity.vo.hop;

import java.sql.Timestamp;


/**
 * @author pengzhikun
 * function:定制科室信息显示实体类
 *
 */
public class HopIncNewsVo {
	
	private Long newsid;
	
	private String newstitle;
	
	private String newspath;
	
	private String newscontent;
	
	private String username;
	
	private Timestamp newsdate;
	
	private int readcount;

	public Long getNewsid() {
		return newsid;
	}

	public void setNewsid(Long newsid) {
		this.newsid = newsid;
	}

	public String getNewstitle() {
		return newstitle;
	}

	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}

	public String getNewspath() {
		return newspath;
	}

	public void setNewspath(String newspath) {
		this.newspath = newspath;
	}

	public String getNewscontent() {
		return newscontent;
	}

	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Timestamp getNewsdate() {
		return newsdate;
	}

	public void setNewsdate(Timestamp newsdate) {
		this.newsdate = newsdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	
	
	

		
}
