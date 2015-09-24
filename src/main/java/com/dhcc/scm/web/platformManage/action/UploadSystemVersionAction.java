package com.dhcc.scm.web.platformManage.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.scm.service.platformManage.SystemVersionService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * <p>标题: UploadSystemVersionAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  上传安装包文件Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年11月6日
 * @version V1.0 
 */
@Namespace(value = "/systemVersion")
@Scope("prototype")
@Action("uploadSystemVersionAction")
@InterceptorRefs({@InterceptorRef("fileUploadStack"),@InterceptorRef("dhccStack")})
@Results({@Result(name = "success", location = "/WEB-INF/jsp/platformManage/systemVersion.jsp")})
public class UploadSystemVersionAction extends ActionSupport {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	@Resource
	private SystemVersionService systemVersionService;
	
	//private SystemVersionDto systemVersionDto;
	
	/**  
	* 字段:      字段名称
	* @Fields BUFFER_SIZE : 最大缓存空间 
	*/
	private static final int BUFFER_SIZE = 1024*1024;
	
	/**  
	* 字段:      字段名称
	* @Fields appSystem : 上传文件
	*/
	private File appSystem;
	
	/**  
	* 字段:      字段名称
	* @Fields contentType : 上传文件类型
	*/
	private String contentType;
	
	/**  
	* 字段:      字段名称
	* @Fields appSystemFileName : 上传文件名称
	*/
	private String appSystemFileName;
	
	/**  
	* 字段:      字段名称
	* @Fields newFileName : TODO 
	*/
	private String newFileName;
	
	/**  
	* 字段:      字段名称
	* @Fields storageFileName : TODO 
	*/
	private String storageFileName;

	/**  
	 * @return appSystem 
	 */
	public File getAppSystem() {
		return appSystem;
	}

	/**  
	 * @param appSystem appSystem 
	 */
	public void setAppSystem(File appSystem) {
		this.appSystem = appSystem;
	}

	/**  
	 * @return contentType 
	 */
	public String getContentType() {
		return contentType;
	}

	/**  
	 * @param contentType contentType 
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**  
	 * @return appSystemFileName 
	 */
	public String getAppSystemFileName() {
		return appSystemFileName;
	}

	/**  
	 * @param appSystemFileName appSystemFileName 
	 */
	public void setAppSystemFileName(String appSystemFileName) {
		this.appSystemFileName = appSystemFileName;
	}

	/**  
	 * @return newFileName 
	 */
	public String getNewFileName() {
		return newFileName;
	}

	/**  
	 * @param newFileName newFileName 
	 */
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	/**  
	 * @return storageFileName 
	 */
	public String getStorageFileName() {
		return storageFileName;
	}

	/**  
	 * @param storageFileName storageFileName 
	 */
	public void setStorageFileName(String storageFileName) {
		this.storageFileName = storageFileName;
	}
	
	/** 
	* 方法名:          copyFile
	* 方法功能描述:    拷贝源文件到目标文件
	* @param:         srcFile,destFile
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月6日 下午8:06:35
	*/
	private void copyFile(File srcFile, File destFile) {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			try {
				inputStream = new BufferedInputStream(new FileInputStream(srcFile), BUFFER_SIZE);
				outputStream = new BufferedOutputStream(new FileOutputStream(destFile), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				
				while(inputStream.read(buffer) > 0) {
					outputStream.write(buffer);
				}
			} finally {
				if (null != inputStream) {
					inputStream.close();
				}
				if (null != outputStream) {
					outputStream.close();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/** 
	* 方法名:          getFileSuffix
	* 方法功能描述:    获取文件类型后缀
	* @param:         fileName
	* @return:        String
	* @Author:        李飞
	* @Create Date:   2013年11月6日 下午8:52:39
	*/
	private String getFileSuffix(String fileName) {
		int position = fileName.lastIndexOf(".");
		
		return fileName.substring(position);
	}
	
	/** 
	* 方法名:          upload
	* 方法功能描述:    上传文件至目标服务器指定目录
	* @param:         
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月6日 下午8:56:11
	*/
	private void upload() {
		//Date date = new Date();
		//newFileName = date.getTime() + getFileSuffix(appSystemFileName);
		newFileName = appSystemFileName;
		
		storageFileName = ServletActionContext.getServletContext().getRealPath("/upload");
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}
		
		File destFile = new File(storageFileName, newFileName);
		copyFile(appSystem, destFile);
	}
	
	/* (非 Javadoc)   
	* <p>Title: execute</p>   
	* <p>Description: 执行文件上传</p>   
	* @return   
	* @see com.opensymphony.xwork2.ActionSupport#execute()   
	*/
	public String execute() {
		try {
			upload();
			
			File temp = new File(storageFileName);
			if (temp.isFile() || temp.list().length==0) {
				temp.delete();
			} else {
				File[] temps = temp.listFiles();
				for (int i=0; i<temps.length; i++) {
					temps[i].delete();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new DataBaseException(e.getMessage(), e);
		}
		return SUCCESS;
	}
	
	/** 
	* 方法名:          createFolder
	* 方法功能描述:    在远程服务器上新建文件夹
	* @param:         
	* @return:        String
	* @Author:        李飞
	* @Create Date:   2013年11月8日 上午10:16:52
	*/
	public String createFolder() {
		//String sysType = systemVersionDto.getSystemVersion().getSystemType();
		//String sysName = systemVersionDto.getSystemVersion().getSystemName();
		//String sysVer = systemVersionDto.getSystemVersion().getVersion();
		
//		if ((sysName != null)&&(!sysName.equals(""))) {
//			File dir = new File(File.separator+sysType+sysName);
//			storageFileName = ServletActionContext.getServletContext().getRealPath("/upload");
//		}
		
		return SUCCESS;
	}
	
	/** 
	* 方法名:          delFile
	* 方法功能描述:    删除远程服务器上的文件
	* @param:         
	* @return:        String
	* @Author:        李飞
	* @Create Date:   2013年11月8日 上午10:17:54
	*/
	public String delFile() {
		
		return SUCCESS;
	}
	
	/** 
	* 方法名:          delFolder
	* 方法功能描述:    删除远程服务器上的文件夹
	* @param:         
	* @return:        String
	* @Author:        李飞
	* @Create Date:   2013年11月8日 上午10:18:44
	*/
	public String delFolder() {
		
		return SUCCESS;
	}
}
