/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import java.io.IOException;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.QrCodeUtil;
import com.dhcc.scm.dto.sys.QrCodeDto;


@Component
public class QrCodeBlh extends AbstractBaseBlh {



	
	public QrCodeBlh() {
		
	}
	
	
	/**
	 * 
	* @Title: QrCodeBlh.java
	* @Description: TODO(生成二维码)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月27日 上午10:51:40
	* @version V1.0
	 */
	public void encoderQrAndroid(BusinessRequest res) throws IOException{
		
		QrCodeDto dto=super.getDto(QrCodeDto.class, res);
		QrCodeUtil.EncoderQrCode(dto.getContent());
	}
	
}
