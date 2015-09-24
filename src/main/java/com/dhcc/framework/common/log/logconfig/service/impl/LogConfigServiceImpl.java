package com.dhcc.framework.common.log.logconfig.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.log.BusinessLogUtil;
import com.dhcc.framework.common.log.logconfig.dao.logconfig.LogConfigDao;
import com.dhcc.framework.common.log.logconfig.dto.logconfig.LogConfigDto;
import com.dhcc.framework.common.log.logconfig.service.LogConfigService;

@Service("logConfigService")
public class LogConfigServiceImpl implements LogConfigService {


	@Resource
	private LogConfigDao logConfigureDao;
	
	@Resource
	private CommonService commonService;

	
	public void list(LogConfigDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		logConfigureDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void saveOrUpdate(LogConfigDto dto){
	
		logConfigureDao.save(dto.getLogConfigure());
		BusinessLogUtil.reLoadConfigure();
	}
	
	public void delete(LogConfigDto dto){
	
		logConfigureDao.delete(dto.getLogConfigure());
		BusinessLogUtil.reLoadConfigure();
	}
}