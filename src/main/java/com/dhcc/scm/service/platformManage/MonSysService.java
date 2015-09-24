package com.dhcc.scm.service.platformManage;

import java.util.Date;
import java.util.List;

import com.dhcc.scm.dto.platformManage.MonSysDto;
import com.dhcc.scm.entity.platformManage.MonSys;

/**
 * 
* <p>标题: MonSysService.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
public interface MonSysService {

	public void list(MonSysDto dto);
	
	public void save(MonSysDto dto);
	
	public void delete(MonSysDto dto);
	
	public void update(MonSysDto dto);
	
	public void findById(MonSysDto dto);
	
	public Date getMonStartDate();
	
	public List<MonSys> getMonSysByDate(Date start,Date end);
	
}
