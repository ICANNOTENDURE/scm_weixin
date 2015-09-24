/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.weixin.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.weixin.WxMessageDao;
import com.dhcc.scm.dto.weixin.WxMessageDto;
import com.dhcc.scm.entity.weixin.WxMessage;
import com.dhcc.scm.service.weixin.WxMessageService;

@Service("wxMessageService")
public class WxMessageServiceImpl implements WxMessageService {

	@Resource
	private WxMessageDao wxMessageDao;
	@Resource
	private CommonService commonService;

	public void list(WxMessageDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		wxMessageDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(WxMessageDto dto){
	
		wxMessageDao.save(dto.getWxMessage());
	}
	
	public void delete(WxMessageDto dto){
	
		wxMessageDao.delete(dto.getWxMessage());
	}
	
	public void update(WxMessageDto dto){
	
		wxMessageDao.update(dto.getWxMessage());
	}
	
	public WxMessage findById(WxMessageDto dto){
	
		dto.setWxMessage(wxMessageDao.findById(dto.getWxMessage()));
		return dto.getWxMessage();
	}

	@Override
	public void listToDoTask(WxMessageDto dto) {
		// TODO Auto-generated method stub
		wxMessageDao.listToDoTask(dto);
	}

}
