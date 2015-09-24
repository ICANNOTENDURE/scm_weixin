package com.dhcc.scm.tool.security;

import java.io.ByteArrayOutputStream;
import java.security.MessageDigest;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.dhcc.framework.exception.DataBaseException;

/**
 * <p>标题: Coder.java</p>
 * <p>业务描述:基础编码组件</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月25日
 * @version V1.0 
 */
public class Coder {
	
	public static final String KEY_SHA = "SHA";
	public static final String KEY_MD5 = "MD5";
	public static final String KEY_MAC = "HmacMD5";
	
	private static String hexString="0123456789ABCDEF";
	
	/**
	 * 
	* 方法名:          stringToHexString
	* 方法功能描述:    将字符串编码成16进制数字,适用于所有字符（包括中文）
	* @param:         字符串
	* @return:        16进制数字字符串
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:14:53
	 */
	public static String stringToHexString(String str)
	{
		// 根据默认编码获取字节数组
		byte[] bytes=str.getBytes();
		StringBuilder sb=new StringBuilder(bytes.length*2);
		// 将字节数组中每个字节拆解成2位16进制整数
		for(int i=0;i<bytes.length;i++){
			sb.append(hexString.charAt((bytes[i]&0xf0)>>4));
			sb.append(hexString.charAt((bytes[i]&0x0f)>>0));
		}
		return sb.toString();
	}
	
	/**
	 * 
	* 方法名:          hexStringToString
	* 方法功能描述:    将16进制数字解码成字符串,适用于所有字符（包括中文）
	* @param:         16进制数字字符串
	* @return:        字符串;
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:16:14
	 */
	public static String hexStringToString(String hexStr){
		ByteArrayOutputStream baos=new ByteArrayOutputStream(hexStr.length()/2);
		// 将每2位16进制整数组装成一个字节
		for(int i=0;i<hexStr.length();i+=2){
			baos.write((hexString.indexOf(hexStr.charAt(i))<<4 |hexString.indexOf(hexStr.charAt(i+1))));
		}
		return new String(baos.toByteArray());
	}
	
	private static char[] base64EncodeChars = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',  
         'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',  
         'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/' };
	
	private static byte[] base64DecodeChars = new byte[] { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  
         -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55,  
         56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,  
         21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46,  
         47, 48, 49, 50, 51, -1, -1, -1, -1, -1 };

	/**
	 * 
	* 方法名:          base64Encode
	* 方法功能描述:    使用Base64编码方式编码字符串
	* @param:         要编码的字符Byte
	* @return:        编码后的字符串
	* @Author:        于鸿
	* @Create Date:   2013年10月10日 下午7:57:48
	 */
	public static String base64Encode(byte[] data){
        StringBuffer sb = new StringBuffer();
        int len = data.length;
        int i = 0;
        int b1, b2, b3;
        while (i < len){
            b1 = data[i++] & 0xff;
            if (i == len){
                sb.append(base64EncodeChars[b1 >>> 2]);
                sb.append(base64EncodeChars[(b1 & 0x3) << 4]);
                sb.append("==");
                break;
            }
            b2 = data[i++] & 0xff;
            if (i == len){  
                sb.append(base64EncodeChars[b1 >>> 2]);
                sb.append(base64EncodeChars[((b1 & 0x03) << 4) | ((b2 & 0xf0) >>> 4)]);
                sb.append(base64EncodeChars[(b2 & 0x0f) << 2]);
                sb.append("=");
                break;
            }
            b3 = data[i++] & 0xff;
            sb.append(base64EncodeChars[b1 >>> 2]);
            sb.append(base64EncodeChars[((b1 & 0x03) << 4) | ((b2 & 0xf0) >>> 4)]);
            sb.append(base64EncodeChars[((b2 & 0x0f) << 2) | ((b3 & 0xc0) >>> 6)]);
            sb.append(base64EncodeChars[b3 & 0x3f]);
        }
        return sb.toString();
    }

	/**
	 * 
	* 方法名:          base64Decode
	* 方法功能描述:    解码Base64编码的字符串
	* @param:         Base64编码的字符串
	* @return:        解码后的字符Byte
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:18:28
	 */
    public static byte[] base64Decode(String str){  
        byte[] data = str.getBytes();
        int len = data.length;
        ByteArrayOutputStream buf = new ByteArrayOutputStream(len);
        int i = 0;
        int b1, b2, b3, b4;
        while (i < len){
            /* b1 */
            do{
                b1 = base64DecodeChars[data[i++]];
            }
            while (i < len && b1 == -1);
            if (b1 == -1){  
                break;  
            }
            /* b2 */  
            do{  
                b2 = base64DecodeChars[data[i++]];
            }
            while (i < len && b2 == -1);
            if (b2 == -1){
                break;
            }
            buf.write((int) ((b1 << 2) | ((b2 & 0x30) >>> 4)));
            /* b3 */  
            do{  
                b3 = data[i++];
                if (b3 == 61){
                    return buf.toByteArray();
                }
                b3 = base64DecodeChars[b3];
            }
            while (i < len && b3 == -1);
            if (b3 == -1){
                break;
            }
            buf.write((int) (((b2 & 0x0f) << 4) | ((b3 & 0x3c) >>> 2)));
            /* b4 */  
            do{
                b4 = data[i++];
                if (b4 == 61){
                    return buf.toByteArray();
                }
                b4 = base64DecodeChars[b4];
            }
            while (i < len && b4 == -1);
            if (b4 == -1){
                break;
            }
            buf.write((int) (((b3 & 0x03) << 6) | b4));
        }
        return buf.toByteArray();
    }

	/**
	 * 
	* 方法名:          md5Digest
	* 方法功能描述:    使用Md5算法生成摘要信息
	* @param:         需要生成摘要信息的字符
	* @return:        生成的摘要信息
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:23:21
	 */
	public static byte[] md5Digest (byte[] data) {
		byte[] b=null;
		try {
			MessageDigest md5 = MessageDigest.getInstance(KEY_MD5);
			md5.update(data);
			b=md5.digest();
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return b;
	}

	/**
	 * 
	* 方法名:          shaDigest
	* 方法功能描述:    使用Sha算法生成摘要信息
	* @param:         需要生成摘要信息的字符
	* @return:        生成的摘要信息
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:26:15
	 */
	public static byte[] shaDigest(byte[] data) {
		byte[] b=null;
		try {
			MessageDigest sha = MessageDigest.getInstance(KEY_SHA);
			sha.update(data);
			b=sha.digest();
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return b;
	}

	/**
	 * 
	* 方法名:          initMacKey
	* 方法功能描述:    初始化HMAC密钥(默认为HmacMD5算法)
	* @param:         无
	* @return:        生成的HMAC密钥
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:28:41
	 */
	public static String initMacKey() {
		String str=new String();
		try{
			KeyGenerator keyGenerator = KeyGenerator.getInstance(KEY_MAC);
			SecretKey secretKey = keyGenerator.generateKey();
			str=base64Encode(secretKey.getEncoded());
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return str;
	}
	
	/**
	 * 
	* 方法名:          initMacKey
	* 方法功能描述:    初始化HMAC密钥
	* @param:         加密算法
	* keyInstance 可以是以下值
	* <pre>
	* HmacMD5
	* HmacSHA1
	* HmacSHA256
	* HmacSHA384
	* HmacSHA512
	* </pre>
	* @return:        生成的HMAC密钥
	* @throws:		  Exception
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:30:19
	 */
	public static String initMacKey(String keyInstance) {
		String str=new String();
		try{
			KeyGenerator keyGenerator = KeyGenerator.getInstance(keyInstance);
			SecretKey secretKey = keyGenerator.generateKey();
			str=base64Encode(secretKey.getEncoded());
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return str;
	}

	/**
	 * 
	* 方法名:          encryptHMAC
	* 方法功能描述:    HMAC加密(默认为HmacMD5算法)
	* @param:         明文字符，密钥
	* @return:        加密后的密文
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:34:49
	 */
	public static byte[] encryptHmac(byte[] data, String key) {
		SecretKey secretKey = new SecretKeySpec(base64Decode(key), KEY_MAC);
		byte[] b=null;
		try{
			Mac mac = Mac.getInstance(secretKey.getAlgorithm());
			mac.init(secretKey);
			b=mac.doFinal(data);
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return b;
	}

	/**
	 * 
	* 方法名:          encryptHMAC
	* 方法功能描述:    HMAC加密
	* @param:         明文字符，密钥，加密算法
	* keyInstance 可以是以下值
	* <pre>
	* HmacMD5
	* HmacSHA1
	* HmacSHA256
	* HmacSHA384
	* HmacSHA512
	* </pre>
	* @return:        加密后的密文
	* @Author:        于鸿
	* @Create Date:   2013年10月9日 下午4:43:30
	 */
	public static byte[] encryptHmac(byte[] data, String key, String keyInstance) {
		SecretKey secretKey = new SecretKeySpec(base64Decode(key), keyInstance);
		byte[] b=null;
		try{
			Mac mac = Mac.getInstance(secretKey.getAlgorithm());
			mac.init(secretKey);
			b=mac.doFinal(data);
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return b;
	}

}
