package com.dhcc.scm.entity.hop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="T_HOP_INC_NEWS")
public class HopIncNews implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_INCNEWS")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="INCNEWS_ID", unique=true, nullable=false)
	private Long incNewsId;

	@Column(name="INCNEWS_TITLE")
	private String incNewsTitle;

	@Column(name="INCNEWS_USERID")
	private Long incNewsUserId;

	@Column(name="INCNEWS_PATH")
	private String incNewsPath;
	
	@Column(name="INCNEWS_DATE")
	private Date incNewsDate;
	
	@Column(name="INCNEWS_CONTENT")
	private String incNewsContetnt;
	
	/*
	 * 1:医院缺货通知
	 * 2:院内通知
	 */
	@Column(name="INCNEWS_TYPE")
	private String incNewsType;
	
	@Column(name="INCNEWS_READCOUNT")
	private int readCount;
	
	@Transient
	private String userName;
	
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getIncNewsType() {
		return incNewsType;
	}

	public void setIncNewsType(String incNewsType) {
		this.incNewsType = incNewsType;
	}

	public Long getIncNewsId() {
		return incNewsId;
	}

	public void setIncNewsId(Long incNewsId) {
		this.incNewsId = incNewsId;
	}

	public String getIncNewsTitle() {
		return incNewsTitle;
	}

	public void setIncNewsTitle(String incNewsTitle) {
		this.incNewsTitle = incNewsTitle;
	}

	public Long getIncNewsUserId() {
		return incNewsUserId;
	}

	public void setIncNewsUserId(Long incNewsUserId) {
		this.incNewsUserId = incNewsUserId;
	}

	public String getIncNewsPath() {
		return incNewsPath;
	}

	public void setIncNewsPath(String incNewsPath) {
		this.incNewsPath = incNewsPath;
	}

	public Date getIncNewsDate() {
		return incNewsDate;
	}

	public void setIncNewsDate(Date incNewsDate) {
		this.incNewsDate = incNewsDate;
	}

	public String getIncNewsContetnt() {
		return incNewsContetnt;
	}

	public void setIncNewsContetnt(String incNewsContetnt) {
		this.incNewsContetnt = incNewsContetnt;
	}
	
	
	


}