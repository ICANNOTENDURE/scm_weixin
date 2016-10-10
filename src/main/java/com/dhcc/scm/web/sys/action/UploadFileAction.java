/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.sys.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.sys.FileDto;
import com.opensymphony.xwork2.ActionSupport;


@Namespace(value = "/sys")
@Scope("prototype")
@Action(value = "uploadFileAction", results = {
		@Result(name = "downLoad",type = "stream", 
		params = { "contentType","application/octet-stream;charset=UTF-8", 
		           "inputName", "inputStream",
	               "contentDisposition", "attachment;filename=\"${downloadFileName}\""
	             }
		)})
@InterceptorRefs(value = { @InterceptorRef("fileUploadStack") })


public class UploadFileAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CommonService commonService;
		
	private FileDto dto = new FileDto();
	
	
	public void upload(){
		

		SimpleDateFormat smDateFormat=new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");
		try{
			//生成随机文件名
			String newFileName =smDateFormat.format(new Date()) +UUID.randomUUID()+ com.dhcc.framework.util.FileUtils.getFileExp(dto.getUploadFileName());
			//获取文件存储路径
			String storageFileName = ServletActionContext.getServletContext().getRealPath(File.separator+"uploadPic");
			//判断文件存储路径是否存在，若不存在则自动新建
			File document = new File(storageFileName);
			if(!document.exists()) {
				 document.mkdir();
			}
			File dstFile = new File(storageFileName,newFileName); 
			FileUtils.copyFile(dto.getUpload(), dstFile);
			WebContextHolder.getContext().getResponse().getWriter().write(newFileName);;
		}catch(Exception e)	{
			e.printStackTrace();
		}
	}


	public FileDto getDto() {
		return dto;
	}


	public void setDto(FileDto dto) {
		this.dto = dto;
	}

	
}
