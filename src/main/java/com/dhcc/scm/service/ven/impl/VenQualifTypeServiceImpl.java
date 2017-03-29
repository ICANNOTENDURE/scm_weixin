/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ven.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.ven.VenQualifTypeDao;
import com.dhcc.scm.dto.ven.VenQualifTypeDto;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.service.ven.VenQualifTypeService;

@Service("venQualifTypeService")
public class VenQualifTypeServiceImpl implements VenQualifTypeService {

	@Resource
	private VenQualifTypeDao venQualifTypeDao;
	@Resource
	private CommonService commonService;

	public void list(VenQualifTypeDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		venQualifTypeDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(VenQualifTypeDto dto){
	
		venQualifTypeDao.save(dto.getVenQualifType());
	}
	
	public void delete(VenQualifTypeDto dto){
	
		venQualifTypeDao.delete(dto.getVenQualifType());
	}
	
	public void update(VenQualifTypeDto dto){
	
		venQualifTypeDao.update(dto.getVenQualifType());
	}
	
	public VenQualifType findById(VenQualifTypeDto dto){
	
		dto.setVenQualifType(venQualifTypeDao.findById(dto.getVenQualifType()));
		return dto.getVenQualifType();
	}

	@Override
	public String checkVenIncQualify(Long id) {
		// TODO Auto-generated method stub
		return venQualifTypeDao.checkVenIncQualify(id);
	}

	@Override
	public String checkVenQualify(Long venId) {
		// TODO Auto-generated method stub
		return venQualifTypeDao.checkVenQualify(venId);
	}

}
