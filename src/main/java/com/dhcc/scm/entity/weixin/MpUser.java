package com.dhcc.scm.entity.weixin;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

//微信公众号和sci关联表
@Entity
@Table(name="t_wx_mp_user")
public class MpUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="wx_mp_userid", unique=true, nullable=false)
	private Long wxMpUserId;
	
	@Column(name="wx_mp_openid")
	private String wxMpOpenId;
	
	//对应sci里用户(T_SYS_NORMAL_USER)id
	@Column(name="wx_mp_sci_pointer")
	private Long wxMpSciPointer;
	
	@Column(name="wx_mp_unionid")
	private String wxMpUnionid;
	
	@Column(name="wx_mp_nickname")
	private String wxMpNickname;
	
	//关注公众号时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="wx_mp_subscribe_wx_time")
	private Date wxMpSubscribeWxTime;
	
	//关联供应链时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="wx_mp_subscribe_sci_time")
	private Date wxMpSubscribeSciTime;
	
	@Column(name="wx_mp_headimgurl")
	private String wxMpHeadimgurl;

	public Long getWxMpUserId() {
		return wxMpUserId;
	}

	public void setWxMpUserId(Long wxMpUserId) {
		this.wxMpUserId = wxMpUserId;
	}

	public String getWxMpOpenId() {
		return wxMpOpenId;
	}

	public void setWxMpOpenId(String wxMpOpenId) {
		this.wxMpOpenId = wxMpOpenId;
	}

	public Long getWxMpSciPointer() {
		return wxMpSciPointer;
	}

	public void setWxMpSciPointer(Long wxMpSciPointer) {
		this.wxMpSciPointer = wxMpSciPointer;
	}

	public String getWxMpUnionid() {
		return wxMpUnionid;
	}

	public void setWxMpUnionid(String wxMpUnionid) {
		this.wxMpUnionid = wxMpUnionid;
	}

	public String getWxMpNickname() {
		return wxMpNickname;
	}

	public void setWxMpNickname(String wxMpNickname) {
		this.wxMpNickname = wxMpNickname;
	}

	public Date getWxMpSubscribeWxTime() {
		return wxMpSubscribeWxTime;
	}

	public void setWxMpSubscribeWxTime(Date wxMpSubscribeWxTime) {
		this.wxMpSubscribeWxTime = wxMpSubscribeWxTime;
	}

	public Date getWxMpSubscribeSciTime() {
		return wxMpSubscribeSciTime;
	}

	public void setWxMpSubscribeSciTime(Date wxMpSubscribeSciTime) {
		this.wxMpSubscribeSciTime = wxMpSubscribeSciTime;
	}

	public String getWxMpHeadimgurl() {
		return wxMpHeadimgurl;
	}

	public void setWxMpHeadimgurl(String wxMpHeadimgurl) {
		this.wxMpHeadimgurl = wxMpHeadimgurl;
	}
	
	
}