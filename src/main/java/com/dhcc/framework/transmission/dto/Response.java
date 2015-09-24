package com.dhcc.framework.transmission.dto;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * <p>项目名称: cdbp</p>
 * <p>类名称: Response</p>
 * <p>类描述: Rest调用返回的Response</p>
 * <p>创建人: yan</p> 
 * <p>创建时间: 2013年10月16日 下午7:33:22</p>
 * <p>修改人: yan</p> 
 * <p>修改时间: 2013年10月16日 下午7:33:22</p>
 * <p>修改备注: 新增泛型</p>
 * @version V1.0
 */
@XmlRootElement
public class Response<T> {

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
	private List<T> pageData;
	
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
  	
	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
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
				+ msg + ", opFlg=" + opFlg + "]";
	}

	public String getTradeAccount() {
		return tradeAccount;
	}

	public void setTradeAccount(String tradeAccount) {
		this.tradeAccount = tradeAccount;
	}
  
}
