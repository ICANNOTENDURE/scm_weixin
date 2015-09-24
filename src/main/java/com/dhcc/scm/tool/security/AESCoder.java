package com.dhcc.scm.tool.security;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.dhcc.framework.exception.DataBaseException;

/**
 * <p>标题: AESCoder.java</p>
 * <p>业务描述:AES安全编码组件</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月25日
 * @version V1.0
 * 
 */
public class AESCoder extends Coder {

    /**
     * 
    * 方法名:          aesEncrypt
    * 方法功能描述:    AES加密。( CBC模式、ZeroPadding填充、128位密钥。password的Md5值前16bit作为key，后16bit作为iv )
    * @param:         明文，密码
    * @return:        Base64编码的密文
    * @Author:        于鸿
    * @Create Date:   2013年10月9日 下午5:32:38
     */
    public static String aesCbcEncrypt(String data, String password) {
    	Cipher cipher = getCipher(password,Cipher.ENCRYPT_MODE);
    	
    	// ZeroPadding
    	int blockSize = cipher.getBlockSize();
		byte[] plaintext = zeroPad(data.getBytes(),blockSize);
		byte[] encryptText=null;
		try {
			// 加密
			encryptText=cipher.doFinal(plaintext);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        String encryptedStr = base64Encode(encryptText);
        return encryptedStr;
	}
    
    /**
     * 
    * 方法名:          aesEncrypt
    * 方法功能描述:    AES加密。( CBC模式、ZeroPadding填充、128位密钥。password的Md5值前16bit作为key，后16bit作为iv )
    * @param:         明文，密码，加密前处理方式(0:不处理；1:URLEncoder使用UTF-8格式编码)
    * @return:        Base64编码的密文
    * @Author:		      于鸿
    * @Create Date:   2013年11月11日 下午2:25:15
     */
    public static String aesCbcEncrypt(String data, String password,String encode) {
    	Cipher cipher = getCipher(password,Cipher.ENCRYPT_MODE);
    	
    	// ZeroPadding
    	int blockSize = cipher.getBlockSize();
    	byte[] databyte=null;
    	if (encode.equals("1")) {
    		try {
				data = URLEncoder.encode(data, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				throw new DataBaseException(e.getMessage(), e);
			}
		}
		databyte=data.getBytes();

		byte[] plaintext = zeroPad(databyte,blockSize);
		byte[] encryptText=null;
		try {
			// 加密
			encryptText=cipher.doFinal(plaintext);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        String encryptedStr = base64Encode(encryptText);
        return encryptedStr;
	}
    
    /**
     * 
    * 方法名:          aesDecrypt
    * 方法功能描述:    AES解密
    * @param:         Base64编码的密文，密码
    * @return:        明文
    * @Author:        于鸿
    * @Create Date:   2013年10月9日 下午7:00:46
     */
    public static String aesCbcDecrypt(String data, String password) {
    	Cipher cipher = getCipher(password,Cipher.DECRYPT_MODE);

    	byte[] dataByte = base64Decode(data);
    	byte[] plaintext = null;
    	try{
	    	// 解密
	    	plaintext = cipher.doFinal(dataByte);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
    	// ZeroUnPadding
    	byte[] unpad=zeroUnPad(plaintext);
    	String decryptStr=new String(unpad);
        return decryptStr;
    }
    
    /**
     * 
    * 方法名:          aesDecrypt
    * 方法功能描述:    AES解密
    * @param:         Base64编码的密文，密码，解密后处理方式(0:不处理；1:URLDecoder使用UTF-8格式解码)
    * @return:        明文
    * @Author:		     于鸿
    * @Create Date:   2013年11月11日 下午2:25:58
     */
    public static String aesCbcDecrypt(String data, String password,String encode) {
    	Cipher cipher = getCipher(password,Cipher.DECRYPT_MODE);
    	byte[] dataByte = base64Decode(data);
    	byte[] plaintext = null;
    	try{
	    	// 解密
	    	plaintext = cipher.doFinal(dataByte);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
    	// ZeroUnPadding
    	byte[] unpad=zeroUnPad(plaintext);
    	
    	String decryptStr=new String(unpad);
    	if (encode.equals("1")) {
    		try {
    			decryptStr = URLDecoder.decode(decryptStr, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				throw new DataBaseException(e.getMessage(), e);
			}
		}
        return decryptStr;
    }
    
    /**
     * 
    * 方法名:          getCipher
    * 方法功能描述:    获取Cipher对象
    * @param:         密码，模式
    * @return:        Cipher对象
    * @Author:        于鸿
    * @Create Date:   2013年10月9日 下午6:57:39
     */
    private static Cipher getCipher(String password,int mode) {
    	byte[] passwordByte=Coder.md5Digest(password.getBytes());
    	BigInteger passwordBigInteger = new BigInteger(1, passwordByte);
        String passwordMd5Str = passwordBigInteger.toString(16);
        
        String key=passwordMd5Str.substring(0, 16);
		String iv = passwordMd5Str.substring(16, 32);
		
		SecretKey secretKey = new SecretKeySpec(key.getBytes(), "AES");
		IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());
		Cipher cipher=null;
		try{
			cipher = Cipher.getInstance("AES/CBC/NoPadding");
			cipher.init(mode, secretKey, ivspec);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return cipher;
    }

    /**
     * 
    * 方法名:          zeroPad
    * 方法功能描述:    用nul填充字节
    * @param:         字节数组，块长度
    * @return:        填充后的字节数组
    * @Author:        于鸿
    * @Create Date:   2013年10月9日 下午6:50:27
     */
    private static byte[] zeroPad(byte[] dataBytes,int blockSize) {
		int plaintextLength = dataBytes.length;
		if (plaintextLength % blockSize != 0) {
			plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
		}
		byte[] plaintext = new byte[plaintextLength];
		System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
    	return plaintext;
    }
    
    /**
     * 
    * 方法名:          zeroUnPad
    * 方法功能描述:    去掉填充的字节
    * @param:         字节数组
    * @return:        去掉填充的nul的字节数组
    * @Author:        于鸿
    * @Create Date:   2013年10月9日 下午6:54:35
     */
    private static byte[] zeroUnPad(byte[] dataBytes) {
    	int i = dataBytes.length - 1;
        while ((dataBytes[i] & 0xff)==0) {
            i--;
        }
        int length = i + 1;
        byte[] plaintext = new byte[length];
		System.arraycopy(dataBytes, 0, plaintext, 0, length);
    	return plaintext;
    }
}
