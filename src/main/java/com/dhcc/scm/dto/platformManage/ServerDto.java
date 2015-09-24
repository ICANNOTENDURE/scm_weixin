package com.dhcc.scm.dto.platformManage;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.Gateway;
import com.dhcc.scm.entity.platformManage.Org;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.platformManage.ServerIp;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.vo.platformManage.ServerRegisterVo;
import com.dhcc.scm.entity.vo.platformManage.ServerVo;

/**
 * <p>标题: ServerDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器信息传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@XmlRootElement
public class ServerDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Server server;
	
	private ServerIp serverIp;
	
	private Gateway gateway;
	
	private Org org;
	
	private String serialNumber;
	
	private String encrypt;
	
	/**  
	* 字段:      字段名称
	* @Fields serverVo : 服务器列表模式数据 
	*/
	private ServerVo serverVo;
	
	/**  
	* 字段:      字段名称
	* @Fields serverVos : 服务器图形模式数据
	*/
	private List<ServerVo> serverVos;
	
	/**  
	* 字段:      字段名称
	* @Fields systemVersions : 安装包版本信息
	*/
	private List<SystemVersion> systemVersions;
	
	/**  
	* 字段:      字段名称
	* @Fields serverRegisterVos : 新增服务器校验和注册信息
	*/
	private ServerRegisterVo serverRegisterVo;

	/**  
	 * @return server 
	 */
	public Server getServer() {
		return server;
	}

	/**  
	 * @param server server 
	 */
	public void setServer(Server server) {
		this.server = server;
	}

	/**  
	 * @return serverIp 
	 */
	public ServerIp getServerIp() {
		return serverIp;
	}

	/**  
	 * @param serverIp serverIp 
	 */
	public void setServerIp(ServerIp serverIp) {
		this.serverIp = serverIp;
	}

	/**  
	 * @return gateway 
	 */
	public Gateway getGateway() {
		return gateway;
	}

	/**  
	 * @param gateway gateway 
	 */
	public void setGateway(Gateway gateway) {
		this.gateway = gateway;
	}

	/**  
	 * @return org 
	 */
	public Org getOrg() {
		return org;
	}

	/**  
	 * @param org org 
	 */
	public void setOrg(Org org) {
		this.org = org;
	}

	/**  
	 * @return serialNumber 
	 */
	public String getSerialNumber() {
		return serialNumber;
	}

	/**  
	 * @param serialNumber serialNumber 
	 */
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	/**  
	 * @return encrypt 
	 */
	public String getEncrypt() {
		return encrypt;
	}

	/**  
	 * @param encrypt encrypt 
	 */
	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
	}

	/**  
	 * @return serverVo 
	 */
	public ServerVo getServerVo() {
		return serverVo;
	}

	/**  
	 * @param serverVo serverVo 
	 */
	public void setServerVo(ServerVo serverVo) {
		this.serverVo = serverVo;
	}

	/**  
	 * @return serverVos 
	 */
	public List<ServerVo> getServerVos() {
		return serverVos;
	}

	/**  
	 * @param serverVos serverVos 
	 */
	public void setServerVos(List<ServerVo> serverVos) {
		this.serverVos = serverVos;
	}

	/**  
	 * @return systemVersions 
	 */
	public List<SystemVersion> getSystemVersions() {
		return systemVersions;
	}

	/**  
	 * @param systemVersions systemVersions 
	 */
	public void setSystemVersions(List<SystemVersion> systemVersions) {
		this.systemVersions = systemVersions;
	}

	/**  
	 * @return serverRegisterVo 
	 */
	public ServerRegisterVo getServerRegisterVo() {
		return serverRegisterVo;
	}

	/**  
	 * @param serverRegisterVo serverRegisterVo 
	 */
	public void setServerRegisterVo(ServerRegisterVo serverRegisterVo) {
		this.serverRegisterVo = serverRegisterVo;
	}

}
