package com.dhcc.scm.dto.platformManage;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.RsConfig;

/**
 * <p>标题: RsConfigDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  数据接收服务器配置信息传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月17日
 * @version V1.0 
 */
@XmlRootElement
public class RsConfigDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private RsConfig rsConfig;
	
	/**  
	 * @return rsConfig 
	 */
	public RsConfig getRsConfig() {
		return rsConfig;
	}

	/**  
	 * @param rsConfig rsConfig 
	 */
	public void setRsConfig(RsConfig rsConfig) {
		this.rsConfig = rsConfig;
	}

}
