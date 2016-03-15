/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.st.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.st.StInGdRecDao;
import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.st.StInGdRecService;

@Service("stInGdRecService")
public class StInGdRecServiceImpl implements StInGdRecService {

	@Resource
	private StInGdRecDao stInGdRecDao;
	@Resource
	private CommonService commonService;

	public void list(StInGdRecDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		stInGdRecDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(StInGdRecDto dto){
	
		stInGdRecDao.save(dto.getStInGdRec());
	}
	
	public void delete(StInGdRecDto dto){
	
		stInGdRecDao.delete(dto.getStInGdRec());
	}
	
	public void update(StInGdRecDto dto){
	
		stInGdRecDao.update(dto.getStInGdRec());
	}
	
	public StInGdRec findById(StInGdRecDto dto){
	
		dto.setStInGdRec(stInGdRecDao.findById(dto.getStInGdRec()));
		return dto.getStInGdRec();
	}

	@Override
	public void mpInGdRec(StInGdRecDto dto) {
		
		stInGdRecDao.mpInGdRec(dto);
	}

}
