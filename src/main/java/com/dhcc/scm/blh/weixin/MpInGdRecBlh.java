/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.scm.blh.sys.LockAppUtil;
import com.dhcc.scm.dto.weixin.MpInGdRecDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.OrdLabel;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecItm;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.mobile.InGdRec;
import com.dhcc.scm.entity.vo.mobile.InGdRecItm;
import com.dhcc.scm.entity.vo.mobile.QrCode;
import com.dhcc.scm.entity.vo.weixin.WxJsapiSign;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.tool.datetime.OperTime;

@Component
public class MpInGdRecBlh extends AbstractBaseBlh {

	@Resource
	private CommonService commonService;

	@Resource
	private WxMpService wxMpService;

	@Resource
	private WxMpConfigStorage wxMpConfigStorage;
	
	@Resource
	private LockAppUtil lockAppUtil;

	public MpInGdRecBlh() {

	}

	/**
	 * 
	 * @Title: mpInGdRec
	 * @Description: TODO(进入入库界面)
	 * @param @param res
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2016年3月8日 上午9:40:18
	 */
	public String mpInGdRec(BusinessRequest res) {

		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		dto.setTitle("入库");
		NormalAccount normalAccount = super.getMpUserId();
		if (normalAccount == null) {
			dto.setOperateResult(new OperateResult());
			return "mpSubscribe";
		}
		if (normalAccount.getNormalUser().getType().longValue() != 1) {
			return "noPermission";
		}
		dto.setUser(normalAccount.getAccountAlias());
		HopCtloc hopCtloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
		dto.setLoc(hopCtloc.getName());
		new OperTime();
		dto.setDate(OperTime.getCurrentDate());
		return "mpInGdRec";
	}

	/**
	 * 
	 * @Title: getWxJsapiSignature
	 * @Description: TODO(获取微信config)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2016年3月8日 上午9:40:53
	 */
	public void getWxJsapiSignature(BusinessRequest res) {
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		WxJsapiSign jsapiSign = new WxJsapiSign();
		try {
			WxJsapiSignature jsapiSignature = wxMpService.createJsapiSignature(dto.getUrl());
			jsapiSign.setResultCode(0);
			jsapiSign.setAppId(wxMpConfigStorage.getAppId());
			jsapiSign.setNoncestr(jsapiSignature.getNoncestr());
			jsapiSign.setSignature(jsapiSignature.getSignature());
			jsapiSign.setTimestamp(jsapiSignature.getTimestamp());
		} catch (WxErrorException e) {
			e.printStackTrace();
			jsapiSign.setErrMsg(e.getMessage());
		} finally {
			super.writeJSON(jsapiSign);
		}

	}

	public void getBarCodeInfo(BusinessRequest res) {
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		OperateResult operateResult = new OperateResult();
		dto.setOperateResult(operateResult);
		Long locId = getMpUserId().getNormalUser().getLocId();
		InGdRec gdRec = new InGdRec();
		try {
			QrCode qrCode = JsonUtils.toObject(dto.getBarcode(), QrCode.class);
			switch (qrCode.getCodeType()) {
			case "ByOrder":
				OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(qrCode.getContent()));
				String[] ordNames = { "orderNo", "orderRecLoc" };
				Object[] ordValues = { orderDetail.getOrderNo(), locId };
				List<OrderDetail> orderDetails = commonService.findByProperties(OrderDetail.class, ordNames, ordValues);
				for (OrderDetail detail : orderDetails) {
					String[] subNames = { "ordSubDetailId", "ordSubStatus" };
					Object[] subValues = { detail.getOrderId(), "Y" };
					List<OrderDetailSub> orderDetailSubs = commonService.findByProperties(OrderDetailSub.class, subNames, subValues);

					for (OrderDetailSub detailSub : orderDetailSubs) {
						InGdRecItm inGdRecItm = new InGdRecItm();
						inGdRecItm.setResultCode("0");
						inGdRecItm.setInvno(detailSub.getOrdSubInvNo());
						inGdRecItm.setBatno(detailSub.getOrdSubBatNo());
						inGdRecItm.setExpDate(detailSub.getOrdSubExpDate());
						float fac = detail.getOrderFac().floatValue();
						inGdRecItm.setQty(detailSub.getOrderSubQty() * fac);
						inGdRecItm.setRp(detailSub.getOrderSubRp() / fac);
						HopInc hopInc = commonService.get(HopInc.class, detail.getOrderHopIncId());
						inGdRecItm.setDesc(hopInc.getIncName());
						inGdRecItm.setUom(hopInc.getIncUomname());
						if (hopInc.getIncManfid() != null) {
							HopManf hopManf = commonService.get(HopManf.class, hopInc.getIncManfid());
							inGdRecItm.setManf(hopManf.getManfName());
						}
						Vendor vendor = commonService.get(Vendor.class, detail.getOrderVenId());
						inGdRecItm.setVendor(vendor.getName());
						inGdRecItm.setScmid(detailSub.getOrdSubId());
						gdRec.getGdRecItms().add(inGdRecItm);
						gdRec.setResultCode("0");
					}
				}
				break;
			default:
				InGdRecItm inGdRecItm = new InGdRecItm();
				String orderDetailSubId = "";
				if (qrCode.getCodeType().equals("ByQty")) {
					OrdLabel label = commonService.get(OrdLabel.class, qrCode.getContent());
					orderDetailSubId = label.getLabelParentId();
					if (StringUtils.equals(label.getLabelStatus(), "T")) {
						gdRec.setResultComtent("该条码已入库,不能重复入库");
						super.writeJSON(gdRec);
						return;
					}

				} else {
					orderDetailSubId = qrCode.getContent();
				}
				OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, orderDetailSubId);
				if (orderDetailSub == null) {
					gdRec.setResultComtent("条码错误01");
					super.writeJSON(gdRec);
					return;
				}
				if (orderDetailSub.getOrdSubStatus().equals("T") && !StringUtils.equals(qrCode.getCodeType(), "ByQty")) {
					gdRec.setResultComtent("该条码已入库,不能重复入库");
					super.writeJSON(gdRec);
					return;
				}
				OrderDetail orderDetail1 = commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
				if (orderDetail1.getOrderState().longValue() > 2) {
					gdRec.setResultCode("0");
					inGdRecItm.setInvno(orderDetailSub.getOrdSubInvNo());
					inGdRecItm.setBatno(orderDetailSub.getOrdSubBatNo());
					inGdRecItm.setExpDate(orderDetailSub.getOrdSubExpDate());
					float fac = orderDetail1.getOrderFac().floatValue();
					boolean flag = qrCode.getCodeType().equals("ByQty");
					// 奇葩，非要我这样写？
					if (flag) {
						inGdRecItm.setQty(1);
						inGdRecItm.setSeq(qrCode.getSeq());
						inGdRecItm.setScmid(orderDetailSub.getOrdSubId());
						inGdRecItm.setLabelId(qrCode.getContent());
					} else {
						inGdRecItm.setScmid(qrCode.getContent());
						inGdRecItm.setQty(orderDetailSub.getOrderSubQty() * fac);
					}
					inGdRecItm.setRp(orderDetailSub.getOrderSubRp() / fac);
					HopInc hopInc = commonService.get(HopInc.class, orderDetail1.getOrderHopIncId());
					inGdRecItm.setDesc(hopInc.getIncName());
					inGdRecItm.setUom(hopInc.getIncUomname());
					if (hopInc.getIncManfid() != null) {
						HopManf hopManf = commonService.get(HopManf.class, hopInc.getIncManfid());
						inGdRecItm.setManf(hopManf.getManfName());
					}
					Vendor vendor = commonService.get(Vendor.class, orderDetail1.getOrderVenId());
					inGdRecItm.setVendor(vendor.getName());
					gdRec.getGdRecItms().add(inGdRecItm);
				} else {
					gdRec.setResultComtent("条码错误-状态不对");
				}
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			gdRec.setResultComtent(e.getMessage());
		} finally {
			super.writeJSON(gdRec);
		}
	}
	

	public void saveIngdRec(BusinessRequest res) {
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		OperateResult operateResult=new OperateResult();
		dto.setOperateResult(operateResult);
		if(org.apache.commons.lang3.StringUtils.isBlank(dto.getOrdSubIdStr())){
			operateResult.setResultContent("入参为空");
			writeJSON(operateResult);
			return;
		}
		String ingdrecno=lockAppUtil.GetAppNo("INGDREC");
		StInGdRec stInGdRec=new StInGdRec();
		stInGdRec.setIngdrecNo(ingdrecno);
		stInGdRec.setIngdrecRemark(dto.getRemark());
		stInGdRec.setIndrecDate(new Date());
		stInGdRec.setIngdrecLocId(getMpUserId().getNormalUser().getLocId());
		dto.setStInGdRec(stInGdRec);
		
		String[] OrdSubIds=dto.getOrdSubIdStr().split(BaseConstants.COMMA);
		for(String ordSubId:OrdSubIds){
			if(org.apache.commons.lang3.StringUtils.isNotBlank(ordSubId)){
				OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class, ordSubId.trim());
				StInGdRecItm stInGdRecItm=new StInGdRecItm();
				stInGdRecItm.setIngdrecitmBatNo(orderDetailSub.getOrdSubBatNo());
			}
		}
	}

}
