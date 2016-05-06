
package com.dhcc.scm.entity.vo.ws;

import javax.activation.DataHandler;
import javax.xml.bind.annotation.XmlMimeType;
/**
 * CXF上传和下载文件对象包装类 由于CXF的DataHandler无法获取文件名和文件类型，需要在上传和下载时附带文件名
 * 
 */
public class FileWrapper {
    //文件名
    private String fileName;
    //文件扩展名
    private String fileExtension;
    //文件二进制数据
    private DataHandler file;
    
    private String resultCode="-1";
    
    private String resultContent;
    
    
    
    public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileExtension() {
        return fileExtension;
    }

    public void setFileExtension(String fileExtension) {
        this.fileExtension = fileExtension;
    }

    //注解该字段为二进制流
    @XmlMimeType("application/octet-stream")
    public DataHandler getFile() {
        return file;
    }

    public void setFile(DataHandler file) {
        this.file = file;
    }
}