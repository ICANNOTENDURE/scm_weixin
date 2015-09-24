package com.dhcc.framework.common.log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * <p>标题: BusinessLogFlie.java</p>
 * <p>业务描述:业务日志存入本地文件</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 姚凯
 * @date 2013年8月23日
 * @version V1.0 
 */
public class BusinessLogFlie {
	private static boolean flag;
	/** 
	 * 方法名:          createNewFile
	 * 方法功能描述:    创建文件，如果该文件已存在将不再创建
	 * @param:         filePath  文件路径
	 * @return:        void
	 * @Author:        姚凯
	 * @Create Date:   2013年8月23日 下午3:01:08
	 */
	public synchronized static boolean createNewFile(String filePath) {		
		boolean isSuccess = true;
	    //如有则将"\\"转为"/",没有则不产生任何变化
	    String filePathTurn = filePath.replaceAll("\\\\", "/");
	    //先过滤掉文件名
	    int index = filePathTurn.lastIndexOf("/");
	    String dir = filePathTurn.substring(0, index);
	    //再创建文件夹
	    File fileDir = new File(dir);
	    isSuccess = fileDir.mkdirs();
	    //创建文件
	    File file = new File(filePathTurn);
	    try {
	        isSuccess = file.createNewFile();
	    } catch (IOException e) {
	        isSuccess = false;
	    }
	    return isSuccess;
	}
	
	/**
	 * 方法名: writeIntoFile 
	 * 方法功能描述: 将指定字符串写入文件。如果给定的文件路径不存在，将新建文件后写入
	 * @param: log   要写入文件的字符串
	 * @param: filePath 文件路径的字符串表示形式，目录的层次分隔可以是“/”也可以是“\\”
	 * @param: true：追加到文件的末尾；false：以覆盖原文件的方式写入
	 * @return: boolean 写入文件是否成功
	 * @Author: 姚凯
	 * @Create Date: 2013年8月23日 下午3:03:40
	 */
	@SuppressWarnings("unused")
	public synchronized static boolean writeIntoFile(String log, String filePath,
			boolean isAppend) {
		boolean isSuccess = true;
		// 如有则将"\\"转为"/",没有则不产生任何变化
		String filePathTurn = filePath.replaceAll("\\\\", "/");
		// 先过滤掉文件名
		int index = filePath.lastIndexOf("/");
		String dir = filePath.substring(0, index);
		// 创建除文件的路径
		File fileDir = new File(dir);
		fileDir.mkdirs();
		// 再创建路径下的文件
		File file = null;
		try {
			file = new File(filePath);
			file.createNewFile();
		} catch (IOException e) {
			isSuccess = false;
			// e.printStackTrace();

		}
		// 将logs写入文件
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(file, isAppend);
			fileWriter.write(log);
			fileWriter.flush();
		} catch (IOException e) {
			isSuccess = false;
			 e.printStackTrace();

		} finally {
			try {
				fileWriter.close();
			} catch (IOException e) {

			}
		}
		return isSuccess;
	}
	
	/** 
	 * 方法名:          readFromFile
	 * 方法功能描述:    文件读取
	 * @param:         filePath   文件路径
	 * @param:         KeyWords   查找包含某个关键字的信息：非null为带关键字查询；null为全文显示
	 * @return:        当文件存在时，返回字符串；当文件不存在时，返回null
	 * @Author:        姚凯
	 * @Create Date:   2013年8月23日 下午3:10:31
	 */
	public synchronized static String readFromFile(String filePath, String KeyWords) {
		StringBuffer stringBuffer = null;
		File file = new File(filePath);
		if (file.exists()) {
			stringBuffer = new StringBuffer();
			FileReader fileReader = null;
			BufferedReader bufferedReader = null;
			String temp = "";
			try {
				fileReader = new FileReader(file);
				bufferedReader = new BufferedReader(fileReader);
				while ((temp = bufferedReader.readLine()) != null) {
					if (KeyWords == null) {
						stringBuffer.append(temp + "\n");
					} else {
						if (temp.contains(KeyWords)) {
							stringBuffer.append(temp + "\n");
						}
					}
				}
			} catch (FileNotFoundException e) {
				 e.printStackTrace();
			} catch (IOException e) {
				 e.printStackTrace();
			} finally {
				try {
					fileReader.close();
				} catch (IOException e) {
					 e.printStackTrace();
				}
				try {
					bufferedReader.close();
				} catch (IOException e) {
					 e.printStackTrace();
				}
			}
		}
		if (stringBuffer == null) {
			return null;
		} else {
			return stringBuffer.toString();
		}
	}
	
	/** 
	 * 方法名:          deleteFile
	 * 方法功能描述:    删除单个文件
	 * @param:         sPath    被删除文件的文件名
	 * @return:        单个文件删除成功返回true，否则返回false
	 * @Author:        姚凯
	 * @Create Date:   2013年8月23日 下午3:58:34
	 */
	public synchronized static boolean deleteFile(String sPath) {  
	    flag = false;  
	    File file = new File(sPath);  
	    // 路径为文件且不为空则进行删除  
	    if (file.isFile() && file.exists()) {  
	        file.delete();  
	        flag = true;  
	    }  
	    return flag;  
	}
	
	/** 
	 * 方法名:          deleteDirectory
	 * 方法功能描述:    删除目录（文件夹）以及目录下的文件
	 * @param:         sPath 被删除目录的文件路径
	 * @return:        目录删除成功返回true，否则返回false
	 * @Author:        姚凯
	 * @Create Date:   2013年8月23日 下午4:00:33
	 */
	public synchronized static boolean deleteDirectory(String sPath) {  
	    //如果sPath不以文件分隔符结尾，自动添加文件分隔符  
	    if (!sPath.endsWith(File.separator)) {  
	        sPath = sPath + File.separator;  
	    }  
	    File dirFile = new File(sPath);  
	    //如果dir对应的文件不存在，或者不是一个目录，则退出  
	    if (!dirFile.exists() || !dirFile.isDirectory()) {  
	        return false;  
	    }  
	    flag = true;  
	    //删除文件夹下的所有文件(包括子目录)  
	    File[] files = dirFile.listFiles();  
	    for (int i = 0; i < files.length; i++) {  
	        //删除子文件  
	        if (files[i].isFile()) {  
	            flag = deleteFile(files[i].getAbsolutePath());  
	            if (!flag) break;  
	        } //删除子目录  
	        else {  
	            flag = deleteDirectory(files[i].getAbsolutePath());  
	            if (!flag) break;  
	        }  
	    }  
	    if (!flag) return false;  
	    //删除当前目录  
	    if (dirFile.delete()) {  
	        return true;  
	    } else {  
	        return false;  
	    }  
	}
}