/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import java.util.List;

import com.dhcc.scm.dto.hop.HopVendorDto;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.vo.combo.ComboxVo;

public interface HopVendorService {

	public void list(HopVendorDto dto);
	
	public void save(HopVendorDto dto);
	
	public void delete(HopVendorDto dto);
	
	public void update(HopVendorDto dto);
	
	public HopVendor findById(HopVendorDto dto);
	
	/**
	 * 
	* @Title: HopVendorService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月11日 上午10:07:19
	* @version V1.0
	 */
	public void listHopCon(HopVendorDto dto);
	
	/**
	 * 
	* @Title: HopVendorService.java
	* @Description: TODO(批量导入医院供应商)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午12:48:24
	* @version V1.0
	 */
	public void exportVendor(HopVendorDto dto);
	
	/**
	 * 
	* @Title: HopVendorService.java
	* @Description: TODO(供应商名称找ID)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月12日 下午2:08:30
	* @version V1.0
	 */
	public Long findVendorIdByName(String name);
	
	
	/**
	 * 
	* @Title: HopVendorService.java
	* @Description: TODO(查询登录人有权限的供应商)
	* @param input
	* @return
	* @return:List<ComboxVo> 
	* @author zhouxin  
	* @date 2014年6月13日 上午11:35:12
	* @version V1.0
	 */
	public List<ComboxVo> findHopVenComboxVos(String input);
	
	/**
	 * 
	* @Title: HopVendorService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param code
	* @param hopId
	* @return
	* @return:HopVendor 
	* @author zhouxin  
	* @date 2014年8月5日 下午7:06:34
	* @version V1.0
	 */
	public HopVendor findVendorByCode(String code,Long hopId);
	
	/**
	 * 
	* @Title: HopVendorService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月12日 下午2:38:12
	* @version V1.0
	 */
	public void listVenDetail(HopVendorDto dto);
	
	public List<ComboxVo> getHopVenComboxVos(String input);
	
	public HopVendor getHopVendoByBarCode(String barcode,Long hopid);

//	public void listHopVen(VendorDto dto);//add hxy 
	
}
