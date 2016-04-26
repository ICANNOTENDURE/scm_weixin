
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 
 * @author Administrator
 *
 */
public class VenQualifyWebItm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 工商执照
	 */
	private String businessLicenseNo;//工商执照号
	private List<HisPicWeb> businessLicensePics;//照片
	private Date businessLicenseExpDate;//效期
	
	/**
	 * 器械经营许可
	 */
	private String equipmentPermit;//许可证号
	private List<HisPicWeb> equipmentPermitPics;//照片
	private Date equipmentPermitExpDate;//效期
	public String getBusinessLicenseNo() {
		return businessLicenseNo;
	}
	public void setBusinessLicenseNo(String businessLicenseNo) {
		this.businessLicenseNo = businessLicenseNo;
	}
	public List<HisPicWeb> getBusinessLicensePics() {
		return businessLicensePics;
	}
	public void setBusinessLicensePics(List<HisPicWeb> businessLicensePics) {
		this.businessLicensePics = businessLicensePics;
	}
	public Date getBusinessLicenseExpDate() {
		return businessLicenseExpDate;
	}
	public void setBusinessLicenseExpDate(Date businessLicenseExpDate) {
		this.businessLicenseExpDate = businessLicenseExpDate;
	}
	public String getEquipmentPermit() {
		return equipmentPermit;
	}
	public void setEquipmentPermit(String equipmentPermit) {
		this.equipmentPermit = equipmentPermit;
	}
	public List<HisPicWeb> getEquipmentPermitPics() {
		return equipmentPermitPics;
	}
	public void setEquipmentPermitPics(List<HisPicWeb> equipmentPermitPics) {
		this.equipmentPermitPics = equipmentPermitPics;
	}
	public Date getEquipmentPermitExpDate() {
		return equipmentPermitExpDate;
	}
	public void setEquipmentPermitExpDate(Date equipmentPermitExpDate) {
		this.equipmentPermitExpDate = equipmentPermitExpDate;
	}
	
	
	
	
	
}
