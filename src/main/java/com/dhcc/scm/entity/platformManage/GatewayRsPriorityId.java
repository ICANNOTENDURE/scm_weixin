package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.Embeddable;

/**
 * <p>标题: GatewayRsPriorityId.java</p>
 * <p>业务描述:统一运维及安全管理平台  系统安装信息与接收服务器优先级信息联合主键类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月9日
 * @version V1.0 
 */
@Embeddable
public class GatewayRsPriorityId implements Serializable {

	private static final long serialVersionUID = -1667459032016103985L;
	
	private String gatewayId;
	
	private String rsPriorityId;

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
	 * @return rsPriorityId 
	 */
	public String getRsPriorityId() {
		return rsPriorityId;
	}

	/**  
	 * @param rsPriorityId rsPriorityId 
	 */
	public void setRsPriorityId(String rsPriorityId) {
		this.rsPriorityId = rsPriorityId;
	}
	
	
}
