/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.cat.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.dao.cat.CatGroupDao;
import com.dhcc.scm.dao.cat.SubCatGroupDao;
import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.dto.cat.SubCatGroupDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.service.cat.CatGroupService;
import com.dhcc.scm.service.cat.SubCatGroupService;


@Service("subCatGroupService")
public class SubCatGroupServiceImpl implements SubCatGroupService {

	@Resource
	private SubCatGroupDao subCatGroupDao;
	@Resource
	private CommonService commonService;

	public void list(SubCatGroupDto dto){
		
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		subCatGroupDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(SubCatGroupDto dto){
	
		subCatGroupDao.save(dto.getSubCatGroup());
	}
	
	public void delete(SubCatGroupDto dto){
		subCatGroupDao.deleteById(SubCatGroup.class, dto.getSubCatGroup().getSubGroupID());
	}

	public void update(SubCatGroupDto dto){
	
		subCatGroupDao.update(dto.getSubCatGroup());
	}
	
	public void getListSubInfo(SubCatGroupDto dto) {
		subCatGroupDao.getListInfo(dto);;
	}

	@Override
	public SubCatGroup findById(SubCatGroupDto dto) {
		dto.setSubCatGroup(subCatGroupDao.findById(dto.getSubCatGroup()));
		return dto.getSubCatGroup();
	}

}
