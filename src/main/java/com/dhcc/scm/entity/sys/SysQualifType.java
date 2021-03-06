package com.dhcc.scm.entity.sys;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author huaxiaoying
 * date    20160302
 *
 */
@Entity
@Table(name="T_SYS_QUALIF_TYPE")
public class SysQualifType implements Serializable{
	/**
	 * 默认
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="QUALIF_TYPE_ID")
	private Long qualifTypeId;
	
	@Column(name="QUALIF_TYPE_CODE")
	private String code;
	@Column(name="QUALIF_TYPE_NAME")
	private String name;
	@Column(name="QUALIF_TYPE_TYPE")
	private String type;
	@Column(name="QUALIF_TYPE_CATGROUP_ID")
	private Long catgroupid;
	@Column(name="QUALIF_TYPE_SEQ")
	private Integer seq;
	


	 
	
	


	public Long getQualifTypeId() {
		return this.qualifTypeId;
	}
	public void setQualifTypeId(Long qualifTypeId) {
		this.qualifTypeId = qualifTypeId;
	}
	public String getCode() {
		return this.code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Long getCatgroupid() {
		return this.catgroupid;
	}
	public void setCatgroupid(Long catgroupid) {
		this.catgroupid = catgroupid;
	}
	public Integer getSeq() {
		return this.seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	

}
