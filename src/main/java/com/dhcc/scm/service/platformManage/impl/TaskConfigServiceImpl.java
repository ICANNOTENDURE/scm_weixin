package com.dhcc.scm.service.platformManage.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.TaskConfigDao;
import com.dhcc.scm.dto.sys.TaskConfigDto;
import com.dhcc.scm.service.platformManage.TaskConfigService;


/**
 * 
* <p>标题: TaskConfigServiceImpl.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月15日
* @version V1.0
 */
@Service("latformManageService")
public class TaskConfigServiceImpl implements TaskConfigService {

	@Resource
	private TaskConfigDao taskConfigDao;
	@Resource
	private CommonService commonService;

	public void list(TaskConfigDto dto){
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		taskConfigDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
		
//		Map<String,String> map=new HashMap<String,String>(1);
//		map.put("timePeriodType", "taskTimeType");
//		commonService.dictionaryConvert(pagerModel.getPageData(), map);
		
		
	}
	
	public void save(TaskConfigDto dto){
		taskConfigDao.save(dto.getTaskConfig());
	}
	
	public void delete(TaskConfigDto dto){
		taskConfigDao.delete(dto.getTaskConfig());
	}
	
	public void update(TaskConfigDto dto){
		taskConfigDao.update(dto.getTaskConfig());
	}
	
	public void findById(TaskConfigDto dto){
		dto.setTaskConfig(taskConfigDao.findById(dto.getTaskConfig()));
	}
	
}
