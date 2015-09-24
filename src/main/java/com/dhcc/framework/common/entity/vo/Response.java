package com.dhcc.framework.common.entity.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * <p>标题: Response.java</p>
 * <p>业务描述:数据中心Rest返回类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author liuyg
 * @date 2013年10月9日
 * @version V1.0
 */
@XmlRootElement
public class Response {

	/**
	 * 数据页数
	 */
	private int pageNo;
	
	/**
	 * 数据页面内容数量
	 */
	private int pageSize;
	
	/**
	 * 具体返回的数据
	 */
	private List<?> pageData;
	
	/**
	 * 数据总数
	 */
	private int totals;	
	
	/**
	 * 业务操作返回信息
	 */
	private String msg;
	
	/**
	 * 操作标记：1成功0失败
	 */
	private String opFlg;
	
	/**
	 * 交易号
	 */
	private String tradeAccount;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<?> getPageData() {
		return pageData;
	}
	
	public void setPageData(List<?> pageData) {
		this.pageData = pageData;
	}

	public int getTotals() {
		return totals;
	}

	public void setTotals(int totals) {
		this.totals = totals;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getOpFlg() {
		return opFlg;
	}

	public void setOpFlg(String opFlg) {
		this.opFlg = opFlg;
	}

	@Override
	public String toString() {
		return "Response [pageNo=" + pageNo + ", pageSize=" + pageSize
				+ ", pageData=" + pageData + ", totals=" + totals + ", msg="
				+ msg + ", opFlg=" + opFlg +", tradeAccount=" + tradeAccount + "]";
	}

	public String getTradeAccount() {
		return tradeAccount;
	}

	public void setTradeAccount(String tradeAccount) {
		this.tradeAccount = tradeAccount;
	}

	
	
}

