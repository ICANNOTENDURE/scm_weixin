/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.ord.StateDao;
import com.dhcc.scm.dto.ord.StateDto;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.service.ord.StateService;

@Service("stateService")
public class StateServiceImpl implements StateService {

	@Resource
	private StateDao stateDao;
	@Resource
	private CommonService commonService;

	public void list(StateDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		stateDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(StateDto dto){
	
		stateDao.save(dto.getState());
	}
	
	public void delete(StateDto dto){
	
		stateDao.delete(dto.getState());
	}
	
	public void update(StateDto dto){
	
		stateDao.update(dto.getState());
	}
	
	public State findById(StateDto dto){
	
		dto.setState(stateDao.findById(dto.getState()));
		return dto.getState();
	}

}
