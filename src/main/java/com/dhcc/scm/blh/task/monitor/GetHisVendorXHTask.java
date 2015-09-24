package com.dhcc.scm.blh.task.monitor;

import org.quartz.Job;
import org.quartz.JobExecutionContext;

import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.scm.blh.hop.HopVendorBlh;

public class GetHisVendorXHTask implements Job{


	
	@Override
	public void execute(JobExecutionContext arg0)  {
		HopVendorBlh hopCtlocBlh = SpringContextHolder.getBean("hopVendorBlh");
		hopCtlocBlh.GetHisVendorXHWS();
	}

}
