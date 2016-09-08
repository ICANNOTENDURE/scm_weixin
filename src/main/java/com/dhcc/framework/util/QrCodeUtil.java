package com.dhcc.framework.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.tool.security.AESCoder;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

public final class QrCodeUtil {
	
	
	/**
	 * 
	* @Title: QrCode 
	* @Description: TODO(生成二维码) 
	* @param @param content
	* 				二维码内容
	* @param @param encryptFlag
	* 				是否加密:true()
	* @param @throws IOException
	* @param @throws WriterException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年10月23日 下午5:11:32
	 */
	public static void QrCode(String content,boolean encryptFlag) throws IOException, WriterException {
		
		if(encryptFlag){
			String servicePassword = PropertiesBean.getInstance().getProperty("confg.serviceKey");
			content = AESCoder.aesCbcEncrypt(content, servicePassword);
		}
		int width = 300; // 图像宽度
		int height = 300; // 图像高度
		String format = "png";// 图像类型
		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);// 生成矩阵
		MatrixToImageWriter.writeToStream(bitMatrix, format, WebContextHolder.getContext().getResponse().getOutputStream());
	}
	
	/**
	 * 
	* @Title: CODE128 
	* @Description: TODO(一维码) 
	* @param @param content
	* @param @throws IOException
	* @param @throws WriterException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年9月8日 下午3:40:35
	 */
	public static void CODE128(String content) throws IOException, WriterException {
		

		int width = 200; // 图像宽度
		int height = 100; // 图像高度
		String format = "png";// 图像类型
		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.CODE_128, width, height, hints);// 生成矩阵
		MatrixToImageWriter.writeToStream(bitMatrix, format, WebContextHolder.getContext().getResponse().getOutputStream());
	
	}
	public static void DcoderQrCode(String path) {

	}

}