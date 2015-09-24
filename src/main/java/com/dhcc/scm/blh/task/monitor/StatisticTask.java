package com.dhcc.scm.blh.task.monitor;

import org.apache.commons.mail.EmailException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.dhcc.framework.util.SendMailUtil;

public class StatisticTask implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		try {
			SendMailUtil.sendEmail("新疆欢迎你", "来新疆吃抓饭", "228460078@qq.com", 60 * 1000);
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

}
