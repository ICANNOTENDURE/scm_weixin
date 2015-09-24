package com.dhcc.scm.blh.sys;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.sys.LogDto;
import com.dhcc.scm.service.sys.LogService;


@Component
public class LogBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(LogBlh.class);


	@Resource
	private CommonService commonService;
	
	@Resource
	private LogService logService;
	
	public LogBlh() {
		logger.info("====new LogBlh====");
	}

	public void list(BusinessRequest res) {
		LogDto dto=super.getDto(LogDto.class, res);
		logService.list(dto);
	}

	
}
