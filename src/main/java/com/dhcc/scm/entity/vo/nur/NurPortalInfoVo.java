/**
 * 
 */
package com.dhcc.scm.entity.vo.nur;



public class NurPortalInfoVo {
	
	/*
	 * 咨询问题供应商已回复条数
	 */
	private int adviceReplyNum;
	/*
	 * 咨询问题供应商已回复未读条数
	 */
	private int adviceAskNum;
	/*
	 * 未发货商品数
	 */
	private int forSendNum;
	
	/*
	 * 新订单数
	 */
	private int newOrderNum;
	/*
	 * 退货申请数
	 */
	private int reqOrderNum;
	
	/*
	 * 退货数
	 */
	private int retOrderNum;
	
	/*
	 * 退货未通过数
	 */
	private int noRetOrderNum;
	/*
	 * 待收货数量
	 */
	private int recieveNum;
	
	/*
	 * 待评价数
	 */
	private int commentNum;
	
	
	
	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getRecieveNum() {
		return recieveNum;
	}

	public void setRecieveNum(int recieveNum) {
		this.recieveNum = recieveNum;
	}

	public int getNoRetOrderNum() {
		return noRetOrderNum;
	}

	public void setNoRetOrderNum(int noRetOrderNum) {
		this.noRetOrderNum = noRetOrderNum;
	}

	public int getRetOrderNum() {
		return retOrderNum;
	}

	public void setRetOrderNum(int retOrderNum) {
		this.retOrderNum = retOrderNum;
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

	public int getForSendNum() {
		return forSendNum;
	}

	public void setForSendNum(int forSendNum) {
		this.forSendNum = forSendNum;
	}

	public int getAdviceAskNum() {
		return adviceAskNum;
	}

	public void setAdviceAskNum(int adviceAskNum) {
		this.adviceAskNum = adviceAskNum;
	}

	public int getAdviceReplyNum() {
		return adviceReplyNum;
	}

	public void setAdviceReplyNum(int adviceReplyNum) {
		this.adviceReplyNum = adviceReplyNum;
	}

	
}
