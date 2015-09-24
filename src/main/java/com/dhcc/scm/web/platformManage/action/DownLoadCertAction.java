package com.dhcc.scm.web.platformManage.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.scm.entity.platformManage.Cert;
import com.dhcc.scm.service.platformManage.CertService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 标题: DownLoadAction.java 业务描述：安全运维管理平台 公司:东华软件股份公司 版权:dhcc2013
 * 
 * @author 聂文来
 * @date 2013年10月22日
 * @version V1.0
 */
@Namespace(value="/cert")
@Scope("prototype")
@Action("downLoadCertCtrl") 
@Results({ 
	@Result(name = "success",type = "stream", 
			params = { "contentType","application/octet-stream;charset=UTF-8", 
			           "inputName", "inputStream",
		               "contentDisposition", "attachment;filename=\"${downloadFileName}\""
		             }
	) 
})
@InterceptorRef("fileUpload")
public class DownLoadCertAction extends ActionSupport {

	private static final long serialVersionUID = 8784555891643520648L;
	private String fileName;// 文件名称

	/**
	 * @return fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName
	 *            fileName
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Resource
	private CertService certService;

	public String getDownloadFileName() {
		String downloadFileName = fileName;
		try {
			downloadFileName = new String(downloadFileName.getBytes(), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return downloadFileName;
	}

	public InputStream getInputStream(){
		try {
			String certSerialNum = ServletActionContext.getRequest()
					.getParameter("certSerialNum");
			System.out.println(certSerialNum);
			this.setFileName(certSerialNum+".cer");
			Cert cert = this.certService.getCert(certSerialNum);

			InputStream is = new ByteArrayInputStream(cert.getCertInfo().getBytes("UTF-8"));
			return is;
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	public String execute(){  
		return SUCCESS;  
    }  


}
