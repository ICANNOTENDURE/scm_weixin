/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.sys;

import com.dhcc.scm.dto.sys.SysAppParamDto;
import com.dhcc.scm.entity.sys.SysAppParam;

public interface SysAppParamService {

	public void list(SysAppParamDto dto);
	
	public void save(SysAppParamDto dto);
	
	public void delete(SysAppParamDto dto);
	
	public void update(SysAppParamDto dto);
	
	public SysAppParam findById(SysAppParamDto dto);
	
	/**
	 * 
	* @Title: getOrderAudit 
	* @Description: TODO(查询当前状态的下一个状态) 
	* @param @param par
	* @param @return    设定文件 
	* @return Long    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月23日 下午3:42:27
	 */
	public Long getOrderAudit(Long par);

}
