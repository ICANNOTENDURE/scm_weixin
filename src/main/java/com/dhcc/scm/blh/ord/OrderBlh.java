/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ord;

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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.mail.EmailException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.SendMailUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.Ord;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ws.HisCmpRecWeb;
import com.dhcc.scm.entity.vo.ws.HisIncItmWeb;
import com.dhcc.scm.entity.vo.ws.HisInvInfoItmWeb;
import com.dhcc.scm.entity.vo.ws.HisInvInfoWeb;
import com.dhcc.scm.entity.vo.ws.HisOrderItmWebVo;
import com.dhcc.scm.entity.vo.ws.HisOrderWebVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.hop.HopCtlocDestinationService;
import com.dhcc.scm.service.hop.HopCtlocService;
import com.dhcc.scm.service.hop.HopIncService;
import com.dhcc.scm.service.hop.HopVendorService;
import com.dhcc.scm.service.hop.HospitalService;
import com.dhcc.scm.service.manf.HopManfService;
import com.dhcc.scm.service.ord.OrderService;
import com.dhcc.scm.service.sys.SysImpModelService;
import com.dhcc.scm.service.ven.VenDeliverService;
import com.dhcc.scm.service.ven.VendorService;


@Component
public class OrderBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(OrderBlh.class);
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private SysImpModelService sysImpModelService;
	
	@Resource
	private HopCtlocService hopCtlocService;
	
	@Resource
	private HopIncService hopIncService;
	
	@Resource
	private HopVendorService hopVendorService;
	
	@Resource
	private HospitalService hospitalService;
	
	@Resource
	private VendorService vendorService;

	@Resource
	private VenDeliverService venDeliverService;
	
	@Resource
	private HopManfService hopManfService;
	
	@Resource
	private HopCtlocDestinationService hopCtlocDestinationService;
	
	public OrderBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		//调用对应的service方法
		orderService.list(dto);
	}
	
	//保存订单
	public void save(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.saveOrUpdate(dto);
		dto.setOpFlg("1");
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		//调用对应的service方法
		orderService.delete(dto);
		dto.setOpFlg("1");
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		//调用对应的service方法
		orderService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		//调用对应的service方法
		orderService.findById(dto);
		
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(保存购物车)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月21日 下午7:09:27
	* @version V1.0
	 */
	public void saveShopCart(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		//调用对应的service方法
		orderService.saveShopCart(dto);
		dto.setMsg("添加成功");
		dto.setOpFlg("1");
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(查询登录人的购物车)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月22日 下午2:31:51
	* @version V1.0
	 */
	public void listShopCart(BusinessRequest res) {
		
		OrderDto dto = super.getDto(OrderDto.class, res);
		dto.setShopCartVoList(orderService.listShopCart(dto));
		
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(删除购物车的一个药 )
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月23日 上午11:36:08
	* @version V1.0
	 */
	public void deleteShopCart(BusinessRequest res) {
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.deleteShopCart(dto);
		dto.setOpFlg("1");
		
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(确认购物车药品)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月27日 上午10:11:12
	* @version V1.0
	 */
	public void saveOrdInfo(BusinessRequest res) {
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		orderService.saveOrdInfo(dto);
		dto.setOpFlg("1");
		
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(返回收货地址combo)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月27日 下午3:15:12
	* @version V1.0
	 */
	public void findLocDesctionComboList(BusinessRequest res) throws IOException {
		OrderDto dto = super.getDto(OrderDto.class, res);
		List<HopCtlocDestination> destinationList=orderService.findLocDesctionComboList(dto);
		WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(destinationList));
	}
	
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(导入订单)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月31日 下午3:27:12
	* @version V1.0
	 * @throws IOException 
	 */
	@SuppressWarnings({ "unchecked" })
	public void upload(BusinessRequest res) throws IOException{
		OrderDto dto = super.getDto(OrderDto.class, res);
		
		Long hopID=null;
		Long userID=null;
		Long locId=null;
		try{
			hopID=WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
			userID=Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId());
			locId=WebContextHolder.getContext().getVisit().getUserInfo().getLocId();
		}catch(Exception e){
			dto.setOpFlg("-11");
			dto.setMsg("<br>登录超时,请重新登录:");
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			return;
		}
		dto.setMsg("<BR>");
		//生成随机文件名
		String newFileName =UUID.randomUUID().toString();
		//获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadtmps");
		//判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}

		File dstFile = new File(storageFileName,newFileName); 
        com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile,BaseConstants.BUFFER_SIZE);
        
        //
        Map<Integer,String> modelMap=new HashMap<Integer,String>();
        SysImpModelDto SysImpModelDto=new SysImpModelDto();
        SysImpModelDto.setImpModel(new ImpModel());
        SysImpModelDto.getImpModel().setType("ORDER");
        try {
        	List<ImpModel> listImpModels=sysImpModelService.getModelList(SysImpModelDto);
        	for(int i=0;i<listImpModels.size();i++){
            	modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getName());
            }
        }catch (Exception e) {
        	dto.setOpFlg("-11");
			dto.setMsg("<br>Exception:"+e.getMessage());
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			return;
		}
        
        Map<String, Order> orderMap=new HashMap<String,Order>();
        
        SysLog log=new SysLog();
        log.setOpName("医院订单excel导入");
		log.setOpIp(WebContextHolder.getContext().getRequest().getRemoteAddr().toString());
		log.setOpDate(new Date());
		log.setOpResult(dto.getMsg());
		log.setOpType("excel上传");
		log.setOpUser(commonService.get(NormalAccount.class, userID).getAccountAlias());

        
        //读取excel
        try {

        	//读取Excel文件
        	Workbook workbook = null;
			Sheet sheet = null;
			Row row = null;
			Cell cell = null;
			String prefix=dto.getUploadFileName().substring(dto.getUploadFileName().lastIndexOf(".")+1);
			if(prefix.equals("xls")){
				workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			}else if(prefix.equals("xlsx"))  {
				workbook = new XSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			}else{
				dto.setOpFlg("-11");
				dto.setMsg("<br>文件类型错误:");
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				return;
			}
			
			
			
			sheet = workbook.getSheetAt(0);
			dto.setOpFlg("1");
			
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {
				
				row = sheet.getRow(numRows);
				String orderNo="";
				//String purLoc="";
				String emflag="";
				String destion="";
				Date requireDate=null;
				String venCode="";
				float rp=0f;
				float qty=0f;
				String incCode="";
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString=modelMap.get(numCells);
					if(StringUtils.isNullOrEmpty(colNameString)) {colNameString=" ";};

					switch (colNameString) {
							case "订单号":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_STRING);
									orderNo=cell.getStringCellValue();
								}
								break;
//							case "入库科室":
//								if(cell!=null){
//									cell.setCellType(HSSFCell.CELL_TYPE_STRING);
//									purLoc=cell.getStringCellValue();	
//								}
//								break;	
							case "是否加急":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_STRING);
									emflag=cell.getStringCellValue();
								}
								break;
							case "收货地址":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_STRING);
									destion=cell.getStringCellValue();
								}
								break;
							case "要求送货时间":
								if(cell!=null){
									requireDate=cell.getDateCellValue();
								}
								break;
							case "供应商代码":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_STRING);
									venCode=cell.getStringCellValue();
								}
								break;
							case "HIS药品代码":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_STRING);
									incCode=cell.getStringCellValue();
								}
								break;	
							case "数量":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_NUMERIC);
									qty=(float)cell.getNumericCellValue();
								}
								break;	
							case "进价":
								if(cell!=null){
									cell.setCellType(Cell.CELL_TYPE_NUMERIC);
									rp=(float)cell.getNumericCellValue();
								}
								break;		
						}
				}
				
				
				if(StringUtils.isNullOrEmpty(orderNo)){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行订单号不能为空");
				}else{
					DetachedCriteria criteriaOrderNo = DetachedCriteria.forClass(Order.class);
					criteriaOrderNo.add(Restrictions.eq("orderNo",orderNo));
					criteriaOrderNo.add(Restrictions.eq("hopId", hopID));
					List<Order> orders=commonService.findByDetachedCriteria(criteriaOrderNo);
					if(orders.size()>0){
						dto.setOpFlg("-1");
						dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行订单号已经上传");
					}
				}
				
				if(StringUtils.isNullOrEmpty(venCode)){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行供应商代码不能为空");
				}
				
				if(StringUtils.isNullOrEmpty(destion)){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行收货地址不能为空");
				}
//				if(StringUtils.isNullOrEmpty(purLoc)){
//					dto.setOpFlg("-1");
//					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行请求科室不能为空");
//				}
				if(StringUtils.isNullOrEmpty(incCode)){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行供his药品代码不能为空");
				}
				
				if(qty==0f){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行供订单数量不能为0");
				}
				
				if(!dto.getOpFlg().equals("1")){
					continue;
				}
				
				OrderItm orderItm=new OrderItm();
				
				if(incCode.contains("'")){
					incCode=incCode.substring(incCode.indexOf("'")+1);
				}
				
				Long incId=hopIncService.getHopIncByCode(incCode,hopID);
				if(incId==null){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行"+incCode+"，医院药品代码错误");
					continue;
				}
				HopInc hopInc=commonService.get(HopInc.class, incId);
				orderItm.setIncId(incId);
				orderItm.setReqqty(qty);
				orderItm.setRp(rp);
				orderItm.setUom(hopInc.getIncUomname());
				
				if(orderMap.containsKey(orderNo)){
					orderMap.get(orderNo).getItms().add(orderItm);
					continue;
				}else{
					
					HopVendor hopVendor=hopVendorService.findVendorByCode(venCode,hopID);
					if(hopVendor==null){
						dto.setOpFlg("-1");
						dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行:"+venCode+"，供应商代码错误");
						continue;
					}
					
					
					HopCtlocDestination ctlocDestination=hopCtlocDestinationService.getDesctionByCode(destion, hopID);
					Long recLocId=null;
					Long desctId=null;
					if(ctlocDestination==null){
						dto.setOpFlg("-1");
						dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行:"+destion+"，收货地址错误");
						continue;
					}else{
						recLocId=ctlocDestination.getCtlocDr();
						desctId=ctlocDestination.getHopCtlocDestinationId();
					}
					

					
//					Long purLocId=hopCtlocService.getLocIdByName(purLoc);
//					if(purLocId==null){
//						dto.setOpFlg("-1");
//						dto.setMsg(dto.getMsg()+"<br>第"+numRows+"行"+purLoc+"，请求科室错误");
//						continue;
//					}
					
					
					Order order=new Order();
					order.setEmFlag(emflag);
					order.setCreateUser(userID);
					order.setOrderNo(orderNo);
					order.setHopId(hopID);
					order.setPlanDate(new Date());
					order.setVendorId(hopVendor.getHopVendorId());
					order.setPlanArrDate(requireDate);
					order.setPurLoc(locId);
					order.setRecLoc(recLocId);
					order.setRecDestination(desctId);
					List<OrderItm> itms=new ArrayList<OrderItm>();
					itms.add(orderItm);
					order.setItms(itms);
					orderMap.put(orderNo, order);
				}
			}		
			if(!dto.getOpFlg().equals("1")){
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				return;
			}
			orderService.importOrderByExcel(orderMap);
			dto.setMsg("操作成功");
			
			for(Map.Entry<String, Order> entry: orderMap.entrySet()) {
				   Order order=entry.getValue();
				   log.setOpArg(log.getOpArg()+"."+ JsonUtils.toJson(order));
			}	   

			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
			
			
        } catch (Exception e) {
        	logger.info(e);
			e.printStackTrace();
			dto.setOpFlg("-11");
			dto.setMsg(dto.getMsg()+"<br>程序异常:"+e.getLocalizedMessage());
			log.setOpResult("falie:exception:"+e.getMessage()+dto.getMsg());
		
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
		}finally{
			commonService.saveOrUpdate(log);
			FileUtils.forceDelete(dstFile);
		}
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(修改订单明细)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月5日 上午9:41:40
	* @version V1.0
	 */
	public void saveOrditm(BusinessRequest res){
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.saveOrditm(dto);
	}
	
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(删除订单明细)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月5日 上午9:42:39
	* @version V1.0
	 */
	public void deleteOrditm(BusinessRequest res){
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.deleteOrditm(dto);
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(医院确定订单完成)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月5日 下午8:42:41
	* @version V1.0
	 */
	public void complete(BusinessRequest res){
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.complete(dto);
		this.sendMailByOrder(dto.getOrder().getOrderId());
		
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(发送邮件)
	* @param orderId
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月18日 下午3:08:59
	* @version V1.0
	 */
	public void sendMailByOrder(Long orderId){
		Order order=commonService.get(Order.class, orderId);
		//发送邮件
		String sub="订单通知";
		StringBuffer msg = new StringBuffer();
		String address="";
		HopCtlocDestination ctlocDestination=commonService.get(HopCtlocDestination.class,order.getRecDestination());
		HopVendor hopVendor=commonService.get(HopVendor.class, order.getVendorId());
		Vendor vendor=commonService.get(Vendor.class, hopVendor.getHopVenId());
		Hospital hospital=commonService.get(Hospital.class, order.getHopId());
		address=vendor.getEmail();
		if(address.equals("")){
			return;
		}
		msg.append(hospital.getHospitalName()+" 新的订单:<h1>"+order.getOrderNo()+"</h1>。");
		if(order.getPlanArrDate()!=null){
			msg.append("<br>要求送达时间:"+new SimpleDateFormat("yyyy-mm-dd").format(order.getPlanArrDate()));
		}
		msg.append("<br>收货地址:"+ctlocDestination.getDestination());
		msg.append("<br>请发货.");
		msg.append("<br><br><br><br><br><div 'float:right'>联系人:"+ctlocDestination.getContact()+"</div>");
		msg.append("<br>电话:"+ctlocDestination.getTel());
		try {
			if(!StringUtils.isNullOrEmpty(address)){
				SendMailUtil.sendEmail(sub, msg.toString(),address,60 * 1000);
			}
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(取消完成状态)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月17日 下午2:00:55
	* @version V1.0
	 */
	public void cancleComplete(BusinessRequest res){
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.cancleComplete(dto);
		dto.setOpFlg("1");
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月17日 上午9:53:27
	* @version V1.0
	 */
	public void saveMain(BusinessRequest res) {
	
		OrderDto dto = super.getDto(OrderDto.class, res);
		if(dto.getOrder().getOrderSerial()==null){
			Ord ord=new Ord();
			ord.setOrdDate(new java.sql.Timestamp(new Date().getTime()));
			ord.setOrdHopId(WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
			commonService.saveOrUpdate(ord);
			dto.getOrder().setOrderSerial(ord.getOrdId());
		}
		if(dto.getOrder().getHopId()==null){
			dto.getOrder().setHopId(WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		commonService.saveOrUpdate(dto.getOrder());
		dto.setOpFlg("1");
	}
	
	public void exeOrder(BusinessRequest res) {
		
		OrderDto dto = super.getDto(OrderDto.class, res);
		orderService.exeOrder(dto);
		dto.setOpFlg("1");
	}
	
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月28日 下午5:52:24
	* @version V1.0
	 */
	
	public void importOrderByWS(HisOrderWebVo hisOrderWebVo,OperateResult operateResult){

		
		this.importOrderByWSSub(hisOrderWebVo,operateResult);
		
		SysLog log=new SysLog();
		log.setOpArg(JsonUtils.toJson(hisOrderWebVo));
		log.setOpName("webservice医院同步订单");
		//log.setOpIp(WebContextHolder.getContext().getRequest().getRemoteAddr());
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(operateResult));
		log.setOpType("webservice");
		log.setOpUser(hisOrderWebVo.getHopname());
		commonService.saveOrUpdate(log);
		
	}
	@SuppressWarnings("unchecked")
	public void importOrderByWSSub(HisOrderWebVo hisOrderWebVo,OperateResult operateResult){
		if(hisOrderWebVo.getHisOrderItmWebVos().size()==0){
			operateResult.setResultCode("-1");
			operateResult.setResultContent("订单明细不能为空");
			return ;
		}
		Order order=new Order();
		
		if(StringUtils.isNullOrEmpty(hisOrderWebVo.getHopname())){
			operateResult.setResultCode("-2");
			operateResult.setResultContent("医院名称不能为空");
			return ;
		}else{
			DetachedCriteria criteria = DetachedCriteria.forClass(Hospital.class);
			criteria.add(Restrictions.eq("hospitalName", hisOrderWebVo.getHopname()));
			List<Hospital> hospitals=commonService.findByDetachedCriteria(criteria);
			if(hospitals.size()==0){
				operateResult.setResultCode("-6");
				operateResult.setResultContent("医院名称错误");
				return ;
			}
			order.setHopId(hospitals.get(0).getHospitalId());
		}
		
		if(StringUtils.isNullOrEmpty(hisOrderWebVo.getVendorname())){
			operateResult.setResultCode("-3");
			operateResult.setResultContent("供应商名称名称不能为空");
			return ;
		}else{
			DetachedCriteria criteriaVendor = DetachedCriteria.forClass(HopVendor.class);
			criteriaVendor.add(Restrictions.eq("hopCode", hisOrderWebVo.getVendorname()));
			criteriaVendor.add(Restrictions.eq("hopHopId", order.getHopId()));
			List<HopVendor> hopVendors=commonService.findByDetachedCriteria(criteriaVendor);
			if(hopVendors.size()==0){
				operateResult.setResultCode("-7");
				operateResult.setResultContent("供应商名称错误");
				return ;
			}
			order.setVendorId(hopVendors.get(0).getHopVenId());
		}
		
		if(StringUtils.isNullOrEmpty(hisOrderWebVo.getOrderno())){
			operateResult.setResultCode("-4");
			operateResult.setResultContent("医院订单号不能为空");
			return ;
		}else{
			DetachedCriteria criteriaOrderNo = DetachedCriteria.forClass(Order.class);
			criteriaOrderNo.add(Restrictions.eq("orderNo", hisOrderWebVo.getOrderno()));
			criteriaOrderNo.add(Restrictions.eq("hopId", order.getHopId()));
			List<Order> orders=commonService.findByDetachedCriteria(criteriaOrderNo);
			if(orders.size()>0){
				operateResult.setResultCode("-10");
				operateResult.setResultContent("该单号已经上传");
				return ;
			}
			order.setOrderNo(hisOrderWebVo.getOrderno());
		}
		
		
		if(StringUtils.isNullOrEmpty(hisOrderWebVo.getPurloc())){
			operateResult.setResultCode("-5");
			operateResult.setResultContent("入库科室不能不能为空");
			return ;
		}else{
			DetachedCriteria criteriaPurLoc = DetachedCriteria.forClass(HopCtloc.class);
			criteriaPurLoc.add(Restrictions.eq("name", hisOrderWebVo.getPurloc()));
			criteriaPurLoc.add(Restrictions.eq("hospid", order.getHopId()));
			List<HopCtloc> hopCtlocs=commonService.findByDetachedCriteria(criteriaPurLoc);
			if(hopCtlocs.size()==0){
				operateResult.setResultCode("-8");
				operateResult.setResultContent("采购科室名称错误");
				return ;
			}
			order.setPurLoc(hopCtlocs.get(0).getHopCtlocId());
		}
		

		if(hisOrderWebVo.getRemark()!=null){
			order.setRemark(hisOrderWebVo.getRemark());
		}
		if(!StringUtils.isNullOrEmpty(hisOrderWebVo.getPlanDate().toString())){
			order.setPlanDate(hisOrderWebVo.getPlanDate());
		}else{
			order.setPlanDate(new Date());
		}
		order.setDeliveryDate(new Date());

		if(hisOrderWebVo.getRecloc()!=null){
			DetachedCriteria criteriaRecLoc = DetachedCriteria.forClass(HopCtloc.class);
			criteriaRecLoc.add(Restrictions.eq("name", hisOrderWebVo.getRecloc()));
			criteriaRecLoc.add(Restrictions.eq("hospid", order.getHopId()));
			List<HopCtloc> hopCtlocs2=commonService.findByDetachedCriteria(criteriaRecLoc);
			if(hopCtlocs2.size()==0){
				operateResult.setResultCode("-9");
				operateResult.setResultContent("收货室名称错误");
				return ;
			}
			order.setRecLoc(hopCtlocs2.get(0).getHopCtlocId());
		}
		
		
		List<OrderItm> orderItms=new ArrayList<OrderItm>();
		for(HisOrderItmWebVo hisOrderItmWebVo:hisOrderWebVo.getHisOrderItmWebVos()){
			if(StringUtils.isNullOrEmpty(hisOrderItmWebVo.getHopIncCode())){
				operateResult.setResultCode("-1");
				operateResult.setResultContent(operateResult.getResultContent()+";药品代码为空");
				continue;
			}
			
			DetachedCriteria criteriaInc=null;
			criteriaInc= DetachedCriteria.forClass(HopInc.class);
			criteriaInc.add(Restrictions.eq("incCode", hisOrderItmWebVo.getHopIncCode()));
			criteriaInc.add(Restrictions.eq("incHospid", order.getHopId()));
			List<HopInc> hopIncs=null;
			hopIncs=commonService.findByDetachedCriteria(criteriaInc);
			if(hopIncs.size()==0){
				operateResult.setResultCode("-1");
				operateResult.setResultContent(operateResult.getResultContent()+";药品代码:"+hisOrderItmWebVo.getHopIncCode()+"平台没有,请同步药品基础数据");
				continue;
			}
			OrderItm orderItm=new OrderItm();
			orderItm.setIncId(hopIncs.get(0).getIncId());
			orderItm.setReqqty(hisOrderItmWebVo.getQty());
			orderItm.setRp(hisOrderItmWebVo.getRp());
			orderItm.setUom(hopIncs.get(0).getIncUomname());
			
			orderItms.add(orderItm);
		}
		
		if(orderItms.size()!=hisOrderWebVo.getHisOrderItmWebVos().size()){
			return ;
		}

		orderService.ImportOrderByWS(order, orderItms);
		operateResult.setResultCode("0");
		operateResult.setResultContent("success");
	}
	
	
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(his调用，入库带出明细使用)
	* @param invNo
	* @param hopName
	* @param venName
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月30日 上午10:36:09
	* @version V1.0
	 */
	public void getRecItmByInvWS(String invNo, String hopName,String venName,HisInvInfoWeb hisInvInfoWeb){
		
		this.getRecItmByInvWS(invNo, hopName, venName, hisInvInfoWeb);
		
		SysLog log=new SysLog();
		log.setOpArg(JsonUtils.toJson(hisInvInfoWeb)+",invNo:"+invNo+",venName:"+venName);
		log.setOpName("webservice医院入库查找发票");
		//log.setOpIp(WebContextHolder.getContext().getRequest().getRemoteAddr());
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(hisInvInfoWeb.getResultContent()));
		log.setOpType("webservice");
		log.setOpUser(hopName);
		commonService.saveOrUpdate(log);
	}	
	
	@SuppressWarnings("unchecked")
	public void getRecItmByInvWSSub(String invNo, String hopName,String venName,HisInvInfoWeb hisInvInfoWeb){
		Long hopId=null;
		Long vendorId=null;
		if(StringUtils.isNullOrEmpty(invNo)){
			hisInvInfoWeb.setResultCode("1");
			hisInvInfoWeb.setResultContent("发票号为空");
			return;
		}
		if(StringUtils.isNullOrEmpty(hopName)){
			hisInvInfoWeb.setResultCode("1");
			hisInvInfoWeb.setResultContent("医院名称为空");
			return;
		}else{
			Hospital hospital=hospitalService.getHospitalByName(hopName);
			if(hospital==null){
				hisInvInfoWeb.setResultCode("1");
				hisInvInfoWeb.setResultContent("医院名称错误");
				return;
			}else{
				hopId=hospital.getHospitalId();
			}
		}
		if(StringUtils.isNullOrEmpty(venName)){
			hisInvInfoWeb.setResultCode("1");
			hisInvInfoWeb.setResultContent("供应商名称为空");
			return;
		}else{
			DetachedCriteria criteriaVendor = DetachedCriteria.forClass(Vendor.class);
			criteriaVendor.add(Restrictions.eq("code", venName));
			List<Vendor> hopVendors=commonService.findByDetachedCriteria(criteriaVendor);
			if(hopVendors.size()==0){
				hisInvInfoWeb.setResultCode("1");
				hisInvInfoWeb.setResultContent("供应商名称错误");
				return;
			}
			vendorId=hopVendors.get(0).getVendorId();
		}
		
		List<HisInvInfoItmWeb> hisInvInfoItmWebs=venDeliverService.getRecItmByInv(hopId, vendorId, invNo);
		if(hisInvInfoItmWebs.size()>0){
			hisInvInfoWeb.setHisInvInfoItmWebs(hisInvInfoItmWebs);
			hisInvInfoWeb.setResultCode("0");
			hisInvInfoWeb.setResultContent("sucess");
			return;
		}else{
			hisInvInfoWeb.setResultCode("1");
			hisInvInfoWeb.setResultContent("发票号码无效,错误");
		}
	}
	
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(同步HIS药品)
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月30日 下午5:36:32
	* @version V1.0
	 */
	public void saveHisIncWS(HisIncItmWeb hisIncItmWeb,OperateResult operateResult,String hopName){
		
		this.saveHisIncWSSub(hisIncItmWeb, operateResult, hopName);
		SysLog log=new SysLog();
		log.setOpArg(JsonUtils.toJson(hisIncItmWeb)+",hopName:"+hopName);
		log.setOpName("webservice医院药品字典信息同步");
		//log.setOpIp(WebContextHolder.getContext().getRequest().getRemoteAddr());
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(operateResult));
		log.setOpType("webservice");
		log.setOpUser(hopName);
		commonService.saveOrUpdate(log);
	}
	
    public void saveHisIncWSSub(HisIncItmWeb hisIncItmWeb,OperateResult operateResult,String hopName){
		
		if(hisIncItmWeb==null){
			operateResult.setResultCode("1");
			operateResult.setResultContent("入参为空");
			return;
		}
		HopInc hopInc=new HopInc();
		if(StringUtils.isNullOrEmpty(hopName)){
			operateResult.setResultCode("1");
			operateResult.setResultContent("医院名称为空");
			return;
		}else{
			Hospital hospital=hospitalService.getHospitalByName(hopName);
			if(hospital!=null){
				hopInc.setIncHospid(hospital.getHospitalId());
			}else{
				operateResult.setResultCode("1");
				operateResult.setResultContent("医院名称错误");
				return;
			}
			
		}
		if(StringUtils.isNullOrEmpty(hisIncItmWeb.getVenIncCode())){
			operateResult.setResultCode("1");
			operateResult.setResultContent("药品代码不能为空");
			return;
		}
		
		DetachedCriteria criteria = DetachedCriteria.forClass(HopInc.class);
		criteria.add(Restrictions.eq("incCode", hisIncItmWeb.getVenIncCode()));
		criteria.add(Restrictions.eq("incHospid", hopInc.getIncHospid()));
		@SuppressWarnings("unchecked")
		List<HopInc> hopIncs=commonService.findByDetachedCriteria(criteria);
		if(hopIncs.size()>0){
			hopInc.setIncId(hopIncs.get(0).getIncId());
		}
		hopInc.setIncUomname(hisIncItmWeb.getVenIncUom());
		hopInc.setIncCode(hisIncItmWeb.getVenIncCode());
		hopInc.setIncCat(hisIncItmWeb.getVenIncCat());
		hopInc.setIncName(hisIncItmWeb.getVenIncName());
		hopInc.setIncRp(hisIncItmWeb.getVenIncPrice());
		hopInc.setIncSp(hisIncItmWeb.getVenIncSp());
		hopInc.setIncSpec(hisIncItmWeb.getVenIncSpec());
		if(!StringUtils.isNullOrEmpty(hisIncItmWeb.getVenIncManf())){
				Long manfIdLong=hopManfService.getIdByName(hisIncItmWeb.getVenIncManf());
			    if(manfIdLong==null){
			    	 HopManf manf=new HopManf();
			    	 manf.setManfName(hisIncItmWeb.getVenIncManf());
			    	 commonService.saveOrUpdate(manf);
			    	 hopInc.setIncManfid(manf.getHopManfId());
			    }else{
			    	hopInc.setIncManfid(manfIdLong);
			    }
		}
		commonService.saveOrUpdate(hopInc);
		operateResult.setResultCode("0");
		operateResult.setResultContent("success");
	}
	/**
	 * 
	* @Title: OrderBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param invs
	* @param operateResult
	* @param hopname
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月1日 上午11:18:26
	* @version V1.0
	 */
	
	public void cmpRecWS(OperateResult operateResult,HisCmpRecWeb hisCmpRecWeb){
		
		this.cmpRecWSSub(operateResult, hisCmpRecWeb);
		SysLog log=new SysLog();
		log.setOpArg(JsonUtils.toJson(hisCmpRecWeb));
		log.setOpName("webservice医院入库审核入库单");
		//log.setOpIp(WebContextHolder.getContext().getRequest().getRemoteAddr());
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(operateResult));
		log.setOpType("webservice");
		log.setOpUser(hisCmpRecWeb.getHopname());
		commonService.saveOrUpdate(log);
		
	}
	@SuppressWarnings("unchecked")
	public void cmpRecWSSub(OperateResult operateResult,HisCmpRecWeb hisCmpRecWeb){
		
		Long hopId=null;
		Long vendorId=null;
		if(hisCmpRecWeb.getInvs()==null||hisCmpRecWeb.getInvs().size()==0){
			operateResult.setResultCode("1");
			operateResult.setResultContent("发票号为空");
			return;
		}
		if(StringUtils.isNullOrEmpty(hisCmpRecWeb.getHopname())){
			operateResult.setResultCode("1");
			operateResult.setResultContent("医院名称为空");
			return;
		}else{
			Hospital hospital=hospitalService.getHospitalByName(hisCmpRecWeb.getHopname());
			if(hospital==null){
				operateResult.setResultCode("1");
				operateResult.setResultContent("医院名称错误");
				return;
			}else{
				hopId=hospital.getHospitalId();
			}
		}
		if(StringUtils.isNullOrEmpty(hisCmpRecWeb.getVenname())){
			operateResult.setResultCode("1");
			operateResult.setResultContent("供应商名称为空");
			return;
		}else{
			//vendorId=vendorService.findVendorIdByName(hisCmpRecWeb.getVenname());
			DetachedCriteria criteriaVendor = DetachedCriteria.forClass(Vendor.class);
			criteriaVendor.add(Restrictions.eq("code", hisCmpRecWeb.getVenname()));
			List<Vendor> hopVendors=commonService.findByDetachedCriteria(criteriaVendor);
			if(hopVendors.size()==0){
				operateResult.setResultCode("1");
				operateResult.setResultContent("供应商名称错误");
				return;
			}
			vendorId=hopVendors.get(0).getVendorId();
		}
		
		for(String inv:hisCmpRecWeb.getInvs()){
			List<HisInvInfoItmWeb> hisInvInfoItmWebs=venDeliverService.getRecItmByInv(hopId, vendorId, inv);
			if(hisInvInfoItmWebs.size()>0){
				VenDeliveritm VenDeliveritm=commonService.get(VenDeliveritm.class, hisInvInfoItmWebs.get(0).getDeliveritmid());
				VenDeliveritm.setDeliveritmRecFlag("1");
				commonService.saveOrUpdate(VenDeliveritm);
			}else{
				operateResult.setResultCode("-1");
				operateResult.setResultContent(operateResult.getResultContent()+","+inv+"发票号码错误,");
			}
		}
		
	}
}
