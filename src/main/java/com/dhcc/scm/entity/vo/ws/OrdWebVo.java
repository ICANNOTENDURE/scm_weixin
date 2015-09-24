package com.dhcc.scm.entity.vo.ws;

import java.util.List;





public class OrdWebVo implements java.io.Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<OrderWebVo> orderWebVos;
	
	private OperateResult operateResult;

	public List<OrderWebVo> getOrderWebVos() {
		return orderWebVos;
	}

	public void setOrderWebVos(List<OrderWebVo> orderWebVos) {
		this.orderWebVos = orderWebVos;
	}

	public OperateResult getOperateResult() {
		return operateResult;
	}

	public void setOperateResult(OperateResult operateResult) {
		this.operateResult = operateResult;
	}
	
	
	
	
}
