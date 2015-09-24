/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.weixin.impl;

import javax.annotation.Resource;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.weixin.WxUserDao;
import com.dhcc.scm.dto.weixin.WxUserDto;
import com.dhcc.scm.entity.weixin.WxUser;
import com.dhcc.scm.service.weixin.WxUserService;

@Service("wxUserService")
public class WxUserServiceImpl implements WxUserService {

	@Resource
	private WxUserDao wxUserDao;
	@Resource
	private CommonService commonService;
	
	@Resource
	private WxCpService wxCpService;

	public void list(WxUserDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		wxUserDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(WxUserDto dto) throws WxErrorException {
	
		wxUserDao.save(dto.getWxUser());
		dto.getWxCpUser().setUserId(dto.getWxUser().getWxUserId());
		wxCpService.userCreate(dto.getWxCpUser());
	}
	
	public void delete(WxUserDto dto)throws WxErrorException{
		
		String[] ids=dto.getWxUser().getWxUserId().split(",");
		wxCpService.userDelete(ids);
		for(int i=0;i<ids.length;i++){
			commonService.delete(WxUser.class, ids[i]);
		}
	}
	
	public void update(WxUserDto dto)throws WxErrorException{
	
		wxUserDao.update(dto.getWxUser());
		wxCpService.userUpdate(dto.getWxCpUser());
	}
	
	public WxUser findById(WxUserDto dto){
	
		dto.setWxUser(wxUserDao.findById(dto.getWxUser()));
		return dto.getWxUser();
	}

}
