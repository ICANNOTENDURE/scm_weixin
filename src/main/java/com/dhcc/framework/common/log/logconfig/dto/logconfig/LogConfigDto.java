package com.dhcc.framework.common.log.logconfig.dto.logconfig;

import com.dhcc.framework.common.entity.LogConfigure;
import com.dhcc.framework.transmission.dto.BaseDto;



/**
 * <p>标题: LogConfigDto.java</p>
 * <p>业务描述:日志配置Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 姚凯
 * @date 2013年11月18日
 * @version V1.0 
 */
public class LogConfigDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private LogConfigure logConfigure;
	
	public LogConfigure getLogConfigure() {
		return logConfigure;
	}

	public void setLogConfigure(LogConfigure logConfigure) {
		this.logConfigure = logConfigure;
	}
	
}
