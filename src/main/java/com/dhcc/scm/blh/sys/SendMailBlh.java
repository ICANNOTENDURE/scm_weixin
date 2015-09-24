/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import org.apache.commons.mail.EmailException;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.SendMailUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.sys.SendMailDto;


@Component
public class SendMailBlh extends AbstractBaseBlh {



	
	public SendMailBlh() {
		
	}
	
	
	public void send(BusinessRequest res){
		
		SendMailDto dto=super.getDto(SendMailDto.class, res);
		try {
			if(!StringUtils.isNullOrEmpty(dto.getRecUser())){
				SendMailUtil.sendEmail(dto.getSub(), dto.getContent(),dto.getRecUser(),60 * 1000);
			}
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
	
}
