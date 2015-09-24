package com.dhcc.scm.tool.security;

import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import com.dhcc.framework.exception.DataBaseException;

/**
 * <p>标题: RSACoder.java</p>
 * <p>业务描述:RSA安全编码组件</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月25日
 * @version V1.0 
 */
public class RSACoder extends Coder{

	public static final String KEY_ALGORITHM = "RSA";
	public static final String SIGNATURE_ALGORITHM = "MD5withRSA";

	private static final String PUBLIC_KEY = "RSAPublicKey";
	private static final String PRIVATE_KEY = "RSAPrivateKey";
	
	/**
	 * 
	* 方法名:		sign
	* 方法功能描述:	用私钥对信息生成数字签名
	* @param:		加密数据,私钥
	* @return:		签名后的数据
	* @Author:		于鸿
	* @Create Date:   2013年11月20日 下午5:13:22
	 */
	public static String sign(byte[] data, PrivateKey privateKey) {
        String signStr="";
        try{
	        // 用私钥对信息生成数字签名
	        Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
	        signature.initSign(privateKey);
	        signature.update(data);
	        signStr=base64Encode(signature.sign());
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return signStr;
    }
	/**
	 * 
	* 方法名:		sign
	* 方法功能描述:	用私钥对信息生成数字签名
	* @param:		数据,私钥字符串
	* @return:		签名后的数据
	* @Author:		于鸿
	* @Create Date:   2013年11月20日 下午5:14:37
	 */
	public static String sign(byte[] data, String privateKey) {
		// 解密由base64编码的私钥
        byte[] keyBytes = base64Decode(privateKey);
        // 构造PKCS8EncodedKeySpec对象
        PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
        String signStr="";
        try{
	        // KEY_ALGORITHM 指定的加密算法
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	
	        // 取私钥匙对象
	        PrivateKey priKey = keyFactory.generatePrivate(pkcs8KeySpec);
	
	        // 用私钥对信息生成数字签名
	        Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
	        signature.initSign(priKey);
	        signature.update(data);
	        signStr=base64Encode(signature.sign());
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return signStr;
    }

	/**
	 * 
	* 方法名:		verify
	* 方法功能描述:	校验数字签名
	* @param:		数据 ,公钥 ,签名后的数据
	* @return:		校验成功返回true 失败返回false
	* @Author:		于鸿
	* @Create Date:   2013年11月20日 下午5:15:25
	 */
	public static boolean verify(byte[] data, PublicKey publicKey, String sign) {
        boolean verify=false;
        try{
	        Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
	        signature.initVerify(publicKey);
	        signature.update(data);
	        // 验证签名是否正常
	        verify=signature.verify(base64Decode(sign));
        } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return verify;
    }
    /**
     * 
    * 方法名:		verify
	* 方法功能描述:	校验数字签名
	* @param:		数据 ,公钥字符串 ,签名后的数据
	* @return:		校验成功返回true 失败返回false
	* @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:16:35
     */
    public static boolean verify(byte[] data, String publicKey, String sign) {
        // 解密由base64编码的公钥
        byte[] keyBytes = base64Decode(publicKey);

        // 构造X509EncodedKeySpec对象
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);

        boolean verify=false;
        try{
	        // KEY_ALGORITHM 指定的加密算法
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	
	        // 取公钥匙对象
	        PublicKey pubKey = keyFactory.generatePublic(keySpec);
	
	        Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
	        signature.initVerify(pubKey);
	        signature.update(data);
	        // 验证签名是否正常
	        verify=signature.verify(base64Decode(sign));
        } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return verify;
    }

    /**
     * 
    * 方法名:		decryptByPrivateKey
    * 方法功能描述:	用私钥解密 
    * @param:		用公钥加密的数据，私钥
    * @return:		解密后的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:21:07
     */
    public static byte[] decryptByPrivateKey(String dataStr, Key key) {
        byte[] decrypt=null;
        try{
	        // 对数据解密
	        Cipher cipher = Cipher.getInstance(KEY_ALGORITHM);
	        cipher.init(Cipher.DECRYPT_MODE, key);
	        byte[] data=base64Decode(dataStr);
	        decrypt=cipher.doFinal(data);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return decrypt;
    }
    /**
     * 
    * 方法名:		decryptByPrivateKey
    * 方法功能描述:	用私钥解密 
    * @param:		用公钥加密的数据，私钥字符串
    * @return:		解密后的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:21:54
     */
    public static byte[] decryptByPrivateKey(String dataStr, String key) {
        // 对密钥解密
        byte[] keyBytes = base64Decode(key);
        // 取得私钥
        PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
        byte[] decrypt=null;
        try{
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	        Key privateKey = keyFactory.generatePrivate(pkcs8KeySpec);
	        // 对数据解密
	        Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
	        cipher.init(Cipher.DECRYPT_MODE, privateKey);
	        byte[] data=base64Decode(dataStr);
	        decrypt=cipher.doFinal(data);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return decrypt;
    }

    /**
     * 
    * 方法名:		decryptByPublicKey
    * 方法功能描述:	用公钥解密 
    * @param:		用私钥加密的数据，私钥
    * @return:		解密后的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:23:01
     */
    public static byte[] decryptByPublicKey(String dataStr, Key key) {
        byte[] decrypt=null;
        try{
	        // 对数据解密
	        Cipher cipher = Cipher.getInstance(KEY_ALGORITHM);
	        cipher.init(Cipher.DECRYPT_MODE, key);
	        byte[] data=base64Decode(dataStr);
	        decrypt=cipher.doFinal(data);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return decrypt;
    }
    /**
     * 
    * 方法名:		decryptByPublicKey
    * 方法功能描述:	用公钥解密 
    * @param:		用私钥加密的数据，私钥字符串
    * @return:		解密后的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:24:12
     */
    public static byte[] decryptByPublicKey(String dataStr, String key) {
        // 对密钥解密
        byte[] keyBytes = base64Decode(key);
        // 取得公钥
        X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(keyBytes);
        byte[] decrypt=null;
        try{
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	        Key publicKey = keyFactory.generatePublic(x509KeySpec);
	  
	        // 对数据解密
	        Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
	        cipher.init(Cipher.DECRYPT_MODE, publicKey);
	        byte[] data=base64Decode(dataStr);
	        decrypt=cipher.doFinal(data);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return decrypt;
    }

    /**
     * 
    * 方法名:		encryptByPublicKey
    * 方法功能描述:	用公钥加密数据
    * @param:		需要加密的数据，公钥
    * @return:		用公钥加密的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:25:08
     */
    public static String encryptByPublicKey(byte[] data, Key key) {
        String encryptStr=null;
        try{
	        // 对数据加密
	        Cipher cipher = Cipher.getInstance(KEY_ALGORITHM);
	        cipher.init(Cipher.ENCRYPT_MODE, key);
	        byte[] encrypt=cipher.doFinal(data);
	        encryptStr=base64Encode(encrypt);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return encryptStr;
    }
    /**
     * 
    * 方法名:		encryptByPublicKey
    * 方法功能描述:	用公钥加密数据
    * @param:		需要加密的数据，公钥字符串
    * @return:		用公钥加密的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:26:25
     */
    public static String encryptByPublicKey(byte[] data, String key) {
        // 对公钥解密
        byte[] keyBytes = base64Decode(key);
        // 取得公钥
        X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(keyBytes);
        String encryptStr=null;
        try{
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	        Key publicKey = keyFactory.generatePublic(x509KeySpec);
	        // 对数据加密
	        Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
	        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
	        byte[] encrypt=cipher.doFinal(data);
	        encryptStr=base64Encode(encrypt);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return encryptStr;
    }

    /**
     * 
    * 方法名:		encryptByPrivateKey
    * 方法功能描述:	用私钥加密数据
    * @param:		需要加密的数据，私钥
    * @return:		用私钥加密的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:27:29
     */
    public static String encryptByPrivateKey(byte[] data, Key key) {        
        String encryptStr=null;
        try{
	        // 对数据加密
	        Cipher cipher = Cipher.getInstance(KEY_ALGORITHM);
	        cipher.init(Cipher.ENCRYPT_MODE, key);
	        byte[] encrypt=cipher.doFinal(data);
	        encryptStr=base64Encode(encrypt);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return encryptStr;
    }
    /**
     * 
    * 方法名:		encryptByPrivateKey
    * 方法功能描述:	用私钥加密数据
    * @param:		需要加密的数据，私钥字符串
    * @return:		用私钥加密的数据
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:27:55
     */
    public static String encryptByPrivateKey(byte[] data, String key) {
        // 对密钥解密
        byte[] keyBytes = base64Decode(key);
  
        // 取得私钥
        PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
        String encryptStr=null;
        try{
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	        Key privateKey = keyFactory.generatePrivate(pkcs8KeySpec);
	  
	        // 对数据加密
	        Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
	        cipher.init(Cipher.ENCRYPT_MODE, privateKey);
	        byte[] encrypt=cipher.doFinal(data);
	        encryptStr=base64Encode(encrypt);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return encryptStr;
    }


    /**
     * 
    * 方法名:		getPrivateKey
    * 方法功能描述:	取得私钥
    * @param:		keyMap
    * @return:		base64Encode编码的私钥字符串
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:33:32
     */
    public static String getPrivateKey(Map<String, Object> keyMap) {
        Key key = (Key) keyMap.get(PRIVATE_KEY);
        return base64Encode(key.getEncoded());
    }
    
    /**
     * 
    * 方法名:		getPublicKey
    * 方法功能描述:	取得公钥
    * @param:		keyMap
    * @return:		base64Encode编码的公钥字符串
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:34:17
     */
    public static String getPublicKey(Map<String, Object> keyMap) {   
        Key key = (Key) keyMap.get(PUBLIC_KEY);
        return base64Encode(key.getEncoded());
    }

    /**
     * 
    * 方法名:		initKey
    * 方法功能描述:	初始化密钥  
    * @param:		无
    * @return:		keyMap
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:34:44
     */
    public static Map<String, Object> initKey() {
    	Map<String, Object> keyMap =new HashMap<String, Object>();
    	try{
	        KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance(KEY_ALGORITHM);
	        keyPairGen.initialize(1024);
	        KeyPair keyPair = keyPairGen.generateKeyPair();
	
	        // 公钥
	        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
	        // 私钥
	        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
	
	        keyMap = new HashMap<String, Object>(2);
	        keyMap.put(PUBLIC_KEY, publicKey);
	        keyMap.put(PRIVATE_KEY, privateKey);
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return keyMap;
    }
    
    /**
     * 
    * 方法名:		initKeyPair
    * 方法功能描述:	初始化密钥  
    * @param:		无
    * @return:		KeyPair
    * @Author:		于鸿
    * @Create Date:   2013年11月20日 下午5:35:35
     */
    public static KeyPair initKeyPair() {
    	KeyPair keyPair=null;
    	try{
	        KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance(KEY_ALGORITHM);
	        keyPairGen.initialize(1024);
	        keyPair = keyPairGen.generateKeyPair();
	    } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return keyPair;
    }

}
