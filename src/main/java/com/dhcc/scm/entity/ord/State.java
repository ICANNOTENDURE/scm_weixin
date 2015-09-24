package com.dhcc.scm.entity.ord;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the T_ORD_STATE database table.
 * 
 */
@Entity
@Table(name="T_ORD_STATE")
public class State implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="T_ORD_STATE_STATEID_GENERATOR", sequenceName="SEQUENCE_ORD_STATE")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_ORD_STATE_STATEID_GENERATOR")
	@Column(name="STATE_ID")
	private Long stateId;

	@Column(name="STATE_CODE")
	private String stateCode;

	@Column(name="STATE_NAME")
	private String stateName;

	@Column(name="STATE_SEQ")
	private Long stateSeq;
	
	@Transient
	private String checkFlag;
	
	
	
	public String getCheckFlag() {
		return checkFlag;
	}

	public void setCheckFlag(String checkFlag) {
		this.checkFlag = checkFlag;
	}

	public State() {
	}

	public Long getStateId() {
		return this.stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public String getStateCode() {
		return this.stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getStateName() {
		return this.stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public Long getStateSeq() {
		return this.stateSeq;
	}

	public void setStateSeq(Long stateSeq) {
		this.stateSeq = stateSeq;
	}

}