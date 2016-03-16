/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.dto.weixin.MpInGdRecDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.OrdLabel;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecItm;
import com.dhcc.scm.entity.st.StInGdRecPic;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.mobile.InGdRec;
import com.dhcc.scm.entity.vo.mobile.InGdRecItm;
import com.dhcc.scm.entity.vo.mobile.QrCode;
import com.dhcc.scm.entity.vo.weixin.WxJsapiSign;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.st.StInGdRecService;
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
	private StInGdRecService stInGdRecService;

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
	

	
	//保存入库单
	public void saveIngdRec(BusinessRequest res) {
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		OperateResult operateResult=new OperateResult();
		dto.setOperateResult(operateResult);
		if(org.apache.commons.lang3.StringUtils.isBlank(dto.getOrdSubIdStr())){
			operateResult.setResultContent("入参为空");
			writeJSON(operateResult);
			return;
		}
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploads/weixin");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}
		String[] mediaIds=dto.getImgIdStr().split(BaseConstants.COMMA);
		List<StInGdRecPic> stInGdRecPics=new ArrayList<StInGdRecPic>();
		for(String mediaId:mediaIds){
			if(org.apache.commons.lang3.StringUtils.isBlank(mediaId)){
				continue;
			}
			try {
				File wxFile=wxMpService.mediaDownload(mediaId);
				String newFileName = "INGDREC"+OperTime.getCurrentDate()+"_"+UUID.randomUUID().toString()+ com.dhcc.framework.util.FileUtils.getFileExp(wxFile.getName());
				File dstFile = new File(storageFileName, newFileName);
				com.dhcc.framework.util.FileUtils.copyFile(wxFile, dstFile, BaseConstants.BUFFER_SIZE);
				StInGdRecPic inGdRecPic=new StInGdRecPic();
				inGdRecPic.setIngdrecpicPath(newFileName);
				stInGdRecPics.add(inGdRecPic);
			} catch (WxErrorException e) {
				e.printStackTrace();
				operateResult.setResultContent(e.getMessage());
				writeJSON(operateResult);
				return;
			}
		}
		
		StInGdRec stInGdRec=new StInGdRec();
		stInGdRec.setIngdrecRemark(dto.getRemark());
		stInGdRec.setIngdrecLocId(getMpUserId().getNormalUser().getLocId());
		stInGdRec.setIngdrecUserId(getMpUserId().getAccountId());
		StInGdRecDto stDto=new StInGdRecDto();
		stDto.setStInGdRec(stInGdRec);
		stDto.setOrdSubId(dto.getOrdSubIdStr());
		stDto.setInGdRecPics(stInGdRecPics);
		stInGdRecService.mpInGdRec(stDto);
		operateResult.setResultContent(stDto.getStInGdRec().getIngdrecNo());
		operateResult.setResultCode("0");
		writeJSON(operateResult);
	}
	
	
	//查询入库单
	public String mpSearchIngdRec(BusinessRequest res) {
		
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		dto.setTitle("入库单查询");
		NormalAccount normalAccount = super.getMpUserId();
		if (normalAccount == null) {
			dto.setOperateResult(new OperateResult());
			return "mpSubscribe";
		}
		if (normalAccount.getNormalUser().getType().longValue() != 1) {
			return "noPermission";
		}
		return "mpSearchIngdRec";
	}
	
	//查询入库单
	public String mpListInGdRec(BusinessRequest res) {
		
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		dto.setTitle("入库单列表");
		NormalAccount normalAccount = super.getMpUserId();
		if (normalAccount == null) {
			dto.setOperateResult(new OperateResult());
			return "mpSubscribe";
		}
		if (normalAccount.getNormalUser().getType().longValue() != 1) {
			return "noPermission";
		}
		dto.setLocId(normalAccount.getNormalUser().getLocId());
		stInGdRecService.listInGdRec(dto);
		return "mpListInGdRec";
	}
	
	
	
	public String mpListInGdRecDetail(BusinessRequest res){
		MpInGdRecDto dto = super.getDto(MpInGdRecDto.class, res);
		dto.setTitle("入库单明细");
		NormalAccount normalAccount = super.getMpUserId();
		if (normalAccount == null) {
			dto.setOperateResult(new OperateResult());
			return "mpSubscribe";
		}
		if (normalAccount.getNormalUser().getType().longValue() != 1) {
			return "noPermission";
		}
		if(dto.getStInGdRec().getIngdrecId()!=null){
			List<StInGdRecPic> inGdRecPics=commonService.findByProperty(StInGdRecPic.class, "ingdrecpicParrefId", dto.getStInGdRec().getIngdrecId());
			dto.setInGdRecPics(inGdRecPics);
			List<StInGdRecItm> inGdRecItms=commonService.findByProperty(StInGdRecItm.class, "ingdrecitmParrefId", dto.getStInGdRec().getIngdrecId());
			for(StInGdRecItm inGdRecItm:inGdRecItms){
				HopInc hopInc=commonService.get(HopInc.class, inGdRecItm.getIngdrecitmIncId());
				inGdRecItm.setIngdrecitmIncName(hopInc.getIncName());
			}
			dto.setStInGdRecItms(inGdRecItms);
		}
		return "mpListInGdRecDetail";
	}
}
