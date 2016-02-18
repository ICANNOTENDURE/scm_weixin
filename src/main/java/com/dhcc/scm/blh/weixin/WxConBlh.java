package com.dhcc.scm.blh.weixin;

import javax.annotation.Resource;

import me.chanjar.weixin.cp.api.WxCpInMemoryConfigStorage;
import me.chanjar.weixin.cp.api.WxCpMessageRouter;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.bean.WxCpXmlMessage;
import me.chanjar.weixin.cp.bean.WxCpXmlOutMessage;
import me.chanjar.weixin.cp.util.crypto.WxCpCryptUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;


@Component
public class WxConBlh extends AbstractBaseBlh {


	@Resource
	private WxCpService wxCpService;

	@Resource
	private WxCpInMemoryConfigStorage configStorage;

	@Resource
	private WxCpMessageRouter messageRouter;

	public  WxConBlh() {

	}


	public void testCon(BusinessRequest res) {

		String msgSignature = super.getParameter("msg_signature");
		String nonce = super.getParameter("nonce");
		String timestamp = super.getParameter("timestamp");
		String echostr = super.getParameter("echostr");
		if (StringUtils.isNotBlank(echostr)) {
			if (!wxCpService.checkSignature(msgSignature, timestamp, nonce, echostr)) {
				super.writeResult("err");
				return;
			}
			try {
				WxCpCryptUtil cryptUtil = new WxCpCryptUtil(configStorage);
				String plainText = cryptUtil.decrypt(echostr);
				super.writeResult(plainText);
				return;
			} catch (Exception e) {
				super.writeResult(e.getLocalizedMessage());
				e.printStackTrace();
			}
		}

		WxCpXmlMessage inMessage;
		try {
			inMessage = WxCpXmlMessage.fromEncryptedXml(WebContextHolder.getContext().getRequest().getInputStream(), configStorage, timestamp, nonce, msgSignature);
			WxCpXmlOutMessage outMessage = messageRouter.route(inMessage);
			if (outMessage != null) {
				super.writeResult(outMessage.toEncryptedXml(configStorage));
				return;
			}
		} catch (Exception e) {
			super.writeResult("err" + e.getMessage());
		}

	}
}