/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import java.util.List;

import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.framework.transmission.dto.BaseDto;

public class SysImpModelDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ImpModel impModel;

	private List<ImpModel> impModelList;
	

	private String imModelString;
	
	



	/**
	 * @return the imModelString
	 */
	public String getImModelString() {
		return imModelString;
	}


	/**
	 * @param imModelString the imModelString to set
	 */
	public void setImModelString(String imModelString) {
		this.imModelString = imModelString;
	}


	/**
	 * @return the impModelList
	 */
	public List<ImpModel> getImpModelList() {
		return impModelList;
	}


	/**
	 * @param impModelList the impModelList to set
	 */
	public void setImpModelList(List<ImpModel> impModelList) {
		this.impModelList = impModelList;
	}


	public ImpModel getImpModel() {
		return impModel;
	}

	
	public void setImpModel(ImpModel impModel) {
		this.impModel = impModel;
	}
	
}
