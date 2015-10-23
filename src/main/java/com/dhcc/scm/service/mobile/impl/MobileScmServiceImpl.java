/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.mobile.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.scm.dao.mobile.MobileScmDao;
import com.dhcc.scm.service.mobile.MobileScmService;
import com.google.gson.JsonObject;

@Service("mobileScmService")
public class MobileScmServiceImpl implements MobileScmService {
	
	@Resource
	private MobileScmDao mobileScmDao;
	
	@Override
	public void cmpInGdRec(JsonObject jsonObject) {
		mobileScmDao.cmpOrderDetail(jsonObject);
	}


}
