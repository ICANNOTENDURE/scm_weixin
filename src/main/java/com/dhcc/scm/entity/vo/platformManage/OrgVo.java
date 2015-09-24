package com.dhcc.scm.entity.vo.platformManage;

import java.io.Serializable;

/**
 * <p>标题: OrgVo.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月9日
 * @version V1.0 
 */
public class OrgVo implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private String orgId;
	private String orgCenterId;
	private String orgCode;
	private String orgName;
	private String addrState;
	private String addrCity;
	private String addrCounty;
	private String addrTown;
	private String addrStreet;
	private String addrHouseNumber;
	private String addrDistrictsCode;
	private String useState;
	
    //private String gatewayId;
	//private String certId;
	//private String systemType;
	
	//private String serverId;
	private String ip;
	private String port;
	private String serverName;
	private String serverType;
	
	
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public OrgVo() {
		// TODO Auto-generated constructor stub
	}

	public OrgVo(String orgId, String orgCenterId, String orgName, String orgCode, String addrState, String addrCity, 
		String addrCounty, String addrTown, String addrStreet, String addrHouseNumber, String addrDistrictsCode,
		String useState, String serverType, String serverName, String ip, String port) {
		this.orgId = orgId;
		this.orgCenterId = orgCenterId;
		this.orgName = orgName;
		this.orgCode = orgCode;
		this.addrState = addrState;
		this.addrCity = addrCity;
		this.addrCounty = addrCounty;
		this.addrTown = addrTown;
		this.addrStreet = addrStreet;
		this.addrHouseNumber = addrHouseNumber;
		this.addrDistrictsCode = addrDistrictsCode;
		this.useState = useState;
		this.serverType = serverType;
		this.serverName = serverName;
		this.ip = ip;
		this.port = port;
	}

	/**  
	 * @return orgId 
	 */
	public String getOrgId() {
		return orgId;
	}

	/**  
	 * @param orgId orgId 
	 */
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	/**  
	 * @return orgCenterId 
	 */
	public String getOrgCenterId() {
		return orgCenterId;
	}

	/**  
	 * @param orgCenterId orgCenterId 
	 */
	public void setOrgCenterId(String orgCenterId) {
		this.orgCenterId = orgCenterId;
	}

	/**  
	 * @return orgCode 
	 */
	public String getOrgCode() {
		return orgCode;
	}

	/**  
	 * @param orgCode orgCode 
	 */
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	/**  
	 * @return orgName 
	 */
	public String getOrgName() {
		return orgName;
	}

	/**  
	 * @param orgName orgName 
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**  
	 * @return addrState 
	 */
	public String getAddrState() {
		return addrState;
	}

	/**  
	 * @param addrState addrState 
	 */
	public void setAddrState(String addrState) {
		this.addrState = addrState;
	}

	/**  
	 * @return addrCity 
	 */
	public String getAddrCity() {
		return addrCity;
	}

	/**  
	 * @param addrCity addrCity 
	 */
	public void setAddrCity(String addrCity) {
		this.addrCity = addrCity;
	}

	/**  
	 * @return addrCounty 
	 */
	public String getAddrCounty() {
		return addrCounty;
	}

	/**  
	 * @param addrCounty addrCounty 
	 */
	public void setAddrCounty(String addrCounty) {
		this.addrCounty = addrCounty;
	}

	/**  
	 * @return addrTown 
	 */
	public String getAddrTown() {
		return addrTown;
	}

	/**  
	 * @param addrTown addrTown 
	 */
	public void setAddrTown(String addrTown) {
		this.addrTown = addrTown;
	}

	/**  
	 * @return addrStreet 
	 */
	public String getAddrStreet() {
		return addrStreet;
	}

	/**  
	 * @param addrStreet addrStreet 
	 */
	public void setAddrStreet(String addrStreet) {
		this.addrStreet = addrStreet;
	}

	/**  
	 * @return addrHouseNumber 
	 */
	public String getAddrHouseNumber() {
		return addrHouseNumber;
	}

	/**  
	 * @param addrHouseNumber addrHouseNumber 
	 */
	public void setAddrHouseNumber(String addrHouseNumber) {
		this.addrHouseNumber = addrHouseNumber;
	}

	/**  
	 * @return addrDistrictsCode 
	 */
	public String getAddrDistrictsCode() {
		return addrDistrictsCode;
	}

	/**  
	 * @param addrDistrictsCode addrDistrictsCode 
	 */
	public void setAddrDistrictsCode(String addrDistrictsCode) {
		this.addrDistrictsCode = addrDistrictsCode;
	}

	/**  
	 * @return useState 
	 */
	public String getUseState() {
		return useState;
	}

	/**  
	 * @param useState useState 
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}

//	/**  
//	 * @return gatewayId 
//	 */
//	public String getGatewayId() {
//		return gatewayId;
//	}
//
//	/**  
//	 * @param gatewayId gatewayId 
//	 */
//	public void setGatewayId(String gatewayId) {
//		this.gatewayId = gatewayId;
//	}
//
//	/**  
//	 * @return certId 
//	 */
//	public String getCertId() {
//		return certId;
//	}
//
//	/**  
//	 * @param certId certId 
//	 */
//	public void setCertId(String certId) {
//		this.certId = certId;
//	}
//
//	/**  
//	 * @return systemType 
//	 */
//	public String getSystemType() {
//		return systemType;
//	}
//
//	/**  
//	 * @param systemType systemType 
//	 */
//	public void setSystemType(String systemType) {
//		this.systemType = systemType;
//	}
//
//	/**  
//	 * @return serverId 
//	 */
//	public String getServerId() {
//		return serverId;
//	}
//
//	/**  
//	 * @param serverId serverId 
//	 */
//	public void setServerId(String serverId) {
//		this.serverId = serverId;
//	}

	/**  
	 * @return ip 
	 */
	public String getIp() {
		return ip;
	}

	/**  
	 * @param ip ip 
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	/**  
	 * @return port 
	 */
	public String getPort() {
		return port;
	}

	/**  
	 * @param port port 
	 */
	public void setPort(String port) {
		this.port = port;
	}

	/**  
	 * @return serverName 
	 */
	public String getServerName() {
		return serverName;
	}

	/**  
	 * @param serverName serverName 
	 */
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	/**  
	 * @return serverType 
	 */
	public String getServerType() {
		return serverType;
	}

	/**  
	 * @param serverType serverType 
	 */
	public void setServerType(String serverType) {
		this.serverType = serverType;
	}
	
}
