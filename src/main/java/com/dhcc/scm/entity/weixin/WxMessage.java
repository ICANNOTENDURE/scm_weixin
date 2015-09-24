package com.dhcc.scm.entity.weixin;

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


/**
 * The persistent class for the T_VEN_DELIVER database table.
 * 
 */
@Entity
@Table(name="T_WX_MESSAGE")
public class WxMessage implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="WXMESSAGE_ID", unique=true, nullable=false)
	private String wxMessageId;
	
	
	@Column(name="WXMESSAGE_CONTENT")
	private String wxMessageContent;
	
	@Column(name="WXMESSAGE_Title")
	private String wxMessageTitle;
	
	@Column(name="WXMESSAGE_URL")
	private String wxMessageUrl;
	
	@Column(name="WXMESSAGE_PicUrl")
	private String wxMessagePicUrl;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="WXMESSAGE_DATE")
	private Date wxMessageDate;
	
	@Column(name="WXMESSAGE_TOPARTYID")
	private String wxMessageToPartyId;
	
	public String getWxMessageId() {
		return wxMessageId;
	}


	public void setWxMessageId(String wxMessageId) {
		this.wxMessageId = wxMessageId;
	}


	public String getWxMessageContent() {
		return wxMessageContent;
	}


	public void setWxMessageContent(String wxMessageContent) {
		this.wxMessageContent = wxMessageContent;
	}


	public Date getWxMessageDate() {
		return wxMessageDate;
	}


	public void setWxMessageDate(Date wxMessageDate) {
		this.wxMessageDate = wxMessageDate;
	}


	public String getWxMessageTitle() {
		return wxMessageTitle;
	}


	public void setWxMessageTitle(String wxMessageTitle) {
		this.wxMessageTitle = wxMessageTitle;
	}


	public String getWxMessageUrl() {
		return wxMessageUrl;
	}


	public void setWxMessageUrl(String wxMessageUrl) {
		this.wxMessageUrl = wxMessageUrl;
	}


	public String getWxMessagePicUrl() {
		return wxMessagePicUrl;
	}


	public void setWxMessagePicUrl(String wxMessagePicUrl) {
		this.wxMessagePicUrl = wxMessagePicUrl;
	}


	public String getWxMessageToPartyId() {
		return wxMessageToPartyId;
	}


	public void setWxMessageToPartyId(String wxMessageToPartyId) {
		this.wxMessageToPartyId = wxMessageToPartyId;
	}
	
	
	
}