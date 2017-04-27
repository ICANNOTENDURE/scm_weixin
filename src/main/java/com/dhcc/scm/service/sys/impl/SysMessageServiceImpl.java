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

import com.dhcc.scm.service.sys.SysMessageService;
import com.dhcc.scm.dao.sys.SysMessageDao;
import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.dto.ven.VenDeliverDto;
import com.dhcc.scm.entity.sys.SysMessage;

@Service("sysMessageService")
public class SysMessageServiceImpl implements SysMessageService {

	@Resource
	private SysMessageDao sysMessageDao;
	@Resource
	private CommonService commonService;
	
	public void listId(SysMessageDto dto){
		sysMessageDao.list(dto);
		//调用分页查询方法
		//commonService.fillPagerModelData(dto.getPageModel());
	}
	public void list(SysMessageDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		sysMessageDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(SysMessageDto dto){
	
		sysMessageDao.save(dto.getSysMessage());  //
	}
	public Long saveOrUpdate(SysMessageDto dto) {
		return sysMessageDao.asaveOrUpdate(dto.getSysMessage());
		
	}
	/*public void delete(SysMessageDto dto){
	
		sysMessageDao.delete(dto.getSysMessage());
	}*/
	
	public void update(SysMessageDto dto){
	
		sysMessageDao.update(dto.getSysMessage());
	}
	
	public SysMessage findById(SysMessageDto dto){
	
		dto.setSysMessage(sysMessageDao.findById(dto.getSysMessage()));
		return dto.getSysMessage();
	}

}
