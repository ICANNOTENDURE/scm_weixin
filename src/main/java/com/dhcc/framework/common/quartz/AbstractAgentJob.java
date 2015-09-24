package com.dhcc.framework.common.quartz;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.common.config.PropertiesBean;
import com.fasterxml.jackson.jaxrs.json.JacksonJaxbJsonProvider;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;


public abstract class AbstractAgentJob {
	
	private static Client client = null;
	private static Log logger = LogFactory.getLog(AbstractAgentJob.class);
	
	static {
		ClientConfig config = new DefaultClientConfig();
		config.getClasses().add(JacksonJaxbJsonProvider.class);
		client = Client.create(config);
	}
	
	public void runJob(TaskContext taskContext) {
		RunJobThread rt = new RunJobThread(taskContext);
		Thread th = new Thread(rt);
		th.start();
	}
	private static WebResource webResource = null;
	public abstract JobResult  doJob(TaskContext taskContext);

	public static void reportResult(JobResult jobResult) {
		String addressKey = "conf.quartz.address";
		String reportHost =PropertiesBean.getInstance().getProperty(addressKey);
		if(reportHost==null){
			logger.error("conf.quartz.address is null so cont't report job execute result ");
			return;
		}
		ClientResponse rest = null;
		try {
			if(webResource==null){
				String accessUrl =reportHost+"/dhccApi/pubSchedule/report/result";
				webResource = client.resource(UriBuilder.fromUri(accessUrl).build());
			}
			rest = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(ClientResponse.class,jobResult);
		} catch (UniformInterfaceException e) {
			logger.error("occur error when report job result taskId :"+jobResult.getTaskId() +"  " +e.getMessage(),e);
		} catch (ClientHandlerException e) {
			logger.error("occur error when report job result taskId :"+jobResult.getTaskId() +"  "+e.getMessage(),e);
		}catch (Throwable e) {
			logger.error("occur error when report job result taskId :"+jobResult.getTaskId() +"  "+e.getMessage(),e);
		}
		if(rest!=null){
			if(rest.getStatus()!=200){
				logger.error("response code :"+rest.getStatus() +" "+ rest.getEntity(String.class));
			}else{
				logger.info("response code :"+rest.getStatus() +" "+ rest.getEntity(String.class));
			}
		}
	}
	
	class RunJobThread implements Runnable{
		TaskContext taskContext;
		public RunJobThread(TaskContext taskContext){
			this.taskContext = taskContext;
		}
		public void run() {
			JobResult jobResult = doJob(this.taskContext);
			reportResult(jobResult);
		}
	}
}
