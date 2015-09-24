
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author Administrator
 *
 */
public class HisCmpRecWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String hopname;
	
	private String venname;
	
	private List<String> invs;

	/**
	 * @return the hopname
	 */
	public String getHopname() {
		return hopname;
	}

	/**
	 * @param hopname the hopname to set
	 */
	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	/**
	 * @return the venname
	 */
	public String getVenname() {
		return venname;
	}

	/**
	 * @param venname the venname to set
	 */
	public void setVenname(String venname) {
		this.venname = venname;
	}

	/**
	 * @return the invs
	 */
	public List<String> getInvs() {
		return invs;
	}

	/**
	 * @param invs the invs to set
	 */
	public void setInvs(List<String> invs) {
		this.invs = invs;
	}
	
	
	
	
}
