package com.dhcc.scm.entity.vo.sys;

import java.sql.Timestamp;



public class SysMessageCheckVo {

private Long messageId;
	private String typedesc;
	
	private String messageTitle;
	
	private String messageContent;
	
	private String messageType;

	private String messageStatus;

	private String messageTotype;

	private int messageSendPointer;

	private String messageSendType;

	private Timestamp messageDate;

	private Timestamp messageCreatedate;
	
	private int messageCreateuser;
	
	

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

	/**
	 * @return the typeDesc
	 */
	public String getTypedesc() {
		return typedesc;
	}

	/**
	 * @param typeDesc the typeDesc to set
	 */
	public void setTypedesc(String typedesc) {
		this.typedesc = typedesc;
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
	public Timestamp getMessageDate() {
		return messageDate;
	}

	/**
	 * @param messageDate the messageDate to set
	 */
	public void setMessageDate(Timestamp messageDate) {
		this.messageDate = messageDate;
	}

	/**
	 * @return the messageCreatedate
	 */
	public Timestamp getMessageCreatedate() {
		return messageCreatedate;
	}

	/**
	 * @param messageCreatedate the messageCreatedate to set
	 */
	public void setMessageCreatedate(Timestamp messageCreatedate) {
		this.messageCreatedate = messageCreatedate;
	}

		
}
