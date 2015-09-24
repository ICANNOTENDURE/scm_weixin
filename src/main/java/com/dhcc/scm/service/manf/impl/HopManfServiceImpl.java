/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.manf.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.dao.manf.HopManfDao;
import com.dhcc.scm.dto.manf.HopManfDto;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.service.manf.HopManfService;

@Service("hopManfService")
public class HopManfServiceImpl implements HopManfService {

	@Resource
	private HopManfDao hopManfDao;
	@Resource
	private CommonService commonService;

	public void list(HopManfDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hopManfDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HopManfDto dto){
	
		hopManfDao.save(dto.getHopManf());
	}
	
	public void delete(HopManfDto dto){
	
		hopManfDao.delete(dto.getHopManf());
	}
	
	public void update(HopManfDto dto){
	
		hopManfDao.update(dto.getHopManf());
	}
	
	public HopManf findById(HopManfDto dto){
	
		dto.setHopManf(hopManfDao.findById(dto.getHopManf()));
		return dto.getHopManf();
	}

	public List<HopManf> getManfInfo(HopManfDto dto) {		
		return hopManfDao.getManfInfo(dto.getHopManf());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.manf.HopManfService#getIdByName(java.lang.String)
	 */
	@Override
	public Long getIdByName(String name) {
		// TODO Auto-generated method stub
		return hopManfDao.getIdByName(name);
	}

	@Override
	public List<ComboxVo> findManfComboxVos(HopManfDto dto) {
		// TODO Auto-generated method stub
		return hopManfDao.findManfComboxVos(dto);
	}

}
