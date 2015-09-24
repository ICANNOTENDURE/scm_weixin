/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.hop.HopVendorDao;
import com.dhcc.scm.dto.hop.HopVendorDto;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.service.hop.HopVendorService;

@Service("hopVendorService")
public class HopVendorServiceImpl implements HopVendorService {

	@Resource
	private HopVendorDao hopVendorDao;
	@Resource
	private CommonService commonService;

	public void list(HopVendorDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hopVendorDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HopVendorDto dto){
	
		hopVendorDao.save(dto.getHopVendor());
	}
	
	public void delete(HopVendorDto dto){
	
		hopVendorDao.delete(dto.getHopVendor());
	}
	
	public void update(HopVendorDto dto){
	
		hopVendorDao.update(dto.getHopVendor());
	}
	
	public HopVendor findById(HopVendorDto dto){
	
		dto.setHopVendor(hopVendorDao.findById(dto.getHopVendor()));
		return dto.getHopVendor();
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopVendorService#listHopCon(com.dhcc.pms.dto.hop.HopVendorDto)
	 */
	@Override
	public void listHopCon(HopVendorDto dto) {
		// TODO Auto-generated method stub
		hopVendorDao.listHopCon(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopVendorService#exportVendor(com.dhcc.pms.dto.hop.HopVendorDto)
	 */
	@Override
	public void exportVendor(HopVendorDto dto) {
		// TODO Auto-generated method stub
		hopVendorDao.exportVendor(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopVendorService#findVendorIdByName(java.lang.String)
	 */
	@Override
	public Long findVendorIdByName(String name) {
		// TODO Auto-generated method stub
		return hopVendorDao.findVendorIdByName(name);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopVendorService#findHopVenComboxVos(java.lang.String)
	 */
	@Override
	public List<ComboxVo> findHopVenComboxVos(String input) {
		// TODO Auto-generated method stub
		return hopVendorDao.findHopVenComboxVos(input);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopVendorService#findVendorByCode(java.lang.String, java.lang.Long)
	 */
	@Override
	public HopVendor findVendorByCode(String code, Long hopId) {
		// TODO Auto-generated method stub
		return hopVendorDao.findVendorByCode(code, hopId);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopVendorService#listVenDetail(com.dhcc.pms.dto.hop.HopVendorDto)
	 */
	@Override
	public void listVenDetail(HopVendorDto dto) {
		// TODO Auto-generated method stub
		hopVendorDao.listVenDetail(dto);
	}

	@Override
	public List<ComboxVo> getHopVenComboxVos(String input) {
		// TODO Auto-generated method stub
		return hopVendorDao.getHopVenComboxVos(input);
	}

}
