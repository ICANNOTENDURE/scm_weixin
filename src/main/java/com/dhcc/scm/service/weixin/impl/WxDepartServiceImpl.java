/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.weixin.impl;

import javax.annotation.Resource;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.bean.WxCpDepart;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.weixin.WxDepartDao;
import com.dhcc.scm.dto.weixin.WxDepartDto;
import com.dhcc.scm.entity.weixin.WxDepart;
import com.dhcc.scm.service.weixin.WxDepartService;

@Service("wxDepartService")
public class WxDepartServiceImpl implements WxDepartService {

	@Resource
	private WxDepartDao wxDepartDao;
	@Resource
	private CommonService commonService;
	@Resource
	private WxCpService wxCpService;
	
	public void list(WxDepartDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		wxDepartDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(WxDepartDto dto) throws WxErrorException{

		commonService.saveOrUpdate(dto.getWxDepart());
		WxCpDepart cpDepart=new WxCpDepart();
		cpDepart.setId(dto.getWxDepart().getWxDepartId());
		cpDepart.setName(dto.getWxDepart().getWxDepartName());
		cpDepart.setParentId(dto.getWxDepart().getWxDepartParentId());
		wxCpService.departCreate(cpDepart);
	}
	
	public void delete(WxDepartDto dto)throws WxErrorException{
		
	}
	
	public void update(WxDepartDto dto)throws WxErrorException{
	
		commonService.saveOrUpdate(dto.getWxDepart());
		WxCpDepart cpDepart=new WxCpDepart();
		cpDepart.setId(dto.getWxDepart().getWxDepartId());
		cpDepart.setName(dto.getWxDepart().getWxDepartName());
		cpDepart.setParentId(dto.getWxDepart().getWxDepartParentId());
		wxCpService.departUpdate(cpDepart);
	}
	
	public WxDepart findById(WxDepartDto dto){
	
		dto.setWxDepart(wxDepartDao.findById(dto.getWxDepart()));
		return dto.getWxDepart();
	}

}
