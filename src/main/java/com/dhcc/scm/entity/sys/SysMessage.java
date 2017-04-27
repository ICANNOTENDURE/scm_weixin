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
* @ClassName: SysMessage 
* @Description: TODO(系统通知消息) 
* @author guoguomin
* @date 2016年11月10日 下午3:48:05 
*
 */
@Entity
@Table(name="t_sys_message")
public class SysMessage implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")
	@Column(name="message_id")
	private Long messageId;
	
	@Column(name="message_title")
	private String messageTitle;
	
	@Column(name="message_content")
	private String messageContent;
	
	@Column(name="message_type")
	private String messageType;
	
	@Column(name="message_status")
	private String messageStatus;
	
	@Column(name="message_totype")
	private String messageTotype;
	
	@Column(name="message_send_pointer")
	private int messageSendPointer;
	
	@Column(name="message_send_type")
	private String messageSendType;
	
	@Column(name="message_date")
	private Date messageDate;
	
	@Column(name="message_createdate")
	private Date messageCreatedate;
	
	@Column(name="message_createuser")
	private int messageCreateuser;

	
	public Long getMessageId() {
		return messageId;
	}

	
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}

	
	public String getMessageTitle() {
		return messageTitle;
	}

	
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	
	public String getMessageContent() {
		return messageContent;
	}

	
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public String getMessageType() {
		return messageType;
	}

	
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	
	public String getMessageStatus() {
		return messageStatus;
	}

	
	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}

	
	public String getMessageTotype() {
		return messageTotype;
	}

	
	public void setMessageTotype(String messageTotype) {
		this.messageTotype = messageTotype;
	}

	
	public int getMessageSendPointer() {
		return messageSendPointer;
	}

	
	public void setMessageSendPointer(int messageSendPointer) {
		this.messageSendPointer = messageSendPointer;
	}

	
	public String getMessageSendType() {
		return messageSendType;
	}

	
	public void setMessageSendType(String messageSendType) {
		this.messageSendType = messageSendType;
	}

	
	public Date getMessageDate() {
		return messageDate;
	}

	
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	
	public Date getMessageCreatedate() {
		return messageCreatedate;
	}

	
	public void setMessageCreatedate(Date messageCreatedate) {
		this.messageCreatedate = messageCreatedate;
	}

	
	public int getMessageCreateuser() {
		return messageCreateuser;
	}

	
	public void setMessageCreateuser(int messageCreateuser) {
		this.messageCreateuser = messageCreateuser;
	}

	
	

	
	
	
}
