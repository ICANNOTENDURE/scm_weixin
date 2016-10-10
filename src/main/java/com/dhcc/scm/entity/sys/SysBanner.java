
package com.dhcc.scm.entity.sys;



import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 
* @ClassName: SysBanner 
* @Description: TODO(登录首页背景图片转换) 
* @author zhouxin
* @date 2016年10月9日 下午3:09:05 
*
 */
@Entity
@Table(name="t_sys_banner")
public class SysBanner implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")
	@Column(name="banner_id")
	private int bannerId;
	
	

	@Column(name="banner_path")
	private String bannerPath;

	@Column(name="banner_seq")
	private int bannerSeq;
	
	@Column(name="banner_status")
	private String bannerStatus;

	public int getBannerId() {
		return bannerId;
	}

	public void setBannerId(int bannerId) {
		this.bannerId = bannerId;
	}

	public String getBannerPath() {
		return bannerPath;
	}

	public void setBannerPath(String bannerPath) {
		this.bannerPath = bannerPath;
	}

	public int getBannerSeq() {
		return bannerSeq;
	}

	public void setBannerSeq(int bannerSeq) {
		this.bannerSeq = bannerSeq;
	}

	public String getBannerStatus() {
		return bannerStatus;
	}

	public void setBannerStatus(String bannerStatus) {
		this.bannerStatus = bannerStatus;
	}
	
	

	}
