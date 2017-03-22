/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.dhcc.scm.dao.ord.PutShippSumDao;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.dto.ord.PutShippSumDto;
import com.dhcc.scm.service.ord.PutShippSumService;

@Service("PutShippSumService")
public class PutShippSumServiceImpl implements PutShippSumService {

	@Resource
	private PutShippSumDao PutShippSumDao;
	@Resource
	private CommonService commonService;

	public void list(PutShippSumDto dto){

		PutShippSumDao.listPutShippSum(dto);
	}
	
	public void listDeliverItm(PutShippSumDto dto) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		PutShippSumDao.listDeliverItm(dto);
	}


}
