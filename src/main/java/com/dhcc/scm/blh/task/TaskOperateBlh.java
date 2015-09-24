package com.dhcc.scm.blh.task;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.sys.TaskConfigDto;

/**
 * 
* <p>标题: TaskOperateBlh.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月27日
* @version V1.0
 */
@Component
public class TaskOperateBlh extends AbstractBaseBlh{
	
	private static Log logger = LogFactory.getLog(TaskOperateBlh.class);
	
	private TaskOperateBlh(){
		logger.info("====new TaskOperateBlh====");
	}
	
	/**
	 * 
	* 方法名:		addJob
	* 方法功能描述:	添加任务
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月4日 下午7:19:25
	 */
	public void addJob(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskOperate.instance().addJob(dto);
	}

	/**
	 * 
	* 方法名:		removeJob
	* 方法功能描述:	移除任务
	* @param:		业务请求对象-任务名称
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:12:06
	 */
	public void removeJob(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskOperate.instance().removeJob(dto);
	}
	
	/**
	 * 
	* 方法名:		removeAll
	* 方法功能描述:	移除所有任务
	* @param:		业务请求对象-无
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:12:40
	 */
	public void removeAll(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskOperate.instance().removeAll(dto);
	}
	
	/**
	 * 
	* 方法名:		pauseJob
	* 方法功能描述:	暂停任务
	* @param:		业务请求对象-任务名称
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:12:57
	 */
	public void pauseJob(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskOperate.instance().pauseJob(dto);
	}

	/**
	 * 
	* 方法名:		resumeJob
	* 方法功能描述:	恢复任务
	* @param:		业务请求对象-任务名称
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:13:15
	 */
	public void resumeJob(BusinessRequest res) {
		TaskConfigDto dto = super.getDto(TaskConfigDto.class, res);
		TaskOperate.instance().resumeJob(dto);
	}
	
}
