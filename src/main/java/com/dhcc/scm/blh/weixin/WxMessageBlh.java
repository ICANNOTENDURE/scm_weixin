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
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpInMemoryConfigStorage;
import me.chanjar.weixin.cp.api.WxCpMessageRouter;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.bean.WxCpDepart;
import me.chanjar.weixin.cp.bean.WxCpMessage;
import me.chanjar.weixin.cp.bean.WxCpXmlMessage;
import me.chanjar.weixin.cp.bean.WxCpXmlOutMessage;
import me.chanjar.weixin.cp.util.crypto.WxCpCryptUtil;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.weixin.WxMessageDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.weixin.DepartVo;
import com.dhcc.scm.entity.vo.weixin.KindEditorResult;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.WxDepart;
import com.dhcc.scm.entity.weixin.WxMessage;
import com.dhcc.scm.entity.weixin.WxMessagePic;
import com.dhcc.scm.entity.weixin.WxUser;
import com.dhcc.scm.service.weixin.WxMessageService;

@Component
public class WxMessageBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(WxMessageBlh.class);

	@Resource
	private WxCpInMemoryConfigStorage configStorage;

	@Resource
	private WxCpMessageRouter messageRouter;

	@Resource
	private WxMessageService wxMessageService;

	@Resource
	private CommonService commonService;

	@Resource
	private WxCpService wxCpService;
	
	@Resource
	private WxMpService wxMpService;
	
	@Resource
	private WxMpMessageRouter wxMpMessageRouter;
	
	@Resource
	private  WxMpConfigStorage wxMpConfigStorage;
	
	public WxMessageBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);

		// 调用对应的service方法
		wxMessageService.list(dto);
	}

	// 保存
	public void save(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		try {
			if (StringUtils.isBlank(dto.getWxMessage().getWxMessageId())) {
				dto.getWxMessage().setWxMessageId(null);
			}
			dto.getWxMessage().setWxMessageDate(new Date());
			commonService.saveOrUpdate(dto.getWxMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除
	public void delete(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getWxMessage().getWxMessageId())) {
			String[] ids = dto.getWxMessage().getWxMessageId().split(",");
			for (int i = 0; i < ids.length; i++) {
				// 调用对应的service方法
				commonService.delete(WxMessage.class, ids[i].trim());
			}

		}

	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	public void findById(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);

		// 调用对应的service方法
		wxMessageService.findById(dto);

	}

	/**
	 * 
	 * @Title: getDepartUser
	 * @Description: TODO(获取微信部门列表)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年8月24日 上午8:55:04
	 */
	public void getDepart(BusinessRequest res) {

		try {
			List<WxCpDepart> departList = wxCpService.departGet();
			List<DepartVo> roots = new ArrayList<DepartVo>();
			Map<String, DepartVo> departMap = new HashMap<String, DepartVo>();
			// 将获取的根节点组装成Map
			for (WxCpDepart wxCpDepart : departList) {
				DepartVo departVo = new DepartVo();
				departVo.setId(wxCpDepart.getId());
				departVo.setText(wxCpDepart.getName());
				departVo.setParentId(wxCpDepart.getParentId());
				// 获取根节点
				if (wxCpDepart.getParentId().toString().equals("0")) {
					roots.add(departVo);
				}
				departMap.put(wxCpDepart.getId().toString(), departVo);
			}
			// 遍历Map
			Iterator<String> keys = departMap.keySet().iterator();
			while (keys.hasNext()) {
				String key = keys.next();
				DepartVo departVo = departMap.get(key);
				// 缕清父子关系
				if (!departVo.getParentId().toString().equals("0")) {
					DepartVo parentDepart = departMap.get(departVo.getParentId().toString());
					parentDepart.getChildren().add(departVo);
				}
			}
			super.writeJSON(roots);
		} catch (WxErrorException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @Title: sendMessage
	 * @Description: TODO(推送消息)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年8月25日 上午11:45:40
	 */
	public void sendMessage(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		OperateResult operateResult = new OperateResult();
		try {
			String host = PropertiesBean.getInstance().getProperty("config.scm.address");
			String angentId = PropertiesBean.getInstance().getProperty("config.weixin.agentId");
			WxCpMessage cpMessage = new WxCpMessage();
			cpMessage.setMsgType(WxConsts.CUSTOM_MSG_NEWS);
			cpMessage.setAgentId(angentId);
			cpMessage.setArticles(new ArrayList<WxCpMessage.WxArticle>());
			StringBuilder toPart = new StringBuilder();
			if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getWxMessage().getWxMessageId())) {
				String[] ids = dto.getWxMessage().getWxMessageId().split(",");
				for (int i = 0; i < ids.length; i++) {
					WxMessage wxMessage = commonService.get(WxMessage.class, ids[i].trim());
					toPart.append(wxMessage.getWxMessageToPartyId());
					WxCpMessage.WxArticle article1 = new WxCpMessage.WxArticle();
					article1.setUrl(host + "weixin/wxMessageCtrl!listWxMessage.htm?dto.wxMessage.wxMessageId=" + wxMessage.getWxMessageId());

					if (org.apache.commons.lang3.StringUtils.isNotBlank(wxMessage.getWxMessagePicUrl())) {
						article1.setPicUrl(host + "uploadWeixin/" + wxMessage.getWxMessagePicUrl());
					}
					// article1.setDescription(wxMessage.getWxMessageContent());
					article1.setTitle(wxMessage.getWxMessageTitle());
					cpMessage.getArticles().add(article1);
				}
			}
			cpMessage.setToParty(toPart.toString());
			// 调用对应的service方法
			wxCpService.messageSend(cpMessage);

			operateResult.setResultCode("0");
			super.writeJSON(operateResult);
		} catch (Exception e) {
			operateResult.setResultContent(e.getMessage());
			super.writeJSON(operateResult);
		}
	}

	/**
	 * 
	 * @Title: upload
	 * @Description: TODO(上传微信标题图片)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年8月26日 下午5:27:54
	 */
	public void upload(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		OperateResult operateResult = new OperateResult();
		KindEditorResult kindEditorResult = new KindEditorResult();
		Date date = new Date();
		SimpleDateFormat smDateFormat = new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");
		String host = PropertiesBean.getInstance().getProperty("config.scm.address");
		try {
			String newFileName = smDateFormat.format(date) + UUID.randomUUID() + ".png";
			// 获取文件存储路径
			String storagePath = ServletActionContext.getServletContext().getRealPath("/uploadWeixin");
			// 判断文件存储路径是否存在，若不存在则自动新建
			File document = new File(storagePath);
			if (!document.exists()) {
				document.mkdir();
			}
			File dstFile = new File(storagePath, newFileName);
			com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);
			WxMessage message = null;
			WxMessagePic messagePic = null;
			operateResult.setResultContent(newFileName);
			if (org.apache.commons.lang3.StringUtils.isBlank(dto.getWxMessage().getWxMessageId())) {
				message = new WxMessage();
				if (dto.getType().equals("1")) {
					message.setWxMessagePicUrl(newFileName);
				} else {
					messagePic = new WxMessagePic();
					messagePic.setWxMessagePIC(newFileName);
				}
			} else {
				if (dto.getType().equals("1")) {
					message = commonService.get(WxMessage.class, dto.getWxMessage().getWxMessageId());
					if (org.apache.commons.lang3.StringUtils.isNotBlank(message.getWxMessagePicUrl())) {
						// FileUtils.forceDelete(new File(storagePath,
						// message.getWxMessagePicUrl()));
					}
					message.setWxMessagePicUrl(newFileName);
				} else {
					messagePic = new WxMessagePic();
					messagePic.setWxMessagePIC(newFileName);
				}
			}
			commonService.saveOrUpdate(message);
			if (messagePic != null) {
				commonService.saveOrUpdate(messagePic);
			}
			operateResult.setResultValue(message.getWxMessageId());
			operateResult.setResultCode("0");
			kindEditorResult.setError(0);
			kindEditorResult.setUrl(host + "/uploadWeixin/" + newFileName);
		} catch (Exception e) {
			operateResult.setResultContent(e.getMessage());
			kindEditorResult.setMessage(e.getLocalizedMessage());
			e.printStackTrace();
		} finally {
			if (dto.getType().equals("1")) {
				super.writeJSON(operateResult);
			} else {
				super.writeJSON(kindEditorResult);
			}
		}

	}

	/**
	 * 
	 * @Title: listWxMessage
	 * @Description: TODO(显示微信)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年8月28日 上午10:55:27
	 */
	public String listWxMessage(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getWxMessage().getWxMessageId())) {
			dto.setWxMessage(commonService.get(WxMessage.class, dto.getWxMessage().getWxMessageId()));
		}
		return "listWxMessage";
	}

	/**
	 * 
	 * @Title: sendMessByOrd
	 * @Description: TODO(医院订单发送推送)
	 * @param @param id 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年9月2日 上午11:31:51
	 */
	public void sendMessByOrd(OrderDetail orderDetail) {
		try {
			String host = PropertiesBean.getInstance().getProperty("config.scm.address");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
			String angentId = PropertiesBean.getInstance().getProperty("config.weixin.agentId");
			Long vendorId = orderDetail.getOrderVenId();
			List<WxDepart> departs = commonService.findByProperty(WxDepart.class, "wxDepartScmId", vendorId);
			if (departs.size() == 0) {
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
			WxCpMessage cpMessage = new WxCpMessage();
			cpMessage.setMsgType(WxConsts.CUSTOM_MSG_NEWS);
			cpMessage.setAgentId(angentId);
			cpMessage.setArticles(new ArrayList<WxCpMessage.WxArticle>());
			cpMessage.setToParty(departs.get(0).getWxDepartId().toString());

			WxCpMessage.WxArticle article1 = new WxCpMessage.WxArticle();
			article1.setTitle("新订单提醒");
			article1.setDescription(sb.toString());
			article1.setUrl(host + "weixin/wxMessageCtrl!mbListOrderDetail.htm?dto.orderDetail.orderNo=" + orderDetail.getOrderNo());
			logger.debug("setUrl:" + article1.getUrl());
			cpMessage.getArticles().add(article1);

			wxCpService.messageSend(cpMessage);
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
	public String mbListOrderDetail(BusinessRequest res) {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
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
		return "mbListOrderDetail";
	}

	/**
	 * 
	 * @Title: authorizationUrl
	 * @Description: TODO(微信验证用户登录)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年9月14日 上午10:23:27
	 */
	public String authorizationUrl(BusinessRequest res) {
		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		try {
			String userIdString = "";
			Cookie[] cookies = WebContextHolder.getContext().getRequest().getCookies();
			for (Cookie cookie : cookies) {
				cookie.getName();// get the cookie name
				cookie.getValue(); // get the cookie value
				if (cookie.getName().equals("uesrId")) {
					userIdString = cookie.getValue();
				}
			}
			if (StringUtils.isBlank(userIdString)) {
				String host = PropertiesBean.getInstance().getProperty("config.scm.address");
				String url = host + "weixin/wxMessageCtrl!listToDoTask.htm";
				dto.setAuthUrl(wxCpService.oauth2buildAuthorizationUrl(url, null));
			} else {
				return "listToDoTask";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "authorizationUrl";
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
	public String listToDoTask(BusinessRequest res) throws IOException {

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		String userIdString = super.getWeiXinId();
		dto.setTitle("订单查询");
		if (org.apache.commons.lang3.StringUtils.isBlank(userIdString)) {
			dto.setTitle("请登录");
			return "listToDoTask";
		}
		WxUser wxUser = commonService.get(WxUser.class, userIdString);
		if (wxUser == null) {
			dto.setTitle("微信id未和供应链关联");
			return "listToDoTask";
		}
		if (wxUser.getWxUserDepartId() == null) {
			dto.setTitle("部门为空");
			return "listToDoTask";
		}
		try {
			WxDepart wxDepart = commonService.get(WxDepart.class, wxUser.getWxUserDepartId());
			dto.setVenid(wxDepart.getWxDepartScmId());

			wxMessageService.listToDoTask(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "listToDoTask";
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

		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		OperateResult operateResult = new OperateResult();
		String userIdString = super.getWeiXinId();
		if (org.apache.commons.lang3.StringUtils.isBlank(userIdString)) {
			operateResult.setResultCode("1");
			operateResult.setResultContent("登录超时");
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
					exeState.setUserid(orderDetail.getOrderUserId());
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
	public String searchOrder(BusinessRequest res) {
		WxMessageDto dto = super.getDto(WxMessageDto.class, res);
		dto.setTitle("订单查询");
		return "searchOrder";
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

	// 下面是公众号的
	// 2016-02-22

	public void checkSignature(BusinessRequest res) throws IOException {
		
		HttpServletRequest request=WebContextHolder.getContext().getRequest();
		String signature = getParameter("signature");
		String nonce = getParameter("nonce");
		String timestamp = getParameter("timestamp");
		if (!wxMpService.checkSignature(timestamp, nonce, signature)) {
			// 消息签名不正确，说明不是公众平台发过来的消息
			writeResult("非法请求");
			return;
		}

		String echostr = getParameter("echostr");
		if (StringUtils.isNotBlank(echostr)) {
			// 说明是一个仅仅用来验证的请求，回显echostr
			writeResult(echostr);
			return;
		}

		String encryptType = StringUtils.isBlank(getParameter("encrypt_type")) ? "raw" : getParameter("encrypt_type");

		if ("raw".equals(encryptType)) {
			// 明文传输的消息
			WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(request.getInputStream());
			WxMpXmlOutMessage outMessage = wxMpMessageRouter.route(inMessage);
			writeResult(outMessage.toXml());
			return;
		}

		if ("aes".equals(encryptType)) {
			// 是aes加密的消息
			String msgSignature = getParameter("msg_signature");
			WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(request.getInputStream(), wxMpConfigStorage, timestamp, nonce, msgSignature);
			WxMpXmlOutMessage outMessage = wxMpMessageRouter.route(inMessage);
			writeResult(outMessage.toEncryptedXml(wxMpConfigStorage));
			return;
		}

		writeResult("不可识别的加密类型");
		return;
	}

}
