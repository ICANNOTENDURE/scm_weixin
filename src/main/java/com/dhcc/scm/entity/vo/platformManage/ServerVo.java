package com.dhcc.scm.entity.vo.platformManage;

import java.io.Serializable;

/**
 * <p>标题: ServerVo.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月9日
 * @version V1.0 
 */
public class ServerVo implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private String serverId;
	private String onlineState;
	private String port;
	private String serverName;
	private String serverType;
	
	private String ip;
	private String ipType;
	private String useState;
	
	private String systemType;
	private String version;
	
	private String dataUpNum;
	
	private String orgName;
	
	public ServerVo() {
		
	}
	
	public ServerVo(String serverId) {
		this.serverId = serverId;
	}

	public ServerVo(String serverId, String serverType, String serverName, String ipType, String ip, String port,
		String onlineState, String systemType, String version, String orgName) {
		this.serverId = serverId;
		this.serverType = serverType;
		this.serverName = serverName;
		this.ipType = ipType;
		this.ip = ip;
		this.port = port;
		this.onlineState = onlineState;
		this.systemType = systemType;
		this.version = version;
		this.orgName = orgName;
	}

	public ServerVo(String serverId, String serverType, String serverName, String ipType, String ip, String port,
		String onlineState) {
		this.serverId = serverId;
		this.serverType = serverType;
		this.serverName = serverName;
		this.ipType = ipType;
		this.ip = ip;
		this.port = port;
		this.onlineState = onlineState;
	}
	
	/**  
	 * @return serverId 
	 */
	public String getServerId() {
		return serverId;
	}

	/**  
	 * @param serverId serverId 
	 */
	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	/**  
	 * @return onlineState 
	 */
	public String getOnlineState() {
		return onlineState;
	}

	/**  
	 * @param onlineState onlineState 
	 */
	public void setOnlineState(String onlineState) {
		this.onlineState = onlineState;
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
	 * @return ipType 
	 */
	public String getIpType() {
		return ipType;
	}

	/**  
	 * @param ipType ipType 
	 */
	public void setIpType(String ipType) {
		this.ipType = ipType;
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

	/**  
	 * @return systemType 
	 */
	public String getSystemType() {
		return systemType;
	}

	/**  
	 * @param systemType systemType 
	 */
	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}

	/**  
	 * @return version 
	 */
	public String getVersion() {
		return version;
	}

	/**  
	 * @param version version 
	 */
	public void setVersion(String version) {
		this.version = version;
	}

	/**  
	 * @return dataUpNum 
	 */
	public String getDataUpNum() {
		return dataUpNum;
	}

	/**  
	 * @param dataUpNum dataUpNum 
	 */
	public void setDataUpNum(String dataUpNum) {
		this.dataUpNum = dataUpNum;
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
	
}
