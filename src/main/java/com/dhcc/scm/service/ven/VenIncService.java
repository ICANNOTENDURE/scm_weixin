/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ven;

import java.util.List;

import com.dhcc.scm.dto.ven.VenIncDto;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;

public interface VenIncService {

	public void list(VenIncDto dto);
	
	public void save(VenIncDto dto);
	
	public void delete(VenIncDto dto);
	
	public void update(VenIncDto dto);
	
	public VenInc findById(VenIncDto dto);

	public List<VenInc> getIncInfo(VenIncDto dto);

	public void getListInfo(VenIncDto dto);
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(医院药品对照查询)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月30日 上午9:02:26
	* @version V1.0
	 */
	public void listContrantInc(VenIncDto dto);
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(保存药品对照)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月30日 下午5:41:58
	* @version V1.0
	 */
	public void saveContranst(VenIncDto dto);
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(列出供应商药品)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月11日 下午2:42:57
	* @version V1.0
	 */
	public void listVenContranst(VenIncDto dto);
	
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午2:14:19
	* @version V1.0
	 */
	public void exportVenInc(VenIncDto dto);

	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param code
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月20日 下午2:19:18
	* @version V1.0
	 */
	public Long getHopIncByVenIncCode(String code);
	
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param code
	* @param venId
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年7月11日 下午4:42:29
	* @version V1.0
	 */
	public Long getVenIncByCode(String code,Long venId);
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(批量保存吧对照关系)
	* @param hopIncs
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月30日 上午9:44:44
	* @version V1.0
	 */
	public void saveVenHopIncList(List<VenHopInc> hopIncs);
	
	
	/**
	 * 
	* @Title: VenIncService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param hopInc
	* @param vendorId
	* @return
	* @return:float 
	* @author zhouxin  
	* @date 2014年7月30日 下午4:30:53
	* @version V1.0
	 */
	public float getFacByhopInc(long hopInc,Long vendorId);
}
