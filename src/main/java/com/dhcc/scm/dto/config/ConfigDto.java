package com.dhcc.scm.dto.config;

import java.util.Properties;

import com.dhcc.framework.transmission.dto.BaseDto;

/**
 * <p>标题: ConfigDto.java</p>
 * <p>业务描述:系统配置信息Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月11日
 * @version V1.0 
 */
public class ConfigDto extends BaseDto {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// 系统配置信息的Properties对象
	private Properties properties;

	/**  
	 * @return properties 
	 */
	public Properties getProperties() {
		return properties;
	}

	/**  
	 * @param properties properties 
	 */
	public void setProperties(Properties properties) {
		this.properties = properties;
	}
}
