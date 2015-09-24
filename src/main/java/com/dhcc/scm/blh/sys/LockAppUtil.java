package com.dhcc.scm.blh.sys;

import java.util.Date;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.entity.sys.SysAppNo;
import com.dhcc.scm.tool.datetime.OperTime;
@Component
public class LockAppUtil{
	
	final ReentrantLock lock = new ReentrantLock(); 
	
	@Resource
	private CommonService commonService;
	
	/**
	 * 
	* @Title: GetAppNo 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param pre
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月23日 上午9:59:14
	 */
	public  String GetAppNo(String pre){
		  StringBuilder appNo=new StringBuilder();
		  assert !lock.isHeldByCurrentThread();  
	      lock.lock();  
	      try { 
	    	  SysAppNo sysAppNo;
	    	  String[] propertyNames={"appPre","appDate"};
	    	  Object[] values={pre,new Date()};
	    	  List<SysAppNo> sysAppNos=commonService.findByProperties(SysAppNo.class, propertyNames, values);
	    	  if(sysAppNos.size()==0){
	    		  sysAppNo=new SysAppNo();
	    		  sysAppNo.setAppPre(pre);
	    		  sysAppNo.setAppCount(0l);
	    		  sysAppNo.setAppDate(new Date());
	    		  commonService.saveOrUpdate(sysAppNo);
	    	  }else{
	    		  sysAppNo=sysAppNos.get(0);
	    	  }
	    	  sysAppNo.setAppCount(sysAppNo.getAppCount()+1l);
	    	  commonService.saveOrUpdate(sysAppNo);
	    	  long currNo=sysAppNo.getAppCount();
	    	  appNo=appNo.append(pre).append(OperTime.getCurrentDate().replaceAll("-","")).append(currNo);
	      } finally {  
	          lock.unlock();  
	      }  
		
		return appNo.toString();
	}

}
