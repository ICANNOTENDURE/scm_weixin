/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.sys.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import javax.annotation.Resource;
import com.dhcc.scm.service.sys.SysQualifTypeService;
import com.dhcc.scm.dao.sys.SysQualifTypeDao;
import com.dhcc.scm.dto.sys.SysQualifTypeDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.sys.SysQualifType;

@Service("sysQualifTypeService")
public class SysQualifTypeServiceImpl implements SysQualifTypeService {

	@Resource
	private SysQualifTypeDao sysQualifTypeDao;
	@Resource
	private CommonService commonService;

	public void list(SysQualifTypeDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		sysQualifTypeDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(SysQualifTypeDto dto){
	
		sysQualifTypeDao.save(dto.getSysQualifType());
	}
	
	public void delete(SysQualifTypeDto dto){
	
		sysQualifTypeDao.delete(dto.getSysQualifType());
	}
	
	public void update(SysQualifTypeDto dto){
	
		sysQualifTypeDao.update(dto.getSysQualifType());
	}
	
	public SysQualifType findById(SysQualifTypeDto dto){
	
		dto.setSysQualifType(sysQualifTypeDao.findById(dto.getSysQualifType()));
		return dto.getSysQualifType();
	}
	
//add hxy
	@Override
	public List<CatGroup> getCatInfo(SysQualifTypeDto dto) {
		// TODO Auto-generated method stub
		return sysQualifTypeDao.getCatInfo(dto);
	}

}
