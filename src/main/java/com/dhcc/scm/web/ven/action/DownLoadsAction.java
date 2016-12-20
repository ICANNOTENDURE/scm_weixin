/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ven.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
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
import com.dhcc.scm.dto.ven.VenStatisticsDto;
import com.dhcc.scm.entity.vo.ven.VenStatisticsVo;
import com.dhcc.scm.service.ven.VenStatisticsService;
import com.opensymphony.xwork2.ActionSupport;


@Namespace(value = "/ven")
@Scope("prototype")
@Action(value = "downLoadsCtrl", results = {
		
		@Result(name = "downLoads",type = "stream", 
		params = { "contentType","application/octet-stream;charset=UTF-8", 
		           "inputName", "inputStream",
	               "contentDisposition", "attachment;filename=\"${downloadFileName}\""
	             }
		)})
@InterceptorRefs(value = { @InterceptorRef("fileUploadStack") })


public class DownLoadsAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private VenStatisticsService venStatisticsService;
	
	private InputStream inputStream;
	
	private String downloadFileName;
	
	private Date stDate;
	
	private Date edDate;
	
	private String hosp;
	
	private String venincname;

	public VenStatisticsService getVenStatisticsService() {
		return venStatisticsService;
	}

	public void setVenStatisticsService(VenStatisticsService venStatisticsService) {
		this.venStatisticsService = venStatisticsService;
	}

	public String getHosp() {
		return hosp;
	}

	public void setHosp(String hosp) {
		this.hosp = hosp;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

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
	


	public String downLoads() {
		
		downloadFileName=UUID.randomUUID().toString()+".xls";
		String outputFile = ServletActionContext.getServletContext().getRealPath("/downloads")+File.separator+downloadFileName;
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();  
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String stTime,edTime;
		if(stDate!=null){
		 stTime = formatter.format(stDate);
		}else {
			stTime = "";
		}
		if(edDate!=null){
		 edTime = formatter.format(edDate);
		}else {
			edTime = "";
		}
		String printDate = formatter.format(date);
		  
		//sheet.protectSheet("123");
		HSSFCell cell=null;
		HSSFRow row=null;
		
		row = sheet.createRow(0);
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("药品汇总统计出货单");

		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("统计日期");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		if((stTime == "")&&(edTime == "")){
		cell.setCellValue(stTime+edTime);
		}else{
			cell.setCellValue(stTime+"-"+edTime);
		}
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("打印日期");
		
		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(printDate);
		
		row = sheet.createRow(1);        //创建第一行
		
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("商品名称");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("数量");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("进价");
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("商品金额");
		
		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院");
		
		VenStatisticsDto venStatisticsDto=new VenStatisticsDto();
		venStatisticsDto.setOrdStart(stDate);
		venStatisticsDto.setOrdEnd(edDate);
	
		if(StringUtils.isNotBlank(venincname)){
			try {
				venStatisticsDto.setVenincname(new String(venincname .getBytes("ISO8859-1")).toString());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		if(StringUtils.isNotBlank(hosp)){
			try {
				venStatisticsDto.setHosp(new String(hosp .getBytes("ISO8859-1")).toString());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		venStatisticsDto.setPageModel(new PagerModel());
		venStatisticsDto.getPageModel().setPageSize(99999999);
		venStatisticsDto.getPageModel().setPageNo(1);
		venStatisticsService.list(venStatisticsDto);
		int i=2; float totalQty=0;float totalRp=0;
		for(Object o:venStatisticsDto.getPageModel().getPageData()){
			VenStatisticsVo venStatisticsVo=(VenStatisticsVo)o;
			row = sheet.createRow(i);        //创建第一行
			
			cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(venStatisticsVo.getVenincname());
			
			cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
			if(venStatisticsVo.getOrdsubqty()!=null){
				cell.setCellValue(venStatisticsVo.getOrdsubqty());
				totalQty +=venStatisticsVo.getOrdsubqty();
			}
			
			cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(venStatisticsVo.getOrdsubrp());
			
			cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
			if(venStatisticsVo.getOrdsubrpamt()!=null){
				cell.setCellValue(venStatisticsVo.getOrdsubrpamt());
				totalRp+=venStatisticsVo.getOrdsubrpamt();
			}
			
			cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(venStatisticsVo.getHosp());
			
			++i;
		}
		
		row = sheet.createRow(i);
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("合计");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(totalQty);
			
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
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
		return "downLoads";
	}
	

	
}
