/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpCustomMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.dto.weixin.WxMessageDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.scm.service.weixin.WxMessageService;

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
				}
				dto.setOrderDetails(details);
				if (details.size() > 0) {
					dto.setAccpectFlag(details.get(0).getOrderState());
				}
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
		NormalAccount normalAccount=super.getMpUserId();
		if(normalAccount==null){
			dto.setOperateResult(new OperateResult());
			return "MpSubscribe";
		}
		WxMessageDto messageDto=new WxMessageDto();
		messageDto.setEnd(dto.getEndDate());
		messageDto.setStart(dto.getStartDate());
		messageDto.setVenid(normalAccount.getNormalUser().getVendorId());
		wxMessageService.listToDoTask(messageDto);
		dto.setOrderInfos(messageDto.getOrderInfos());
		dto.setPageModel(messageDto.getPageModel());
		return "mpToDoTask";
	}
}
