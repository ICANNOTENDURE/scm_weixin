package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
* @ClassName: Evalute 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author zhouxin
* @date 2015年2月3日 下午4:08:44 
*
 */
@Entity
@Table(name="t_hop_ele_pic")
public class EvalutePic implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="pid_id", unique=true, nullable=false, precision=22)
	private Long picId;

	/*扫码入库主表Id*/
	@Column(name="pic_ingdrecid")
	private Long picIngdrecId;
	
	
	@Column(name="pic_path")
	private String picpath;


	public Long getPicId() {
		return picId;
	}


	public void setPicId(Long picId) {
		this.picId = picId;
	}


	public Long getPicIngdrecId() {
		return picIngdrecId;
	}


	public void setPicIngdrecId(Long picIngdrecId) {
		this.picIngdrecId = picIngdrecId;
	}


	public String getPicpath() {
		return picpath;
	}


	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	
	
	

}