/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.cat.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.cat.CatGroupPropertyDao;
import com.dhcc.scm.dto.cat.CatGroupPropertyDto;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.service.cat.CatGroupPropertyService;

@Service("catGroupPropertyService")
public class CatGroupPropertyServiceImpl implements CatGroupPropertyService {

	@Resource
	private CatGroupPropertyDao catGroupPropertyDao;
	@Resource
	private CommonService commonService;

	public void list(CatGroupPropertyDto dto){
	
		catGroupPropertyDao.listCatProperty(dto);
	}
	
	public void save(CatGroupPropertyDto dto){
	
		catGroupPropertyDao.save(dto.getCatGroupProperty());
	}
	
	public void delete(CatGroupPropertyDto dto){
	
		catGroupPropertyDao.delete(dto.getCatGroupProperty());
	}
	
	public void update(CatGroupPropertyDto dto){
	
		catGroupPropertyDao.update(dto.getCatGroupProperty());
	}
	
	public CatGroupProperty findById(CatGroupPropertyDto dto){
	
		dto.setCatGroupProperty(catGroupPropertyDao.findById(dto.getCatGroupProperty()));
		return dto.getCatGroupProperty();
	}

}
