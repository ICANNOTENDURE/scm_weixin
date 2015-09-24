
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;

import com.dhcc.scm.entity.ven.VenDeliveritm;

/**
 * 
 * @author Administrator
 *
 */
public class DeliverWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private List<VenDeliveritm> deliveritms;


	/**
	 * @return the deliveritms
	 */
	public List<VenDeliveritm> getDeliveritms() {
		return deliveritms;
	}


	/**
	 * @param deliveritms the deliveritms to set
	 */
	public void setDeliveritms(List<VenDeliveritm> deliveritms) {
		this.deliveritms = deliveritms;
	}
	
	
	
	
	
	
}
