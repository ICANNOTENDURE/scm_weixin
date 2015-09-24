package com.dhcc.scm.entity.weixin;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="T_WX_USER")
public class WxUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="WXUSER_ID", unique=true, nullable=false)
	private String wxUserId;
	
	
	@Column(name="WXUSER_NAME")
	private String wxUserName;
	
	@Column(name="WXUSER_EMAIL")
	private String wxUserEmail;
	
	@Column(name="WXUSER_TEL")
	private String wxUserTel;
	
	@Column(name="WXUSER_WEIXINID")
	private String wxUserWeixinId;
	
	@Column(name="WXUSER_SCMID")
	private Long wxUserScmId;
	
	@Column(name="WXUSER_DEPARTID")
	private Integer wxUserDepartId;
	
	
	
	
	public Integer getWxUserDepartId() {
		return wxUserDepartId;
	}

	public void setWxUserDepartId(Integer wxUserDepartId) {
		this.wxUserDepartId = wxUserDepartId;
	}

	public String getWxUserId() {
		return wxUserId;
	}

	public void setWxUserId(String wxUserId) {
		this.wxUserId = wxUserId;
	}

	public String getWxUserName() {
		return wxUserName;
	}

	public void setWxUserName(String wxUserName) {
		this.wxUserName = wxUserName;
	}

	public String getWxUserEmail() {
		return wxUserEmail;
	}

	public void setWxUserEmail(String wxUserEmail) {
		this.wxUserEmail = wxUserEmail;
	}

	public String getWxUserTel() {
		return wxUserTel;
	}

	public void setWxUserTel(String wxUserTel) {
		this.wxUserTel = wxUserTel;
	}

	public String getWxUserWeixinId() {
		return wxUserWeixinId;
	}

	public void setWxUserWeixinId(String wxUserWeixinId) {
		this.wxUserWeixinId = wxUserWeixinId;
	}

	public Long getWxUserScmId() {
		return wxUserScmId;
	}

	public void setWxUserScmId(Long wxUserScmId) {
		this.wxUserScmId = wxUserScmId;
	}
	
	
	
	
}