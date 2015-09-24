/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.sys.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.sys.ImpModelDao;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.service.sys.SysImpModelService;

@Service("sysImpModelService")
public class SysImpModelServiceImpl implements SysImpModelService {

	@Resource
	private ImpModelDao impModelDao;
	@Resource
	private CommonService commonService;

	public void list(SysImpModelDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		impModelDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(SysImpModelDto dto){
	
		impModelDao.save(dto.getImpModel());
	}
	
	public void delete(SysImpModelDto dto){
	
		impModelDao.delete(dto.getImpModel());
	}
	
	public void update(SysImpModelDto dto){
	
		impModelDao.update(dto.getImpModel());
	}
	
	public ImpModel findById(SysImpModelDto dto){
	
		dto.setImpModel(impModelDao.findById(dto.getImpModel()));
		return dto.getImpModel();
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysImpModelService#getModelList(com.dhcc.pms.dto.sys.SysImpModelDto)
	 */
	@Override
	public List<ImpModel> getModelList(SysImpModelDto dto) {
		// TODO Auto-generated method stub
		return impModelDao.getModelList(dto.getImpModel());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysImpModelService#saveModel(com.dhcc.pms.dto.sys.SysImpModelDto)
	 */
	@Override
	public void saveModel(SysImpModelDto dto) {
		// TODO Auto-generated method stub
		impModelDao.saveModel(dto);
	}

}
