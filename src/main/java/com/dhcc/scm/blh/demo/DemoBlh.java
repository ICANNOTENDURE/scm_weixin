/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.demo;

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
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.demo.DemoDto;
import com.dhcc.scm.service.demo.DemoService;

@Component
public class DemoBlh extends AbstractBaseBlh {

	@Resource
	private DemoService demoService;

	@Resource
	private CommonService commonService;

	@Resource
	private WxCpService wxCpService;

	@Resource
	private WxCpInMemoryConfigStorage configStorage;

	@Resource
	private WxCpMessageRouter messageRouter;

	public DemoBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list2(BusinessRequest res) {

		DemoDto dto = super.getDto(DemoDto.class, res);

		// 调用对应的service方法
		demoService.list(dto);
	}

	// 保存
	public void save(BusinessRequest res) {

		// DemoDto dto = super.getDto(DemoDto.class, res);

		// 调用对应的service方法
		// demoService.save(dto);
	}

	// 删除
	public void delete(BusinessRequest res) {

		DemoDto dto = super.getDto(DemoDto.class, res);

		// 调用对应的service方法
		demoService.delete(dto);
	}

	// 更新
	public void update(BusinessRequest res) {

		DemoDto dto = super.getDto(DemoDto.class, res);

		// 调用对应的service方法
		demoService.update(dto);
	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	public void findById(BusinessRequest res) {

		DemoDto dto = super.getDto(DemoDto.class, res);

		// 调用对应的service方法
		demoService.findById(dto);

	}

	public void testCon(BusinessRequest res) {

		String msgSignature = super.getParameter("msg_signature");
		String nonce = super.getParameter("nonce");
		String timestamp = super.getParameter("timestamp");
		String echostr = super.getParameter("echostr");
		if (StringUtils.isNotBlank(echostr)) {
			if (!wxCpService.checkSignature(msgSignature, timestamp, nonce, echostr)) {
				// 消息签名不正确，说明不是公众平台发过来的消息
				super.writeResult("非法请求");
				return;
			}
			try {
				WxCpCryptUtil cryptUtil = new WxCpCryptUtil(configStorage);
				String plainText = cryptUtil.decrypt(echostr);
				// 说明是一个仅仅用来验证的请求，回显echostr
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
