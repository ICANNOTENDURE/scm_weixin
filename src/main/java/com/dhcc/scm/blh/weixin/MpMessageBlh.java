/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpCustomMessage;
import me.chanjar.weixin.mp.bean.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.WxMpTemplateMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.dto.weixin.WxMessageDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailPic;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.scm.service.weixin.WxMessageService;
import com.dhcc.scm.tool.datetime.OperTime;

@Component
public class MpMessageBlh extends AbstractBaseBlh {

	@Resource
	private CommonService commonService;

	@Resource
	private WxMpService wxMpService;
	
	@Resource
	private WxMessageService wxMessageService;

	public MpMessageBlh() {

	}

	public void sendMessByOrd(OrderDetail orderDetail) {
		try {
			String host = PropertiesBean.getInstance().getProperty("config.sci.dns");
			String templateid = PropertiesBean.getInstance().getProperty("config.weixin.mp.template.neworder");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Long vendorId = orderDetail.getOrderVenId();
			List<NormalUser> normalUsers=commonService.findByProperty(NormalUser.class, "vendorId", vendorId);
			if(normalUsers.size()==0){
				return;
			}
			Hospital hospital = commonService.get(Hospital.class, orderDetail.getOrderHopId());
			WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
			templateMessage.setTemplateId(templateid);
			templateMessage.setUrl(host + "weixin/mpMessageCtrl!mpListOrderDetail.htm?dto.orderDetail.orderNo=" + orderDetail.getOrderNo());
			templateMessage.getDatas().add(new WxMpTemplateData("first", hospital.getHospitalName()+"给您的新订单", "#173177"));
			templateMessage.getDatas().add(new WxMpTemplateData("tradeDateTime", sdf.format(orderDetail.getOrderDate()) , "#173177"));
			if (orderDetail.getOrderRecDestination() != null) {
				HopCtlocDestination ctlocDestination = commonService.get(HopCtlocDestination.class, orderDetail.getOrderRecDestination());
				templateMessage.getDatas().add(new WxMpTemplateData("customerInfo", ctlocDestination.getDestination(), "#173177"));
			}
			templateMessage.getDatas().add(new WxMpTemplateData("订单编号", orderDetail.getOrderNo(), "#173177"));
			if(StringUtils.isNotBlank(orderDetail.getOrderEmFlag())){
				templateMessage.getDatas().add(new WxMpTemplateData("orderType", "加急", "#173177"));
			}else{
				templateMessage.getDatas().add(new WxMpTemplateData("orderType", "普通订单", "#173177"));
			}
			
			templateMessage.getDatas().add(new WxMpTemplateData("orderItemName", "订单编号"));
			templateMessage.getDatas().add(new WxMpTemplateData("orderItemData", orderDetail.getOrderNo(), "#173177"));
			templateMessage.getDatas().add(new WxMpTemplateData("remark", "请您及时处理订单，谢谢", "#173177"));
			for(NormalUser normalUser:normalUsers){
				String[] propertyNames={"wxMpSciPointer","wxMpSend"};
				Object[] values={normalUser.getNormalAccount().getAccountId(),"1"};
				List<MpUser> mpUsers=commonService.findByProperties(MpUser.class, propertyNames, values);
				for(MpUser mpUser:mpUsers){
					templateMessage.setToUser(mpUser.getWxMpOpenId());
					wxMpService.templateSend(templateMessage);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public void customMessage(OrderDetail orderDetail){
		try {
			String host = PropertiesBean.getInstance().getProperty("config.sci.dns");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");

			Long vendorId = orderDetail.getOrderVenId();
			List<NormalUser> normalUsers=commonService.findByProperty(NormalUser.class, "vendorId", vendorId);
			if(normalUsers.size()==0){
				return;
			}
			StringBuffer sb = new StringBuffer();
			Hospital hospital = commonService.get(Hospital.class, orderDetail.getOrderHopId());
			sb.append(hospital.getHospitalName());
			if (orderDetail.getOrderPurLoc() != null) {
				HopCtloc hopCtloc = commonService.get(HopCtloc.class, orderDetail.getOrderPurLoc());
				sb.append("_" + hopCtloc.getName());
			}
			sb.append("给您的新订单" + System.getProperty("line.separator") + System.getProperty("line.separator"));
			sb.append("订单时间:" + sdf.format(orderDetail.getOrderDate()) + System.getProperty("line.separator"));

			if (orderDetail.getOrderRecDestination() != null) {
				HopCtlocDestination ctlocDestination = commonService.get(HopCtlocDestination.class, orderDetail.getOrderRecDestination());
				sb.append("收货地址:" + ctlocDestination.getDestination() + System.getProperty("line.separator"));
			}
			sb.append("订单单号:" + orderDetail.getOrderNo() + System.getProperty("line.separator") + System.getProperty("line.separator"));
			sb.append("请您及时处理订单,谢谢");

			WxMpCustomMessage.WxArticle article1 = new WxMpCustomMessage.WxArticle();
			article1.setUrl(host + "weixin/mpMessageCtrl!mpListOrderDetail.htm?dto.orderDetail.orderNo=" + orderDetail.getOrderNo());
			article1.setDescription(sb.toString());
			article1.setTitle("新订单提醒");
			
			for(NormalUser normalUser:normalUsers){
				String[] propertyNames={"wxMpSciPointer","wxMpSend"};
				Object[] values={normalUser.getNormalAccount().getAccountId(),"1"};
				List<MpUser> mpUsers=commonService.findByProperties(MpUser.class, propertyNames, values);
				for(MpUser mpUser:mpUsers){
					//WxMpCustomMessage.NEWS().toUser(mpUser.getWxMpOpenId()).addArticle(article1).build();
					wxMpService.customMessageSend(WxMpCustomMessage.NEWS().toUser(mpUser.getWxMpOpenId()).addArticle(article1).build());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * \
	 * 
	 * @Title: mbListOrderDetail
	 * @Description: TODO(手机查看订单明细)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年9月2日 下午4:31:22
	 */
	public String mpListOrderDetail(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		dto.setTitle("订单明细");
		if (dto.getOrderDetail() != null) {
			if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getOrderDetail().getOrderNo())) {
				List<OrderDetail> details = commonService.findByProperty(OrderDetail.class, "orderNo", dto.getOrderDetail().getOrderNo());
				for (OrderDetail detail : details) {
					VenInc venInc = commonService.get(VenInc.class, detail.getOrderVenIncId());
					detail.setIncName(venInc.getVenIncName());
					detail.setSpec(venInc.getVenIncSpec());
					HopInc hopInc=commonService.get(HopInc.class, detail.getOrderHopIncId());
					detail.setForm(hopInc.getIncForm());
					if(detail.getOrderPurLoc()!=null){
						HopCtloc hopCtloc=commonService.get(HopCtloc.class, detail.getOrderPurLoc());
						detail.setPurloc(hopCtloc.getName());
					}
				}
				dto.setOrderDetails(details);
				if (details.size() > 0) {
					dto.setAccpectFlag(details.get(0).getOrderState());
				}
				List<OrderDetailPic> detailPics=commonService.findByProperty(OrderDetailPic.class, "ordPicOrderNo", dto.getOrderDetail().getOrderNo());
				dto.setOrderDetailPics(detailPics);
			}
		}
		return "mpListOrderDetail";
	}
	
	
	/**
	 * 
	 * @Title: accpectOrder
	 * @Description: TODO(接收订单)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年9月16日 下午3:41:58
	 */
	public void accpectOrder(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		OperateResult operateResult = new OperateResult();
		
		//获取session微信用户信息
		WxMpUser wxMpUser=getWxMpUser();
		if (wxMpUser==null) {
			operateResult.setResultContent("登录超时");
			super.writeJSON(operateResult);
			return;
		}
		if(getMpUserId()==null){
			operateResult.setResultContent("用户未关联");
			super.writeJSON(operateResult);
			return;
		}
		if (dto.getOrderDetail() != null) {
			if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getOrderDetail().getOrderNo())) {
				String[] propertyNames = { "orderNo", "orderState" };
				Object[] values = { dto.getOrderDetail().getOrderNo(), 1l };
				List<OrderDetail> orderDetails = commonService.findByProperties(OrderDetail.class, propertyNames, values);
				for (OrderDetail orderDetail : orderDetails) {
					orderDetail.setOrderState(2l);
					commonService.saveOrUpdate(orderDetail);
					ExeState exeState = new ExeState();
					exeState.setRemark("手机微信确认");
					exeState.setStateId(Long.valueOf(2));
					exeState.setUserid(getMpUserId().getAccountId());
					exeState.setOrdId(orderDetail.getOrderId());
					exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
					commonService.saveOrUpdate(exeState);
				}
				accporderMessage(orderDetails.get(0));
				operateResult.setResultCode("0");
			} else {
				operateResult.setResultContent("入参为空");
			}
		} else {
			operateResult.setResultContent("入参为空");
		}
		super.writeJSON(operateResult);
	}
	
	/**
	 * 
	 * @Title: searchOrder
	 * @Description: TODO(跳到查询条件页面)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年9月18日 下午2:52:46
	 */
	public String mpSearchOrder(BusinessRequest res) {
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		NormalAccount normalAccount=super.getMpUserId();
		if(normalAccount==null){
			dto.setOperateResult(new OperateResult());
			return "mpSubscribe";
		}
		dto.setTitle("订单查询");
		return "mpSearchOrder";
	}
	
	/**
	 * 
	 * @Title: listToDoTask
	 * @Description: TODO(微信订单查询)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws IOException
	 * @throws
	 * @author zhouxin
	 * @date 2015年9月15日 下午3:06:25
	 */
	public String mpToDoTask(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		dto.setTitle("代办任务");
		NormalAccount normalAccount=super.getMpUserId();
		if(normalAccount==null){
			dto.setOperateResult(new OperateResult());
			return "MpSubscribe";
		}
		WxMessageDto messageDto=new WxMessageDto();
		messageDto.setEnd(dto.getEndDate());
		messageDto.setStart(dto.getStartDate());
		messageDto.setVenid(normalAccount.getNormalUser().getVendorId());
		messageDto.setLocid(normalAccount.getNormalUser().getLocId());
		messageDto.setPageModel(dto.getPageModel());
		wxMessageService.listToDoTask(messageDto);
		dto.setOrderInfos(messageDto.getOrderInfos());
		dto.setPageModel(messageDto.getPageModel());
		dto.setPageCount(messageDto.getPageCount());
		return "mpToDoTask";
	}
	
	public void accporderMessage(OrderDetail orderDetail){

		try {
			String host = PropertiesBean.getInstance().getProperty("config.sci.dns");
			String templateid = PropertiesBean.getInstance().getProperty("config.weixin.mp.template.accporder");

			List<NormalUser> normalUsers=commonService.findByProperty(NormalUser.class, "locId", orderDetail.getOrderRecLoc());
			if(normalUsers.size()==0){
				return;
			}
			
			Vendor vendor=commonService.get(Vendor.class, orderDetail.getOrderVenId());
			WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
			templateMessage.setTemplateId(templateid);
			templateMessage.setUrl(host + "weixin/mpMessageCtrl!mpListOrderDetail.htm?dto.orderDetail.orderNo=" + orderDetail.getOrderNo());
			templateMessage.getDatas().add(new WxMpTemplateData("first", vendor.getName()+"已经接收到您的订单", "#173177"));
			templateMessage.getDatas().add(new WxMpTemplateData("OrderSn", orderDetail.getOrderNo() , "#173177"));
			templateMessage.getDatas().add(new WxMpTemplateData("OrderStatus", "确认订单/下载订单" , "#173177"));
	
			templateMessage.getDatas().add(new WxMpTemplateData("remark", "请您及时留意订单状态，谢谢", "#173177"));
			for(NormalUser normalUser:normalUsers){
				String[] propertyNames={"wxMpSciPointer","wxMpSend"};
				Object[] values={normalUser.getNormalAccount().getAccountId(),"1"};
				List<MpUser> mpUsers=commonService.findByProperties(MpUser.class, propertyNames, values);
				for(MpUser mpUser:mpUsers){
					templateMessage.setToUser(mpUser.getWxMpOpenId());
					wxMpService.templateSend(templateMessage);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	
	}
	
	
	
	/**
	 * 
	* @Title: uploadOrdPic 
	* @Description: TODO(供应商上传发货图片) 
	* @param @param res    微信服务器图片id ,分割，订单号 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年4月19日 下午10:37:17
	 */
	public void uploadOrdPic(BusinessRequest res){
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		
		OperateResult operateResult = new OperateResult();
		dto.setOperateResult(operateResult);
		if (org.apache.commons.lang3.StringUtils.isBlank(dto.getImgIdStr())) {
			operateResult.setResultContent("图片为空");
			writeJSON(operateResult);
			return;
		}
		if (org.apache.commons.lang3.StringUtils.isBlank(dto.getOrderno())) {
			operateResult.setResultContent("入参为空");
			writeJSON(operateResult);
			return;
		}
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploads/weixin/order");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}
		String[] mediaIds = dto.getImgIdStr().split(BaseConstants.COMMA);
		List<OrderDetailPic> orderDetailPics = new ArrayList<OrderDetailPic>();
		for (String mediaId : mediaIds) {
			if (org.apache.commons.lang3.StringUtils.isBlank(mediaId)) {
				continue;
			}
			try {
				File wxFile = wxMpService.mediaDownload(mediaId);
				String newFileName = "ORDER" + OperTime.getCurrentDate() + "_" + UUID.randomUUID().toString() + com.dhcc.framework.util.FileUtils.getFileExp(wxFile.getName());
				File dstFile = new File(storageFileName, newFileName);
				com.dhcc.framework.util.FileUtils.copyFile(wxFile, dstFile, BaseConstants.BUFFER_SIZE);
				OrderDetailPic orderDetailPic = new OrderDetailPic();
				orderDetailPic.setOrdPicPath(newFileName);
				orderDetailPic.setOrdPicOrderNo(dto.getOrderno());
				orderDetailPics.add(orderDetailPic);
			} catch (WxErrorException e) {
				e.printStackTrace();
				operateResult.setResultContent(e.getMessage());
				writeJSON(operateResult);
				return;
			}
		}

		for(OrderDetailPic orderDetailPic:orderDetailPics){
			commonService.saveOrUpdate(orderDetailPic);
		}
		operateResult.setResultCode("0");
		writeJSON(operateResult);
	}
}
