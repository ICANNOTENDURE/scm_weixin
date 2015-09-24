/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.dao.hop.HopIncPicDao;
import com.dhcc.scm.dto.hop.HopIncPicDto;
import com.dhcc.scm.entity.hop.HopIncPic;
import com.dhcc.scm.entity.vo.hop.HopIncPicVo;
import com.dhcc.scm.service.hop.HopIncPicService;

@Service("hopIncPicService")
public class HopIncPicServiceImpl implements HopIncPicService {

	@Resource
	private HopIncPicDao hopIncPicDao;
	@Resource
	private CommonService commonService;

	public void list(HopIncPicDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hopIncPicDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HopIncPicDto dto){
	
		hopIncPicDao.save(dto.getHopIncPic());
	}
	
	public void delete(HopIncPicDto dto){
	
		hopIncPicDao.delete(dto.getHopIncPic());
	}
	
	public void update(HopIncPicDto dto){
	
		hopIncPicDao.update(dto.getHopIncPic());
	}
	
	public HopIncPic findById(HopIncPicDto dto){
	
		dto.setHopIncPic(hopIncPicDao.findById(dto.getHopIncPic()));
		return dto.getHopIncPic();
	}
	
	public List<HopIncPicVo> getListInfo(HopIncPicDto dto) {
		PagerModel pagerModel=dto.getPageModel();
		return hopIncPicDao.getListInfo(pagerModel,dto.getHopIncPicVos(),dto.getHopIncPic());
	}


}
