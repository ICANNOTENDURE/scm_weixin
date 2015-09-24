/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.cat.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.cat.CatGroupDao;
import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.service.cat.CatGroupService;


@Service("catGroupService")
public class CatGroupServiceImpl implements CatGroupService {

	@Resource
	private CatGroupDao catGroupDao;
	@Resource
	private CommonService commonService;

	public void list(CatGroupDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		catGroupDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}

	public void save(CatGroupDto dto){
	
		catGroupDao.save(dto.getCatGroup());
	}
	
	public void delete(CatGroupDto dto){
		catGroupDao.deleteById(CatGroup.class, dto.getCatGroup().getGroupID());
	}

	public void update(CatGroupDto dto){
	
		catGroupDao.update(dto.getCatGroup());
	}
	
	public CatGroup findById(CatGroupDto dto){
		dto.setCatGroup(catGroupDao.findById(dto.getCatGroup()));
		return dto.getCatGroup();
	}

	@Override
	public void listGroup(CatGroupDto dto) {
		// TODO Auto-generated method stub
		catGroupDao.listGroup(dto);
	}

	@Override
	public void listCatGroup(CatGroupDto dto) {
		// TODO Auto-generated method stub
		catGroupDao.listCatGroup(dto);
	}

	@Override
	public void listGroupComb(CatGroupDto dto) {
		// TODO Auto-generated method stub
		catGroupDao.listGroupComb(dto);
	}

}
