/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.manf;

import java.util.List;

import com.dhcc.scm.dto.manf.HopManfDto;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.vo.combo.ComboxVo;

public interface HopManfService {

	public void list(HopManfDto dto);
	
	public void save(HopManfDto dto);
	
	public void delete(HopManfDto dto);
	
	public void update(HopManfDto dto);
	
	public HopManf findById(HopManfDto dto);

	public List<HopManf> getManfInfo(HopManfDto dto);
	
	/**
	 * 
	* @Title: HopManfService.java
	* @Description: TODO(更具产地描述查找产地)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月10日 下午3:19:30
	* @version V1.0
	 */
	public Long getIdByName(String name);
	
	/**
	 * 
	* @Title: findManfComboxVos 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto
	* @param @return    设定文件 
	* @return List<ComboxVo>    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 下午2:53:08
	 */
	public List<ComboxVo> findManfComboxVos(HopManfDto dto);
}
