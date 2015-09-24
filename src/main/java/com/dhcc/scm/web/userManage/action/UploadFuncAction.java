package com.dhcc.scm.web.userManage.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.service.userManage.FuncService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 标题: UploadFuncAction.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年11月5日
 * @version V1.0 
 */
@Namespace(value="/func")
@Scope("prototype")
@Action("uploadFuncAction")  
@InterceptorRefs(value = {@InterceptorRef("fileUploadStack")})  
@Results({@Result(name = "success", location = "/WEB-INF/jsp/userManage/func.jsp")})  
public class UploadFuncAction extends ActionSupport{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	@Resource
	private FuncService funcService;
	
    //最大缓存空间
	private static final int BUFFER_SIZE = 16 * 1024;  
	// 封装上传文件域的属性  
	private File upload;  
	// 封装上传文件类型的属性  
	private String contentType;  
	// 封装上传文件名的属性  
	private String uploadFileName;  
	private String newFileName;
	private String storageFileName;
    
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
	 * @return upload 
	 */
	public File getUpload() {
		return upload;
	}
	/**  
	 * @param upload upload 
	 */
	public void setUpload(File upload) {
		this.upload = upload;
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
	 * @return uploadFileName 
	 */
	public String getUploadFileName() {
		return uploadFileName;
	}
	/**  
	 * @param uploadFileName uploadFileName 
	 */
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
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
	 * 
	* 方法名:          copyFile
	* 方法功能描述:    拷贝源文件到指定位置
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月5日 下午2:48:21
	 */
	private void copyFile(File srcFile,File dstFile){
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
	 * 
	* 方法名:          getFileExp
	* 方法功能描述:     获取文件的后缀名
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月5日 下午2:53:59
	 */
	private String getFileExp(String fileName) throws Exception{
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
	
	/**
	 * 
	* 方法名:          upload
	* 方法功能描述:    上传文件到upload文件夹
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月5日 下午3:10:10
	 */
	private void upload() throws Exception{
		Date date = new Date();
		//生成随机文件名
		this.newFileName = date.getTime() + this.getFileExp(this.uploadFileName);
		//获取文件存储路径
		this.storageFileName = ServletActionContext.getServletContext().getRealPath("/uploads");
		//判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(this.storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}
		
		File dstFile = new File(this.storageFileName,this.newFileName); 
        this.copyFile(this.upload, dstFile);
	}
	
	/**
	 * 
	* 方法名:          structuringFunc
	* 方法功能描述:    结构化权限成树结构
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月5日 下午5:33:48
	 */
	private void structuringFunc(List<Func> funcs){
		try {
			for(int i=0;i<funcs.size();i++){
				this.funcService.structuringFunc(funcs.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          execute
	* 方法功能描述:    读取Excel文件中的权限信息并以树结构保存
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月5日 下午3:10:10
	 */
	public String execute(){
		try {
			//上传Excel文件到upload文件夹
			//this.upload();

			List<Func> funcs = new ArrayList<Func>();
			
			//读取Excel文件
			HSSFWorkbook workbook = null;
			HSSFSheet sheet = null;
			HSSFRow row = null;
			HSSFCell cell = null;
			
			workbook = new HSSFWorkbook(new FileInputStream(this.storageFileName + File.separator + this.newFileName));
			sheet = workbook.getSheetAt(0);
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {
				
				row = sheet.getRow(numRows);
				
				Func func = new Func();
				func.setUseState("1");
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell((short) numCells);
					
					switch (numCells) {
					case 0:
						if(cell==null){
							func.setMenuSeq("");
						}else{
							func.setMenuSeq((int)cell.getNumericCellValue()+"");
						}
						break;
					case 1:
						if(cell==null){
							//func.setSystemType("");
						}else{
							//func.setSystemType(cell.toString());
						}
						break;
					case 2:
						if(cell==null){
							func.setFuncName("");
						}else{
							func.setFuncName(cell.toString());
						}
						break;
					case 3:
						if(cell==null){
							//func.setVersion("");
						}else{
							//func.setVersion(cell.toString());
						}
						break;
					case 4:
                        if(cell==null){
                        	//func.setSeq("");
						}else{
							//func.setSeq((int)cell.getNumericCellValue()+"");
						}
						break;
					case 5:
					    if(cell==null){
                        	func.setImgUrl("");
						}else{
							func.setImgUrl(cell.toString());
						}
						break;
					case 6:
					    if(cell==null){
                        	func.setUrl("");
						}else{
							func.setUrl(cell.toString());
						}
						break;
					case 7:
						if(cell==null){
                        	func.setSecutiryUrl("");
						}else{
							func.setSecutiryUrl(cell.toString());
						}
						break;
					}
				}
				if(!func.getMenuSeq().equals("")&&!func.getFuncName().equals("")){
					funcs.add(func);
				}
			}
			
			//删除upload文件夹下的所有文件
			File tempFile = new File(this.storageFileName);
			if(tempFile.isFile() || tempFile.list().length ==0)  {  
				tempFile.delete();       
			}else{      
				File[] tempFiles = tempFile.listFiles();  
				for (int i = 0; i < tempFiles.length; i++) {  
					tempFiles[i].delete();      
				}
			}
			
			//批量保存权限
			this.funcService.saveFuncs(funcs);
			//树结构化funcs成树结构
			this.structuringFunc(funcs);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
		return SUCCESS;  
	}

	
}






















