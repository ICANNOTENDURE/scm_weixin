/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.sys.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.entity.sys.SysLog;
import com.opensymphony.xwork2.ActionSupport;


@Namespace(value = "/sys")
@Scope("prototype")
@Action(value = "downLoadLogCtrl", results = {
		@Result(name = "downLoadLog",type = "stream", 
		params = { "contentType","application/octet-stream;charset=UTF-8", 
		           "inputName", "inputStream",
	               "contentDisposition", "attachment;filename=\"${downloadFileName}\""
	             }
		)})
@InterceptorRefs(value = { @InterceptorRef("fileUploadStack") })


public class DownLoadLogAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CommonService commonService;
	
	private InputStream inputStream;
	
	private String downloadFileName;
	
	private Date stDate;
	
	private Date edDate;
	
	
	
	/**
	 * @return the stDate
	 */
	public Date getStDate() {
		return stDate;
	}

	/**
	 * @param stDate the stDate to set
	 */
	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}

	/**
	 * @return the edDate
	 */
	public Date getEdDate() {
		return edDate;
	}

	/**
	 * @param edDate the edDate to set
	 */
	public void setEdDate(Date edDate) {
		this.edDate = edDate;
	}

	/**
	 * @return the inputStream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * @param inputStream the inputStream to set
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	/**
	 * @return the downloadFileName
	 */
	public String getDownloadFileName() {
		return downloadFileName;
	}

	/**
	 * @param downloadFileName the downloadFileName to set
	 */
	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}

	public String execute(){  
		return SUCCESS;  
    }
	
	/**
	 * 
	* @Title: DownLoadOrderAction.java
	* @Description: TODO(下载订单)
	* @return
	* @return:String 
	* @author zhouxin  
	* @date 2014年6月18日 上午10:54:41
	* @version V1.0
	 * @throws IOException 
	 */
	@SuppressWarnings("unchecked")
	public String downLoadLog() {
		
		downloadFileName=UUID.randomUUID().toString()+".xls";
		String outputFile = ServletActionContext.getServletContext().getRealPath("/downloads")+File.separator+downloadFileName;
		
       
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();  
		
		//sheet.protectSheet("123");
		HSSFCell cell=null;
		HSSFRow row=null;
		
		row = sheet.createRow(0);        //创建第一行
		
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("时间");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("操作人");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("业务名称");
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("ip");
		
		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("入参");
		
		cell = row.createCell(5, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("结果");
		
		
		
		DetachedCriteria criteria = DetachedCriteria.forClass(SysLog.class);
		criteria.add(Restrictions.between("opDate",this.stDate, this.edDate));
		
		List<SysLog> sysLogs=commonService.findByDetachedCriteria(criteria);
		int i=1;
		for(SysLog tmpSysLog:sysLogs){
			row = sheet.createRow(i);        //创建第一行
			
			cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpSysLog.getOpDate().toString());
			
			cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpSysLog.getOpUser());
			
			cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpSysLog.getOpName());
			
			cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpSysLog.getOpIp());
			
			cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpSysLog.getOpType());
			
			cell = row.createCell(5, HSSFCell.CELL_TYPE_STRING);
			if(tmpSysLog.getOpArg()!=null){
				if(tmpSysLog.getOpArg().length()>32767){
					cell.setCellValue(tmpSysLog.getOpArg().substring(0, 32767));
				}else{
					cell.setCellValue(tmpSysLog.getOpArg());
				}
			}
			cell = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
			if(tmpSysLog.getOpResult()!=null){
				if(tmpSysLog.getOpResult().length()>32767){
					cell.setCellValue(tmpSysLog.getOpResult().substring(0, 32767));
				}else{
					cell.setCellValue(tmpSysLog.getOpResult());
				}
			}
			
			
			++i;
		}
		
		try {
			FileOutputStream fOut = new FileOutputStream(outputFile);
			// 把相应的Excel 工作簿存盘
			workbook.write(fOut);
			fOut.flush();
			// 操作结束，关闭文件
			fOut.close();
			File tmpFlieFile=new File(outputFile);
			inputStream = new FileInputStream(tmpFlieFile);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			//org.apache.commons.io.FileUtils.forceDelete(new File(outputFile));
		}
		return "downLoadLog";
	}
	

	
}
