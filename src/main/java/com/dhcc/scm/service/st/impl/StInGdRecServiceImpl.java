/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.st.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.scm.dao.st.StInGdRecDao;
import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.dto.weixin.MpInGdRecDto;
import com.dhcc.scm.service.st.StInGdRecService;

@Service("stInGdRecService")
public class StInGdRecServiceImpl implements StInGdRecService {

	@Resource
	private StInGdRecDao stInGdRecDao;

	@Override
	public void mpInGdRec(StInGdRecDto dto) {
		
		stInGdRecDao.mpInGdRec(dto);
	}

	@Override
	public void listInGdRec(MpInGdRecDto dto) {
		// TODO Auto-generated method stub
		stInGdRecDao.listInGdRec(dto);
	}

}
