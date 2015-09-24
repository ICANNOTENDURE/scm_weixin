package com.dhcc.scm.blh.common.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.service.AuthorityInterface;
import com.dhcc.scm.dto.userManage.FuncDto;
import com.dhcc.scm.entity.userManage.Func;



@Component("authorityInterface")
public class AuthorityInterfaceImpl implements AuthorityInterface{
	
	private static Log logger = LogFactory.getLog(AuthorityInterfaceImpl.class);
	
	@Resource
	private CommonService commonService;
	
	@Override
	public Set<String> getNeedCheckUrls(String systemType) {
		Set<String> needCheckUrls=new HashSet<String>();
		FuncDto dto = new FuncDto();
		dto.setSystemType(systemType);
//		Response<Func>  response = null;
		try {
			//response =PmsApiResourceClient.funcCtrlGetFuncListBySystemType(dto);
			
			List<Func> funcs=commonService.getAll(Func.class, "funcId",true);
			for(Func tmp:funcs){
				needCheckUrls.add(tmp.getSecutiryUrl());
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("can not load security url ",e);
		}
//		if(response!=null&&response.getPageData()!=null){
//			for(Func func :response.getPageData()){
//				needCheckUrls.add(func.getSecutiryUrl());
//			}
//			needCheckUrls.remove(null);
//			needCheckUrls.remove("");
//		}
		needCheckUrls.remove(null);
		needCheckUrls.remove("");
		return needCheckUrls;
	}

}
