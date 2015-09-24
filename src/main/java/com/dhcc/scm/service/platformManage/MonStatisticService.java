package com.dhcc.scm.service.platformManage;

import java.util.Date;
import java.util.List;

import com.dhcc.scm.dto.platformManage.MonStatisticDto;
import com.dhcc.scm.entity.platformManage.MonStatistic;

/**
 * 
* <p>标题: MonStatisticService.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
public interface MonStatisticService {

	public void list(MonStatisticDto dto);
	
	public void save(MonStatisticDto dto);
	
	public void delete(MonStatisticDto dto);
	
	public void update(MonStatisticDto dto);
	
	public void findById(MonStatisticDto dto);
	
	public void findLastStaEndTime(MonStatisticDto dto);
	
	public String ifHaveData();
	
	public void saveStaList(List<MonStatistic> monStatisticList);
}
