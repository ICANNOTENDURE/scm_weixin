/**
 * 
 */
package com.dhcc.scm.entity.vo.mobile;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;



public class InGdRec implements Serializable{
	  
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		private String codeType;	
	
		private String resultCode="1";
		
		private String resultComtent="";
		
		private List<InGdRecItm> gdRecItms=new ArrayList<InGdRecItm>();

		public String getResultCode() {
			return resultCode;
		}

		public void setResultCode(String resultCode) {
			this.resultCode = resultCode;
		}

		public String getResultComtent() {
			return resultComtent;
		}

		public void setResultComtent(String resultComtent) {
			this.resultComtent = resultComtent;
		}

		public List<InGdRecItm> getGdRecItms() {
			return gdRecItms;
		}

		public void setGdRecItms(List<InGdRecItm> gdRecItms) {
			this.gdRecItms = gdRecItms;
		}

		public String getCodeType() {
			return codeType;
		}

		public void setCodeType(String codeType) {
			this.codeType = codeType;
		}
		
		
		
	
}