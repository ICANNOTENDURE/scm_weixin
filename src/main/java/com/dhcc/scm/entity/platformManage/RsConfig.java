package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Column;

/**
 * <p>标题: RsUse.java</p>
 * <p>业务描述:统一运维及安全管理平台  数据接收服务器配置信息实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@Entity
@Table(name="T_RS_CONFIG", schema="PMS")
@IdClass(GatewayRsPriorityId.class)
public class RsConfig implements Serializable {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
//	private String configId;
	private String gatewayId;
	private String rsPriorityId;

	@Id
	@AttributeOverrides({
		@AttributeOverride(name = "gatewayId",
		column = @Column(name = "GATEWAY_ID")),
		@AttributeOverride(name = "rsPriorityId",
		column = @Column(name = "RS_PRIORITY_ID"))
	})

//	/**  
//	 * @return useId 
//	 */
//	public String getConfigId() {
//		return configId;
//	}
//
//	/**  
//	 * @param useId useId 
//	 */
//	public void setConfigId(String configId) {
//		this.configId = configId;
//	}

	/**  
	 * @return gatewayId 
	 */
	@Column(name="GATEWAY_ID", length=32)
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
	@Column(name="RS_PRIORITY_ID", length=32)
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