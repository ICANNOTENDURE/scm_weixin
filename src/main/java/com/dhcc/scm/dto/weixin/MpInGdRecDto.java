/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hop.Evalute;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecItm;
import com.dhcc.scm.entity.st.StInGdRecPic;
import com.dhcc.scm.entity.vo.st.InGdRecVO;

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
	
	
	private Date startDate;
	
	private Date endDate;
	
	
	private Long locId;
	
	private List<InGdRecVO> gdRecVOs;
	
	
	private List<StInGdRecPic> inGdRecPics;
	
	private Evalute evalute;
	
	
	

	public Evalute getEvalute() {
		return evalute;
	}

	public void setEvalute(Evalute evalute) {
		this.evalute = evalute;
	}

	public List<StInGdRecPic> getInGdRecPics() {
		return inGdRecPics;
	}

	public void setInGdRecPics(List<StInGdRecPic> inGdRecPics) {
		this.inGdRecPics = inGdRecPics;
	}

	public List<InGdRecVO> getGdRecVOs() {
		return gdRecVOs;
	}

	public void setGdRecVOs(List<InGdRecVO> gdRecVOs) {
		this.gdRecVOs = gdRecVOs;
	}

	public Long getLocId() {
		return locId;
	}

	public void setLocId(Long locId) {
		this.locId = locId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

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
