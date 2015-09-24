package com.dhcc.scm.blh.task.monitor;

import org.quartz.Job;
import org.quartz.JobExecutionContext;

import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.scm.blh.hop.HopCtlocBlh;

public class GetHisLocXHTask2 implements Job{


	
	@Override
	public void execute(JobExecutionContext arg0)  {
		HopCtlocBlh hopCtlocBlh = SpringContextHolder.getBean("hopCtlocBlh");
		hopCtlocBlh.getLoc2();
	}

}
