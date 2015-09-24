/**  
* @Title: FileUtils.java
* @Package com.dhcc.framework.util
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年6月3日 上午11:12:10
* @version V1.0  
*/
package com.dhcc.framework.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;

import com.dhcc.framework.exception.DataBaseException;

/**
 * 
* @ClassName: FileUtils 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author zhouxin
* @date 2015年2月9日 上午11:50:55 
*
 */
public class FileUtils {
	
	/**
	 * 
	* 方法名:          getFileExp
	* 方法功能描述:     获取文件的后缀名
	* @param:         
	* @return:        
	* @Author:        周鑫
	 */
	public static String getFileExp(String fileName) throws Exception{
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
	/**
	 * 
	* 方法名:          copyFile
	* 方法功能描述:    拷贝源文件到指定位置
	* @param:         
	* @return:        
	* @Author:        周鑫
	 */
	public static void copyFile(File srcFile,File dstFile,int BUFFER_SIZE){
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			try{
				inputStream = new BufferedInputStream(new FileInputStream(srcFile),BUFFER_SIZE);
				outputStream = new BufferedOutputStream(new FileOutputStream(dstFile), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while(inputStream.read(buffer)>0){
					outputStream.write(buffer);
				}
			}finally{
				if(null!=inputStream){
					inputStream.close();
				}
				if(null!=outputStream){
					outputStream.close();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
    /**
     * 删除单个文件
     * @param   sPath    被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static void deleteFile(String sPath) {
  
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
        }
    }
    
    /**
     * 
    * @Title: getFileSizes 
    * @Description: TODO(取得文件大小) 
    * @param @param f
    * @param @return
    * @param @throws Exception    设定文件 
    * @return long    返回类型 
    * @throws 
    * @author zhouxin   
    * @date 2015年5月12日 下午3:12:28
     */
    public static long getFileSizes(File f) throws Exception{
        long s=0;
		if (f.exists()) {
			FileInputStream fis = null;
			fis = new FileInputStream(f);
			s = fis.available();
			fis.close();
		} 
		return s;
     }

	/**
	 * 
	* @Title: longgetFileSize 
	* @Description: TODO(取得文件夹大小) 
	* @param @param f
	* @param @throws Exception    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月12日 下午4:17:38
	 */
     public static long getFileSize(File f)throws Exception//
     {
        long size = 0;
        File flist[] = f.listFiles();
        for (int i = 0; i < flist.length; i++)
        {
            if (flist[i].isDirectory())
            {
                size = size + getFileSize(flist[i]);
            } else
            {
                size = size + flist[i].length();
            }
        }
        return size;
     }
     
     /**
      * 
     * @Title: FormetFileSize 
     * @Description: TODO(转换文件大小) 
     * @param @param fileS
     * @param @return    设定文件 
     * @return String    返回类型 
     * @throws 
     * @author zhouxin   
     * @date 2015年5月12日 下午4:18:02
      */
     public static String FormetFileSize(long fileS) {//
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) +"G";
        }
        return fileSizeString;
     }
     
     /**
      * 
     * @Title: getlist 
     * @Description: TODO(递归求取目录文件个数) 
     * @param @param f
     * @param @return    设定文件 
     * @return long    返回类型 
     * @throws 
     * @author zhouxin   
     * @date 2015年5月12日 下午4:18:21
      */
     public static long getlist(File f){//
        long size = 0;
        File flist[] = f.listFiles();
        size=flist.length;
        for (int i = 0; i < flist.length; i++) {
            if (flist[i].isDirectory()) {
                size = size + getlist(flist[i]);
                size--;
            }
        }
        return size;
  
    }
    
}
