package com.dhcc.scm.ws.his;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.jws.WebService;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.scm.blh.hop.HopCtlocBlh;
import com.dhcc.scm.blh.hop.HopIncBlh;
import com.dhcc.scm.blh.hop.HopIncLocBlh;
import com.dhcc.scm.blh.hop.HopVendorBlh;
import com.dhcc.scm.blh.ord.OrdBlh;
import com.dhcc.scm.blh.ord.OrderBlh;
import com.dhcc.scm.dao.ven.VendorDao;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hv.HvLabel;
import com.dhcc.scm.entity.ord.OrdLabel;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailPic;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.st.StInGdRecItm;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.ven.VenIncqQualif;
import com.dhcc.scm.entity.ven.VenIncqQualifPic;
import com.dhcc.scm.entity.ven.VenQualifPic;
import com.dhcc.scm.entity.ven.VenQualification;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ws.FileWrapper;
import com.dhcc.scm.entity.vo.ws.HisCmpRecWeb;
import com.dhcc.scm.entity.vo.ws.HisHvInvWeb;
import com.dhcc.scm.entity.vo.ws.HisHvLabelWeb;
import com.dhcc.scm.entity.vo.ws.HisInGdRec;
import com.dhcc.scm.entity.vo.ws.HisInGdRecItm;
import com.dhcc.scm.entity.vo.ws.HisIncLocQtyWeb;
import com.dhcc.scm.entity.vo.ws.HisIncWeb;
import com.dhcc.scm.entity.vo.ws.HisInvInfoItmWeb;
import com.dhcc.scm.entity.vo.ws.HisInvInfoWeb;
import com.dhcc.scm.entity.vo.ws.HisLocWeb;
import com.dhcc.scm.entity.vo.ws.HisOrderWeb;
import com.dhcc.scm.entity.vo.ws.HisOrderWebVo;
import com.dhcc.scm.entity.vo.ws.HisPicWeb;
import com.dhcc.scm.entity.vo.ws.HisVendorWeb;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.vo.ws.VenQualifyWeb;
import com.dhcc.scm.entity.vo.ws.VenQualifyWebItm;

/**
 * @author auto-generated by AnnoParameterParser
 * @timestamp 2014-07-10 09:36:34.205
 */
@WebService(endpointInterface = "com.dhcc.scm.ws.his.HisInfoServiceInterface", targetNamespace = "http://his.ws.scm.dhcc.com/", portName = "HisInfoServiceServiceHttpSoap12Endpoint")
public class HisInfoService implements HisInfoServiceInterface {

	@Resource
	private OrderBlh blh;

	@Resource
	private HopIncLocBlh hopIncLocBlh;

	@Resource
	private HopIncBlh hopIncBlh;

	@Resource
	private HopCtlocBlh hopCtlocBlh;

	@Resource
	private HopVendorBlh hopVendorBlh;

	@Resource
	private OrdBlh ordBlh;

	@Resource
	private CommonService commonService;

	@Resource
	private VendorDao vendorDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dhcc.scm.ws.his.HisInfoServiceInterface#getHopInc(com.dhcc.scm.entity
	 * .vo.ws.VenIncWeb)
	 */
	@Override
	public OperateResult getHopInc(HisIncWeb hisIncWeb) {
		OperateResult operateResult = new OperateResult();
		try {
			hopIncBlh.syncHisInc(operateResult, hisIncWeb);
		} catch (Exception e) {
			SysLog log = new SysLog();
			log.setOpArg(JsonUtils.toJson(hisIncWeb));
			log.setOpName("webservice同步医院商品信息");
			log.setOpDate(new Date());
			log.setOpResult(e.getMessage());
			log.setOpType("webservice");
			log.setOpUser(hisIncWeb.getUserName());
			commonService.saveOrUpdate(log);
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		}
		return operateResult;
	}

	/**
	 * 
	 */
	@Override
	public OperateResult getHisOrder(HisOrderWebVo hisOrderWebVo) {
		OperateResult operateResult = new OperateResult();
		try {
			blh.importOrderByWS(hisOrderWebVo, operateResult);
		} catch (Exception e) {
			e.printStackTrace();
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常1:" + e.getMessage());
		}
		return operateResult;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dhcc.scm.ws.his.HisInfoServiceInterface#getRecItmByInv(java.lang.
	 * String, java.lang.String, java.lang.String)
	 */
	@Override
	public HisInvInfoWeb getRecItmByInv(String invNo, String hopName, String venName) {
		HisInvInfoWeb hisInvInfoWeb = new HisInvInfoWeb();
		
		try {
			blh.getRecItmByInvWSSub(invNo, hopName, venName, hisInvInfoWeb);
		} catch (Exception e) {
			SysLog log = new SysLog();
			log.setOpArg(JsonUtils.toJson(hisInvInfoWeb) + ",invNo:" + invNo + ",venName:" + venName);
			log.setOpName("webservice医院入库查找发票");
			log.setOpDate(new Date());
			log.setOpResult(JsonUtils.toJson(hisInvInfoWeb.getResultContent()));
			log.setOpType("webservice");
			log.setOpUser(hopName);
			log.setOpResult(e.getMessage());
			commonService.saveOrUpdate(log);
			hisInvInfoWeb.setResultCode("1");
			hisInvInfoWeb.setResultContent("程序异常1:" + e.getMessage());
			return hisInvInfoWeb;
		}
		return hisInvInfoWeb;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dhcc.scm.ws.his.HisInfoServiceInterface#cmpRec(java.util.List,
	 * java.lang.String)
	 */
	@Override
	public OperateResult cmpRec(HisCmpRecWeb hisCmpRecWeb) {
		// TODO Auto-generated method stub
		OperateResult operateResult = new OperateResult();
		try {
			operateResult.setResultCode("0");
			operateResult.setResultContent("success");
			blh.cmpRecWS(operateResult, hisCmpRecWeb);
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常1:" + e.getMessage());
			return operateResult;
		}
		return operateResult;
	}

	@Override
	public OperateResult getHopLocIncQty(HisIncLocQtyWeb hisIncLocQtyWeb) {
		// TODO Auto-generated method stub
		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg(JsonUtils.toJson(hisIncLocQtyWeb));
		log.setOpName("webservice同步医院科室库存");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(hisIncLocQtyWeb.getUserName());
		try {
			operateResult.setResultCode("0");
			operateResult.setResultContent("success");
			hopIncLocBlh.saveHisLocQty(operateResult, hisIncLocQtyWeb);
			log.setOpResult(JsonUtils.toJson(operateResult));
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常1:" + e.getMessage());
			log.setOpResult(JsonUtils.toJson(operateResult));
			return operateResult;
		} finally {
			commonService.saveOrUpdate(log);
		}
		return operateResult;
	}

	@Override
	public OperateResult getHopLoc(HisLocWeb hisLocWeb) {
		OperateResult operateResult = new OperateResult();
		try {
			hopCtlocBlh.syncHisLoc(operateResult, hisLocWeb);
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		}
		return operateResult;
	}

	@Override
	public OperateResult getHopVendor(HisVendorWeb hisVendorWeb) {
		OperateResult operateResult = new OperateResult();
		try {
			hopVendorBlh.syncHisVendor(operateResult, hisVendorWeb);
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		} finally {
			if (!"0".equals(operateResult.getResultCode())) {
				SysLog log = new SysLog();
				log.setOpArg(JsonUtils.toJson(hisVendorWeb));
				log.setOpName("webservice同步医院供应商信息");
				log.setOpDate(new Date());
				log.setOpType("webservice");
				log.setOpUser(hisVendorWeb.getUserName());
				log.setOpResult(JsonUtils.toJson(operateResult));
				commonService.saveOrUpdate(log);
			}

		}
		return operateResult;
	}

	@Override
	public OperateResult getHopOrder(HisOrderWeb hisOrderWeb) {
		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg(JsonUtils.toJson(hisOrderWeb));
		log.setOpName("webservice同步医院订单信息");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(hisOrderWeb.getUserName());
		try {
			ordBlh.syncHisOrder(operateResult, hisOrderWeb);
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		} finally {
			log.setOpResult(JsonUtils.toJson(operateResult));
			commonService.saveOrUpdate(log);
		}
		return operateResult;
	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public HisInGdRec listInGdRec(String usename, String password) {

		HisInGdRec hisInGdRec = new HisInGdRec();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password);
		log.setOpName("webservice同步医院发货信息");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(StInGdRecItm.class);
			detachedCriteria.add(Restrictions.isNull("ingdrecitmWsflag"));
			List<StInGdRecItm> stInGdRecItms = commonService.findByDetachedCriteria(detachedCriteria);
			for (StInGdRecItm stInGdRecItm : stInGdRecItms) {
				HisInGdRecItm hisInGdRecItm = new HisInGdRecItm();
				hisInGdRecItm.setBatNo(stInGdRecItm.getIngdrecitmBatNo());
				hisInGdRecItm.setExpdate(stInGdRecItm.getIngdrecitmExpDate());
				hisInGdRecItm.setIncBarCode(stInGdRecItm.getIngdrecitmIncBarCode());
				hisInGdRecItm.setIngdrecId(stInGdRecItm.getIngdrecitmId());
				hisInGdRecItm.setInvNo(stInGdRecItm.getIngdrecitmInvNo());
				hisInGdRecItm.setQty(stInGdRecItm.getIngdrecitmQty());
				hisInGdRecItm.setRp(stInGdRecItm.getIngdrecitmRp());
				hisInGdRecItm.setHisNo(stInGdRecItm.getIngdrecitmHisNo());
				hisInGdRecItm.setPurLocCode(stInGdRecItm.getIngdrecitmPurLocCode());
				hisInGdRecItm.setRecLocCode(stInGdRecItm.getIngdrecitmRecLocCode());
				hisInGdRecItm.setVendorCode(stInGdRecItm.getIngdrecitmVendorCode());
				hisInGdRec.getInGdRecItms().add(hisInGdRecItm);
			}
			hisInGdRec.setResultCode("0");
			hisInGdRec.setResultContent("success");
		} catch (Exception e) {
			hisInGdRec.setResultCode("1");
			hisInGdRec.setResultContent("程序异常->Exception:" + e.getMessage());
			return hisInGdRec;
		} finally {
			log.setOpResult(JsonUtils.toJson(hisInGdRec));
			commonService.saveOrUpdate(log);
		}
		return hisInGdRec;
	}

	@Override
	public OperateResult cmpInGdRec(String usename, String password, Long ingdrecId) {

		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password);
		log.setOpName("webservice同步医院入库信息：》cmpInGdRec");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {
			if (ingdrecId == null) {
				operateResult.setResultContent("入参为空!");
				return operateResult;
			}
			StInGdRecItm stInGdRecItm = commonService.get(StInGdRecItm.class, ingdrecId);
			if (stInGdRecItm != null) {
				stInGdRecItm.setIngdrecitmWsflag("1");
				commonService.saveOrUpdate(stInGdRecItm);
				operateResult.setResultCode("0");
				operateResult.setResultContent("success");
			}
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		} finally {
			log.setOpResult(JsonUtils.toJson(operateResult));
			commonService.saveOrUpdate(log);
		}
		return operateResult;
	}

	@Override
	public OperateResult getInvByRec(String usename, String password, Long ingdrecId) {

		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password + ",ingdrecId:" + ingdrecId);
		log.setOpName("webservice获取发票号：》getInvByRec");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {
			if (ingdrecId == null) {
				operateResult.setResultContent("入参为空!");
				return operateResult;
			}
			StInGdRecItm stInGdRecItm = commonService.get(StInGdRecItm.class, ingdrecId);
			if (stInGdRecItm != null) {
				operateResult.setResultCode("0");
				operateResult.setResultContent(stInGdRecItm.getIngdrecitmInvNo());
			}
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		} finally {
			log.setOpResult(JsonUtils.toJson(operateResult));
			commonService.saveOrUpdate(log);
		}
		return operateResult;
	}

	@Override
	public OperateResult syncInvByRec(String usename, String password, Long ingdrecId, String invno) {
		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password + ",ingdrecId:" + ingdrecId + ",invno:" + invno);
		log.setOpName("webservice同步医院发票号：》syncInvByRec");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {
			if (ingdrecId == null) {
				operateResult.setResultContent("入库表id为空!");
				return operateResult;
			}
			if (StringUtils.isBlank(invno)) {
				operateResult.setResultContent("发票号为空!");
				return operateResult;
			}
			StInGdRecItm stInGdRecItm = commonService.get(StInGdRecItm.class, ingdrecId);
			if (stInGdRecItm != null) {
				stInGdRecItm.setIngdrecitmInvNo(invno);
				OrderDetailSub detailSub = commonService.get(OrderDetailSub.class, stInGdRecItm.getIngdrecitmOrdsubId());
				commonService.saveOrUpdate(detailSub);
				commonService.saveOrUpdate(stInGdRecItm);
				operateResult.setResultCode("0");
			}
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		} finally {
			if (!"0".equals(operateResult.getResultCode())) {
				log.setOpResult(JsonUtils.toJson(operateResult));
				commonService.saveOrUpdate(log);
			}
		}
		return operateResult;
	}

	@Override
	public FileWrapper downLoadPic(String type, String name) {
		// TODO Auto-generated method stub

		FileWrapper fileWrapper = new FileWrapper();

		if (StringUtils.isBlank(name)) {
			fileWrapper.setResultContent("path不能为空");
			return fileWrapper;
		}
		try {

			String result = this.getClass().getClassLoader().getResource("").getPath();
			int index = result.indexOf("WEB-INF");
			if (index == -1) {
				index = result.indexOf("bin");
			}
			result = result.substring(0, index);
			fileWrapper.setFileName(name);
			fileWrapper.setFileExtension(com.dhcc.framework.util.FileUtils.getFileExp(name));
			String path = "uploads/weixin/";
			switch (type) {
			case "ORDER":
				path = "uploads/weixin/order/";
				break;
			case "INC":
				path = "uploadPic/";
				break;
			case "INCQUALIFY":
				path = "uploadPic/venIncQualify/";
				break;
			case "VENQUALIFY":
				path = "uploads/";
				break;
			default:
				break;
			}

			DataSource source = new FileDataSource(new File(result + path + name));
			fileWrapper.setFile(new DataHandler(source));
			fileWrapper.setResultCode("0");
		} catch (Exception e) {
			e.printStackTrace();
			fileWrapper.setResultCode("-11");
			fileWrapper.setResultContent(e.getMessage());
			return fileWrapper;
		}
		return fileWrapper;
	}

	@Override
	public HisInGdRec getOrderDetail(String orderno) {
		HisInGdRec hisInGdRec = new HisInGdRec();
		List<HisInGdRecItm> inGdRecItms = new ArrayList<HisInGdRecItm>();
		List<HisPicWeb> hisPicWebs = new ArrayList<HisPicWeb>();
		try {
			if (orderno == null) {
				hisInGdRec.setResultContent("入库表id为空!");
				return hisInGdRec;
			}
			List<OrderDetail> OrderDetails = commonService.findByProperty(OrderDetail.class, "orderNo", orderno);
			if (OrderDetails != null) {
				for (OrderDetail orderdetil : OrderDetails) {
					HopInc hopInc = commonService.get(HopInc.class, orderdetil.getOrderHopIncId());
					String purLoc = "", recLoc = "";
					if (orderdetil.getOrderPurLoc() != null) {
						purLoc = commonService.get(HopCtloc.class, orderdetil.getOrderPurLoc()).getCode();
					}
					if (orderdetil.getOrderRecLoc() != null) {
						recLoc = commonService.get(HopCtloc.class, orderdetil.getOrderRecLoc()).getCode();
					}
					Vendor vendor = commonService.get(Vendor.class, orderdetil.getOrderVenId());
					String[] propertyNames = { "ordSubDetailId", "ordSubStatus" };
					Object[] values = { orderdetil.getOrderId(), "Y" };
					List<OrderDetailSub> detailSubs = commonService.findByProperties(OrderDetailSub.class, propertyNames, values);
					for (OrderDetailSub detailsub : detailSubs) {
						HisInGdRecItm hisInGdRecItm = new HisInGdRecItm();
						hisInGdRecItm.setBatNo(detailsub.getOrdSubBatNo());
						hisInGdRecItm.setExpdate(detailsub.getOrdSubExpDate());
						hisInGdRecItm.setArriveDate(detailsub.getOrdSubArriveDate());
						hisInGdRecItm.setHisNo(orderdetil.getOrderHisNo());
						hisInGdRecItm.setIncBarCode(hopInc.getIncBarCode());
						hisInGdRecItm.setInvNo(detailsub.getOrdSubInvNo());
						hisInGdRecItm.setOrderno(orderdetil.getOrderNo());
						hisInGdRecItm.setPurLocCode(purLoc);
						hisInGdRecItm.setQty(detailsub.getOrderSubQty());
						hisInGdRecItm.setRecLocCode(recLoc);
						hisInGdRecItm.setRp(detailsub.getOrderSubRp());
						hisInGdRecItm.setVendorCode(vendor.getCode());
						hisInGdRecItm.setOrderDetailSubId(detailsub.getOrdSubId());
						hisInGdRecItm.setInvDate(detailsub.getOrdSubInvDate());
						hisInGdRecItm.setLabels(new ArrayList<String>());
						List<OrdLabel> labels = commonService.findByProperty(OrdLabel.class, "labelParentId", detailsub.getOrdSubId());
						for (OrdLabel label : labels) {
							hisInGdRecItm.getLabels().add(label.getLabelId());
						}
						inGdRecItms.add(hisInGdRecItm);
					}

				}
			}
			List<OrderDetailPic> orderDetailPics = commonService.findByProperty(OrderDetailPic.class, "ordPicOrderNo", orderno);
			for (OrderDetailPic detailPic : orderDetailPics) {
				hisPicWebs.add(new HisPicWeb("ORDER", detailPic.getOrdPicPath()));
			}
			hisInGdRec.setInGdRecItms(inGdRecItms);
			hisInGdRec.setPicWebs(hisPicWebs);
		} catch (Exception e) {
			hisInGdRec.setResultCode("1");
			hisInGdRec.setResultContent("程序异常->Exception:" + e.getMessage());
			return hisInGdRec;
		}
		return hisInGdRec;
	}

	@Override
	public OperateResult cmpOrder(String username, String password, List<String> ordsubs, String flag) {

		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + username + ",password:" + password + ",ordsubs:" + JsonUtils.toJson(ordsubs) + ",flag:" + flag);
		log.setOpName("webservice库房扫码确认完成：》cmpOrder");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(username);
		if (StringUtils.isEmpty(flag)) {
			operateResult.setResultContent("入参为空");
			return operateResult;
		}
		try {
			NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, username, password, ordsubs);
			if (normalAccount == null) {
				return operateResult;
			}
			int succ = 0;
			for (String sub : ordsubs) {
				OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, sub);
				if (orderDetailSub != null) {
					orderDetailSub.setOrdSubStatus(flag);
					commonService.saveOrdSub(orderDetailSub, "库房扫码入库确认", normalAccount.getAccountId());
					succ++;
				}
			}
			operateResult.setResultCode("0");
			operateResult.setResultContent(String.valueOf(succ));
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return operateResult;
		} finally {
			if (!"0".equals(operateResult.getResultCode())) {
				log.setOpResult(JsonUtils.toJson(operateResult));
				commonService.saveOrUpdate(log);
			}
		}
		return operateResult;
	}

	@Override
	public VenQualifyWeb getVenQualify(String username, String password, List<String> hopVenCodes) {

		VenQualifyWeb venQualifyWeb = new VenQualifyWeb();
		OperateResult operateResult = new OperateResult();
		venQualifyWeb.setOperateResult(operateResult);
		SysLog log = new SysLog();
		log.setOpArg("usename:" + username + ",password:" + password + ",hopVenCode:" + JsonUtils.toJson(hopVenCodes));
		log.setOpName("webservice查询供应商资质信息：》cmpOrder");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(username);
		try {

			NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, username, password, hopVenCodes);
			if (normalAccount == null) {
				return venQualifyWeb;
			}
			List<VenQualifyWebItm> venQualifyWebItms = new ArrayList<VenQualifyWebItm>();
			HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());

			for (String hopvenCode : hopVenCodes) {
				HopVendor hopVendor = commonService.getVenByBusinessRegNo(hopvenCode, ctloc.getHospid());
				if (hopVendor == null) {
					hopVendor = commonService.getVenByCode(hopvenCode, ctloc.getHospid());
				}
				if ((hopVendor != null) & (hopVendor.getHopVenId() != null)) {
					List<VenQualification> qualifications = commonService.findByProperty(VenQualification.class, "vendorid", hopVendor.getHopVenId());
					for (VenQualification qualification : qualifications) {
						VenQualifyWebItm venQualifyWebItm = new VenQualifyWebItm();
						venQualifyWebItm.setExp(qualification.getExpdate());
						venQualifyWebItm.setText(qualification.getDescription());
						venQualifyWebItm.setPics(castVO(qualification.getVenQualifPics(),"VENDOR"));
						venQualifyWebItm.setType(qualification.getVenQualifType().getCode());
						venQualifyWebItm.setVenCode(hopvenCode);
						venQualifyWebItms.add(venQualifyWebItm);
					}
				}
				venQualifyWeb.setVenQualifyWebItms(venQualifyWebItms);
			}
			operateResult.setResultCode("0");
			operateResult.setResultContent("success");
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return venQualifyWeb;
		} finally {
			if(!"0".equals(operateResult.getResultCode())){
				log.setOpResult(JsonUtils.toJson(operateResult));
				commonService.saveOrUpdate(log);
			}
		}
		return venQualifyWeb;
	}

	private List<HisPicWeb> castVO(List<VenQualifPic> qualifPics,String type) {
		List<HisPicWeb> hisPicWebs = new ArrayList<HisPicWeb>();
		if (qualifPics == null)
			return hisPicWebs;
		for (VenQualifPic pic : qualifPics) {
			HisPicWeb hisPicWeb = new HisPicWeb(type, pic.getPath());
			hisPicWebs.add(hisPicWeb);
		}
		return hisPicWebs;
	}

	@Override
	public OperateResult getHvLabel(String usename, String password, HisHvLabelWeb hisHvLabelWeb) {

		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password + ",hisHvLabelWeb:" + JsonUtils.toJson(hisHvLabelWeb));
		log.setOpName("webservice his 传送高值医嘱条码信息：》getHvLabel");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {
			if (hisHvLabelWeb == null) {
				operateResult.setResultCode("-2");
				operateResult.setResultContent("入参不能为空");
				return operateResult;
			}
			if (hisHvLabelWeb.getOrdDate() == null) {
				operateResult.setResultCode("-4");
				operateResult.setResultContent("医嘱日期不能为空");
				return operateResult;
			}
			if (StringUtils.isBlank(hisHvLabelWeb.getLabel())) {
				operateResult.setResultCode("-5");
				operateResult.setResultContent("条码不能为空");
				return operateResult;
			}
			NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
			if (normalAccount == null) {
				return operateResult;
			}
			HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());

			HopVendor hopVendor = commonService.getVenByCode(hisHvLabelWeb.getHopVendorCode(), ctloc.getHospid());
			if (hopVendor == null) {
				operateResult.setResultCode("-3");
				operateResult.setResultContent("供应商编码错误");
				return operateResult;
			}
			HvLabel hvLabel = new HvLabel();
			HvLabel tmphvLabel = commonService.getHvLabel(hisHvLabelWeb.getLabel(), ctloc.getHospid(), hopVendor.getHopVenId());
			if (tmphvLabel != null) {
				if ("Y".equals(tmphvLabel.getHvFlag())) {
					operateResult.setResultCode("-6");
					operateResult.setResultContent("该条码状态不能更新");
					return operateResult;
				} else {
					hvLabel.setHvId(tmphvLabel.getHvId());
					hvLabel.setHvInvNo(tmphvLabel.getHvInvNo());
					hvLabel.setHvInvNoDate(tmphvLabel.getHvInvNoDate());
					hvLabel.setHvRecNo(tmphvLabel.getHvRecNo());
				}
			}
			// 弋矶山医院商品编码和供应商商品编号相同
			// 弋矶山医院商品编码和供应商商品码相同
			VenInc venInc = commonService.getVenIncByBarCode(hopVendor.getHopVenId(), hisHvLabelWeb.getHopIncCode());
			if (venInc == null) {
				operateResult.setResultCode("-7");
				operateResult.setResultContent("商品编码错误");
				return operateResult;
			}
			hvLabel.setHvHopId(ctloc.getHospid());
			hvLabel.setHvVendorId(hopVendor.getHopVenId());
			hvLabel.setHvOrdDate(hisHvLabelWeb.getOrdDate());
			hvLabel.setHvLabel(hisHvLabelWeb.getLabel());
			hvLabel.setHvQty(hisHvLabelWeb.getQty());
			hvLabel.setHvVenIncId(venInc.getVenIncId());
			hvLabel.setHvRp(hisHvLabelWeb.getRp());

			commonService.saveOrUpdate(hvLabel);
			operateResult.setResultCode("0");
			operateResult.setResultContent("sucess");
		} catch (Exception e) {
			operateResult.setResultCode("-1");
			operateResult.setResultContent(e.getMessage());
			log.setOpResult(e.getMessage());
		} finally {
			log.setOpResult(JsonUtils.toJson(operateResult));
			if ("0".equals(operateResult.getResultCode())) {
			} else {
				commonService.saveOrUpdate(log);
			}
		}
		return operateResult;
	}

	@Override
	public HisHvInvWeb getHvInvNo(String usename, String password, String label, String vendorCode) {
		// TODO Auto-generated method stub
		HisHvInvWeb hisHvInvWeb = new HisHvInvWeb();
		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password + ",label:" + label + ",vendorCode:" + vendorCode);
		log.setOpName("webservice 高值条码完成，确认完成信息：》cmpHvInv");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {

			if (StringUtils.isBlank(label)) {
				hisHvInvWeb.setResultCode("-5");
				hisHvInvWeb.setResultContent("条码不能为空");
				return hisHvInvWeb;
			}
			if (StringUtils.isBlank(vendorCode)) {
				hisHvInvWeb.setResultCode("-6");
				hisHvInvWeb.setResultContent("供应商编码不能为空");
				return hisHvInvWeb;
			}
			NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
			if (normalAccount == null) {
				hisHvInvWeb.setResultCode(operateResult.getResultCode());
				hisHvInvWeb.setResultContent(operateResult.getResultContent());
				return hisHvInvWeb;
			}
			HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
			HopVendor hopVendor = commonService.getVenByCode(vendorCode, ctloc.getHospid());
			if (hopVendor == null) {
				hisHvInvWeb.setResultCode("-3");
				hisHvInvWeb.setResultContent("供应商编码错误");
				return hisHvInvWeb;
			}
			HvLabel tmpHvLabel = commonService.getHvLabel(label, ctloc.getHospid(), hopVendor.getHopVenId());
			if (tmpHvLabel == null) {
				hisHvInvWeb.setResultCode("-4");
				hisHvInvWeb.setResultContent("高值条码错误");
				return hisHvInvWeb;
			}
			hisHvInvWeb.setResultCode("0");
			hisHvInvWeb.setInvDate(tmpHvLabel.getHvInvNoDate());
			hisHvInvWeb.setInvNo(tmpHvLabel.getHvInvNo());
		} catch (Exception e) {
			hisHvInvWeb.setResultCode("-1");
			hisHvInvWeb.setResultContent(e.getMessage());
			log.setOpResult(e.getMessage());
		} finally {
			if (!"0".equals(operateResult.getResultCode())) {
				commonService.saveOrUpdate(log);
			}
		}
		return hisHvInvWeb;
	}

	@Override
	public OperateResult cmpHvInv(String usename, String password, String label, String vendorCode, String flag) {

		OperateResult operateResult = new OperateResult();
		SysLog log = new SysLog();
		log.setOpArg("usename:" + usename + ",password:" + password + ",label:" + label + ",vendorCode:" + vendorCode + ",flag：" + flag);
		log.setOpName("webservice 高值条码完成，确认完成信息：》cmpHvInv");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		log.setOpUser(usename);
		try {

			if (StringUtils.isBlank(label)) {
				operateResult.setResultCode("-5");
				operateResult.setResultContent("条码不能为空");
				return operateResult;
			}
			if (StringUtils.isBlank(vendorCode)) {
				operateResult.setResultCode("-6");
				operateResult.setResultContent("供应商编码不能为空");
				return operateResult;
			}
			NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
			if (normalAccount == null) {
				return operateResult;
			}
			HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
			HopVendor hopVendor = commonService.getVenByCode(vendorCode, ctloc.getHospid());
			if (hopVendor == null) {
				operateResult.setResultCode("-3");
				operateResult.setResultContent("供应商编码错误");
				return operateResult;
			}
			HvLabel tmpHvLabel = commonService.getHvLabel(label, ctloc.getHospid(), hopVendor.getHopVenId());
			if (tmpHvLabel == null) {
				operateResult.setResultCode("-4");
				operateResult.setResultContent("高值条码错误");
				return operateResult;
			}
			if ("Y".equals(flag)) {
				tmpHvLabel.setHvFlag("Y");
			} else {
				tmpHvLabel.setHvFlag(null);
			}
			commonService.saveOrUpdate(tmpHvLabel);
			operateResult.setResultCode("0");
			operateResult.setResultContent("sucess");
		} catch (Exception e) {
			operateResult.setResultCode("-1");
			operateResult.setResultContent(e.getMessage());
			log.setOpResult(e.getMessage());
		} finally {
			if (!"0".equals(operateResult.getResultCode())) {
				commonService.saveOrUpdate(log);
			}
		}
		return operateResult;
	}

	@Override
	public List<String> getIncPicName(String usename, String password, String vendorCode, String incCode) {

		List<String> list = new ArrayList<String>();
		NormalAccount normalAccount = ordBlh.checkWsParam(new OperateResult(), usename, password, null);
		if (normalAccount == null) {
			return list;
		}
		HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
		HopVendor hopVendor = commonService.getVenByCode(vendorCode, ctloc.getHospid());
		if (hopVendor == null) {
			return list;
		}
		VenInc venInc = commonService.getVenIncByBarCode(hopVendor.getHopVenId(), incCode);
		if (venInc == null) {
			return list;
		}
		List<VenIncPic> incPics = commonService.findByProperty(VenIncPic.class, "venIncPicVenincid", venInc.getVenIncId());
		for (VenIncPic incPic : incPics) {
			list.add(incPic.getVenIncPicPath());
		}
		return list;
	}

	@Override
	public HisInvInfoItmWeb getInvBySubId(String usename, String password, String subId) {

		HisInvInfoItmWeb hisInvInfoItmWeb = new HisInvInfoItmWeb();
		NormalAccount normalAccount = ordBlh.checkWsParam(new OperateResult(), usename, password, null);
		if (normalAccount == null) {
			return hisInvInfoItmWeb;
		}
		if (StringUtils.isBlank(subId)) {
			return hisInvInfoItmWeb;
		}
		OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, subId);
		if (orderDetailSub != null) {
			hisInvInfoItmWeb.setInvno(orderDetailSub.getOrdSubInvNo());
			hisInvInfoItmWeb.setInvdate(orderDetailSub.getOrdSubInvDate());
		}
		return hisInvInfoItmWeb;
	}

	@Override
	public OperateResult syncInvBySub(String usename, String password, String subId, String invno) {

		OperateResult operateResult = new OperateResult();
		NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
		if (normalAccount == null) {
			return operateResult;
		}
		if (StringUtils.isBlank(subId)) {
			operateResult.setResultCode("-1");
			operateResult.setResultContent("入参为空");
			return operateResult;
		}
		OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, subId);
		if (orderDetailSub != null) {
			orderDetailSub.setOrdSubInvNo(invno);
			commonService.saveOrUpdate(orderDetailSub);
		}
		return operateResult;
	}

	@Override
	public OperateResult updHvRecNo(String usename, String password, String label, String vendorCode, String no) {
		OperateResult operateResult=new OperateResult();
		if (StringUtils.isBlank(label)) {
			operateResult.setResultCode("-5");
			operateResult.setResultContent("条码不能为空");
			return operateResult;
		}
		if (StringUtils.isBlank(vendorCode)) {
			operateResult.setResultCode("-6");
			operateResult.setResultContent("供应商编码不能为空");
			return operateResult;
		}
		NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
		if (normalAccount == null) {
			return operateResult;
		}
		HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
		HopVendor hopVendor = commonService.getVenByCode(vendorCode, ctloc.getHospid());
		if (hopVendor == null) {
			operateResult.setResultCode("-3");
			operateResult.setResultContent("供应商编码错误");
			return operateResult;
		}
		HvLabel tmpHvLabel = commonService.getHvLabel(label, ctloc.getHospid(), hopVendor.getHopVenId());
		if (tmpHvLabel == null) {
			operateResult.setResultCode("-4");
			operateResult.setResultContent("高值条码错误");
			return operateResult;
		}
		tmpHvLabel.setHvRecNo(no);
		commonService.saveOrUpdate(tmpHvLabel);
		return operateResult;
	}

	@Override
	public VenQualifyWeb getVenIncQualify(String usename, String password, String hopVenIncCode) {
		VenQualifyWeb venQualifyWeb = new VenQualifyWeb();
		OperateResult operateResult = new OperateResult();
		venQualifyWeb.setOperateResult(operateResult);

		try {

			NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
			if (normalAccount == null) {
				return venQualifyWeb;
			}
			List<VenQualifyWebItm> venQualifyWebItms = new ArrayList<VenQualifyWebItm>();
			HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());

	
			String[] propertyNames = { "incHospid", "incBarCode" };
			Object[] values = { ctloc.getHospid(), hopVenIncCode};
			
			List<HopInc> hopIncs = commonService.findByProperties(HopInc.class, propertyNames, values);
			if (hopIncs.size()==0) {
				return venQualifyWeb;
			}
			List<VenHopInc> venhopIncs=commonService.findByProperty(VenHopInc.class, "hopIncId", hopIncs.get(0).getIncId());
			if(venhopIncs.size()==0){
				return venQualifyWeb;
			}
	
			List<VenIncqQualif> qualifications = commonService.findByProperty(VenIncqQualif.class, "qualifyIncId", venhopIncs.get(0).getVenIncId());
			for (VenIncqQualif qualification : qualifications) {
				VenQualifyWebItm venQualifyWebItm = new VenQualifyWebItm();
				venQualifyWebItm.setExp(qualification.getQualifDate());
				venQualifyWebItm.setText(qualification.getQualifDescription());
				venQualifyWebItm.setType(qualification.getSysQualifType().getCode());
				venQualifyWebItm.setVenCode(hopVenIncCode);
				venQualifyWebItm.setPics(new ArrayList<HisPicWeb>());
				for(VenIncqQualifPic venIncqQualifPic:qualification.getIncqQualifPics()){
					
					venQualifyWebItm.getPics().add(new HisPicWeb("INCQUALIFY",venIncqQualifPic.getPicPath()));
				}
				
				venQualifyWebItms.add(venQualifyWebItm);
			}
			
			venQualifyWeb.setVenQualifyWebItms(venQualifyWebItms);
			
			operateResult.setResultCode("0");
			operateResult.setResultContent("success");
		} catch (Exception e) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("程序异常->Exception:" + e.getMessage());
			return venQualifyWeb;
		} finally {
			if(!"0".equals(operateResult.getResultCode())){
				SysLog log = new SysLog();
				log.setOpArg("usename:" + usename + ",password:" + password + ",hopVenCode:" + hopVenIncCode);
				log.setOpName("webservice查询供应商商品资质信息：》cmpOrder");
				log.setOpDate(new Date());
				log.setOpType("webservice");
				log.setOpUser(usename);
				log.setOpResult(JsonUtils.toJson(operateResult));
				commonService.saveOrUpdate(log);
			}
		}
		return venQualifyWeb;
	}

	@Override
	public List<HisPicWeb> getVenIncPic(String usename, String password, String hopVenIncCode) {
		
		List<HisPicWeb> picWebs=new ArrayList<HisPicWeb>();
		OperateResult operateResult=new OperateResult();
		NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
		if (normalAccount == null) {
			return picWebs;
		}
		HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());

		String[] propertyNames = { "incHospid", "incBarCode" };
		Object[] values = { ctloc.getHospid(), hopVenIncCode};
		
		List<HopInc> hopIncs = commonService.findByProperties(HopInc.class, propertyNames, values);
		if (hopIncs.size()==0) {
			return picWebs;
		}
		List<VenHopInc> venhopIncs=commonService.findByProperty(VenHopInc.class, "hopIncId", hopIncs.get(0).getIncId());
		if(venhopIncs.size()==0){
			return picWebs;
		}
		List<VenIncPic> incPics=commonService.findByProperty(VenIncPic.class, "venIncPicVenincid", venhopIncs.get(0).getVenIncId());
		for(VenIncPic incPic:incPics){
			HisPicWeb hisPicWeb=new HisPicWeb("INC", incPic.getVenIncPicPath());
			picWebs.add(hisPicWeb);
		}
		
		return picWebs;
	}

}
