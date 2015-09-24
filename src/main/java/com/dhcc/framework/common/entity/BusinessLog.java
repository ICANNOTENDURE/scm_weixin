package com.dhcc.framework.common.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 
 * 日务日志类
 * @author liuyg
 *
 */

@JsonIgnoreProperties({"intercepterInterface","operDate"})
public class BusinessLog implements java.io.Serializable {


	private static final long serialVersionUID = 2928366510221416597L;
	private String logId;
	//操作明细
	private String operDesc;
	//当前操作的用户登录帐号
	private String accountName;
	private Date operDate;
	//当前操作名,就是在日志配置里的标题名
	private String operSummary;
	private Date startDate;
	private Date endDate;
	private String intercepterInterface;
	//交易号
	private String tradeAccount;
	//记录网关ID
	private String  recordGatewayId;
	//1 操作日志;2警告日志;3 错误日志
	private String  logType ;
	
	private String ipAddress;
	//交易状态  1:成功；0:失败
	private String dealStatus;
	//交易方式  Sync(同步)、Async(异步)。
	private String dealMode;
	
	//业务系统缩写
	private String busiSys;
	
	//根操作，为1是根操作，
	private String rootOpper ;
	
	//来务系统版本
	private String busiVersion;
	
	//业务系统中文名
	private String busiName;

	//根交易号
	private String rootTradeAccount;
	//查询使用的日期
	private String startDateString;
	private String endDateString;
	private String startDateYMString;
	
	public BusinessLog() {
		
	}

	public BusinessLog(String logId) {
		this.logId = logId;
	}


	public String getLogId() {
		return this.logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getOperDesc() {
		return this.operDesc;
	}

	public void setOperDesc(String operDesc) {
		this.operDesc = operDesc;
	}

	public String getAccountName() {
		return this.accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public Date getOperDate() {
		return this.operDate;
	}

	public void setOperDate(Date operDate) {
		this.operDate = operDate;
	}

	public String getOperSummary() {
		return this.operSummary;
	}

	public void setOperSummary(String operSummary) {
		this.operSummary = operSummary;
	}

	public String getTradeAccount() {
		return tradeAccount;
	}
	public void setTradeAccount(String tradeAccount) {
		this.tradeAccount = tradeAccount;
	}
	public String getIntercepterInterface() {
		return intercepterInterface;
	}
	public void setIntercepterInterface(String intercepterInterface) {
		this.intercepterInterface = intercepterInterface;
	}
	public String getRecordGatewayId() {
		return recordGatewayId;
	}
	public void setRecordGatewayId(String recordGatewayId) {
		this.recordGatewayId = recordGatewayId;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getDealStatus() {
		return dealStatus;
	}
	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}
	public String getDealMode() {
		return dealMode;
	}
	public void setDealMode(String dealMode) {
		this.dealMode = dealMode;
	}
	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof BusinessLog))
			return false;
		BusinessLog castOther = (BusinessLog) other;

		return ((this.getLogId() == castOther.getLogId()) || (this.getLogId() != null
				&& castOther.getLogId() != null && this.getLogId().equals(
				castOther.getLogId())))
				&& ((this.getOperDesc() == castOther.getOperDesc()) || (this
						.getOperDesc() != null
						&& castOther.getOperDesc() != null && this
						.getOperDesc().equals(castOther.getOperDesc())))
				&& ((this.getAccountName() == castOther.getAccountName()) || (this
						.getAccountName() != null
						&& castOther.getAccountName() != null && this
						.getAccountName().equals(castOther.getAccountName())))
				&& ((this.getOperDate() == castOther.getOperDate()) || (this
						.getOperDate() != null
						&& castOther.getOperDate() != null && this
						.getOperDate().equals(castOther.getOperDate())))
				&& ((this.getOperSummary() == castOther.getOperSummary()) || (this
						.getOperSummary() != null
						&& castOther.getOperSummary() != null && this
						.getOperSummary().equals(castOther.getOperSummary())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getLogId() == null ? 0 : this.getLogId().hashCode());
		result = 37 * result
				+ (getOperDesc() == null ? 0 : this.getOperDesc().hashCode());
		result = 37
				* result
				+ (getAccountName() == null ? 0 : this.getAccountName()
						.hashCode());
		result = 37 * result
				+ (getOperDate() == null ? 0 : this.getOperDate().hashCode());
		result = 37
				* result
				+ (getOperSummary() == null ? 0 : this.getOperSummary()
						.hashCode());
		return result;
	}
	

	/**  
	 * @return startDate 
	 */
	public Date getStartDate() {
		return startDate;
	}




	/**  
	 * @param startDate startDate 
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}




	/**  
	 * @return endDate 
	 */
	public Date getEndDate() {
		return endDate;
	}




	/**  
	 * @param endDate endDate 
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}




	public String getBusiSys() {
		return busiSys;
	}


	public void setBusiSys(String busiSys) {
		this.busiSys = busiSys;
	}


	public String getRootOpper() {
		return rootOpper;
	}


	public void setRootOpper(String rootOpper) {
		this.rootOpper = rootOpper;
	}


	public String getBusiVersion() {
		return busiVersion;
	}


	public void setBusiVersion(String busiVersion) {
		this.busiVersion = busiVersion;
	}




	public String getBusiName() {
		return busiName;
	}




	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}




	public String getRootTradeAccount() {
		return rootTradeAccount;
	}




	public void setRootTradeAccount(String rootTradeAccount) {
		this.rootTradeAccount = rootTradeAccount;
	}

	/**  
	 * @return startDateString 
	 */
	public String getStartDateString() {
		return startDateString;
	}

	/**  
	 * @param startDateString startDateString 
	 */
	public void setStartDateString(String startDateString) {
		this.startDateString = startDateString;
	}

	/**  
	 * @return endDateString 
	 */
	public String getEndDateString() {
		return endDateString;
	}

	/**  
	 * @param endDateString endDateString 
	 */
	public void setEndDateString(String endDateString) {
		this.endDateString = endDateString;
	}

	/**  
	 * @return startDateYMString 
	 */
	public String getStartDateYMString() {
		return startDateYMString;
	}

	/**  
	 * @param startDateYMString startDateYMString 
	 */
	public void setStartDateYMString(String startDateYMString) {
		this.startDateYMString = startDateYMString;
	}
	
	
}