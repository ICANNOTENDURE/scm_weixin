
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class HisInGdRec implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String resultCode;
	
	private String resultContent;
	
	private List<HisInGdRecItm> inGdRecItms =new ArrayList<HisInGdRecItm>();

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public List<HisInGdRecItm> getInGdRecItms() {
		return inGdRecItms;
	}

	public void setInGdRecItms(List<HisInGdRecItm> inGdRecItms) {
		this.inGdRecItms = inGdRecItms;
	}
	
}
