package com.dhcc.scm.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.sys.LogDao;
import com.dhcc.scm.dto.sys.LogDto;
import com.dhcc.scm.service.sys.LogService;

@Service("logService")
public class LogServiceImpl implements LogService  {

	@Resource
	private CommonService commonService;
	
	@Resource
	private LogDao logDao;

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysDictService#list(com.dhcc.pms.dto.sys.SysDictDto)
	 */
	@Override
	public void list(LogDto dto) {
		PagerModel pagerModel=dto.getPageModel();
		//调用DAO拼接查询条件
		logDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);

		
	}

	

}
