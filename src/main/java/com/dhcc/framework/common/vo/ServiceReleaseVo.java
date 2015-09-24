package com.dhcc.framework.common.vo;

import java.io.Serializable;
import java.util.List;

/**
 * <p>标题: ServiceRegisterVo.java</p>
 * <p>业务描述: 统一运维及安全管理平台</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2014年1月15日
 * @version V1.0 
 */

public class ServiceReleaseVo implements Serializable{
	
	private static final long serialVersionUID = 1L;

	// 服务注册必填,服务类别
	private String serviceType;
	
	// 服务注册必填,系统类型
	private String systemType;   
		
	// 服务注册必填,系统版本信息
	private String systemVersion;
		
	// 服务注册必填,服务地址
	private String serviceUrl;
		
	private List<ServiceReleaseDetailVo> serviceReleaseDetailList;

	/**  
	 * @return serviceType 
	 */
	public String getServiceType() {
		return serviceType;
	}

	/**  
	 * @param serviceType serviceType 
	 */
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
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
	 * @return systemVersion 
	 */
	public String getSystemVersion() {
		return systemVersion;
	}

	/**  
	 * @param systemVersion systemVersion 
	 */
	public void setSystemVersion(String systemVersion) {
		this.systemVersion = systemVersion;
	}

	/**  
	 * @return serviceUrl 
	 */
	public String getServiceUrl() {
		return serviceUrl;
	}

	/**  
	 * @param serviceUrl serviceUrl 
	 */
	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

	/**  
	 * @return serviceReleaseDetailList 
	 */
	public List<ServiceReleaseDetailVo> getServiceReleaseDetailList() {
		return serviceReleaseDetailList;
	}

	/**  
	 * @param serviceReleaseDetailList serviceReleaseDetailList 
	 */
	public void setServiceReleaseDetailList(
			List<ServiceReleaseDetailVo> serviceReleaseDetailList) {
		this.serviceReleaseDetailList = serviceReleaseDetailList;
	}

}
