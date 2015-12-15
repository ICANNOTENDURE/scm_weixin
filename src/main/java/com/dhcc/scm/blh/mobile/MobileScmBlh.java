/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.mobile;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.mobile.InGdRec;
import com.dhcc.scm.entity.vo.mobile.InGdRecItm;
import com.dhcc.scm.entity.vo.mobile.QrCode;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.mobile.MobileScmService;
import com.google.gson.JsonObject;

@Component
public class MobileScmBlh extends AbstractBaseBlh {

	@Resource
	private CommonService commonService;

	@Resource
	private MobileScmService mobileScmService;

	public MobileScmBlh() {

	}

	/**
	 * 
	 * @Title: getBarCodeInfo
	 * @Description: TODO(查询条码信息)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws IOException
	 * @throws
	 * @author zhouxin
	 * @date 2015年10月18日 上午9:57:04
	 */
	public void getBarCodeInfo(BusinessRequest res) throws IOException {

		String barCode = super.getParameter("value");
		QrCode qrCode = JsonUtils.toObject(barCode, QrCode.class);
		InGdRec gdRec = new InGdRec();
		gdRec.setCodeType(qrCode.getCodeType());
		switch (qrCode.getCodeType()) {
		case "ByOrder":
			List<OrderDetail> details=commonService.findByProperty(OrderDetail.class, "orderNo", qrCode.getContent());
			for(OrderDetail detail:details){
				List<OrderDetailSub> detailSubs=commonService.findByProperty(OrderDetailSub.class, "ordSubDetailId", detail.getOrderId());
				for(OrderDetailSub detailSub:detailSubs){
					InGdRecItm inGdRecItm = new InGdRecItm();
					if (!detailSub.getOrdSubStatus().equals("T")){
						inGdRecItm.setResultCode("0");
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
						inGdRecItm.setScmid(qrCode.getContent());
						gdRec.getGdRecItms().add(inGdRecItm);
					}
				}
			}
			break;
		default:
			InGdRecItm inGdRecItm = new InGdRecItm();
			OrderDetailSub orderDetailSub = commonService.get(OrderDetailSub.class, qrCode.getContent());
			if (orderDetailSub != null) {
				OrderDetail orderDetail = commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
				if (orderDetail.getOrderState().longValue() > 4) {
					if (orderDetailSub.getOrdSubStatus().equals("T")) {
						gdRec.setResultCode("-2");
						gdRec.setResultComtent("该条码已入库,不能重复入库");
					} else {
						gdRec.setResultCode("0");
						inGdRecItm.setBatno(orderDetailSub.getOrdSubBatNo());
						inGdRecItm.setExpDate(orderDetailSub.getOrdSubExpDate());
						float fac = orderDetail.getOrderFac().floatValue();
						if(qrCode.getCodeType().equals("ByOty")){
							inGdRecItm.setQty(1);
							inGdRecItm.setSeq(qrCode.getSeq());
						}else{
							inGdRecItm.setQty(orderDetailSub.getOrderSubQty() * fac);
						}
						inGdRecItm.setRp(orderDetailSub.getOrderSubRp() / fac);
						HopInc hopInc = commonService.get(HopInc.class, orderDetail.getOrderHopIncId());
						inGdRecItm.setDesc(hopInc.getIncName());
						inGdRecItm.setUom(hopInc.getIncUomname());
						if (hopInc.getIncManfid() != null) {
							HopManf hopManf = commonService.get(HopManf.class, hopInc.getIncManfid());
							inGdRecItm.setManf(hopManf.getManfName());
						}
						Vendor vendor = commonService.get(Vendor.class, orderDetail.getOrderVenId());
						inGdRecItm.setVendor(vendor.getName());
						inGdRecItm.setScmid(qrCode.getContent());
						gdRec.getGdRecItms().add(inGdRecItm);
					}
				} else {
					gdRec.setResultCode("-3");
					gdRec.setResultComtent("条码错误");
				}
			}
			
			break;
		}
		super.writeJSON(gdRec);
	}

	/**
	 * 
	 * @Title: saveBarCode
	 * @Description: TODO(药库pda确认收货)
	 * @param @param res
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年10月20日 下午4:11:48
	 */
	public void saveBarCode(BusinessRequest res) throws IOException {

		OperateResult operateResult = new OperateResult();
		JsonObject jsonObject = new JsonObject();
		try {
			String barCodeStr = super.getParameter("value");
			String userid = super.getParameter("userid");
			jsonObject.addProperty("resultCode", "-1");
			jsonObject.addProperty("value", barCodeStr);
			jsonObject.addProperty("userid", Long.valueOf(userid));
			mobileScmService.cmpInGdRec(jsonObject);
			operateResult.setResultCode(jsonObject.get("resultCode").toString());
			if (jsonObject.get("resultMsg") != null) {
				operateResult.setResultContent(jsonObject.get("resultMsg").toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
			operateResult.setResultCode("-3");
			operateResult.setResultContent(e.getLocalizedMessage());
		} finally {
			super.writeJSON(operateResult);
		}
	}
}
