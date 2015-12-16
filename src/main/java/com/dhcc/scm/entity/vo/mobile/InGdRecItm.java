/**
 * 
 */
package com.dhcc.scm.entity.vo.mobile;

import java.util.Date;



public class InGdRecItm {
	
	   //名称
		private String desc;
		
		private float rp;
		
		private float qty;
		
		private String batno;
		
		private Date expDate;
		
		private String hisId;
		
		private String manf;
		
		private String uom;
		
		private String vendor;
		
		private String scmid;
		
		private String resultCode="1";
		
		private String resultMsg="";
		
		private int seq;
		
		private String labelId;
		
		
		
		
		public String getLabelId() {
			return labelId;
		}

		public void setLabelId(String labelId) {
			this.labelId = labelId;
		}

		public int getSeq() {
			return seq;
		}

		public void setSeq(int seq) {
			this.seq = seq;
		}

		public String getResultMsg() {
			return resultMsg;
		}

		public void setResultMsg(String resultMsg) {
			this.resultMsg = resultMsg;
		}

		public String getScmid() {
			return scmid;
		}

		public void setScmid(String scmid) {
			this.scmid = scmid;
		}

		

		public String getResultCode() {
			return resultCode;
		}

		public void setResultCode(String resultCode) {
			this.resultCode = resultCode;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}

		public float getRp() {
			return rp;
		}

		public void setRp(float rp) {
			this.rp = rp;
		}

		public float getQty() {
			return qty;
		}

		public void setQty(float qty) {
			this.qty = qty;
		}

		public String getBatno() {
			return batno;
		}

		public void setBatno(String batno) {
			this.batno = batno;
		}

		public Date getExpDate() {
			return expDate;
		}

		public void setExpDate(Date expDate) {
			this.expDate = expDate;
		}

		public String getHisId() {
			return hisId;
		}

		public void setHisId(String hisId) {
			this.hisId = hisId;
		}

		public String getManf() {
			return manf;
		}

		public void setManf(String manf) {
			this.manf = manf;
		}

		public String getUom() {
			return uom;
		}

		public void setUom(String uom) {
			this.uom = uom;
		}

		public String getVendor() {
			return vendor;
		}

		public void setVendor(String vendor) {
			this.vendor = vendor;
		}
		
		
	
}
