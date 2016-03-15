/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.st;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecPic;

public class StInGdRecDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StInGdRec stInGdRec;

	private String ordSubId;
	
	private List<StInGdRecPic> inGdRecPics;
	

	public String getOrdSubId() {
		return ordSubId;
	}


	public void setOrdSubId(String ordSubId) {
		this.ordSubId = ordSubId;
	}


	public List<StInGdRecPic> getInGdRecPics() {
		return inGdRecPics;
	}


	public void setInGdRecPics(List<StInGdRecPic> inGdRecPics) {
		this.inGdRecPics = inGdRecPics;
	}


	public StInGdRec getStInGdRec() {
		return stInGdRec;
	}

	
	public void setStInGdRec(StInGdRec stInGdRec) {
		this.stInGdRec = stInGdRec;
	}
	
}
