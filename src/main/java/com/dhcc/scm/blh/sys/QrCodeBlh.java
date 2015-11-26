/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import java.io.IOException;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.QrCodeUtil;
import com.dhcc.scm.dto.sys.QrCodeDto;
import com.google.zxing.WriterException;


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
	 * @throws WriterException 
	 */
	public void qrAndroid(BusinessRequest res) throws IOException, WriterException{
		QrCodeDto dto=super.getDto(QrCodeDto.class, res);
		QrCodeUtil.QrCode(JsonUtils.toJson(dto),false);
	}
	/**
	 * 
	* @Title: encoderQrAndroid 
	* @Description: TODO(生成加密的二维码) 
	* @param @param res
	* @param @throws IOException
	* @param @throws WriterException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年10月23日 下午5:13:30
	 */
	public void encoderQrAndroid(BusinessRequest res) throws IOException, WriterException{
		QrCodeDto dto=super.getDto(QrCodeDto.class, res);
		QrCodeUtil.QrCode(JsonUtils.toJson(dto),true);
	}
}
