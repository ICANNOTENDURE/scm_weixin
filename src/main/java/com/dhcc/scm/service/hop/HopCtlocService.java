/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import java.util.List;

import com.dhcc.scm.dto.hop.HopCtlocDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.hop.HopCtlocVo;

public interface HopCtlocService {

	public void list(HopCtlocDto dto);
	
	public void save(HopCtlocDto dto);
	
	public void delete(HopCtlocDto dto);
	
	public void update(HopCtlocDto dto);
	
	public HopCtloc findById(HopCtlocDto dto);

	/**
	 * @param dto
	 */
	public List<HopCtloc> getCtlocInfo(HopCtlocDto dto);

	/**
	 * @param dto
	 * @return
	 */
	public List<HopCtlocVo> getListInfo(HopCtlocDto dto);
	
	
	/**
	 * 
	* @Title: HopCtlocService.java
	* @Description: TODO(按登录人权限查和科室类型看科室)
	* @param dto
	* @return
	* @return:List<ComboxVo> 
	* @author zhouxin  
	* @date 2014年6月13日 下午1:02:30
	* @version V1.0
	 */
	public List<ComboxVo> findHopLocComboxVos(HopCtlocDto dto);
	
	
	/**
	 * 
	* @Title: HopCtlocService.java
	* @Description: TODO(更具科室描述和登录医院取科室ID)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月17日 上午10:29:25
	* @version V1.0
	 */
	public Long getLocIdByName(String name);

	/**
	 * @param dto
	 * @return
	 */
	public List<ComboxVo> findHopLocAndroid(HopCtlocDto dto);



}
