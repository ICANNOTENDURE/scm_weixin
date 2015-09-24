/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ord.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.entity.vo.ord.ExportOrderVo;
import com.dhcc.scm.entity.vo.ord.OrderInfoVo;
import com.dhcc.scm.service.ord.OrderService;
import com.dhcc.scm.service.ord.OrderStateService;
import com.opensymphony.xwork2.ActionSupport;


@Namespace(value = "/ord")
@Scope("prototype")
@Action(value = "downLoadOrderCtrl", results = {
		@Result(name = "downLoadOrder",type = "stream", 
		params = { "contentType","application/octet-stream;charset=UTF-8", 
		           "inputName", "inputStream",
	               "contentDisposition", "attachment;filename=\"${downloadFileName}\""
	             }
		)})



public class DownLoadOrderAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private OrderStateService ordertateService;
	
	private InputStream inputStream;
	
	private String downloadFileName;
	
	private OrderStateDto dto;
	
	
	
	public OrderStateDto getDto() {
		return dto;
	}

	public void setDto(OrderStateDto dto) {
		this.dto = dto;
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
	public String downLoadOrder() {
		
		downloadFileName=UUID.randomUUID().toString()+".xls";
		String outputFile = ServletActionContext.getServletContext().getRealPath("/downloads")+File.separator+downloadFileName;
		
       
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();  
		
		//sheet.protectSheet("123");
		HSSFCell cell=null;
		HSSFRow row=null;
		
		row = sheet.createRow(0);        //创建第一行
		
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("订单号");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("入库科室");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("收货科室");
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("供应商药品标识");
		
		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("药品名称");
		
		cell = row.createCell(5, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("医院单位数量");
		
		cell = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院单位");
		
		cell = row.createCell(7, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("医院单位进价");
		
		cell = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院标识");
		
		cell = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院药品名称");

		cell = row.createCell(10, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("供应商单位");
		
		cell = row.createCell(11, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("供应商单位数量");
		
		cell = row.createCell(12, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("供应商单位进价");
		
		cell = row.createCell(13, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("供应商单位到医院单位转换系数");
		
		cell = row.createCell(14, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("订单明细ID");
		
		cell = row.createCell(15, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院名称");
		
		cell = row.createCell(16, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("收货地址 ");
		
		List<ExportOrderVo> exportOrderVos=orderService.ExportOrder(WebContextHolder.getContext().getRequest().getParameter("orderId"));
		int i=1;
		for(ExportOrderVo tmpExportOrderVo:exportOrderVos){
			row = sheet.createRow(i);        //创建第一行
			
			cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getNo());
			
			cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getPurloc());
			
			cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getRecloc());
			
			cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getVeninccode());
			
			cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getVenincname());
			
			cell = row.createCell(5, HSSFCell.CELL_TYPE_NUMERIC);
				cell.setCellValue(tmpExportOrderVo.getQty());
			cell = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getUom());
			
			cell = row.createCell(7, HSSFCell.CELL_TYPE_NUMERIC);
				cell.setCellValue(tmpExportOrderVo.getRp());
			cell = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getHopincid());
			
			cell = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getHopincname());
			
			cell = row.createCell(10, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getVenuom());
			
			cell = row.createCell(11, HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(tmpExportOrderVo.getVenqty());
			
			cell = row.createCell(12, HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(tmpExportOrderVo.getVenrp());
			
			cell = row.createCell(13, HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(tmpExportOrderVo.getFac());
			
			cell = row.createCell(14, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getOrderitmid());
			
			cell = row.createCell(15, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getHopname());
			
			cell = row.createCell(16, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(tmpExportOrderVo.getDesction());
			
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
		return "downLoadOrder";
	}
	
	
	public String downLoadOrderNew() {
		
		downloadFileName=UUID.randomUUID().toString()+".xls";
		String outputFile = ServletActionContext.getServletContext().getRealPath("/downloads")+File.separator+downloadFileName;
		
       
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();  
		
		//sheet.protectSheet("123");
		HSSFCell cell=null;
		HSSFRow row=null;
		
		row = sheet.createRow(0);        //创建第一行
		
		cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("订单号");
		
		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("收货科室");
		
		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("供应商药品标识");
		
		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("药品名称");

		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("供应商单位");
		
		cell = row.createCell(5, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("供应商单位数量");
		
		cell = row.createCell(6, HSSFCell.CELL_TYPE_NUMERIC);
		cell.setCellValue("订单明细ID");
		
		cell = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("医院名称");
		
		cell = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("收货地址 ");
		
		cell = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("订单状态 ");
		
		PagerModel pagerModel=new PagerModel();
		pagerModel.setPageNo(1);
		pagerModel.setPageSize(9999999);
		ordertateService.listVenOrd(dto);
		
		int i=1;
		for(Object o:dto.getPageModel().getPageData()){
			OrderInfoVo orderInfoVo=(OrderInfoVo) o;
			row = sheet.createRow(i);        //创建第一行
			
			cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getOrderno());
			
			cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getRecloc());
			
			cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getVeninccode());
			
			cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getVenincname());
			
			cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getUom());
				
			cell = row.createCell(5, HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(orderInfoVo.getVenqty());
			
			cell = row.createCell(6, HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(orderInfoVo.getOrderid());
			
			cell = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getHopname());
			
			cell = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getDestination());
			
			cell = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(orderInfoVo.getStatedesc());
			
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
		return "downLoadOrder";
	}
	
}
