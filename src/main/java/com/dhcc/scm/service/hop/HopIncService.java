/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import java.util.List;

import com.dhcc.scm.dto.hop.HopIncDto;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.hop.HopIncVo;

public interface HopIncService {

	public void list(HopIncDto dto);
	
	public void save(HopIncDto dto);
	
	public void delete(HopIncDto dto);
	
	public void update(HopIncDto dto);
	
	public HopInc findById(HopIncDto dto);

	public List<HopIncVo> getIncInfo(HopIncDto dto);

	public void getListInfo(HopIncDto dto);
	
	/**
	 * 
	* @Title: HopIncService.java
	* @Description: TODO(保存导入药品信息)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月10日 下午3:32:22
	* @version V1.0
	 */
	public void saveInc(HopIncDto dto);
	
	/**
	 * 
	* @Title: HopIncService.java
	* @Description: TODO(查询药品id)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月17日 上午10:32:36
	* @version V1.0
	 */
	public HopInc getIncIdByName(String name);
	
	/**
	 * 
	* @Title: HopIncService.java
	* @Description: TODO(根据医院ID和药品代码查找医院药品么)
	* @param code
	* @param hopId
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年7月29日 下午8:00:46
	* @version V1.0
	 */
	
	public Long getHopIncByCode(String code,Long hopId);
	/**
	 * 查询药品分类
	 */
	public List<SubCatGroup> getSubCatInfo(HopIncDto dto); 
	
	/**
	 * 
	* @Title: findHopIncComboxVos 
	* @Description: TODO(查询医院商品，下拉列表) 
	* @param @param dto
	* @param @return    设定文件 
	* @return List<ComboxVo>    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月25日 上午10:28:14
	 */
	public List<ComboxVo> findHopIncComboxVos(HopIncDto dto);
	
	
	public HopInc getHopIncByBarCode(String code,Long hospid);
	
}
