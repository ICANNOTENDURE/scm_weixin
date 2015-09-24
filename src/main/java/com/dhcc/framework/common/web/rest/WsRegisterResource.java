package com.dhcc.framework.common.web.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.common.config.SpringSetupContextHolder;
import com.dhcc.framework.common.vo.ServiceReleaseVo;
import com.dhcc.framework.common.ws.WsRegisterService;

@Component
@Path("/wsmgr")
public class WsRegisterResource {

	private static Log logger = LogFactory.getLog(WsRegisterResource.class);
	
	@POST
	@Path("/register")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON})
	public String register(List<ServiceReleaseVo> serverInfo){
		try {
			WsRegisterService wrs = SpringSetupContextHolder.getBean("wsRegisterService");
			wrs.registerService(serverInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return e.getMessage();
		}
		return "success";
		
	}
	
}
