/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import java.util.Date;

import javax.persistence.Column;

import com.dhcc.scm.entity.sys.SysMessage;
import com.dhcc.framework.transmission.dto.BaseDto;

public class SysMessageDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
   private Date ordStart;
	
	private Date ordEnd;
	
	private Long messageId;
	
	private String messageTitle;
	
	private String messageContent;
	
	private String messageType;

	private String messageStatus;
	
	private String messageTotype;

	private int messageSendPointer;

	private String messageSendType;

	private Date messageDate;

	private Date messageCreatedate;


	/**
	 * @return the ordStart
	 */
	public Date getOrdStart() {
		return ordStart;
	}


	/**
	 * @param ordStart the ordStart to set
	 */
	public void setOrdStart(Date ordStart) {
		this.ordStart = ordStart;
	}


	/**
	 * @return the ordEnd
	 */
	public Date getOrdEnd() {
		return ordEnd;
	}


	/**
	 * @param ordEnd the ordEnd to set
	 */
	public void setOrdEnd(Date ordEnd) {
		this.ordEnd = ordEnd;
	}


	/**
	 * @return the messageId
	 */
	public Long getMessageId() {
		return messageId;
	}


	/**
	 * @param messageId the messageId to set
	 */
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}


	/**
	 * @return the messageTitle
	 */
	public String getMessageTitle() {
		return messageTitle;
	}


	/**
	 * @param messageTitle the messageTitle to set
	 */
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}


	/**
	 * @return the messageContent
	 */
	public String getMessageContent() {
		return messageContent;
	}


	/**
	 * @param messageContent the messageContent to set
	 */
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	/**
	 * @return the messageType
	 */
	public String getMessageType() {
		return messageType;
	}


	/**
	 * @param messageType the messageType to set
	 */
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}


	/**
	 * @return the messageStatus
	 */
	public String getMessageStatus() {
		return messageStatus;
	}


	/**
	 * @param messageStatus the messageStatus to set
	 */
	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}


	/**
	 * @return the messageTotype
	 */
	public String getMessageTotype() {
		return messageTotype;
	}


	/**
	 * @param messageTotype the messageTotype to set
	 */
	public void setMessageTotype(String messageTotype) {
		this.messageTotype = messageTotype;
	}


	/**
	 * @return the messageSendPointer
	 */
	public int getMessageSendPointer() {
		return messageSendPointer;
	}


	/**
	 * @param messageSendPointer the messageSendPointer to set
	 */
	public void setMessageSendPointer(int messageSendPointer) {
		this.messageSendPointer = messageSendPointer;
	}


	/**
	 * @return the messageSendType
	 */
	public String getMessageSendType() {
		return messageSendType;
	}


	/**
	 * @param messageSendType the messageSendType to set
	 */
	public void setMessageSendType(String messageSendType) {
		this.messageSendType = messageSendType;
	}


	/**
	 * @return the messageDate
	 */
	public Date getMessageDate() {
		return messageDate;
	}


	/**
	 * @param messageDate the messageDate to set
	 */
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}


	/**
	 * @return the messageCreatedate
	 */
	public Date getMessageCreatedate() {
		return messageCreatedate;
	}


	/**
	 * @param messageCreatedate the messageCreatedate to set
	 */
	public void setMessageCreatedate(Date messageCreatedate) {
		this.messageCreatedate = messageCreatedate;
	}


	/**
	 * @return the messageCreateuser
	 */
	public int getMessageCreateuser() {
		return messageCreateuser;
	}


	/**
	 * @param messageCreateuser the messageCreateuser to set
	 */
	public void setMessageCreateuser(int messageCreateuser) {
		this.messageCreateuser = messageCreateuser;
	}


	private int messageCreateuser;

	
	
	
	private SysMessage sysMessage;
    private Long sysMessageId;
    private Date sysStart;
	private Date sysEnd; 
	
	/**
	 * @return the sysStart
	 */
	public Date getSysStart() {
		return sysStart;
	}


	/**
	 * @param sysStart the sysStart to set
	 */
	public void setSysStart(Date sysStart) {
		this.sysStart = sysStart;
	}


	/**
	 * @return the sysEnd
	 */
	public Date getSysEnd() {
		return sysEnd;
	}


	/**
	 * @param sysEnd the sysEnd to set
	 */
	public void setSysEnd(Date sysEnd) {
		this.sysEnd = sysEnd;
	}


	public SysMessage getSysMessage() {
		return sysMessage;
	}

	
	public void setSysMessage(SysMessage sysMessage) {
		this.sysMessage = sysMessage;
	}


	/**
	 * @return the sysMessageId
	 */
	public Long getSysMessageId() {
		return sysMessageId;
	}


	/**
	 * @param sysMessageId the sysMessageId to set
	 */
	public void setSysMessageId(Long sysMessageId) {
		this.sysMessageId = sysMessageId;
	}
	
}
