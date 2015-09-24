package com.dhcc.scm.blh.task;

import static org.quartz.SimpleScheduleBuilder.simpleSchedule;

import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.StdSchedulerFactory;

import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.scm.dto.sys.TaskConfigDto;
import com.dhcc.scm.entity.sys.TaskConfig;

/**
 * <p>标题: TaskOperateBlh.java</p>
 * <p>业务描述: 统一运维及安全管理平台</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年11月15日
 * @version V1.0 
 */
public class TaskOperate {
	
	private static Log logger = LogFactory.getLog(TaskOperate.class);
	
	private static SchedulerFactory sf = new StdSchedulerFactory();
	private static TaskOperate taskOperate;
	
	private TaskOperate(){
		super();
	}
	
	public static TaskOperate instance(){
		if(taskOperate == null ){
			taskOperate = new TaskOperate();
		}
		return taskOperate;
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
	public void addJob(TaskConfigDto tcdto) {
		TaskConfig tc=tcdto.getTaskConfig();
		if (tc.getJobName().equals("")||tc.getJobGroup().equals("")
				||tc.getTriggerName().equals("")||tc.getTriggerGroup().equals("")
				||(tc.getTaskClass().equals(""))||(Integer.parseInt(tc.getTimePeriod())<1)) {
			tcdto.setSuccess(false);
			tcdto.setMessage("信息不完整，添加任务失败");
		}else {
			try {
				String timePeriodType=tc.getTimePeriodType();
				int timePeriod=Integer.parseInt(tc.getTimePeriod());
				if (timePeriodType!=null) {
					switch(timePeriodType){
						// 秒
		 	    		case "1": break;
		 	    		// 分钟
		 	    		case "2": timePeriod=timePeriod*60;break;
		 	    		// 小时
		 	    		case "3":timePeriod=timePeriod*60*60;break;
			 	    	// 日
			 	    	case "4":timePeriod=timePeriod*24*60*60;break;
			 	    	default : break;
		 	    	}
				}
				Class taskClass= Class.forName(tc.getTaskClass());
	 			JobDetail jobDetail = JobBuilder.newJob(taskClass).withIdentity(tc.getJobName(),tc.getJobGroup()).build();
	 			Date startTime=tc.getStartTime();
	 			Date endTime=tc.getEndTime();
	 			if (startTime==null) {
	 				startTime=new Date();
				}
	 			Trigger trigger =(SimpleTrigger)TriggerBuilder.newTrigger().withIdentity(tc.getTriggerName(), tc.getTriggerGroup())
	 					.startAt(startTime).withSchedule(simpleSchedule()
	 					.withIntervalInSeconds(timePeriod).repeatForever()).endAt(endTime).build();
	 			Scheduler scheduler = sf.getScheduler();
	 			scheduler.scheduleJob(jobDetail, trigger );
	 			scheduler.start();
	 			tcdto.setSuccess(true);
	 			tcdto.setMessage("添加任务成功");
			}catch (Exception e) {
				logger.info("\n--------------addJob Exception------------------\n"+e.getMessage());
				tcdto.setSuccess(false);
				tcdto.setMessage(e.getMessage());
				throw new DataBaseException(e.getMessage(), e);
			}
		}
	}
	
	/**
	 * 
	* 方法名:		removeJob
	* 方法功能描述:	移除任务
	* @param:		任务名称
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:12:06
	 */
	public void removeJob(TaskConfigDto tcdto) {
		TaskConfig tc=tcdto.getTaskConfig();
		try{
			Scheduler scheduler = sf.getScheduler();
			TriggerKey tk = new TriggerKey(tc.getTriggerName(),tc.getTriggerGroup());
			scheduler.pauseTrigger(tk);//停止触发器
			scheduler.unscheduleJob(tk);//移除触发器
			JobKey jk = new JobKey(tc.getJobName(),tc.getJobGroup());
			scheduler.deleteJob(jk);//删除任务
			tcdto.setSuccess(true);
 			tcdto.setMessage("移除任务成功");
		}catch (Exception e) {
			logger.info("\n--------------removeJob Exception------------------\n"+e.getMessage());
			tcdto.setSuccess(false);
			tcdto.setMessage(e.getMessage());
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:		removeAll
	* 方法功能描述:	移除所有任务
	* @param:		无
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:12:40
	 */
	public void removeAll(TaskConfigDto tcdto) {
		try{
			Collection<Scheduler> list = sf.getAllSchedulers();
			Iterator<Scheduler> it = list.iterator();
			while(it.hasNext()){
				Scheduler sc = it.next();
				if(sc != null){
					sc.clear();
				}
			}
			tcdto.setSuccess(true);
 			tcdto.setMessage("移除所有任务成功");
		}catch (Exception e) {
			logger.info("\n--------------removeAll Exception------------------\n"+e.getMessage());
			tcdto.setSuccess(false);
			tcdto.setMessage(e.getMessage());
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:		pauseJob
	* 方法功能描述:	暂停任务
	* @param:		任务名称
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:12:57
	 */
	public void pauseJob(TaskConfigDto tcdto) {
		TaskConfig tc=tcdto.getTaskConfig();
		try {
			Scheduler scheduler = sf.getScheduler();
			TriggerKey triggerKey = new TriggerKey(tc.getTriggerName(),tc.getTriggerGroup());
			scheduler.pauseTrigger(triggerKey);
			JobKey jobKey=new JobKey(tc.getJobName(),tc.getJobGroup());
			scheduler.pauseJob(jobKey);
			tcdto.setSuccess(true);
 			tcdto.setMessage("暂停任务成功");
		}catch (Exception e) {
			logger.info("\n--------------removeAll Exception------------------\n"+e.getMessage());
			tcdto.setSuccess(false);
			tcdto.setMessage(e.getMessage());
			throw new DataBaseException(e.getMessage(), e);
		}
	}

	/**
	 * 
	* 方法名:		resumeJob
	* 方法功能描述:	恢复任务
	* @param:		任务名称
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月5日 上午11:13:15
	 */
	public void resumeJob(TaskConfigDto tcdto) {
		TaskConfig tc=tcdto.getTaskConfig();
		try {
			Scheduler scheduler = sf.getScheduler();
			JobKey jobKey=new JobKey(tc.getJobName(),tc.getJobGroup());
			if(scheduler.checkExists(jobKey)){
				scheduler.resumeJob(jobKey);
			}else{
				this.addJob(tcdto);
			}
			
			TriggerKey triggerKey = new TriggerKey(tc.getTriggerName(),tc.getTriggerGroup());
			scheduler.resumeTrigger(triggerKey);
			tcdto.setSuccess(true);
 			tcdto.setMessage("恢复任务成功");
		}catch (Exception e) {
			logger.info("\n--------------resumeJob Exception------------------\n"+e.getMessage());
			tcdto.setSuccess(false);
			tcdto.setMessage(e.getMessage());
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	public void display(){
		try {
			Scheduler scheduler = sf.getScheduler();
			System.out.println("----------------display-----------------");
			System.out.println("scheduler.getCurrentlyExecutingJobs() :"+scheduler.getCurrentlyExecutingJobs());
			System.out.println("scheduler.getJobGroupNames() :"+scheduler.getJobGroupNames());
			System.out.println("scheduler.getMetaData() :"+scheduler.getMetaData());
			System.out.println("scheduler.getPausedTriggerGroups() :"+scheduler.getPausedTriggerGroups());
			System.out.println("scheduler.getTriggerGroupNames() :"+scheduler.getTriggerGroupNames());
			System.out.println("scheduler.isInStandbyMode() :"+scheduler.isInStandbyMode());
			System.out.println("scheduler.isShutdown() :"+scheduler.isShutdown());
			System.out.println("scheduler.isStarted() :"+scheduler.isStarted());
			
		} catch (SchedulerException e) {
			System.out.println("e.getMessage() :"+e.getMessage());
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	public boolean isExist(TaskConfigDto tcdto){
		TaskConfig tc=tcdto.getTaskConfig();
		try {
			Scheduler scheduler = sf.getScheduler();
			JobKey jobKey=new JobKey(tc.getJobName(),tc.getJobGroup());
			scheduler.getJobDetail(jobKey);
			System.out.println("----------------display-----------------");
			System.out.println("scheduler.getCurrentlyExecutingJobs() :"+scheduler.getCurrentlyExecutingJobs());
			System.out.println("scheduler.getJobGroupNames() :"+scheduler.getJobGroupNames());
			System.out.println("scheduler.getMetaData() :"+scheduler.getMetaData());
			System.out.println("scheduler.getPausedTriggerGroups() :"+scheduler.getPausedTriggerGroups());
			System.out.println("scheduler.getTriggerGroupNames() :"+scheduler.getTriggerGroupNames());
			System.out.println("scheduler.isInStandbyMode() :"+scheduler.isInStandbyMode());
			System.out.println("scheduler.isShutdown() :"+scheduler.isShutdown());
			System.out.println("scheduler.isStarted() :"+scheduler.isStarted());
			
		} catch (SchedulerException e) {
			System.out.println("e.getMessage() :"+e.getMessage());
			throw new DataBaseException(e.getMessage(), e);
		}
		return true;
	}
	
	
}
