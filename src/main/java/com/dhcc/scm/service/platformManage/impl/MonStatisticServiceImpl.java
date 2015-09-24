package com.dhcc.scm.service.platformManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.MonStatisticDao;
import com.dhcc.scm.dto.platformManage.MonStatisticDto;
import com.dhcc.scm.entity.platformManage.MonStatistic;
import com.dhcc.scm.service.platformManage.MonStatisticService;

/**
 * 
* <p>标题: MonStatisticServiceImpl.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
@Service("monStatisticService")
public class MonStatisticServiceImpl implements MonStatisticService {

	@Resource
	private MonStatisticDao monStatisticDao;
	@Resource
	private CommonService commonService;

	public void list(MonStatisticDto dto){
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		monStatisticDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(MonStatisticDto dto){
		monStatisticDao.save(dto.getMonStatistic());
	}
	
	public void delete(MonStatisticDto dto){
		monStatisticDao.delete(dto.getMonStatistic());
	}
	
	public void update(MonStatisticDto dto){
		monStatisticDao.update(dto.getMonStatistic());
	}
	
	public void findById(MonStatisticDto dto){
		monStatisticDao.findById(dto.getMonStatistic());
	}

	@Override
	public void findLastStaEndTime(MonStatisticDto dto){
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		monStatisticDao.buildFindLastStaEndTimeQuery(pagerModel);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}

	@Override
	public String ifHaveData() {
		String re=monStatisticDao.ifHaveData();
		return re;
	}

	@Override
	public void saveStaList(List<MonStatistic> monStatisticList) {
		monStatisticDao.saveStaList(monStatisticList);
	}
	
}
