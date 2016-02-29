/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpCustomMessage;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.weixin.MpUser;

@Component
public class MpMessageBlh extends AbstractBaseBlh {

	@Resource
	private CommonService commonService;

	@Resource
	private WxMpService wxMpService;

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
			article1.setUrl(host + "weixin/wxMessageCtrl!mbListOrderDetail.htm?dto.orderDetail.orderNo=" + orderDetail.getOrderNo());
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

}
