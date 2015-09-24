package com.dhcc.scm.entity.weixin;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "T_WX_MESSAGE_PIC")
public class WxMessagePic implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name = "WXMESSAGE_PICID")
	private String wxMessagePicId;
	
	@Column(name = "WXMESSAGE_ID")
	private String wxMessageId;

	@Column(name = "WXMESSAGE_PIC")
	private String wxMessagePIC;

	public String getWxMessageId() {
		return wxMessageId;
	}

	public void setWxMessageId(String wxMessageId) {
		this.wxMessageId = wxMessageId;
	}

	public String getWxMessagePIC() {
		return wxMessagePIC;
	}

	public void setWxMessagePIC(String wxMessagePIC) {
		this.wxMessagePIC = wxMessagePIC;
	}

	
	
}