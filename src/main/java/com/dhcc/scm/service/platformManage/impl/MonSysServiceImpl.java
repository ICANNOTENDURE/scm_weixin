package com.dhcc.scm.service.platformManage.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.MonSysDao;
import com.dhcc.scm.dto.platformManage.MonSysDto;
import com.dhcc.scm.entity.platformManage.MonSys;
import com.dhcc.scm.service.platformManage.MonSysService;

/**
 * 
* <p>标题: MonSysServiceImpl.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
@Service("monSysService")
public class MonSysServiceImpl implements MonSysService {

	@Resource
	private MonSysDao monSysDao;
	@Resource
	private CommonService commonService;

	public void list(MonSysDto dto){
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		monSysDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(MonSysDto dto){
		monSysDao.save(dto.getMonSys());
	}
	
	public void delete(MonSysDto dto){
		monSysDao.delete(dto.getMonSys());
	}
	
	public void update(MonSysDto dto){
		monSysDao.update(dto.getMonSys());
	}
	
	public void findById(MonSysDto dto){
		monSysDao.findById(dto.getMonSys());
	}

	@Override
	public Date getMonStartDate() {
		Date startDate=monSysDao.getMonStartDate();
		return startDate;
	}

	@Override
	public List<MonSys> getMonSysByDate(Date start, Date end) {
		List<MonSys> monSysList=monSysDao.getMonSysByDate(start, end);
		return monSysList;
	}
	
}
