package com.dhcc.scm.dto.platformManage;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.RsPriority;

/**
 * <p>标题: RsPriorityDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器优先级信息传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
@XmlRootElement
public class RsPriorityDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private RsPriority rsPriority;

	/**  
	 * @return rsPriority 
	 */
	public RsPriority getRsPriority() {
		return rsPriority;
	}

	/**  
	 * @param rsPriority rsPriority 
	 */
	public void setRsPriority(RsPriority rsPriority) {
		this.rsPriority = rsPriority;
	}
		
}

