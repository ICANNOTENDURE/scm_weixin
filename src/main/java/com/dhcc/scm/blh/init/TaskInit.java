package com.dhcc.scm.blh.init;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.blh.task.TaskOperate;
import com.dhcc.scm.dto.sys.TaskConfigDto;
import com.dhcc.scm.entity.sys.TaskConfig;


@Component
@DependsOn("propertiesBean")
public class TaskInit {
	
	private static Log logger = LogFactory.getLog(TaskInit.class);
	
	@Resource
	private CommonService commonService;
	
	public TaskInit() {
		logger.info("====TaskInit====");
	};
	
	
	@PostConstruct
	public void TaskLoad() {
		logger.info("\n-------------------TaskInit--------------------\n");
		// 获取任务，存入内存 
		List<TaskConfig> tcList =commonService.getAll(TaskConfig.class, "startTime", true);
		if(tcList.size()!=0){
			TaskConfigDto tcdto=new TaskConfigDto();
			for(int i=0;i<tcList.size();i++){
				tcdto.setTaskConfig(tcList.get(i));
				if(tcdto.getTaskConfig().getTaskStatus().equals("1")){
					TaskOperate.instance().addJob(tcdto);
					logger.info("\n-------------------add Job--------------------\n"+tcList.get(i).getJobName());
				}
				
			}
		}
	}
	


}
