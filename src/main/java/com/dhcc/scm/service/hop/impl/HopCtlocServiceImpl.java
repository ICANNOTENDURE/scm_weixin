/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.dao.hop.HopCtlocDao;
import com.dhcc.scm.dto.hop.HopCtlocDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.hop.HopCtlocVo;
import com.dhcc.scm.service.hop.HopCtlocService;

@Service("hopCtlocService")
public class HopCtlocServiceImpl implements HopCtlocService {

	@Resource
	private HopCtlocDao hopCtlocDao;
	@Resource
	private CommonService commonService;

	public void list(HopCtlocDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hopCtlocDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HopCtlocDto dto){
	
		hopCtlocDao.save(dto.getHopCtloc());
	}
	
	public void delete(HopCtlocDto dto){
	
		hopCtlocDao.delete(dto.getHopCtloc());
	}
	
	public void update(HopCtlocDto dto){
	
		hopCtlocDao.update(dto.getHopCtloc());
	}
	
	public HopCtloc findById(HopCtlocDto dto){
	
		dto.setHopCtloc(hopCtlocDao.findById(dto.getHopCtloc()));
		return dto.getHopCtloc();
	}

	public List<HopCtloc> getCtlocInfo(HopCtlocDto dto) {
		return hopCtlocDao.getCtlocInfo(dto.getHopCtloc());
	}


	public List<HopCtlocVo> getListInfo(HopCtlocDto dto) {
		
		PagerModel pagerModel=dto.getPageModel();
		return hopCtlocDao.getListInfo(pagerModel,dto.getHopCtlocVos(),dto.getHopCtloc());
	}


	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopCtlocService#findHopLocComboxVos(com.dhcc.pms.dto.hop.HopCtlocDto)
	 */

	public List<ComboxVo> findHopLocComboxVos(HopCtlocDto dto) {
		
		return hopCtlocDao.findHopLocComboxVos(dto);
	}

	
	public List<ComboxVo> findHopLocAndroid(HopCtlocDto dto) {
		// TODO Auto-generated method stub
		return hopCtlocDao.findHopLocAndroid(dto);
	}
	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopCtlocService#getLocIdByName(java.lang.String)
	 */

	public Long getLocIdByName(String name) {
		// TODO Auto-generated method stub
		return hopCtlocDao.getLocIdByName(name);

	}


		
}
