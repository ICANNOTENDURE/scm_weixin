/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.hop.HopCtlocDestinationDao;
import com.dhcc.scm.dto.hop.HopCtlocDestinationDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.service.hop.HopCtlocDestinationService;

@Service("hopCtlocDestinationService")
public class HopCtlocDestinationServiceImpl implements HopCtlocDestinationService {

	@Resource
	private HopCtlocDestinationDao hopCtlocDestinationDao;
	@Resource
	private CommonService commonService;

	public void list(HopCtlocDestinationDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hopCtlocDestinationDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HopCtlocDestinationDto dto){
	
		hopCtlocDestinationDao.save(dto.getHopCtlocDestination());
	}
	
	public void delete(HopCtlocDestinationDto dto){
	
		hopCtlocDestinationDao.delete(dto.getHopCtlocDestination());
	}
	
	public void update(HopCtlocDestinationDto dto){
	
		hopCtlocDestinationDao.update(dto.getHopCtlocDestination());
	}
	
	public HopCtlocDestination findById(HopCtlocDestinationDto dto){
	
		dto.setHopCtlocDestination(hopCtlocDestinationDao.findById(dto.getHopCtlocDestination()));
		return dto.getHopCtlocDestination();
	}

	public HopCtloc getCtloc(HopCtlocDestinationDto dto) throws Exception {
		return hopCtlocDestinationDao.getCtloc(dto);
	}

	public void getListInfo(HopCtlocDestinationDto dto) {
		hopCtlocDestinationDao.getListInfo(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopCtlocDestinationService#getDesctionByCode(java.lang.String, java.lang.Long)
	 */
	@Override
	public HopCtlocDestination getDesctionByCode(String code, Long hopId) {
		// TODO Auto-generated method stub
		return hopCtlocDestinationDao.getDesctionByCode(code, hopId);
	}

	

}
