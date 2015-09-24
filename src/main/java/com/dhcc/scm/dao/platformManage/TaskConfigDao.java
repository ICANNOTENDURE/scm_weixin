package com.dhcc.scm.dao.platformManage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.sys.TaskConfigDto;
import com.dhcc.scm.entity.sys.TaskConfig;
import com.dhcc.scm.tool.hql.GetHql;

/**
 * 
* <p>标题: TaskConfigDao.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月15日
* @version V1.0
 */
@Repository
public class TaskConfigDao extends HibernatePersistentObjectDAO<TaskConfig> {

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		TaskConfigDto taskConfigDto=(TaskConfigDto)dto;
		TaskConfig taskConfig=taskConfigDto.getTaskConfig();
		Map<String, Object> map = new HashMap<String, Object>();
		
		StringBuilder hqlStr=new StringBuilder(64);
		if (taskConfig==null) {
			hqlStr.append("from TaskConfig where 1=1");
		}else {
			List<String> exceptList=new ArrayList<String>();
			exceptList.add("startTime");
			exceptList.add("endTime");
			GetHql getHql=new GetHql();
			getHql.getHqlByObject(taskConfig,hqlStr,map, exceptList);
		}
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		pagerModel.setHqlParamMap(map);
		pagerModel.setCountProName("taskId");
		pagerModel.setQueryHql(hqlStr.toString());
	}
		
	public void save(TaskConfig taskConfig){
		super.save(taskConfig);
	}
	
	public void delete(TaskConfig taskConfig){
		super.delete(taskConfig);
	}
	
	public void update(TaskConfig taskConfig){
		super.update(taskConfig);
	}
	
	public TaskConfig findById(TaskConfig taskConfig){
		return super.findById(taskConfig.getTaskId());
	}
	
}
