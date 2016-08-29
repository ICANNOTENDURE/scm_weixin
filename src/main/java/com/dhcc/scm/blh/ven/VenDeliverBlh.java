/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ven;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.mail.EmailException;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.SendMailUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.dto.ven.VenDeliverDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrdLabel;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.ven.VenDel;
import com.dhcc.scm.entity.ven.VenDeliver;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.DeliverItmVo;
import com.dhcc.scm.entity.vo.ven.PrintByQtyVo;
import com.dhcc.scm.entity.vo.ven.PrintVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.sys.SysImpModelService;
import com.dhcc.scm.service.ven.VenDeliverService;
import com.dhcc.scm.service.ven.VenIncService;
import com.dhcc.scm.tool.security.AESCoder;

@Component
public class VenDeliverBlh extends AbstractBaseBlh {

	@Resource
	private VenDeliverService venDeliverService;

	@Resource
	private VenIncService venIncService;

	@Resource
	private CommonService commonService;

	@Resource
	private SysImpModelService sysImpModelService;

	public VenDeliverBlh() {

	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(查询发货单)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月19日 下午3:46:55
	 * @version V1.0
	 */
	public void listDeliver(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.listDeliver(dto);
	}

	public void listDeliverNew(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.listDeliverNew(dto);
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(查询发货单明细)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月19日 下午3:46:59
	 * @version V1.0
	 */
	public void listDeliverItm(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.listDeliverItm(dto);
	}

	public void listDeliverItmNew(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.listDeliverItmNew(dto);
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(修改发货单明细)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月19日 下午5:03:15
	 * @version V1.0
	 */
	public void saveDeliverItm(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.saveDeliverItm(dto);
		dto.setOpFlg("1");
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(删除一条发货明细)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月19日 下午5:28:40
	 * @version V1.0
	 */
	public void delDeliverItm(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);

		VenDeliveritm venDeliveritm = commonService.get(VenDeliveritm.class, dto.getVenDeliveritm().getDeliveritmId());
		VenDeliver venDeliver = commonService.get(VenDeliver.class, venDeliveritm.getDeliveritmParentid());
		if (commonService.get(ExeState.class, venDeliver.getDeliverExestateid()).getStateId().toString().equals("4")) {
			dto.setOpFlg("2");
			return;
		}
		OrderItm orderItm = commonService.get(OrderItm.class, venDeliveritm.getDeliveritmOrderitmid());
		Float delQty = orderItm.getDeliverqty().floatValue() - venDeliveritm.getDeliveritmHisQty().floatValue();
		orderItm.setDeliverqty(delQty);
		orderItm.setFlag(1l);
		commonService.saveOrUpdate(orderItm);
		Order order = commonService.get(Order.class, orderItm.getOrdId());
		order.setOrdFlag(1l);
		commonService.saveOrUpdate(order);
		commonService.delete(venDeliveritm);
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(保存发货单)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月19日 下午7:06:51
	 * @version V1.0
	 */
	public void saveMain(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		VenDeliver venDeliver = commonService.get(VenDeliver.class, dto.getVenDeliver().getDeliverId());
		venDeliver.setDeliverArrdate(dto.getVenDeliver().getDeliverArrdate());
		venDeliver.setDeliverRemark(dto.getVenDeliver().getDeliverRemark());
		commonService.saveOrUpdate(venDeliver);
		dto.setOpFlg("1");
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(导入发票)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月20日 下午1:58:28
	 * @version V1.0
	 * @throws IOException
	 */
	public void uploadAndroid(BusinessRequest res) throws IOException {

		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);

		// 生成随机文件名
		String newFileName = UUID.randomUUID().toString();
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadtmps");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}

		File dstFile = new File(storageFileName, newFileName);
		com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);

		//
		SysImpModelDto SysImpModelDto = new SysImpModelDto();
		SysImpModelDto.setImpModel(new ImpModel());
		SysImpModelDto.getImpModel().setType("VENINVBYORDER");
		List<ImpModel> listImpModels = sysImpModelService.getModelList(SysImpModelDto);
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getName());
		}

		// 读取excel
		try {
			dto.setOpFlg("1");
			// 读取Excel文件
			HSSFWorkbook workbook = null;
			HSSFSheet sheet = null;
			HSSFRow row = null;
			HSSFCell cell = null;

			workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			sheet = workbook.getSheetAt(0);

			// 明细
			quit: for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {

				row = sheet.getRow(numRows);

				VenDeliveritm venDeliveritm = new VenDeliveritm();
				String orderNo = "";
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					;
					switch (colNameString) {
					case "订单号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							orderNo = cell.getStringCellValue();
						}
						break;
					case "供应商药品代码":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);

							Long hopincid = venIncService.getHopIncByVenIncCode(cell.getStringCellValue());
							if (hopincid == null) {
								dto.setOpFlg("2");
								if (StringUtils.isNullOrEmpty(dto.getMsg())) {
									dto.setMsg(cell.getStringCellValue());
								} else {
									dto.setMsg(dto.getMsg() + "," + cell.getStringCellValue());
								}
								break quit;
							} else {
								venDeliveritm.setDeliveritmHopincid(hopincid);
							}
						}
						break;
					case "发票":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							venDeliveritm.setDeliveritmInvnoe(cell.getStringCellValue());
						}
						break;
					case "数量":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							venDeliveritm.setDeliveritmQty((float) cell.getNumericCellValue());
						}
						break;
					case "批号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							venDeliveritm.setDeliveritmBatno(cell.getStringCellValue());
						}
						break;
					case "效期":
						if (cell != null) {
							venDeliveritm.setDeliveritmExpdate(cell.getDateCellValue());
						}
						break;
					case "进价":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							venDeliveritm.setDeliveritmRp((float) cell.getNumericCellValue());
						}
						break;
					}
				}
				if (orderNo.equals("")) {
					break quit;
				}
				if (dto.getOrderMap() != null && dto.getOrderMap().containsKey(orderNo)) {
					dto.getOrderMap().get(orderNo).add(venDeliveritm);
				} else {
					List<VenDeliveritm> venDeliveritms2 = new ArrayList<VenDeliveritm>();
					venDeliveritms2.add(venDeliveritm);
					dto.getOrderMap().put(orderNo, venDeliveritms2);
				}
			}

			if (!dto.getOpFlg().equals("1")) {
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				;
				return;
			}
			venDeliverService.impByOrder(dto);
			workbook = null;
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			;
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		} finally {
			// 删除upload文件夹下的所有文件
			FileUtils.forceDelete(dstFile);
		}

	}

	public void upload(BusinessRequest res) throws IOException {

		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);

		// 生成随机文件名
		String newFileName = UUID.randomUUID().toString();
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadtmps");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}

		File dstFile = new File(storageFileName, newFileName);
		com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);

		//
		SysImpModelDto SysImpModelDto = new SysImpModelDto();
		SysImpModelDto.setImpModel(new ImpModel());
		SysImpModelDto.getImpModel().setType("VENINV");
		List<ImpModel> listImpModels = sysImpModelService.getModelList(SysImpModelDto);
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getName());
		}

		// 读取excel
		try {
			dto.setOpFlg("1");
			List<VenDeliveritm> venDeliveritms = new ArrayList<VenDeliveritm>();
			// 读取Excel文件
			HSSFWorkbook workbook = null;
			HSSFSheet sheet = null;
			HSSFRow row = null;
			HSSFCell cell = null;

			workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			sheet = workbook.getSheetAt(0);

			// 明细
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {

				row = sheet.getRow(numRows);

				VenDeliveritm venDeliveritm = new VenDeliveritm();
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					;
					switch (colNameString) {
					case "供应商药品代码":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);

							Long hopincid = venIncService.getHopIncByVenIncCode(cell.getStringCellValue());
							if (hopincid == null) {
								dto.setOpFlg("2");
								if (StringUtils.isNullOrEmpty(dto.getMsg())) {
									dto.setMsg(cell.getStringCellValue());
								} else {
									dto.setMsg(dto.getMsg() + "," + cell.getStringCellValue());
								}
							} else {
								venDeliveritm.setDeliveritmHopincid(hopincid);
							}
						}
						break;
					case "发票":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							venDeliveritm.setDeliveritmInvnoe(cell.getStringCellValue());
						}
						break;
					case "数量":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							venDeliveritm.setDeliveritmQty((float) cell.getNumericCellValue());
						}
						break;
					case "批号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							venDeliveritm.setDeliveritmBatno(cell.getStringCellValue());
						}
						break;
					case "效期":
						if (cell != null) {
							venDeliveritm.setDeliveritmExpdate(cell.getDateCellValue());
						}
						break;
					case "进价":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							venDeliveritm.setDeliveritmRp((float) cell.getNumericCellValue());
						}
						break;
					}
				}
				venDeliveritms.add(venDeliveritm);
			}
			if (!dto.getOpFlg().equals("1")) {
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				;
				return;
			}
			dto.setVenDeliveritms(venDeliveritms);
			venDeliverService.impInv(dto);
			workbook = null;
			// 删除upload文件夹下的所有文件
			if (dstFile.isFile() || dstFile.list().length == 0) {
				dstFile.delete();
			} else {
				File[] tempFiles = dstFile.listFiles();
				for (int i = 0; i < tempFiles.length; i++) {
					tempFiles[i].delete();
				}
			}
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			;
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		} finally {
			// 删除upload文件夹下的所有文件
			FileUtils.forceDelete(dstFile);
		}

	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(发货)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月24日 上午11:44:37
	 * @version V1.0
	 */
	public void sendDeliver(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.deliver(dto);
		// 发送邮件
		String sub = "发货通知";
		StringBuffer msg = new StringBuffer();
		String address = "";
		VenDeliver VenDeliver = commonService.get(VenDeliver.class, dto.getVenDeliver().getDeliverId());
		HopCtlocDestination ctlocDestination = commonService.get(HopCtlocDestination.class, VenDeliver.getDeliverDestinationid());
		NormalUser normalUser = commonService.get(NormalUser.class, Long.valueOf(ctlocDestination.getContact()));
		Order order = commonService.get(Order.class, VenDeliver.getDeliverOrderid());
		Vendor vendor = commonService.get(Vendor.class, VenDeliver.getDeliverVendorid());
		if (normalUser != null) {
			address = normalUser.getEmail();
		}
		if (!StringUtils.isNullOrEmpty(address)) {
			address = address + BaseConstants.COMMA + ctlocDestination.getMail();
		} else {
			address = ctlocDestination.getMail();
		}
		msg.append("您的订单:<h1>" + order.getOrderNo() + "</h1>已经发货。");
		if (VenDeliver.getDeliverArrdate() != null) {
			msg.append("<br>预计送达时间:" + new SimpleDateFormat("yyyy-mm-dd").format(VenDeliver.getDeliverArrdate()));
		}
		msg.append("<br>收货地址:" + ctlocDestination.getDestination());
		msg.append("<br>请注意收货.");
		msg.append("<br><br><br><br><br><div 'float:right'>供应商:" + vendor.getName() + "</div>");
		msg.append("<br>地址:" + vendor.getAddress());
		msg.append("<br>传真:" + vendor.getFax());
		msg.append("<br>电话:" + vendor.getTel());
		try {
			if (!StringUtils.isNullOrEmpty(address)) {
				SendMailUtil.sendEmail(sub, msg.toString(), address, 60 * 1000);
			}
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(删除发货单)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月24日 下午4:57:24
	 * @version V1.0
	 */
	public void delete(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.delete(dto);
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(取消发货状态)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月24日 下午4:57:21
	 * @version V1.0
	 */
	public void cancelComplete(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.cancelComplete(dto);
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月26日 下午2:22:48
	 * @version V1.0
	 */
	public void createDelByOrder(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		venDeliverService.AccectOrder(dto);
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(查询所有订单明细)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月27日 下午2:42:23
	 * @version V1.0
	 * @throws IOException
	 */
	public void getDeliveritms(BusinessRequest res) throws IOException {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(venDeliverService.getDeliveritms(dto.getVenDeliver().getDeliverId())));
	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(导入发票,excel,按着订单明细ID)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月20日 下午1:58:28
	 * @version V1.0
	 * @throws IOException
	 */
	public void uploadByOrderItmAndroid(BusinessRequest res) throws IOException {

		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		Long vendorId = WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		// 生成随机文件名
		String newFileName = UUID.randomUUID().toString();
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadtmps");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}

		File dstFile = new File(storageFileName, newFileName);
		com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);

		//
		SysImpModelDto SysImpModelDto = new SysImpModelDto();
		SysImpModelDto.setImpModel(new ImpModel());
		SysImpModelDto.getImpModel().setType("IMPBYORDERITEM");
		List<ImpModel> listImpModels = sysImpModelService.getModelList(SysImpModelDto);
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getName());
		}
		dto.setMsg("<BR>");
		// 读取excel
		try {
			dto.setOpFlg("1");
			// 读取Excel文件
			HSSFWorkbook workbook = null;
			HSSFSheet sheet = null;
			HSSFRow row = null;
			HSSFCell cell = null;

			workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			sheet = workbook.getSheetAt(0);

			// 明细
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {

				row = sheet.getRow(numRows);

				VenDeliveritm venDeliveritm = new VenDeliveritm();
				String orderNo = "";
				String venincCode = "";
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					;
					switch (colNameString) {
					case "订单明细ID":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							if (!StringUtils.isNullOrEmpty(cell.getStringCellValue())) {
								venDeliveritm.setDeliveritmOrderitmid(Long.valueOf(cell.getStringCellValue()));
							}
						}
						break;
					case "供应商药品代码":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							if (!StringUtils.isNullOrEmpty(cell.getStringCellValue())) {
								venincCode = cell.getStringCellValue();
							}
						}
						break;
					case "发票号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							if (!StringUtils.isNullOrEmpty(cell.getStringCellValue())) {
								venDeliveritm.setDeliveritmInvnoe(cell.getStringCellValue());
							}
						}
						break;
					case "数量":
						if (cell != null) {
							venDeliveritm.setDeliveritmQty((float) cell.getNumericCellValue());
						}
						break;
					case "批号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							venDeliveritm.setDeliveritmBatno(cell.getStringCellValue());
						}
						break;
					case "效期":
						if (cell != null) {
							venDeliveritm.setDeliveritmExpdate(cell.getDateCellValue());
						}
						break;
					case "进价":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							venDeliveritm.setDeliveritmRp((float) cell.getNumericCellValue());
						}
						break;
					case "进价金额":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							venDeliveritm.setDeliveritmRpamt((float) cell.getNumericCellValue());
						}
						break;
					}
				}

				if (venDeliveritm.getDeliveritmOrderitmid() == null) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行订单明细ID不能为空<br>");
					continue;
				}
				if (StringUtils.isNullOrEmpty(venincCode)) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行供应商代码不能为空<br>");
					continue;
				}
				if (StringUtils.isNullOrEmpty(venDeliveritm.getDeliveritmInvnoe())) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行发票号不能为空<br>");
					continue;
				}

				// 查询订单号
				OrderItm orderItm = commonService.get(OrderItm.class, venDeliveritm.getDeliveritmOrderitmid());
				if (orderItm == null) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行订单明细ID：" + venDeliveritm.getDeliveritmOrderitmid() + "错误<br>");
					continue;

				}
				// 处理转换系数
				Long venIncId = venIncService.getVenIncByCode(venincCode.trim(), vendorId);
				if (venIncId == null) {
					dto.setOpFlg("-11");
					dto.setMsg(dto.getMsg() + "第" + numRows + "供应商药品代码：" + venincCode.trim() + ",vendorId:" + vendorId + "错误<br>");
					continue;
				}

				orderNo = orderItm.getOrdId().toString();
				// 校验发票号是否重复
				boolean invFlag = venDeliverService.checkInvExist(venDeliveritm.getDeliveritmInvnoe(), venDeliveritm.getDeliveritmOrderitmid());
				if (!invFlag) {
					dto.setOpFlg("-11");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行发票号：" + venDeliveritm.getDeliveritmInvnoe() + "重复<br>");
					continue;
				}

				Float fac = venDeliverService.getFac(orderItm.getIncId(), venIncId);
				if (fac == null) {
					dto.setOpFlg("-11");
					dto.setMsg(dto.getMsg() + "第" + numRows + "药品转换系数维护错误<br>");
					continue;
				}
				venDeliveritm.setDeliveritmHopincid(orderItm.getIncId());
				venDeliveritm.setDeliveritmVenincid(venIncId);
				venDeliveritm.setDeliveritmFac(fac);
				venDeliveritm.setDeliveritmHisQty(venDeliveritm.getDeliveritmQty().floatValue() * fac.floatValue());
				venDeliveritm.setDeliveritmHisRp(venDeliveritm.getDeliveritmRp().floatValue() * fac.floatValue());
				if (dto.getOrderMap() != null && dto.getOrderMap().containsKey(orderNo)) {
					dto.getOrderMap().get(orderNo).add(venDeliveritm);
				} else {
					List<VenDeliveritm> venDeliveritms2 = new ArrayList<VenDeliveritm>();
					venDeliveritms2.add(venDeliveritm);
					dto.getOrderMap().put(orderNo, venDeliveritms2);
				}
			}

			workbook = null;
			if (!dto.getOpFlg().equals("1")) {
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				return;
			}
			dto.setOperateType("Excel 导入");
			venDeliverService.impByOrderItm(dto);
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
		} catch (Exception e) {
			dto.setOpFlg("-2");
			dto.setMsg(dto.getMsg() + "<BR>" + e.getLocalizedMessage());
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			e.printStackTrace();
			// throw new DataBaseException(e.getMessage(), e);

		} finally {
			// 删除upload文件夹下的所有文件
			FileUtils.forceDelete(dstFile);
		}

	}

	/**
	 * 
	 * @Title: VenDeliverBlh.java
	 * @Description: TODO(检查发货单状态更具发货主表ID)
	 * @param res
	 * @throws IOException
	 * @return:void
	 * @author zhouxin
	 * @date 2014年7月23日 下午2:21:58
	 * @version V1.0
	 */
	public void checkDelState(BusinessRequest res) throws IOException {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		VenDeliver venDeliver = commonService.get(VenDeliver.class, dto.getVenDeliver().getDeliverId());
		ExeState ExeState = commonService.get(ExeState.class, venDeliver.getDeliverExestateid());
		WebContextHolder.getContext().getResponse().getWriter().write(ExeState.getStateId().toString());
		// WebContextHolder.getContext().getResponse().getWriter().write("4");
	}

	/**
	 * 
	 * @Title: uploadInvAndroid
	 * @Description: TODO(导入发票信息)
	 * @param @param res
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年6月2日 上午9:42:19
	 */
	public void uploadInvAndroid(BusinessRequest res) throws IOException {

		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		// Long
		// vendorId=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		// 生成随机文件名
		String newFileName = UUID.randomUUID().toString();
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadtmps");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}

		File dstFile = new File(storageFileName, newFileName);
		com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);

		//
		SysImpModelDto SysImpModelDto = new SysImpModelDto();
		SysImpModelDto.setImpModel(new ImpModel());
		SysImpModelDto.getImpModel().setType("IMPBYORDERITEM");
		List<ImpModel> listImpModels = sysImpModelService.getModelList(SysImpModelDto);
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getName());
		}
		dto.setMsg("<BR>");
		// 读取excel
		try {
			List<OrderDetailSub> orderDetailSubs = new ArrayList<OrderDetailSub>();
			dto.setOpFlg("1");
			// 读取Excel文件
			Workbook workbook = null;
			Sheet sheet = null;
			Row row = null;
			Cell cell = null;

			String prefix = dto.getUploadFileName().substring(dto.getUploadFileName().lastIndexOf(".") + 1);
			if (prefix.equals("xls")) {
				workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			} else if (prefix.equals("xlsx")) {
				workbook = new XSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			} else {
				dto.setOpFlg("-11");
				dto.setMsg("<br>文件类型错误:");
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				return;
			}
			sheet = workbook.getSheetAt(0);

			// 明细
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {

				row = sheet.getRow(numRows);
				OrderDetailSub orderDetailSub = new OrderDetailSub();
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					;
					switch (colNameString) {
					case "订单明细ID":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							if (!StringUtils.isNullOrEmpty(cell.getStringCellValue())) {
								orderDetailSub.setOrdSubDetailId(Long.valueOf(cell.getStringCellValue()));
							}
						}
						break;
					case "供应商药品代码":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							if (!StringUtils.isNullOrEmpty(cell.getStringCellValue())) {
								// venincCode=cell.getStringCellValue();
							}
						}
						break;
					case "发票号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							if (!StringUtils.isNullOrEmpty(cell.getStringCellValue())) {
								orderDetailSub.setOrdSubInvNo(cell.getStringCellValue());
							}
						}
						break;
					case "数量":
						if (cell != null) {
							orderDetailSub.setOrderSubQty((float) cell.getNumericCellValue());
						}
						break;
					case "批号":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							orderDetailSub.setOrdSubBatNo(cell.getStringCellValue());
						}
						break;
					case "效期":
						if (cell != null) {
							orderDetailSub.setOrdSubExpDate(cell.getDateCellValue());
						}
						break;
					case "进价":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							orderDetailSub.setOrderSubRp((float) cell.getNumericCellValue());
						}
						break;
					case "进价金额":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
							orderDetailSub.setOrderSubRpAmt((float) cell.getNumericCellValue());
						}
						break;
					}
				}

				if (orderDetailSub.getOrdSubDetailId() == null) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行订单明细ID不能为空<br>");
					continue;
				}
				/*
				 * if(StringUtils.isNullOrEmpty(venincCode)){
				 * dto.setOpFlg("-12");
				 * dto.setMsg(dto.getMsg()+"第"+numRows+"行供应商代码不能为空<br>");
				 * continue; }
				 */
				if (StringUtils.isNullOrEmpty(orderDetailSub.getOrdSubInvNo())) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行发票号不能为空<br>");
					continue;
				}

				// 查询订单号
				OrderDetail orderDetail = commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
				if (orderDetail == null) {
					dto.setOpFlg("-12");
					dto.setMsg(dto.getMsg() + "第" + numRows + "行订单明细ID：" + orderDetailSub.getOrdSubDetailId() + "错误<br>");
					continue;
				}
				orderDetailSub.setOrdSubUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
				orderDetailSub.setOrderSubHisQty(orderDetailSub.getOrderSubQty().floatValue() / orderDetail.getOrderFac().floatValue());
				orderDetailSub.setOrderSubHisRp(orderDetailSub.getOrderSubRp().floatValue() / orderDetail.getOrderFac().floatValue());
				orderDetailSub.setOrdSubDate(new Date());
				orderDetailSubs.add(orderDetailSub);
			}

			workbook = null;
			if (!dto.getOpFlg().equals("1")) {
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				return;
			}
			dto.setOperateType("Excel 导入");
			dto.setOrderDetailSubs(orderDetailSubs);
			venDeliverService.impInvByOrd(dto);
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
		} catch (Exception e) {
			dto.setOpFlg("-2");
			dto.setMsg(dto.getMsg() + "<BR>" + e.getLocalizedMessage());
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			e.printStackTrace();
			// throw new DataBaseException(e.getMessage(), e);

		} finally {
			// 删除upload文件夹下的所有文件
			FileUtils.forceDelete(dstFile);
		}

	}

	/**
	 * 
	 * @Title: deleteImpInv
	 * @Description: TODO(删除上传发票)
	 * @param @param res
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年6月2日 下午5:40:30
	 */
	public void deleteImpInv(BusinessRequest res) throws IOException {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		dto.setOperateResult(new OperateResult());
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getImpId())) {
			VenDel venDel = commonService.get(VenDel.class, dto.getImpId());
			if (venDel != null) {
				if (venDel.getDelvSendFlag() == null) {
					List<OrderDetailSub> orderDetailSubs = commonService.findByProperty(OrderDetailSub.class, "orderSubImpId", dto.getImpId());
					for (OrderDetailSub orderDetailSub : orderDetailSubs) {
						if (orderDetailSub.getOrdSubStatus() == null) {
							commonService.delete(orderDetailSub);
						}
					}
					commonService.delete(venDel);
					dto.getOperateResult().setResultCode("1");
				} else {
					dto.getOperateResult().setResultContent("以发货,不能删除");
				}

			} else {
				dto.getOperateResult().setResultContent("入参错误");
			}
		} else {
			dto.getOperateResult().setResultContent("入参为空");
		}
		super.writeJSON(dto.getOperateResult());
	}

	/**
	 * 
	 * @Title: deleteImpInv
	 * @Description: TODO(发货)
	 * @param @param res
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年6月2日 下午7:24:34
	 */
	public void sendImpInv(BusinessRequest res) throws IOException {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		dto.setOperateResult(new OperateResult());
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getImpId())) {
			VenDel venDel = commonService.get(VenDel.class, dto.getImpId());
			if (venDel != null) {
				if (venDel.getDelvSendFlag() == null) {
					List<OrderDetailSub> orderDetailSubs = commonService.findByProperty(OrderDetailSub.class, "orderSubImpId", dto.getImpId());
					for (OrderDetailSub orderDetailSub : orderDetailSubs) {
						if (orderDetailSub.getOrdSubStatus() == null) {
							orderDetailSub.setOrdSubStatus("Y");
							commonService.saveOrUpdate(orderDetailSub);

							OrderDetail orderDetail = commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
							orderDetail.setOrderState(3l);
							commonService.saveOrUpdate(orderDetail);

							ExeState exeState = new ExeState();
							exeState.setStateId(Long.valueOf(3));
							exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
							exeState.setOrdId(orderDetail.getOrderId());
							exeState.setRemark(orderDetailSub.getOrdSubInvNo());
							exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
							commonService.saveOrUpdate(exeState);
						}
					}
					venDel.setDelvSendFlag("1");
					commonService.saveOrUpdate(venDel);
					dto.getOperateResult().setResultCode("1");
				} else {
					dto.getOperateResult().setResultContent("以发货,不能删除");
				}

			} else {
				dto.getOperateResult().setResultContent("入参错误");
			}
		} else {
			dto.getOperateResult().setResultContent("入参为空");
		}
		super.writeJSON(dto.getOperateResult());
	}

	// //打印条码*************************************************************************************

	/**
	 * 
	 * @Title: Print
	 * @Description: TODO(打印发货单)
	 * @param @param res
	 * @param @return
	 * @param @throws IOException 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月26日 下午8:06:53
	 */
	public String Print(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrdIdStr())) {
			String servicePassword = PropertiesBean.getInstance().getProperty("confg.serviceKey");
			List<PrintVo> printVos = new ArrayList<PrintVo>();
			if (dto.getOrdIdStr().contains(" ")) {
				dto.setOrdIdStr(dto.getOrdIdStr().replace(" ", "+"));
			}
			String[] ords = dto.getOrdIdStr().split(",");
			for (String ordno : ords) {
				ordno = AESCoder.aesCbcDecrypt(ordno.trim(), servicePassword);
				OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(ordno));
				Hospital hospital = commonService.get(Hospital.class, orderDetail.getOrderHopId());
				HopCtloc ctloc = commonService.get(HopCtloc.class, orderDetail.getOrderRecLoc());
				PrintVo printVo = new PrintVo();
				printVo.setHisno(orderDetail.getOrderNo());
				printVo.setOrdrid(orderDetail.getOrderId());
				printVo.setOrderDate(orderDetail.getOrderDate());
				if (orderDetail.getOrderRecDestination() != null) {
					HopCtlocDestination hopCtlocDestination = commonService.get(HopCtlocDestination.class, orderDetail.getOrderRecDestination());
					printVo.setDestination(hopCtlocDestination.getDestination());
				}

				printVo.setHopname(hospital.getHospitalName());
				printVo.setRecloc(ctloc.getName());

				printVo.setDeliverItmVos(new ArrayList<DeliverItmVo>());
				PagerModel model = new PagerModel();
				model.setPageSize(999999);
				dto.setPageModel(model);
				dto.setOrderno(orderDetail.getOrderNo());
				venDeliverService.listDeliverItmNew(dto);
				Float sumamt = 0f;
				for (Object o : dto.getPageModel().getPageData()) {
					DeliverItmVo deliverItmVo = (DeliverItmVo) o;
					printVo.getDeliverItmVos().add(deliverItmVo);
					sumamt = sumamt + deliverItmVo.getRpamt().floatValue();

					OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, deliverItmVo.getDeliveritmid());
					orderDetailSub.setOrderSubPrintFlag("1");
					commonService.saveOrUpdate(orderDetailSub);

				}
				printVo.setAmt(sumamt);
				printVos.add(printVo);
			}
			dto.setPrintVos(printVos);
		}
		return "print";
	}

	/**
	 * 
	 * @Title: PrintByQtySelect
	 * @Description: TODO(打印选择的商品条码，按数量)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年11月26日 上午9:05:26
	 */
	public String PrintByQtySelect(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);

		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrdIdStr())) {
			String insertFlag = "N";
			List<PrintByQtyVo> printByQtyVos = new ArrayList<PrintByQtyVo>();
			String[] ords = dto.getOrdIdStr().split(",");
			for (String ordno : ords) {
				OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, ordno);
				if (orderDetailSub != null) {
					List<OrdLabel> ordLabels = commonService.findByProperty(OrdLabel.class, "labelParentId", ordno);
					if (ordLabels.size() == 0) {
						insertFlag = "Y";
					}
					OrderDetail detail = commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
					VenInc venInc = commonService.get(VenInc.class, detail.getOrderVenIncId());
					if (insertFlag.equals("Y")) {
						for (int i = 0; i < orderDetailSub.getOrderSubQty(); i++) {
							PrintByQtyVo printByQtyVo = new PrintByQtyVo();
							printByQtyVo.setSeq(i + 1);
							printByQtyVo.setVenincname(venInc.getVenIncName());
							OrdLabel ordLabel = new OrdLabel(orderDetailSub.getOrdSubId(), "D");
							commonService.saveOrUpdate(ordLabel);
							printByQtyVo.setDeliveritmid(ordLabel.getLabelId());
							printByQtyVos.add(printByQtyVo);
						}
					}else{
						int i=0;
						for(OrdLabel label:ordLabels){
							i++;
							PrintByQtyVo printByQtyVo = new PrintByQtyVo();
							printByQtyVo.setSeq(i + 1);
							printByQtyVo.setVenincname(venInc.getVenIncName());
							printByQtyVo.setDeliveritmid(label.getLabelId());
							printByQtyVos.add(printByQtyVo);
						}
					}

				}
			}
			dto.setPrintByQtyVos(printByQtyVos);
		}
		return "PrintByQty";
	}

	public String PrintByQty(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrdIdStr())) {
			String servicePassword = PropertiesBean.getInstance().getProperty("confg.serviceKey");
			if (dto.getOrdIdStr().contains(" ")) {
				dto.setOrdIdStr(dto.getOrdIdStr().replace(" ", "+"));
			}
			String[] ords = dto.getOrdIdStr().split(",");
			List<PrintByQtyVo> printByQtyVos = new ArrayList<PrintByQtyVo>();
			for (String ordno : ords) {
				ordno = AESCoder.aesCbcDecrypt(ordno.trim(), servicePassword);
				OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(ordno));
				if (orderDetail != null) {
					VenInc venInc = commonService.get(VenInc.class, orderDetail.getOrderVenIncId());
					String[] propertyNames = { "ordSubDetailId", "ordSubStatus" };
					Object[] values = { orderDetail.getOrderId(), "Y" };
					List<OrderDetailSub> detailSubs = commonService.findByProperties(OrderDetailSub.class, propertyNames, values);
					for (OrderDetailSub orderDetailSub : detailSubs) {
						String insertFlag="N";
						List<OrdLabel> ordLabels = commonService.findByProperty(OrdLabel.class, "labelParentId", orderDetailSub.getOrdSubId());
						if (ordLabels.size() == 0) {
							insertFlag = "Y";
						}
						if (insertFlag.equals("Y")) {
							for (int i = 0; i < orderDetailSub.getOrderSubQty(); i++) {
								PrintByQtyVo printByQtyVo = new PrintByQtyVo();
								printByQtyVo.setSeq(i + 1);
								printByQtyVo.setVenincname(venInc.getVenIncName());
								OrdLabel ordLabel = new OrdLabel(orderDetailSub.getOrdSubId(), "D");
								commonService.saveOrUpdate(ordLabel);
								printByQtyVo.setDeliveritmid(ordLabel.getLabelId());
								printByQtyVos.add(printByQtyVo);
							}
						}else{
							int i=0;
							for(OrdLabel label:ordLabels){
								i++;
								PrintByQtyVo printByQtyVo = new PrintByQtyVo();
								printByQtyVo.setSeq(i + 1);
								printByQtyVo.setVenincname(venInc.getVenIncName());
								printByQtyVo.setDeliveritmid(label.getLabelId());
								printByQtyVos.add(printByQtyVo);
							}
						}
					}
				}
			}
			dto.setPrintByQtyVos(printByQtyVos);
		}
		return "PrintByQty";
	}

	public String PrintOrder(BusinessRequest res) {
		VenDeliverDto dto = super.getDto(VenDeliverDto.class, res);
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrdIdStr())) {
			String servicePassword = PropertiesBean.getInstance().getProperty("confg.serviceKey");
			if (dto.getOrdIdStr().contains(" ")) {
				dto.setOrdIdStr(dto.getOrdIdStr().replace(" ", "+"));
			}
			String[] ords = dto.getOrdIdStr().split(",");
			List<PrintVo> printVos = new ArrayList<PrintVo>();
			for (String ordno : ords) {
				ordno = AESCoder.aesCbcDecrypt(ordno.trim(), servicePassword);
				OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(ordno));
				Hospital hospital = commonService.get(Hospital.class, orderDetail.getOrderHopId());
				HopCtloc ctloc = commonService.get(HopCtloc.class, orderDetail.getOrderRecLoc());
				PrintVo printVo = new PrintVo();
				printVo.setHisno(orderDetail.getOrderNo());
				printVo.setOrderDate(orderDetail.getOrderDate());
				if (orderDetail.getOrderRecDestination() != null) {
					HopCtlocDestination hopCtlocDestination = commonService.get(HopCtlocDestination.class, orderDetail.getOrderRecDestination());
					printVo.setDestination(hopCtlocDestination.getDestination());
				}
				printVo.setHopname(hospital.getHospitalName());
				printVo.setRecloc(ctloc.getName());
				

				printVo.setDeliverItmVos(new ArrayList<DeliverItmVo>());
				PagerModel model = new PagerModel();
				model.setPageSize(999999);
				dto.setPageModel(model);
				dto.setOrderno(orderDetail.getOrderNo());
				venDeliverService.listDeliverItmNew(dto);
				Float sumamt = 0f;
				for (Object o : dto.getPageModel().getPageData()) {
					DeliverItmVo deliverItmVo = (DeliverItmVo) o;
					printVo.getDeliverItmVos().add(deliverItmVo);
					sumamt = sumamt + deliverItmVo.getRpamt().floatValue();
					OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, deliverItmVo.getDeliveritmid());
					orderDetailSub.setOrderSubPrintFlag("1");
					commonService.saveOrUpdate(orderDetailSub);
				}
				
				
				
				
				
				
				
				
				
				
				
			//打印随行单（按订单）打印后使状态变为已打印状态的方法；
				printVo.setDeliverItmVos(new ArrayList<DeliverItmVo>());
				PagerModel model = new PagerModel();
				model.setPageSize(999999);
				dto.setPageModel(model);
				dto.setOrderno(orderDetail.getOrderNo());
				venDeliverService.listDeliverItmNew(dto);
				Float sumamt = 0f;
				for (Object o : dto.getPageModel().getPageData()) {
					DeliverItmVo deliverItmVo = (DeliverItmVo) o;
					printVo.getDeliverItmVos().add(deliverItmVo);
					sumamt = sumamt + deliverItmVo.getRpamt().floatValue();
					OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, deliverItmVo.getDeliveritmid());
					orderDetailSub.setOrderSubPrintFlag("1");
					commonService.saveOrUpdate(orderDetailSub);

				}
				
				printVo.setOrdrid(orderDetail.getOrderId());
				printVos.add(printVo);
			}
			dto.setPrintVos(printVos);
		}
		return "PrintOrder";
	}
}
