package com.dhcc.framework.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.tool.security.AESCoder;
import com.swetake.util.Qrcode;

public final class QrCodeUtil {	
	
	
	
	public static void EncoderQrCode(String content) throws IOException {
		Qrcode qrcode = new Qrcode();  
        qrcode.setQrcodeErrorCorrect('M');  
        qrcode.setQrcodeEncodeMode('B');  
        qrcode.setQrcodeVersion(7);  
//        if(content == null || !content.equals("")){
//        	content = "DHCC";
//        }
        String servicePassword=PropertiesBean.getInstance().getProperty("confg.serviceKey");
        content=AESCoder.aesCbcEncrypt(content, servicePassword);
        byte[] bstr = content.getBytes("UTF-8");  
        BufferedImage bi = new BufferedImage(139, 139,BufferedImage.TYPE_INT_RGB);  
        Graphics2D g = bi.createGraphics();  
        g.setBackground(Color.WHITE);   //
        g.clearRect(0, 0, 139, 139);  
        g.setColor(Color.BLACK);    //
        if (bstr.length > 0 && bstr.length < 123) {  
            boolean[][] b = qrcode.calQrcode(bstr);  
            for (int i = 0; i < b.length; i++) {  
                for (int j = 0; j < b.length; j++) {  
                    if (b[j][i]) {  
                        g.fillRect(j * 3 + 2, i * 3 + 2, 3, 3);  
                    }  
                }  
  
            }  
        }  
        g.dispose();  
        bi.flush();   
		WebContextHolder.getContext().getResponse().setContentType("image/png");
	    ImageIO.write(bi, "png",  WebContextHolder.getContext().getResponse().getOutputStream());
	}
	
	public static void DcoderQrCode(String path){
		
	}

}