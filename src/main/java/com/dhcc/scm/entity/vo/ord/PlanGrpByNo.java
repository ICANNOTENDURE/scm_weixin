package com.dhcc.scm.entity.vo.ord;

import java.util.Date;
import java.util.List;




public class PlanGrpByNo implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String planno;
	
	private Date plandate;
	
	private String planctloc;
	
	private List<PlanItmVO> planItmVOs;

	public String getPlanno() {
		return planno;
	}

	public void setPlanno(String planno) {
		this.planno = planno;
	}

	public Date getPlandate() {
		return plandate;
	}

	public void setPlandate(Date plandate) {
		this.plandate = plandate;
	}

	public String getPlanctloc() {
		return planctloc;
	}

	public void setPlanctloc(String planctloc) {
		this.planctloc = planctloc;
	}

	public List<PlanItmVO> getPlanItmVOs() {
		return planItmVOs;
	}

	public void setPlanItmVOs(List<PlanItmVO> planItmVOs) {
		this.planItmVOs = planItmVOs;
	}

	
	
	
}
