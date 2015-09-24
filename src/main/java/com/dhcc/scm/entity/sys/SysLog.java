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
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OptimisticLockType;
import org.hibernate.annotations.OptimisticLocking;



@Entity
@Table(name="T_SYS_LOG")
@OptimisticLocking(type=OptimisticLockType.VERSION)
public class SysLog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="ID")
	private String opId;
	
	@Column(name="VERSION")
	private BigInteger version;

	@Column(name="OPUSER")
	private String opUser;

	@Column(name="OPTYPE")
	private String opType;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="OPDATE")
	private Date opDate;

	@Column(name="OPIP")
	private String opIp;

	@Column(name="OPNAME")
	private String opName;

	@Column(name="OPBEFORE")
	private String opBefore;

	@Column(name="OPAFTER")
	private String opAfter;

	@Column(name="OPARG")
	private String opArg;

	@Column(name="OPRESULTS")
	private String opResult;

	/**
	 * @return the opId
	 */
	public String getOpId() {
		return opId;
	}

	/**
	 * @param opId the opId to set
	 */
	public void setOpId(String opId) {
		this.opId = opId;
	}

	/**
	 * @return the opUser
	 */
	public String getOpUser() {
		return opUser;
	}

	/**
	 * @param opUser the opUser to set
	 */
	public void setOpUser(String opUser) {
		this.opUser = opUser;
	}

	/**
	 * @return the opType
	 */
	public String getOpType() {
		return opType;
	}

	/**
	 * @param opType the opType to set
	 */
	public void setOpType(String opType) {
		this.opType = opType;
	}

	/**
	 * @return the opDate
	 */
	public Date getOpDate() {
		return opDate;
	}

	/**
	 * @param opDate the opDate to set
	 */
	public void setOpDate(Date opDate) {
		this.opDate = opDate;
	}

	/**
	 * @return the opIp
	 */
	public String getOpIp() {
		return opIp;
	}

	/**
	 * @param opIp the opIp to set
	 */
	public void setOpIp(String opIp) {
		this.opIp = opIp;
	}

	/**
	 * @return the opName
	 */
	public String getOpName() {
		return opName;
	}

	/**
	 * @param opName the opName to set
	 */
	public void setOpName(String opName) {
		this.opName = opName;
	}

	/**
	 * @return the opBefore
	 */
	public String getOpBefore() {
		return opBefore;
	}

	/**
	 * @param opBefore the opBefore to set
	 */
	public void setOpBefore(String opBefore) {
		this.opBefore = opBefore;
	}

	/**
	 * @return the opAfter
	 */
	public String getOpAfter() {
		return opAfter;
	}

	/**
	 * @param opAfter the opAfter to set
	 */
	public void setOpAfter(String opAfter) {
		this.opAfter = opAfter;
	}

	/**
	 * @return the opArg
	 */
	public String getOpArg() {
		return opArg;
	}

	/**
	 * @param opArg the opArg to set
	 */
	public void setOpArg(String opArg) {
		this.opArg = opArg;
	}

	/**
	 * @return the opResult
	 */
	public String getOpResult() {
		return opResult;
	}

	/**
	 * @param opResult the opResult to set
	 */
	public void setOpResult(String opResult) {
		this.opResult = opResult;
	}

	public BigInteger getVersion() {
		return version;
	}

	public void setVersion(BigInteger version) {
		this.version = version;
	};
	
	
	
	

}
