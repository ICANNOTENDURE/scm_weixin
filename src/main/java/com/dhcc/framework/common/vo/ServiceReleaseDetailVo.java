package com.dhcc.framework.common.vo;

import java.io.Serializable;

/**
 * <p>标题: ServiceRegisterVo.java</p>
 * <p>业务描述: 服务注册VO类</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2014年1月15日
 * @version V1.0 
 */

public class ServiceReleaseDetailVo implements Serializable{

	private static final long serialVersionUID = 1L;

	// 服务注册必填,服务名称
	private String serviceName;
	
	// 服务注册必填,服务调用的方法
	private String serviceMethod;

	// 使用状态（ 1:可用; 2:停用）
	private String useState;

	/**  
	 * @return serviceName 
	 */
	public String getServiceName() {
		return serviceName;
	}

	/**  
	 * @param serviceName serviceName 
	 */
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	/**  
	 * @return serviceMethod 
	 */
	public String getServiceMethod() {
		return serviceMethod;
	}

	/**  
	 * @param serviceMethod serviceMethod 
	 */
	public void setServiceMethod(String serviceMethod) {
		this.serviceMethod = serviceMethod;
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

}
