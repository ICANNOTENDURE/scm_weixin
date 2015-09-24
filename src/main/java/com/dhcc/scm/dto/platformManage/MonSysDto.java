package com.dhcc.scm.dto.platformManage;

import java.util.Date;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.MonSys;
import com.dhcc.scm.entity.vo.monitor.SysInfoVo;

/**
 * 
* <p>标题: MonSysDto.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
public class MonSysDto extends BaseDto {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	/**  
	* 字段:      		MonSys对象
	* @Fields MonSys :	monSys 
	*/
	private MonSys monSys;
	
	private SysInfoVo sysInfoVo;
	
	private Date startDate;
	private Date endDate;
	
	/**  
	 * @return monSys 
	 */
	public MonSys getMonSys() {
		return monSys;
	}

	/**  
	 * @param monSys monSys 
	 */
	public void setMonSys(MonSys monSys) {
		this.monSys = monSys;
	}

	/**  
	 * @return sysInfoVo 
	 */
	public SysInfoVo getSysInfoVo() {
		return sysInfoVo;
	}

	/**  
	 * @param sysInfoVo sysInfoVo 
	 */
	public void setSysInfoVo(SysInfoVo sysInfoVo) {
		this.sysInfoVo = sysInfoVo;
	}

	/**  
	 * @return startDate 
	 */
	public Date getStartDate() {
		return startDate;
	}

	/**  
	 * @param startDate startDate 
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/**  
	 * @return endDate 
	 */
	public Date getEndDate() {
		return endDate;
	}

	/**  
	 * @param endDate endDate 
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}
