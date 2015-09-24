package com.dhcc.scm.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.sys.SysDictDao;
import com.dhcc.scm.dto.sys.SysDictDto;
import com.dhcc.scm.entity.sys.SysDict;
import com.dhcc.scm.service.sys.SysDictService;
/**
 * <p>标题：</p>
 * <p>业务描述：</p>
 * <p>公司：东华软件股份公司</p>
 * <p>版权：dhcc2013</p>
 * @author pzk
 * @date 2014年4月14日
 * @version 
 */
@Service("sysDictService")
public class SysDictServiceImpl implements SysDictService  {

	@Resource
	private CommonService commonService;
	
	@Resource
	private SysDictDao sysDictDao;

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysDictService#list(com.dhcc.pms.dto.sys.SysDictDto)
	 */
	@Override
	public void list(SysDictDto dto) {
		PagerModel pagerModel=dto.getPageModel();
		//调用DAO拼接查询条件
		sysDictDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysDictService#save(com.dhcc.pms.dto.sys.SysDictDto)
	 */
	@Override
	public void save(SysDictDto dto) {
		sysDictDao.save(dto.getSysDict());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysDictService#delete(com.dhcc.pms.dto.sys.SysDictDto)
	 */
	@Override
	public void delete(SysDictDto dto) {
		sysDictDao.deleteById(SysDict.class,dto.getSysDict().getId());
		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysDictService#update(com.dhcc.pms.dto.sys.SysDictDto)
	 */
	@Override
	public void update(SysDictDto dto) {
		sysDictDao.update(dto.getSysDict());
		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.sys.SysDictService#findById(com.dhcc.pms.dto.sys.SysDictDto)
	 */
	@Override
	public SysDict findById(SysDictDto dto) {
		return sysDictDao.findById(dto.getSysDict());
	}

}
