/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hv.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.hv.HvLabelDao;
import com.dhcc.scm.dto.hv.HvLabelDto;
import com.dhcc.scm.service.hv.HvLabelService;

@Service("hvLabelService")
public class HvLabelServiceImpl implements HvLabelService {

	@Resource
	private HvLabelDao hvLabelDao;
	@Resource
	private CommonService commonService;

	public void list(HvLabelDto dto){

		hvLabelDao.listHvLabel(dto);
	}


}
