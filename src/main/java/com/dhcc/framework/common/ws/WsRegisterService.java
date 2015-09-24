package com.dhcc.framework.common.ws;

import java.util.List;

import com.dhcc.framework.common.vo.ServiceReleaseVo;

public interface WsRegisterService {

	public boolean registerService(List<ServiceReleaseVo> serverInfo);
	
	
}
