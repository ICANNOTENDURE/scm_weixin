/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ven.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.ven.VendorDao;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;
import com.dhcc.scm.service.ven.VendorService;

@Service("vendorService")
public class VendorServiceImpl implements VendorService {

	@Resource
	private VendorDao vendorDao;
	@Resource
	private CommonService commonService;

	public void list(VendorDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		vendorDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(VendorDto dto){
	
		vendorDao.save(dto.getVendor());
	}
	
	public void delete(VendorDto dto){
	
		vendorDao.delete(dto.getVendor());
	}
	
	public void update(VendorDto dto){
	
		vendorDao.update(dto.getVendor());
	}
	
	public Vendor findById(VendorDto dto){
	
		dto.setVendor(vendorDao.findById(dto.getVendor()));
		return dto.getVendor();
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VendorService#saveOrUpdate(com.dhcc.pms.dto.ven.VendorDto)
	 */
	@Override
	public void saveOrUpdate(VendorDto dto) {
		vendorDao.saveOrUpdate(dto);
		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VendorService#queryQualifyType(com.dhcc.pms.dto.ven.VendorDto)
	 */
	@Override
	public List<VenQualifTypeVO> queryQualifyType(VendorDto dto) {
		// TODO Auto-generated method stub
		return vendorDao.queryQualifyType(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VendorService#saveOrUpdatePic(com.dhcc.pms.dto.ven.VendorDto)
	 */
	@Override
	public void saveOrUpdatePic(VendorDto dto) {
		vendorDao.saveOrUpdatePic(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VendorService#findVenComboList(com.dhcc.pms.dto.ven.VendorDto)
	 */
	@Override
	public List<Vendor> findVenComboList(VendorDto dto) {
		return vendorDao.findVenComboList(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VendorService#findVendorIdByName(java.lang.String)
	 */
	@Override
	public Long findVendorIdByName(String name) {
		// TODO Auto-generated method stub
		return vendorDao.findVendorIdByName(name);
	}

	@Override
	public void listVendor(VendorDto dto) {
		// TODO Auto-generated method stub
		vendorDao.listVendor(dto);
	}

}
