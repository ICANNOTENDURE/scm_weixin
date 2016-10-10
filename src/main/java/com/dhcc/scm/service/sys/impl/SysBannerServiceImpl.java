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

import com.dhcc.scm.service.sys.SysBannerService;
import com.dhcc.scm.dao.sys.SysBannerDao;
import com.dhcc.scm.dto.sys.SysBannerDto;
import com.dhcc.scm.entity.sys.SysBanner;

@Service("sysBannerService")
public class SysBannerServiceImpl implements SysBannerService {

	@Resource
	private SysBannerDao sysBannerDao;
	@Resource
	private CommonService commonService;

	public void list(SysBannerDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		sysBannerDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(SysBannerDto dto){
	
		sysBannerDao.save(dto.getSysBanner());
	}
	
	public void delete(SysBannerDto dto){
	
		sysBannerDao.delete(dto.getSysBanner());
	}
	
	public void update(SysBannerDto dto){
	
		sysBannerDao.update(dto.getSysBanner());
	}
	
	public SysBanner findById(SysBannerDto dto){
	
		dto.setSysBanner(sysBannerDao.findById(dto.getSysBanner()));
		return dto.getSysBanner();
	}

}
