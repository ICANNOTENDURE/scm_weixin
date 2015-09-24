/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;



public class PortalInfoVo {
	
	/*
	 * 待回复咨询问题个数
	 */
	private int adviceNum;
	/*
	 * 当日待回复问题个数
	 */
	private int todayAdviceNum;
	
	/*
	 * 新订单数
	 */
	private int newOrderNum;
	
	/*
	 * 退货申请数
	 */
	private int reqOrderNum;
	
	/*
	 * 待发货
	 */
	private int sendOrderNum;
	
	/*
	 * 商品品种数
	 */
	private int incQtyNum;
	
	
	
	public int getIncQtyNum() {
		return incQtyNum;
	}
	public void setIncQtyNum(int incQtyNum) {
		this.incQtyNum = incQtyNum;
	}
	public int getNewOrderNum() {
		return newOrderNum;
	}
	public void setNewOrderNum(int newOrderNum) {
		this.newOrderNum = newOrderNum;
	}
	public int getReqOrderNum() {
		return reqOrderNum;
	}
	public void setReqOrderNum(int reqOrderNum) {
		this.reqOrderNum = reqOrderNum;
	}
	public int getSendOrderNum() {
		return sendOrderNum;
	}
	public void setSendOrderNum(int sendOrderNum) {
		this.sendOrderNum = sendOrderNum;
	}
	public int getAdviceNum() {
		return adviceNum;
	}
	public void setAdviceNum(int adviceNum) {
		this.adviceNum = adviceNum;
	}
	public int getTodayAdviceNum() {
		return todayAdviceNum;
	}
	public void setTodayAdviceNum(int todayAdviceNum) {
		this.todayAdviceNum = todayAdviceNum;
	}
	
	
}
