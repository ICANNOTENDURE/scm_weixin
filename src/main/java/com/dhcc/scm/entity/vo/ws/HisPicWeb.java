package com.dhcc.scm.entity.vo.ws;

public class HisPicWeb {
	/**
	 * ORDER 供应商上传发货照片 
	 */
	private String picType;
	
	private String picName;
	public HisPicWeb() {
	}
	public HisPicWeb(String picType, String picName) {
		super();
		this.picType = picType;
		this.picName = picName;
	}

	public String getPicType() {
		return picType;
	}

	public void setPicType(String picType) {
		this.picType = picType;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}
	
}
