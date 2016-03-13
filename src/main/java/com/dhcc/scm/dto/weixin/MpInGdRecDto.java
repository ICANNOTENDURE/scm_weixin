/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecItm;

public class MpInGdRecDto extends BaseDto {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String url;
	private String title;
	private String user;
	private String loc;
	private String date;
	
	private String barcode;
	
	private String ordSubIdStr;
	
	private String imgIdStr;
	
	private String remark;
	
	private List<StInGdRecItm> stInGdRecItms;
	
	private StInGdRec stInGdRec;
	
	
	
	
	

	public List<StInGdRecItm> getStInGdRecItms() {
		return stInGdRecItms;
	}

	public void setStInGdRecItms(List<StInGdRecItm> stInGdRecItms) {
		this.stInGdRecItms = stInGdRecItms;
	}

	public StInGdRec getStInGdRec() {
		return stInGdRec;
	}

	public void setStInGdRec(StInGdRec stInGdRec) {
		this.stInGdRec = stInGdRec;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOrdSubIdStr() {
		return ordSubIdStr;
	}

	public void setOrdSubIdStr(String ordSubIdStr) {
		this.ordSubIdStr = ordSubIdStr;
	}

	public String getImgIdStr() {
		return imgIdStr;
	}

	public void setImgIdStr(String imgIdStr) {
		this.imgIdStr = imgIdStr;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
