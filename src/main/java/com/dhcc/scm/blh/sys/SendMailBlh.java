/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import org.apache.commons.mail.EmailException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.RandomUtil;
import com.dhcc.framework.util.SendMailUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
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
	
	
	
	public void sendValidate(BusinessRequest res){
		SendMailDto dto = super.getDto(SendMailDto.class, res);
		
		if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getRecUser())){
			try {
				Cookie[]  cookies=WebContextHolder.getContext().getRequest().getCookies();
				for(Cookie cookie:cookies){
					if(cookie.getName().equals("code")){
						super.writeResult("验证码已发,请1分钟后再发");
						return;
					}
				}	
				String code=RandomUtil.generateString(4);
				StringBuffer msg = new StringBuffer();
				msg.append("您的验证码为:");
				msg.append(code);
				msg.append("<br>");
				SendMailUtil.sendEmailByAsync("供应链平台验证", msg.toString(),dto.getRecUser(),60 * 1000);
				Cookie cookie=new Cookie("code", code);
				cookie.setMaxAge(60);
				WebContextHolder.getContext().getResponse().addCookie(cookie);
			} catch (EmailException e) {
				e.printStackTrace();
			}
			super.writeResult("0");
		}
	}
	
	/**
	 * 
	* @Title: validateCode 
	* @Description: TODO(验证邮箱验证码) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年4月22日 下午8:49:46
	 */
	@SuppressWarnings("unchecked")
	public void validateCode(BusinessRequest res){
		SendMailDto dto = super.getDto(SendMailDto.class, res);
		if(org.apache.commons.lang3.StringUtils.isBlank(dto.getRecUser())){
			super.writeResult("邮箱不能为空");
			return;
		}
		DetachedCriteria criteria=DetachedCriteria.forClass(Vendor.class);
		criteria.add(Restrictions.eq("email", dto.getRecUser()));
		criteria.add(Restrictions.isNotNull("audit_flag"));
		List<Vendor> vendors=commonService.findByDetachedCriteria(criteria);
		if(vendors.size()>0){
			super.writeResult("邮箱已被注册");
			return;
		}
		Long flag=0l;
		if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getContent())){
			Cookie[]  cookies=WebContextHolder.getContext().getRequest().getCookies();
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("code")){
					if(cookie.getValue().equals(dto.getContent().trim())){
						
						cookie.setMaxAge(0);
						DetachedCriteria criteria2=DetachedCriteria.forClass(Vendor.class);
						criteria2.add(Restrictions.eq("email", dto.getRecUser()));
						criteria2.add(Restrictions.isNull("audit_flag"));
						List<Vendor> vendors2=commonService.findByDetachedCriteria(criteria2);
						if(vendors2.size()>0){
							flag=vendors2.get(0).getVendorId();
						}else{
							Vendor vendor=new Vendor();
							vendor.setEmail(dto.getRecUser());
							vendor.setAccount(dto.getRecUser());
							commonService.saveOrUpdate(vendor);
							flag=vendor.getVendorId();
						}
					}
				}
			}
		}
		super.writeResult(String.valueOf(flag));
	}
}
