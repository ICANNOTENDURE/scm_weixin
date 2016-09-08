/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.QrCodeUtil;
import com.dhcc.scm.dto.sys.QrCodeDto;
import com.dhcc.scm.entity.vo.mobile.QrCode;
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
		if(StringUtils.isNotBlank(dto.getCode128())){
			QrCodeUtil.CODE128(dto.getContent());
		}else{
			QrCode code=new QrCode(dto.getContent(), dto.getCodeType(),dto.getSeq());
			QrCodeUtil.QrCode(JsonUtils.toJson(code),false);
		}

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
		QrCode code=new QrCode(dto.getContent(), dto.getCodeType(),dto.getSeq());
		QrCodeUtil.QrCode(JsonUtils.toJson(code),true);
	}
	
	public void hvAndroid(BusinessRequest res) throws IOException, WriterException{
		QrCodeDto dto=super.getDto(QrCodeDto.class, res);
		QrCodeUtil.QrCode(dto.getContent(),false);
	}
	
}
