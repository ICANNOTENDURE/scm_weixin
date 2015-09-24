package com.dhcc.framework.common.log;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.common.entity.BusinessLog;
import com.dhcc.framework.common.entity.LogConfigure;
//import com.dhcc.framework.hbase.HBaseHelper;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.util.DhccBeanUtils;
import com.dhcc.framework.web.context.WebContextHolder;


/**
 * 写日志公共类
 * @author liuyg
 *
 */
public class BusinessLogUtil {
	
	private static  Map<String, LogConfigure> confMap = new HashMap<String, LogConfigure>();
	private static  boolean haveLoadConfig = false;

	//private static final Logger logger = Logger.getLogger(BusinessLogUtil.class);
	//特别申明了一个  errorLog 且不用使用BusinessLogUtil 因为这里的按业得日志来写的，这里必须用另一个来实如果出错时的日志
	//private static Log errorLog = LogFactory.getLog(LogConfigure.class);
	
	private static Log logger = LogFactory.getLog(BusinessLogUtil.class);
	
	public static void writeLog(MethodInvocation invoke,String loginName,String tradeAccount,Date startDate,Date endDate){
		String className = BusinessLogUtil.getDeclaringClass(invoke.getMethod().getDeclaringClass().getName());
		String method = className + ":" + invoke.getMethod().getName();
		if(confMap.size()==0){
			loadConfigure();
		}
		if(!confMap.containsKey(method)){
			return;
		}
		LogConfigure configure = confMap.get(method);  //getConfigure(method);
		String rootFlg = null;
		if(configure!=null){
			BusinessLog logInfo = null;
			try {
				if(tradeAccount!=null&&tradeAccount.length()>=72){
					rootFlg = "0";
				}else{
					rootFlg = "1";
				}
				logInfo = BusinessLogUtil.buildLogInfo(configure, invoke.getArguments(), loginName,tradeAccount,method);
				logInfo.setRootOpper(rootFlg);
			} catch (Exception e) {
				String ip = null;
				if(WebContextHolder.getContext()!=null){
					ip= WebContextHolder.getContext().getIp();
				}
				String gatewayId = null;

				System.out.println("BusinessLogUtil buildLogInfo error " +e.getMessage());
				logger.error("{\"tradeAccount\":\"" + tradeAccount + "\",\"accountName\":\""
						+ loginName + "\",\"operDesc\":\"" + configure.getTitle() +"\",\"operSummary\":\""
						+ "{write log error "+e.getMessage()+"}\"," 
						+"\"logType\":\"3\","
						+"\"dealStatus\":\"0\","
						+"\"rootOpper\":\""+rootFlg+"\","
						+"\"ipAddress\":\""+ip+"\","
						+"\"recordGatewayId\":\""+gatewayId+"\","
						+"\"startDate\":\""+(startDate==null?"null":sf.format(startDate))+"\","
						+"\"busiSys\":\""+PropertiesBean.getInstance().getProperty("conf.system.shortName")+"\","
						+"\"endDate\":\""+(endDate==null?"null":sf.format(endDate))+"\"}"
						);
				
			}
			if(logInfo==null){
				return ;
			}
			logInfo.setLogType("1");
			logInfo.setStartDate(startDate);
			logInfo.setEndDate(endDate);
			if(WebContextHolder.getContext()!=null){
				logInfo.setIpAddress(WebContextHolder.getContext().getIp());
			}

			logger.info(buidJosnLog(logInfo));

		}
	}
	
	private static SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ;
	private static String buidJosnLog(BusinessLog logInfo ){
		String jsonLog = null;
		jsonLog="{\"operDesc\":\""+logInfo.getOperDesc()+"\","
				+"\"accountName\":\""+logInfo.getAccountName()+"\","
				+"\"operSummary\":\""+logInfo.getOperSummary()+"\","
				+"\"startDate\":\""+(logInfo.getStartDate()==null?"null":sf.format(logInfo.getStartDate()))+"\","
				+"\"endDate\":\""+(logInfo.getEndDate()==null?"null":sf.format(logInfo.getEndDate()))+"\","
				+"\"tradeAccount\":\""+logInfo.getTradeAccount()+"\","
				+"\"recordGatewayId\":\""+logInfo.getRecordGatewayId()+"\","
				+"\"logType\":\""+logInfo.getLogType()+"\","
				+"\"ipAddress\":\""+logInfo.getIpAddress()+"\","
				+"\"dealStatus\":\""+logInfo.getDealStatus()+"\","
				+"\"dealMode\":\""+logInfo.getDealMode()+"\","
				+"\"rootOpper\":\""+logInfo.getRootOpper()+"\","
				+"\"busiVersion\":\""+logInfo.getBusiVersion()+"\","
				+"\"busiSys\":\""+PropertiesBean.getInstance().getProperty("conf.system.shortName")+"\""
				+"}";
		//{"operDesc":"增加用户","accountName":"accountName","operSummary":"增加名字为王强的用户",
		//"startDate":"2013-12-26 13:58:02","endDate":"2013-12-26 13:58:02","tradeAccount":"pms:123",
		//"recordGatewayId":"123456","logType":"1","ipAddress":"192.168.1.1","dealStatus":"1",
		//"dealMode":"Sync","busiSys":"pms","rootOpper":"1","busiVersion":"busiVersion"}
	
		return jsonLog;
	}
	/**
	 * 
	 * @param logInfo
	 * @param loginName
	 * @param tradeAccount
	 * @param startDate
	 * @param endDate
	 */
	public static void writeLog(BusinessLog logInfo){
		if(logInfo.getTradeAccount()!=null&&logInfo.getTradeAccount().length()>=72){
			logInfo.setRootOpper("0");
		}else{
			logInfo.setRootOpper("1");
		}
		if(WebContextHolder.getContext()!=null){
			logInfo.setIpAddress(WebContextHolder.getContext().getIp());
		}
		logger.info(buidJosnLog(logInfo));

		
	}
	
//	static class WriteLogThread implements Runnable{
//		BusinessLog logInfo;
//		public WriteLogThread(BusinessLog logInfo){
//			this.logInfo = logInfo;
//		}
//
//
//		@Override
//		public void run() {
//			logger.info("交易号:" + logInfo.getTradeAccount() + " "
//					+ logInfo.getAccountName() + " " + logInfo.getOperSummary()
//					+ " " + logInfo.getOperDesc());
//			if ("true".equals(PropertiesBean.getInstance().getProperty(
//					"conf.writeLog.db"))) {
//			}			
//		}
//	}	
	
	private static String getDeclaringClass(String str) {
		return str.substring(str.lastIndexOf(".") + 1);
	}

	@SuppressWarnings("rawtypes")
	private static  BusinessLog  buildLogInfo(LogConfigure configure, Object[] objs,String userloginName,String tradeAccount,String intercepterInterface){
		//1:orderId=订单编号:loginName=订单用户;2:classId=班级编号:classNumber=班级编号;3:otherInfo=退班原因
		//UserService.findUser
		//1:pageNo="页数":pageSize="每页记录数";2:user.userId="用户id"
		String args = configure.getArgs();
		String[] rules = args.split(";");
		BusinessLog log = new BusinessLog();
		log.setOperDesc(configure.getTitle());
		log.setOperDate(new Date());
		log.setAccountName(userloginName);
		log.setIntercepterInterface(intercepterInterface);
		log.setTradeAccount(tradeAccount);
		StringBuilder detail = new StringBuilder();
		for (int i = 0; i < rules.length; i++) {    
			String rule = rules[i];
			String[] pvs = rule.split(":");
			int index = Integer.parseInt(pvs[0]);
			Object obj = objs[index - 1];
			if(obj!=null){
				if(obj instanceof String){
					String[] pv = pvs[1].split("=");
					detail.append(pv[1] +"="+ obj);
				}else if (obj instanceof Collection) {
					Iterator iter = ((Collection) obj).iterator();
					while (iter.hasNext()) {
						getDetail(iter.next(), pvs,detail,i+1);
					}
				} else {
					getDetail(obj, pvs,detail,i+1);
				}
			}else{
				detail.append(intercepterInterface +" the " +index +" parameter is null");
			}

		}
		log.setOperSummary(detail.toString());
		return log;
	}
	
	private static String getDetail(Object obj, String[] pvs,StringBuilder detail,int paraSeq) {
		//detail.append( "{");
		for (int j = 1; j < pvs.length; j++) {
			String[] pv = pvs[j].split("=");
			String[] propertys = pv[0].split("\\.");
			detail.append(pv[1]).append("=");
			try {
				Object value = obj;
				
				for (int i = 0;i < propertys.length; i++) {
					if(value!=null){
						value = DhccBeanUtils.forceGetProperty(value, propertys[i]);
					}else{
						
					}
					
				}
				detail.append(value);
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
				detail.append(" read property "+pv[0] +" of the "+paraSeq+" parameter  occur ecxeption :" +e.getMessage());
			}
			detail.append(";");
		}
		//detail.append("\n");
		return detail.toString();
	}
	

	@SuppressWarnings("unused")
	private static LogConfigure getConfigure(String method) {

		if (confMap.isEmpty()&&!haveLoadConfig) {
			confMap.clear();
			loadConfigure();
			haveLoadConfig = true;
		}
		return confMap.get(method);
	}

	private static void loadConfigure(){
		try {
			CommonDao commonDao = SpringContextHolder.getBean("commonDao");
			List<LogConfigure> configures = commonDao.getAll(LogConfigure.class, "id", true);
			for (int i = 0; i < configures.size(); i++) {
				LogConfigure configure = configures.get(i);
				confMap.put(configure.getMethod(), configure);
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}
	
	public static void reLoadConfigure(){
		confMap.clear();
		loadConfigure();
	}
	
//	public static void main(String[] args) {
//		BusinessLog log = new BusinessLog();
//		log.setAccountName("accountName");
//		log.setBusiSys("pms");
//		log.setBusiVersion("busiVersion");
//		log.setDealMode("Sync");
//		log.setDealStatus("1");
//		log.setStartDate(new Date());
//		log.setEndDate(new Date());
//		log.setIpAddress("192.168.1.1");
//		log.setLogType("1");
//		log.setOperDesc("增加用户");
//		log.setOperSummary("{增加名字为王强的用户}");
//		log.setRecordGatewayId("123456");
//		log.setRootOpper("1");
//		log.setTradeAccount("pms:123");
//		String ss = JsonUtils.toJson(log);
//		System.out.println(ss);
//		System.out.println("===="+buidJosnLog(log));
//		Map map = JsonUtils.toObject(buidJosnLog(log), Map.class);
//		System.out.println(map);
//		System.out.println(JsonUtils.toJson(map));
//		System.out.println(JsonUtils.toJson(null));
//	}
}
