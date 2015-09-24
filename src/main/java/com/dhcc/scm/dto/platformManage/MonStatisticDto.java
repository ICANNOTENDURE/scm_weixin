package com.dhcc.scm.dto.platformManage;

import java.util.Date;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.MonStatistic;

/**
 * 
* <p>标题: MonStatisticDto.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
public class MonStatisticDto extends BaseDto {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	/**  
	* 字段:      		MonSys对象
	* @Fields MonStatistic :	monStatistic 
	*/
	private MonStatistic monStatistic;

	private Date startDate;
	private Date endDate;
	
	/**  
	 * @return monStatistic 
	 */
	public MonStatistic getMonStatistic() {
		return monStatistic;
	}

	/**  
	 * @param monStatistic monStatistic 
	 */
	public void setMonStatistic(MonStatistic monStatistic) {
		this.monStatistic = monStatistic;
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
