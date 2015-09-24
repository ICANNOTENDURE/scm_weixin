package com.dhcc.scm.tool.security;

import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.interfaces.DSAPrivateKey;
import java.security.interfaces.DSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import com.dhcc.framework.exception.DataBaseException;

/**
 * <p>标题: DSACoder.java</p>
 * <p>业务描述:DSA安全编码组件</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月25日
 * @version V1.0 
 */
public class DSACoder extends Coder{
	public static final String ALGORITHM = "DSA";

    /**  
     * 默认密钥字节数  
     *   
     * <pre>  
     * DSA   
     * Default Keysize 1024    
     * Keysize must be a multiple of 64, ranging from 512 to 1024 (inclusive).  
     * </pre>  
     */  
    private static final int KEY_SIZE = 1024;
  
    /**  
     * 默认种子  
     */  
    private static final String DEFAULT_SEED = "0f22507a10bbddd07d8a3082122966e3";
  
    private static final String PUBLIC_KEY = "DSAPublicKey";
    private static final String PRIVATE_KEY = "DSAPrivateKey";
  
    /**  
     * 用私钥对信息生成数字签名  
     *   
     * @param data  
     *            加密数据  
     * @param privateKey  
     *            私钥  
     *   
     * @return 
     */  
    public static String sign(byte[] data, String privateKey) {
        // 解密由base64编码的私钥   
        byte[] keyBytes = base64Decode(privateKey);
  
        // 构造PKCS8EncodedKeySpec对象   
        PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
        
		String signStr="";
		try {
	        // KEY_ALGORITHM 指定的加密算法   
	        KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
	  
	        // 取私钥匙对象   
	        PrivateKey priKey = keyFactory.generatePrivate(pkcs8KeySpec);
	  
	        // 用私钥对信息生成数字签名   
	        Signature signature = Signature.getInstance(keyFactory.getAlgorithm());
	        signature.initSign(priKey);
	        signature.update(data);
	        signStr=base64Encode(signature.sign());
        } catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return signStr;
    }
  
    /**  
     * 校验数字签名  
     *   
     * @param data  
     *            加密数据  
     * @param publicKey  
     *            公钥  
     * @param sign  
     *            数字签名  
     *   
     * @return 校验成功返回true 失败返回false
     *   
     */  
    public static boolean verify(byte[] data, String publicKey, String sign){
  
        // 解密由base64编码的公钥   
        byte[] keyBytes = base64Decode(publicKey);
  
        // 构造X509EncodedKeySpec对象   
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
  
		boolean verifyStr=false;
		try {
	        // ALGORITHM 指定的加密算法   
	        KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
	  
	        // 取公钥匙对象   
	        PublicKey pubKey = keyFactory.generatePublic(keySpec);
	  
	        Signature signature = Signature.getInstance(keyFactory.getAlgorithm());
	        signature.initVerify(pubKey);
	        signature.update(data);
	     // 验证签名是否正常   
	        verifyStr=signature.verify(base64Decode(sign));
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return verifyStr;
    }
  
    /**  
     * 生成密钥  
     *   
     * @param seed  
     *            种子  
     * @return 密钥对象 
     */  
    public static Map<String, Object> initKey(String seed) {
    	Map<String, Object> map = new HashMap<String, Object>();
		try {
			KeyPairGenerator keygen = KeyPairGenerator.getInstance(ALGORITHM);
	        // 初始化随机产生器   
	        SecureRandom secureRandom = new SecureRandom();
	        secureRandom.setSeed(seed.getBytes());
	        keygen.initialize(KEY_SIZE, secureRandom);
	  
	        KeyPair keys = keygen.genKeyPair();
	  
	        DSAPublicKey publicKey = (DSAPublicKey) keys.getPublic();
	        DSAPrivateKey privateKey = (DSAPrivateKey) keys.getPrivate();
	  
	        map = new HashMap<String, Object>(2);
	        map.put(PUBLIC_KEY, publicKey);
	        map.put(PRIVATE_KEY, privateKey);
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
        return map;
    }
  
    /**  
     * 默认生成密钥  
     *   
     * @return 密钥对象  
     */  
    public static Map<String, Object> initKey() {
        return initKey(DEFAULT_SEED);
    }
  
    /**  
     * 取得私钥  
     *   
     * @param keyMap  
     * @return 
     */  
    public static String getPrivateKey(Map<String, Object> keyMap) {
        Key key = (Key) keyMap.get(PRIVATE_KEY);
  
        return base64Encode(key.getEncoded());
    }
  
    /**  
     * 取得公钥  
     *   
     * @param keyMap  
     * @return 
     */  
    public static String getPublicKey(Map<String, Object> keyMap) {
        Key key = (Key) keyMap.get(PUBLIC_KEY);
  
        return base64Encode(key.getEncoded());
    }
}
