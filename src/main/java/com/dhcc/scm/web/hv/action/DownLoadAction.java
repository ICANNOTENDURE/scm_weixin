/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.hv.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dto.hv.HvLabelDto;
import com.dhcc.scm.entity.vo.hv.HvInvNoVo;
import com.dhcc.scm.service.hv.HvLabelService;
import com.opensymphony.xwork2.ActionSupport;


@Namespace(value = "/hv")
@Scope("prototype")
@Action(value = "downLoadCtrl", results = {
		
		@Result(name = "downLoad",type = "stream", 
		params = { "contentType","application/octet-stream;charset=UTF-8", 
		           "inputName", "inputStream",
	               "contentDisposition", "attachment;filename=\"${downloadFileName}\""
	             }
		)})
@InterceptorRefs(value = { @InterceptorRef("fileUploadStack") })


public class DownLoadAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private HvLabelService hvLabelService;
	
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
	


	public String downLoad() {
		
		downloadFileName=UUID.randomUUID().toString()+".xls";
		String outputFile = ServletActionContext.getServletContext().getRealPath("/downloads")+File.separator+downloadFileName;
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();  
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String stTime = formatter.format(stDate);
		String edTime = formatter.format(edDate);
		String printDate = formatter.format(date);
		  
		//sheet.protectSheet("123");
		HSSFCell cell=null;
		HSSFRow row=null;
		
		row = sheet.createRow(0);
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("供应商高值物资统计表");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("统计日期");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(stTime+"-"+edTime);
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("打印日期");
		
		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(printDate);
		
		row = sheet.createRow(1);        //创建第一行
		
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医嘱日期");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("条码");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("商品名称");
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("规格");
		
		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("发票号");
		
		cell = row.createCell(5, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("发票日期");
		
		cell = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("数量");
		
		cell = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("单价");
		
		cell = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院");
		
		cell = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("同步标志");
		
		HvLabelDto hvLabelDto=new HvLabelDto();
		hvLabelDto.setOrdStart(stDate);
		hvLabelDto.setOrdEnd(edDate);
		hvLabelDto.setPageModel(new PagerModel());
		hvLabelDto.getPageModel().setPageSize(99999999);
		hvLabelDto.getPageModel().setPageNo(1);
		hvLabelService.list(hvLabelDto);
		int i=2; float totalQty=0;float totalRp=0;
		for(Object o:hvLabelDto.getPageModel().getPageData()){
			HvInvNoVo hvInvNoVo=(HvInvNoVo)o;
			row = sheet.createRow(i);        //创建第一行
			
			cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getOrddate().toString());
			
			cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getLabel());
			
			cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getVenincname());
			
			cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getSpec());
			
			cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getInvno());
			
			cell = row.createCell(5, HSSFCell.CELL_TYPE_STRING);
			if(hvInvNoVo.getInvnodate()!=null){
				cell.setCellValue(hvInvNoVo.getInvnodate());
			}
			
			cell = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
			if(hvInvNoVo.getQty()!=null){
				cell.setCellValue(hvInvNoVo.getQty());
				totalQty +=hvInvNoVo.getQty();
			}
			
			cell = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
			if(hvInvNoVo.getRp()!=null){
				cell.setCellValue(hvInvNoVo.getRp());
				totalRp+=hvInvNoVo.getRp();
			}
			
			cell = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getHosp());
			
			cell = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(hvInvNoVo.getFlag());

			++i;
		}
		
		row = sheet.createRow(i);
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("合计");
		
		cell = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(totalQty);
			
		cell = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(totalRp);
		
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
		return "downLoad";
	}
	

	
}
