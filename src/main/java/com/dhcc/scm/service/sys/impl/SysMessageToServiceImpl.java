/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.sys.impl;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.service.sys.SysMessageToService;
import com.dhcc.scm.dao.sys.SysMessageToDao;
import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.dto.sys.SysMessageToDto;
import com.dhcc.scm.entity.sys.SysMessageTo;

@Service("sysMessageToService")
public class SysMessageToServiceImpl implements SysMessageToService {

	@Resource
	private SysMessageToDao sysMessageToDao;
	@Resource
	private CommonService commonService;

	public void list(SysMessageToDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		sysMessageToDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	public void listId(SysMessageToDto dto){
		sysMessageToDao.list(dto);
		//调用分页查询方法
		//commonService.fillPagerModelData(dto.getPageModel());
	}
	
	public void save(SysMessageToDto dto){
	
		sysMessageToDao.save(dto.getSysMessageTo());
	}
	
	public void delete(SysMessageToDto dto){
	
		sysMessageToDao.delete(dto.getSysMessageTo());
	}
	
	public void update(SysMessageToDto dto){
	
		sysMessageToDao.update(dto.getSysMessageTo());
	}
	
	public SysMessageTo findById(SysMessageToDto dto){
	
		dto.setSysMessageTo(sysMessageToDao.findById(dto.getSysMessageTo()));
		return dto.getSysMessageTo();
	}

}
