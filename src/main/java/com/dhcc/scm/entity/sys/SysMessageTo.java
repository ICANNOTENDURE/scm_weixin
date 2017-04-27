/**
 * 
 */
package com.dhcc.scm.entity.sys;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
* @ClassName: SysMessageTo 
* @Description: TODO(系统消息通知对象) 
* @author guoguomin
* @date 2016年11月10日 下午3:48:05 
*
 */
@Entity
@Table(name="t_sys_message_to")
public class SysMessageTo implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")
	@Column(name="TO_ID")
	private Long toId;
	
	@Column(name="TO_TYPE")
	private String toType;
	
	@Column(name="TO_DEPARTID")
	private long toDepartId;
	
	@Column(name="TO_MESSAGEID")
	private Long toMessageId;
	
	@Column(name="TO_READFLAG")
	private String toReadFlag;
	
	@Column(name="TO_READDATE")
	private Date toReaDate;
	
	@Column(name="TO_WX_OPENID")
	private Long toWxOpenIdLong;

	
	public Long getToId() {
		return toId;
	}

	
	public void setToId(Long toId) {
		this.toId = toId;
	}

	
	public String getToType() {
		return toType;
	}

	
	public void setToType(String toType) {
		this.toType = toType;
	}

	
	public long getToDepartId() {
		return toDepartId;
	}

	
	public void setToDepartId(long toDepartId) {
		this.toDepartId = toDepartId;
	}

	
	public Long getToMessageId() {
		return toMessageId;
	}

	
	public void setToMessageId(Long toMessageId) {
		this.toMessageId = toMessageId;
	}

	
	public String getToReadFlag() {
		return toReadFlag;
	}

	
	public void setToReadFlag(String toReadFlag) {
		this.toReadFlag = toReadFlag;
	}

	
	public Date getToReaDate() {
		return toReaDate;
	}

	
	public void setToReaDate(Date toReaDate) {
		this.toReaDate = toReaDate;
	}

	
	public Long getToWxOpenIdLong() {
		return toWxOpenIdLong;
	}

	
	public void setToWxOpenIdLong(Long toWxOpenIdLong) {
		this.toWxOpenIdLong = toWxOpenIdLong;
	}
	
	

}
