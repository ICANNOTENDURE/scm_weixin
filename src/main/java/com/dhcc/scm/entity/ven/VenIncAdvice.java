package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


/**
 * The persistent class for the T_VEN_INC database table.
 * 
 */
@Entity
@Table(name="T_VEN_INC_ADVICE")
public class VenIncAdvice implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_VENINCADVICE")})
	@GeneratedValue(generator="idGenerator")	
	@Column(name="VENINCADVICE_ID", unique=true, nullable=false)
	private Long venIncAdviceId;

	@Column(name="VENINCADVICE_INC_ID")
	private Long venIncAdviceIncId;

	@Column(name="VENINCADVICE_ASK")
	private String venIncAdviceAsk;

	@Column(name="VENINCADVICE_ASK_USERID")
	private Long venIncAdviceAskUserId;

	@Column(name="VENINCADVICE_REPLAY")
	private  String venIncAdviceReplay;
	
	@Column(name="VENINCADVICE_REPLAY_USERID")
	private Long venIncAdviceReplayUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="VENINCADVICE_ASK_DATE")
	private Date venIncAdviceAskDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="VENINCADVICE_REPLAY_DATE")
	private Date venIncAdviceReplayDate;
	
	@Column(name="VENINCADVICE_READFLAG")
	private  String venIncAdviceReadFlag;
	
	
	
	public String getVenIncAdviceReadFlag() {
		return venIncAdviceReadFlag;
	}

	public void setVenIncAdviceReadFlag(String venIncAdviceReadFlag) {
		this.venIncAdviceReadFlag = venIncAdviceReadFlag;
	}

	public Long getVenIncAdviceId() {
		return venIncAdviceId;
	}

	public void setVenIncAdviceId(Long venIncAdviceId) {
		this.venIncAdviceId = venIncAdviceId;
	}

	public Long getVenIncAdviceIncId() {
		return venIncAdviceIncId;
	}

	public void setVenIncAdviceIncId(Long venIncAdviceIncId) {
		this.venIncAdviceIncId = venIncAdviceIncId;
	}

	public String getVenIncAdviceAsk() {
		return venIncAdviceAsk;
	}

	public void setVenIncAdviceAsk(String venIncAdviceAsk) {
		this.venIncAdviceAsk = venIncAdviceAsk;
	}

	public Long getVenIncAdviceAskUserId() {
		return venIncAdviceAskUserId;
	}

	public void setVenIncAdviceAskUserId(Long venIncAdviceAskUserId) {
		this.venIncAdviceAskUserId = venIncAdviceAskUserId;
	}

	public String getVenIncAdviceReplay() {
		return venIncAdviceReplay;
	}

	public void setVenIncAdviceReplay(String venIncAdviceReplay) {
		this.venIncAdviceReplay = venIncAdviceReplay;
	}

	public Long getVenIncAdviceReplayUserId() {
		return venIncAdviceReplayUserId;
	}

	public void setVenIncAdviceReplayUserId(Long venIncAdviceReplayUserId) {
		this.venIncAdviceReplayUserId = venIncAdviceReplayUserId;
	}

	public Date getVenIncAdviceAskDate() {
		return venIncAdviceAskDate;
	}

	public void setVenIncAdviceAskDate(Date venIncAdviceAskDate) {
		this.venIncAdviceAskDate = venIncAdviceAskDate;
	}

	public Date getVenIncAdviceReplayDate() {
		return venIncAdviceReplayDate;
	}

	public void setVenIncAdviceReplayDate(Date venIncAdviceReplayDate) {
		this.venIncAdviceReplayDate = venIncAdviceReplayDate;
	}

	

}