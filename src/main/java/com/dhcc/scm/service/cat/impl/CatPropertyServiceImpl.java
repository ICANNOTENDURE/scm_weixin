/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.cat.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.cat.CatPropertyDao;
import com.dhcc.scm.dto.cat.CatPropertyDto;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.service.cat.CatPropertyService;

@Service("catPropertyService")
public class CatPropertyServiceImpl implements CatPropertyService {

	@Resource
	private CatPropertyDao catPropertyDao;
	@Resource
	private CommonService commonService;

	public void list(CatPropertyDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		catPropertyDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(CatPropertyDto dto){
	
		catPropertyDao.save(dto.getCatProperty());
	}
	
	public void delete(CatPropertyDto dto){
	
		catPropertyDao.delete(dto.getCatProperty());
	}
	
	public void update(CatPropertyDto dto){
	
		catPropertyDao.update(dto.getCatProperty());
	}
	
	public CatProperty findById(CatPropertyDto dto){
	
		dto.setCatProperty(catPropertyDao.findById(dto.getCatProperty()));
		return dto.getCatProperty();
	}

}
