package com.dhcc.scm.entity.vo.platformManage;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>标题: GatewayVo.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月24日
 * @version V1.0 
 */
public class GatewayVo implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private String gatewayId;
	private String onlineState;
	private String port;
	private Date regTime;
	private String systemType;
	private Date updateTime;
	private String useState;
	private String version;
	
	private String serverType;
	private String serverName;
	
	private String certSerialNum;
	
	public GatewayVo(){
		
	}
	
	public GatewayVo(String gatewayId){
		this.gatewayId = gatewayId;
	}
	
	public GatewayVo(String gatewayId, String serverType, String serverName, String certSerialNum, String port, String onlineState,
		String systemType, String version, Date regTime, Date updateTime, String useState) {
		this.gatewayId = gatewayId;
		this.serverType = serverType;
		this.serverName = serverName;
		this.certSerialNum = certSerialNum;
		this.port = port;
		this.onlineState = onlineState;
		this.systemType = systemType;
		this.version = version;
		this.regTime = regTime;
		this.updateTime = updateTime;
		this.useState = useState;
	}

	/**  
	 * @return gatewayId 
	 */
	public String getGatewayId() {
		return gatewayId;
	}

	/**  
	 * @param gatewayId gatewayId 
	 */
	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
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
	 * @return regTime 
	 */
	public Date getRegTime() {
		return regTime;
	}

	/**  
	 * @param regTime regTime 
	 */
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
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
	 * @return updateTime 
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**  
	 * @param updateTime updateTime 
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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
	 * @return certSerialNum 
	 */
	public String getCertSerialNum() {
		return certSerialNum;
	}

	/**  
	 * @param certSerialNum certSerialNum 
	 */
	public void setCertSerialNum(String certSerialNum) {
		this.certSerialNum = certSerialNum;
	}
	
}
