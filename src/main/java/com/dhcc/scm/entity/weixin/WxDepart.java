package com.dhcc.scm.entity.weixin;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "T_WX_DEPART")
public class WxDepart implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence",parameters={@Parameter(name="sequence",value="SEQUENCE_WX_DEPART")})
	//@GeneratedValue(generator="idGenerator")	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "WXDEPART_ID", unique = true, nullable = false)
	private Integer wxDepartId;

	@Column(name = "WXDEPART_NAME")
	private String wxDepartName;

	@Column(name = "WXDEPART_PARENTID")
	private Integer wxDepartParentId;

	@Column(name = "WXDEPART_SCMID")
	private Long wxDepartScmId;

	public Integer getWxDepartId() {
		return wxDepartId;
	}

	public void setWxDepartId(Integer wxDepartId) {
		this.wxDepartId = wxDepartId;
	}

	public String getWxDepartName() {
		return wxDepartName;
	}

	public void setWxDepartName(String wxDepartName) {
		this.wxDepartName = wxDepartName;
	}

	public Integer getWxDepartParentId() {
		return wxDepartParentId;
	}

	public void setWxDepartParentId(Integer wxDepartParentId) {
		this.wxDepartParentId = wxDepartParentId;
	}

	public Long getWxDepartScmId() {
		return wxDepartScmId;
	}

	public void setWxDepartScmId(Long wxDepartScmId) {
		this.wxDepartScmId = wxDepartScmId;
	}

}