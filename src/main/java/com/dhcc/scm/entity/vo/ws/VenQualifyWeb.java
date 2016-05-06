
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author Administrator
 *
 */
public class VenQualifyWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private OperateResult operateResult;
	
	private List<VenQualifyWebItm> venQualifyWebItms;


    
	

	public OperateResult getOperateResult() {
		return operateResult;
	}

	public void setOperateResult(OperateResult operateResult) {
		this.operateResult = operateResult;
	}

	public List<VenQualifyWebItm> getVenQualifyWebItms() {
		return venQualifyWebItms;
	}

	public void setVenQualifyWebItms(List<VenQualifyWebItm> venQualifyWebItms) {
		this.venQualifyWebItms = venQualifyWebItms;
	}

	
	
	
	
	
}
