/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.mail.EmailException;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.SendMailUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.sys.SendMailDto;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ven.Vendor;

@Component
public class SendMailBlh extends AbstractBaseBlh {
	
	@Resource
	private CommonService commonService;
	
	public SendMailBlh() {

	}

	public void send(BusinessRequest res) {

		SendMailDto dto = super.getDto(SendMailDto.class, res);
		try {
			if (!StringUtils.isNullOrEmpty(dto.getRecUser())) {
				SendMailUtil.sendEmail(dto.getSub(), dto.getContent(),
						dto.getRecUser(), 60 * 1000);
			}
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

	public void sendEMailByOrd(OrderDetail orderDetail) {
		
		if(orderDetail==null){
			return;
		}
		// 发送邮件
		String sub = "订单通知";
		StringBuffer msg = new StringBuffer();
		String address = "";
		Vendor vendor = commonService .get(Vendor.class, orderDetail.getOrderVenId());
		Hospital hospital = commonService.get(Hospital.class, orderDetail.getOrderHopId());
		address = vendor.getEmail();
		if (org.apache.commons.lang3.StringUtils.isBlank(address)) {
			return;
		}
		msg.append(hospital.getHospitalName() + " 新的订单:<h1>" + orderDetail.getOrderNo() + "</h1>。");
		msg.append("<br>请尽快发货.");
		List<OrderDetail> orderDetails=commonService.findByProperty(OrderDetail.class, "orderNo", orderDetail.getOrderNo());
		for(OrderDetail detail:orderDetails){
			msg.append("<br>"+detail.getIncName()+">"+detail.getOrderVenQty()+detail.getOrderVenuom());
		}
		try {
			SendMailUtil.sendEmailByAsync(sub, msg.toString(),address,60 * 1000);
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
}
