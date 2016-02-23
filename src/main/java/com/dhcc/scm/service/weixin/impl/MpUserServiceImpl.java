/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.weixin.impl;

import org.springframework.stereotype.Service;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import javax.annotation.Resource;

import com.dhcc.scm.service.weixin.MpUserService;
import com.dhcc.scm.dao.weixin.MpUserDao;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.weixin.MpUser;

@Service("mpUserService")
public class MpUserServiceImpl implements MpUserService {

	@Resource
	private MpUserDao mpUserDao;
	@Resource
	private CommonService commonService;

	public void list(MpUserDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		mpUserDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(MpUserDto dto){
	
		mpUserDao.save(dto.getMpUser());
	}
	
	public void delete(MpUserDto dto){
	
		mpUserDao.delete(dto.getMpUser());
	}
	
	public void update(MpUserDto dto){
	
		mpUserDao.update(dto.getMpUser());
	}
	
	public MpUser findById(MpUserDto dto){
	
		dto.setMpUser(mpUserDao.findById(dto.getMpUser()));
		return dto.getMpUser();
	}

}
