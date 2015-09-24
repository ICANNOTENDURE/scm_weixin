package com.dhcc.scm.dto.platformManage;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.Maintain;

/**
 * <p>标题: MaintainDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  运维记录传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@XmlRootElement
public class MaintainDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Maintain maintain;

	/**  
	 * @return maintain 
	 */
	public Maintain getMaintain() {
		return maintain;
	}

	/**  
	 * @param maintain maintain 
	 */
	public void setMaintain(Maintain maintain) {
		this.maintain = maintain;
	}
	
}
