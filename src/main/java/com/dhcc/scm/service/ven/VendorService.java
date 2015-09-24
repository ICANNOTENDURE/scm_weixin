/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ven;

import java.util.List;

import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;

public interface VendorService {

	public void list(VendorDto dto);
	
	public void save(VendorDto dto);
	
	public void delete(VendorDto dto);
	
	public void update(VendorDto dto);
	
	public Vendor findById(VendorDto dto);
	
	public void saveOrUpdate(VendorDto dto);
	
	public List<VenQualifTypeVO> queryQualifyType(VendorDto dto) ;
	
	public void saveOrUpdatePic(VendorDto dto);
	
	public List<Vendor> findVenComboList(VendorDto dto);
	
	/**
	 * 
	* @Title: VendorService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月12日 下午2:38:34
	* @version V1.0
	 */
	public Long findVendorIdByName(String name);
	
	public void listVendor(VendorDto dto);
}
