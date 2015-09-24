package com.dhcc.framework.common.quartz.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.framework.common.quartz.AbstractAgentJob;
import com.dhcc.framework.common.quartz.JobResult;
import com.dhcc.framework.common.quartz.TaskContext;
import com.dhcc.framework.transmission.dto.Response;

/**
 * 数据字曲公共服务类 类
 * 
 * @author liuyg
 * @version 0.5
 * @since 2013-08-17
 */
@Component
@Path("/schedule/agent")
public class QuartzBusinessResource {

	private static Log logger = LogFactory.getLog(QuartzBusinessResource.class);

	@POST
	@Path("/runJob")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON })
	public Response<JobResult> doJob(TaskContext taskContext) {
		AbstractAgentJob agent = SpringContextHolder.getBean("dhccAgentJob");
		Response<JobResult> rest = new Response<JobResult>();
		logger.info("start run schedule ======taskId:"+taskContext.getTaskId());
		try {
			
			agent.runJob(taskContext);
			rest.setOpFlg("1");
		} catch (Exception e) {
			rest.setOpFlg("0");
			rest.setMsg(e.getMessage() == null ? "unknow exception " : e
					.getMessage());
			logger.error(
					taskContext.getJobDesc() + " error :" + e.getMessage(), e);
		}
		logger.info("finish run schedule ======taskId:"+taskContext.getTaskId());
		return rest;
	}
}
