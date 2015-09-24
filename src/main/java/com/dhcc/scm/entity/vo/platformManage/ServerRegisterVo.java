package com.dhcc.scm.entity.vo.platformManage;

import java.io.Serializable;

/**
 * <p>标题: ServerRegisterVo.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年11月22日
 * @version V1.0 
 */
public class ServerRegisterVo implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private String serverId;
	
	public ServerRegisterVo() {

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
	
}
