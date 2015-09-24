package com.dhcc.scm.blh.sys;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.Order;
import com.dhcc.scm.blh.task.TaskOperate;
import com.dhcc.scm.dto.sys.TaskConfigDto;
import com.dhcc.scm.entity.sys.TaskConfig;
import com.dhcc.scm.service.platformManage.TaskConfigService;


@Component
public class TaskConfigBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(TaskConfigBlh.class);

	@Resource
	private TaskConfigService taskConfigService;
	
	@Resource
	private CommonService commonService;
	
	public TaskConfigBlh() {
		logger.info("====new TaskConfigBlh====");
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		
		//调用对应的service方法
		taskConfigService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		if(StringUtils.isNullOrEmpty(dto.getTaskConfig().getTaskId())){
			commonService.add(dto.getTaskConfig());
			TaskOperate.instance().addJob(dto);
			if(dto.getTaskConfig().getTaskStatus().equals("2")){
				TaskOperate.instance().pauseJob(dto);
			}
		}else{
			commonService.update(dto.getTaskConfig());
			TaskOperate.instance().removeJob(dto);
			TaskOperate.instance().addJob(dto);
			if(dto.getTaskConfig().getTaskStatus().equals("2")){
				TaskOperate.instance().pauseJob(dto);
			}
		}
		//TaskOperate.instance().display();
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		
		//调用对应的service方法
		taskConfigService.delete(dto);
		
		TaskOperate.instance().removeJob(dto);
	}
	

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		
		//调用对应的service方法
		taskConfigService.findById(dto);
		
	}
	
	/**
	 * 
	* @Title: TaskConfigBlh.java
	* @Description: TODO(暂停任务)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月1日 下午4:18:47
	* @version V1.0
	 */
	
	public void pauseJob(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskConfig taskConfig=commonService.get(TaskConfig.class, dto.getTaskConfig().getTaskId());
		taskConfig.setTaskStatus("2");
		commonService.saveOrUpdate(taskConfig);
		dto.setTaskConfig(taskConfig);
		TaskOperate.instance().pauseJob(dto);
	}
	
	
	/**
	 * 
	* @Title: TaskConfigBlh.java
	* @Description: TODO(继续任务)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月1日 下午4:18:31
	* @version V1.0
	 */
	public void resumeJob(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskConfig taskConfig=commonService.get(TaskConfig.class, dto.getTaskConfig().getTaskId());
		taskConfig.setTaskStatus("1");
		commonService.saveOrUpdate(taskConfig);
		dto.setTaskConfig(taskConfig);
		TaskOperate.instance().resumeJob(dto);
		Order.beaut();
	}
	
}
