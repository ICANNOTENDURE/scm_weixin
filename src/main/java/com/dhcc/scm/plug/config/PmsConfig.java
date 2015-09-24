package com.dhcc.scm.plug.config;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.JarOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.scm.tool.security.Coder;

/**
 * <p>标题: PmsConfig.java</p>
 * <p>业务描述:Pms使用的系统配置信息</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class PmsConfig {
	
	private static Log logger = LogFactory.getLog(PmsConfig.class);
	
	private static PmsConfig pmsConfig;
	
	private static Properties properties=new Properties();
	
	public static PmsConfig getInstance(){
		if(pmsConfig == null){
			pmsConfig = new PmsConfig();
		}
		return pmsConfig;
	}
	
	/**
	 * 
	* 方法名:          getBaseConfig
	* 方法功能描述:    获取配置文件base.dat的内容
	* @param:         无
	* @return:        Properties对象
	 * @throws IOException 
	 * @throws FileNotFoundException 
	* @Author:        于鸿
	* @Create Date:   2013年10月11日 下午3:47:43
	 */
	public Properties getBaseConfig() {
		if (properties.isEmpty()) {
			try {
				String filePath=getFilePath();
				logger.info("\n--------文件路径-------\n"+filePath);
				InputStream inputStream=PmsConfig.class.getResourceAsStream(filePath);
				InputStreamReader fr = new InputStreamReader(inputStream);
				
				BufferedReader br = new BufferedReader(fr);
				StringBuilder strBuilder=new StringBuilder(64);
				String str="";
				while((str = br.readLine()) != null){
					strBuilder.append(str);
				}
				br.close();
				fr.close();
				byte[] decodeStr=Coder.base64Decode(strBuilder.toString());
				ByteArrayInputStream in = new ByteArrayInputStream(decodeStr);
				properties.load(in);
			} catch (Exception e) {
				throw new DataBaseException(e.getMessage(), e);
			}
		}
		return properties;
	}

	/**
	 * 
	* 方法名:          saveBaseConfig
	* 方法功能描述:    保存配置文件base.dat的内容
	* @param:         Properties对象
	* @return:        无
	 * @throws IOException 
	* @Author:        于鸿
	* @Create Date:   2013年10月11日 下午3:47:53
	 */
	public boolean saveBaseConfig(Properties props) {
		String updatePath=getFilePath();
		String filePath=PmsConfig.class.getResource(updatePath).getPath();
		try {
			filePath=URLDecoder.decode(filePath,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		logger.info("\n--------文件路径-------\n"+filePath);
		boolean flag=false;
		boolean jarFlag=filePath.contains(".jar!"+updatePath);
		String jarPath="";
		if (jarFlag) {
			jarPath=filePath.replace("file:/","").replace("!"+updatePath, "");
			logger.info("\n--------JAR文件路径-------\n"+jarPath);
			updatePath=updatePath.substring(1);
			logger.info("\n--------要更新的文件路径-------\n"+updatePath);
		}else {
			jarPath=filePath.substring(1,filePath.length());
			logger.info("\n--------文件路径-------\n"+jarPath);
		}
		StringBuilder strBuilder=new StringBuilder();
		Enumeration<?> en = props.propertyNames();
		while (en.hasMoreElements()) {
			String key = (String) en.nextElement();
			String Property = props.getProperty (key);
			strBuilder.append(key).append("=").append(Property).append("\r\n");
		}
		logger.info("\n--------文件内容-------\n"+strBuilder.toString());
		String encodeStr=Coder.base64Encode(strBuilder.toString().getBytes());
		logger.info("\n--------编码后的内容-------\n"+encodeStr);
		if (jarFlag) {
			flag=updateJar(jarPath,updatePath,encodeStr.getBytes());
		}else {
			try {
				FileWriter fileWriter=new FileWriter(jarPath);
				fileWriter.write(encodeStr);
				fileWriter.flush();
				fileWriter.close();
				flag=true;
			} catch (IOException e) {
				throw new DataBaseException(e.getMessage(), e);
			}
		}
		logger.info("\n--------保存结果-------\n"+flag);
		properties=props;
		return flag;
	}
	
	/**
	 * 
	* 方法名:          getFilePath
	* 方法功能描述:    获取base.dat配置文件的相对路径
	* @param:         无
	* @return:        配置文件的相对路径
	 * @throws IOException 
	* @Author:        于鸿
	* @Create Date:   2013年10月11日 下午3:55:31
	 */
	private String getFilePath() {
		String filePath=PmsConfig.class.getPackage().getName();
		filePath=filePath.replace(".", "/");
		filePath="/"+filePath.concat("/file/base.dat");
		return filePath;
	}
	
	/**
	 * 
	* 方法名:		getByteData
	* 方法功能描述:	转换输入流为byte数组
	* @param:		输入流
	* @return:		byte数组
	* @Author:		于鸿
	* @Create Date:   2013年11月22日 上午11:09:28
	 */
	private byte[] getByteData(InputStream inStream) throws IOException{
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        byte[] buff = new byte[100];
        int rc = 0;
        while ((rc = inStream.read(buff, 0, 100)) > 0) {
            swapStream.write(buff, 0, rc);
        }
        byte[] in2b = swapStream.toByteArray();
        return in2b;
    }
	
	/**
	 * 
	* 方法名:		updateJar
	* 方法功能描述:	修改Jar包中指定路径的文件
	* @param:		Jar包路径，要修改的Jar包中的文件路径，文件字节数组
	* @return:		状态
	* @Author:		于鸿
	* @Create Date:   2013年11月22日 上午11:14:23
	 */
	private boolean updateJar(String jarPath, String updatePath,byte[] newData) {
		boolean flag=false;
		try{
			// 读取jar文件到内存中
			JarFile jarf = new JarFile(jarPath);
			HashMap<JarEntry, byte[]> jarMap=new HashMap<JarEntry,byte[]>();
			for (Enumeration<JarEntry> en = jarf.entries(); en.hasMoreElements();) {
				JarEntry jarEntry = en.nextElement();
				InputStream entryIn = jarf.getInputStream(jarEntry);
				byte[] classData = getByteData(entryIn);
				jarMap.put(jarEntry, classData);
			}
			jarf.close();
			// 写入修改后的jar文件
			JarOutputStream jaros = new JarOutputStream(new FileOutputStream(jarPath));
			for (Entry<JarEntry, byte[]> entry : jarMap.entrySet()) {
				JarEntry jarEntry=entry.getKey();
				jaros.putNextEntry(new JarEntry(jarEntry.getName()));
				byte[] classData = null;
				if (jarEntry.getName().equals(updatePath)) {
					logger.info("\n------entry.getValue------\n"+new String(entry.getValue()));
					classData=newData;
					logger.info("\n------classData------\n"+new String(classData));
				}else {
					classData = entry.getValue();
				}
				jaros.write(classData, 0, classData.length);
				jaros.closeEntry();
			}
			jaros.close();
			flag=true;
		}catch(Exception e){
			throw new DataBaseException(e.getMessage(), e);
		}
		return flag;
	}
}
