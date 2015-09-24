package com.dhcc.scm.blh.platformManage;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;
import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.MonStatisticDto;
import com.dhcc.scm.dto.sys.TaskConfigDto;
import com.dhcc.scm.entity.platformManage.MonStatistic;
import com.dhcc.scm.entity.platformManage.MonSys;
import com.dhcc.scm.entity.sys.TaskConfig;
import com.dhcc.scm.service.platformManage.MonStatisticService;
import com.dhcc.scm.service.platformManage.MonSysService;
import com.dhcc.scm.service.platformManage.TaskConfigService;
import com.dhcc.scm.tool.datetime.OperTime;

/**
 * 
* <p>标题: MonStatisticBlh.java</p>
* <p>业务描述: 服务器资源监控 统计信息Blh</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
@Component
@PmDataTypes({@PmDataType(methodName="list",clsType=MonStatisticDto.class),
	@PmDataType(methodName="findById",clsType=MonStatisticDto.class)})
public class MonStatisticBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(MonStatisticBlh.class);

	@Resource
	private MonStatisticService monStatisticService;
	@Resource
	private TaskConfigService taskConfigService;
	@Resource
	private MonSysService monSysService;

	public MonStatisticBlh() {
		logger.info("====new MonStatisticBlh====");
	}
	
	/**
	 * 
	* 方法名:		list
	* 方法功能描述:	进入服务器资源监控统计信息列表的入口方法
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:21:26
	 */
	public void list(BusinessRequest res) {
		MonStatisticDto dto = super.getDto(MonStatisticDto.class, res);
		
		//调用对应的service方法
		monStatisticService.list(dto);
	}
	
	/**
	 * 
	* 方法名:		save
	* 方法功能描述:	保存服务器资源监控统计信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:27
	 */
	public void save(BusinessRequest res) {
		MonStatisticDto dto = super.getDto(MonStatisticDto.class, res);
		
		//调用对应的service方法
		monStatisticService.save(dto);
	}
	
	/**
	 * 
	* 方法名:		delete
	* 方法功能描述:	删除服务器资源监控统计信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:35
	 */
	public void delete(BusinessRequest res) {
		MonStatisticDto dto = super.getDto(MonStatisticDto.class, res);
		
		//调用对应的service方法
		monStatisticService.delete(dto);
	}
	
	/**
	 * 
	* 方法名:		update
	* 方法功能描述:	更新服务器资源监控统计信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:39
	 */
	public void update(BusinessRequest res) {
		MonStatisticDto dto = super.getDto(MonStatisticDto.class, res);
		
		//调用对应的service方法
		monStatisticService.update(dto);
	}
	
	/**
	 * 
	* 方法名:		findById
	* 方法功能描述:	根据Id查询服务器资源监控统计信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:47
	 */
	public void findById(BusinessRequest res) {
		MonStatisticDto dto = super.getDto(MonStatisticDto.class, res);
		
		//调用对应的service方法
		monStatisticService.findById(dto);
	}
	
	/**
	 * 
	* 方法名:		monSta
	* 方法功能描述:	资源监控统计
	* @param:		无
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月15日 下午4:25:09
	 */
	public void monSysSta() {
		logger.info("\n------------monSta-------------\n");
		// 查任务管理表，系统监控统计任务执行间隔时间作为统计的时间段
		TaskConfig taskConfig = new TaskConfig();
		taskConfig.setJobName("MonSta");
		taskConfig.setJobGroup("PMS");
		taskConfig.setTriggerName("MonSta");
		taskConfig.setTriggerGroup("PMS");
		TaskConfigDto taskConfigDto=new TaskConfigDto();
		taskConfigDto.setTaskConfig(taskConfig);
		PagerModel pagerModel = new PagerModel();
		taskConfigDto.setPageModel(pagerModel);
		taskConfigService.list(taskConfigDto);
		taskConfig=(TaskConfig) pagerModel.getPageData().get(0);
		
		String timePeriodType=taskConfig.getTimePeriodType();
		logger.info("\n----------taskConfig.getTaskId()---------\n"+taskConfig.getTaskId());
		
		if (taskConfig.getTimePeriod()!=null) {
			int timePeriod=Integer.parseInt(taskConfig.getTimePeriod());
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
			// 获取统计开始时间
			Date startMonDate=getStaStartTime();
			if (startMonDate!=null) {
				// 开始统计
				Date nowDate=new Date();
				while (true) {
					long endMonDateL=startMonDate.getTime()+timePeriod*1000;
					Date endMonDate=new Date(endMonDateL);
					double intervalTime=OperTime.getIntervalTime(nowDate, endMonDate);
					if (intervalTime<0) {
						break;
					}
					List<MonSys> monSysList= monSysService.getMonSysByDate(startMonDate, endMonDate);
					if (monSysList!=null) {
						if (monSysList.size()>0) {
							saveStaList(monSysList,startMonDate, endMonDate);
						}
					}
					startMonDate=new Date(endMonDateL+1000);
				}
			}
		}
	}
	
	/**
	 * 
	* 方法名:		getStaStartTime
	* 方法功能描述:	获取统计开始时间
	* @param:		无
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月18日 下午2:25:42
	 */
	private Date getStaStartTime() {
		Date startMonDate=null;
		String monStatisticData=monStatisticService.ifHaveData();
		if (monStatisticData.equals("0")) {
			// 查询第一次监控记录的时间，根据此时间计算出统计开始时间
			startMonDate=monSysService.getMonStartDate();
			if (startMonDate!=null) {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String startMonDateStr =dateFormat.format(startMonDate);
				int hour=startMonDate.getHours();
				String hourAdd="00";
				if (hour>=0&&hour<6) {
					hourAdd="00";
				}else if (hour>=6&&hour<12) {
					hourAdd="06";
				}else if (hour>=12&&hour<18) {
					hourAdd="12";
				}else if (hour>=18&&hour<24) {
					hourAdd="18";
				}
				startMonDateStr=startMonDateStr+" "+hourAdd+":00:00";
				SimpleDateFormat datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					startMonDate=datetimeFormat.parse(startMonDateStr);
				} catch (ParseException e) {
					throw new DataBaseException(e.getMessage(), e);
				}
			}
		}else {
			// 查统计信息表，获取资源监控统计时间段最近一次统计的终止时间。
			MonStatisticDto dto=new MonStatisticDto();
			PagerModel pagerModel = new PagerModel();
			pagerModel.setPageNo(1);
			pagerModel.setPageSize(1);
			dto.setPageModel(pagerModel);
			monStatisticService.findLastStaEndTime(dto);
			if (pagerModel.getPageData().size()>0) {
				MonStatistic monStatistic=(MonStatistic) pagerModel.getPageData().get(0);
				if (monStatistic!=null) {
					Date lastEndTime=monStatistic.getEndTime();
					startMonDate=new Date(lastEndTime.getTime()+1000);
				}
			}
		}
		return startMonDate;
	}
	
	/**
	 * 
	* 方法名:		monSta
	* 方法功能描述:	统计资源监控信息并录入数据库
	* @param:		资源监控信息列表对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月18日 上午11:34:43
	 */
	private void saveStaList(List<MonSys> monSysList,Date startMonDate,Date endMonDate) {
		int num=monSysList.size();
		HashMap<String, Object> monSysMap=new HashMap<String, Object>();
		for (int i = 0; i < num; i++) {
			MonSys monSys=monSysList.get(i);
			if (monSysMap.containsKey(monSys.getServerId())) {
				List<MonSys> monList=(List<MonSys>) monSysMap.get(monSys.getServerId());
				monList.add(monSys);
			}else {
				List<MonSys> monList=new ArrayList<MonSys>();
				monList.add(monSys);
				monSysMap.put(monSys.getServerId(), monList);
			}
		}
		List<MonStatistic> monStatisticList=new ArrayList<MonStatistic>();
		for (Entry<String, Object> entry : monSysMap.entrySet()) {
			List<MonSys> monTempList=(List<MonSys>) entry.getValue();
			Double cpuIdle=0.0;
			Double cpuSystem=0.0;
			Double cpuUser=0.0;
			Double memFree=0.0;
			Double memUsed=0.0;
			int monNum=monTempList.size();
			for (int i = 0; i < monNum; i++) {
				MonSys monSys=monTempList.get(i);
				cpuIdle=cpuIdle+Double.parseDouble(monSys.getCpuIdle());
				cpuSystem=cpuSystem+Double.parseDouble(monSys.getCpuSystem());
				cpuUser=cpuUser+Double.parseDouble(monSys.getCpuUser());
				memFree=memFree+Double.parseDouble(monSys.getMemFree());
				memUsed=memUsed+Double.parseDouble(monSys.getMemUsed());
			}			
			MonStatistic monStatistic=new MonStatistic();
			DecimalFormat df=new DecimalFormat(".##");
			monStatistic.setCpuIdle(df.format(cpuIdle/monNum));
			monStatistic.setCpuSystem(df.format(cpuSystem/monNum));
			monStatistic.setCpuUser(df.format(cpuUser/monNum));
			monStatistic.setCpuTotal(df.format((cpuSystem+cpuUser)/monNum));
			monStatistic.setMemFree(df.format(memFree/monNum));
			monStatistic.setMemUsed(df.format(memUsed/monNum));
			monStatistic.setServerId(entry.getKey());
			monStatistic.setStartTime(startMonDate);
			monStatistic.setEndTime(endMonDate);

			monStatisticList.add(monStatistic);
		}
		if (monStatisticList.size()>0) {
			monStatisticService.saveStaList(monStatisticList);
		}
	}
}
