package com.dhcc.scm.ws.wx;

import java.util.List;

import javax.annotation.Resource;
import javax.jws.WebService;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.WxMpTemplateMessage;

import org.apache.commons.lang3.StringUtils;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.blh.ord.OrdBlh;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.MpUser;

@WebService(endpointInterface = "com.dhcc.scm.ws.wx.WeiXinServiceInterface", targetNamespace = "http://his.ws.scm.dhcc.com/", portName = "WeiXinServiceServiceHttpSoap12Endpoint")
public class WeiXinService implements WeiXinServiceInterface {
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private OrdBlh ordBlh;
	
	@Resource
	private WxMpService wxMpService;
	
	@Override
	public OperateResult sendMessage(String usename, String password,
			String vendorCode, String msg, String keyword1, String keyword2) {
		OperateResult operateResult=new OperateResult();
		NormalAccount normalAccount = ordBlh.checkWsParam(operateResult, usename, password, null);
		if (normalAccount == null) {
			return operateResult;
		}
		HopCtloc ctloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
		if(ctloc.getHospid()==null){
			operateResult.setResultContent("科室未维护医院");
			return operateResult;
		}
		if(StringUtils.isBlank(vendorCode)){
			operateResult.setResultContent("供应商代码不能为空");
			return operateResult;
		}
		HopVendor hopVendor=commonService.getVenByBusinessRegNo(vendorCode, ctloc.getHospid());
		if(hopVendor==null){
			operateResult.setResultContent("供应商代码错误");
			return operateResult;
		}
		if(hopVendor.getHopVenId()==null){
			operateResult.setResultContent("供应商未对照");
			return operateResult;
		}
		List<NormalUser> normalUsers=commonService.findByProperty(NormalUser.class, "vendorId", hopVendor.getHopVenId());
		if(normalUsers.size()==0){
			operateResult.setResultContent("供应商没有注册用户");
			return operateResult;
		}
		Hospital hospital = commonService.get(Hospital.class, ctloc.getHospid());
		WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
		templateMessage.setTemplateId("gRfbpFFfcWgtoWo2k56Am9HSUKFKe_rjtaYreeMe8UU");
		templateMessage.getDatas().add(new WxMpTemplateData("first", hospital.getHospitalName()+"给您的过期提醒", "#173177"));
		templateMessage.getDatas().add(new WxMpTemplateData("keyword1", keyword1, "#173177"));
		templateMessage.getDatas().add(new WxMpTemplateData("keyword2", keyword2, "#173177"));
		templateMessage.getDatas().add(new WxMpTemplateData("remark", msg, "#173177"));
		try {
			for(NormalUser normalUser:normalUsers){
				String[] propertyNames={"wxMpSciPointer","wxMpSend"};
				Object[] values={normalUser.getNormalAccount().getAccountId(),"1"};
				List<MpUser> mpUsers=commonService.findByProperties(MpUser.class, propertyNames, values);
				for(MpUser mpUser:mpUsers){
					templateMessage.setToUser(mpUser.getWxMpOpenId());
					wxMpService.templateSend(templateMessage);
				}
			}
		} catch (WxErrorException e) {
			e.printStackTrace();
			operateResult.setResultContent(e.getMessage());
			return operateResult;
		}
		return operateResult;
	}

}
