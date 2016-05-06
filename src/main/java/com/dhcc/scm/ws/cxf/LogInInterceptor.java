package com.dhcc.scm.ws.cxf;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.AbstractPhaseInterceptor;
import org.apache.cxf.phase.Phase;

import com.dhcc.framework.app.service.CommonService;

public class LogInInterceptor extends AbstractPhaseInterceptor<Message> {

	@Resource
	private CommonService commonService;

	private static Log logger = LogFactory.getLog(LogInInterceptor.class);

	public LogInInterceptor(String phase) {
		super(phase);
	}

	public LogInInterceptor() {
		super(Phase.RECEIVE);
	}

	public void handleMessage(Message message) throws Fault {
		message.getExchange();
		logger.info("############handleMessage##########");
		 logger.info(message);
	        if (message.getDestination() != null) {
	        	logger.info(message.getId() + "#" + message.getDestination().getMessageObserver());
	        }
	        if (message.getExchange() != null) {
	        	//logger.info(message.getExchange().getInMessage() + "#" + message.getExchange().getInFaultMessage().values());
	           logger.info(message.getExchange().getOutMessage() + "#" + message.getExchange().getOutFaultMessage());
	        }
		System.out.println(1);
	}

}
