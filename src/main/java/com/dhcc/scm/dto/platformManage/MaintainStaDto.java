package com.dhcc.scm.dto.platformManage;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.MaintainSta;

/**
 * 
* <p>标题: MaintainStaDto.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月9日
* @version V1.0
 */
@XmlRootElement
public class MaintainStaDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	private MaintainSta maintainSta;

	/**  
	 * @return maintainSta 
	 */
	public MaintainSta getMaintainSta() {
		return maintainSta;
	}

	/**  
	 * @param maintainSta maintainSta 
	 */
	public void setMaintainSta(MaintainSta maintainSta) {
		this.maintainSta = maintainSta;
	}
	
}
