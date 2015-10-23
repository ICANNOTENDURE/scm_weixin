/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.mobile;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.mobile.InGdRecItm;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.mobile.MobileScmService;
import com.google.gson.JsonObject;

@Component
public class MobileScmBlh extends AbstractBaseBlh {


	private static Log logger = LogFactory.getLog(MobileScmBlh.class);

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
	* @param @param res    设定文件 
	* @return void    返回类型 
	 * @throws IOException 
	* @throws 
	* @author zhouxin   
	* @date 2015年10月18日 上午9:57:04
	 */
	public void getBarCodeInfo(BusinessRequest res) throws IOException{
		
		String barCode=super.getParameter("value");
		InGdRecItm inGdRecItm=new InGdRecItm();
		if(StringUtils.isNotBlank(barCode)){
			logger.info("barCode:"+barCode);
			OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class, barCode);
			if(orderDetailSub!=null){
				OrderDetail orderDetail=commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
				if(orderDetail.getOrderState().longValue()>4){
					if(orderDetailSub.getOrdSubStatus().equals("T")){
						inGdRecItm.setResultCode("-2");
						inGdRecItm.setResultMsg("该条码已入库,不能重复入库");
					}else{
						inGdRecItm.setResultCode("0");
						inGdRecItm.setBatno(orderDetailSub.getOrdSubBatNo());
						inGdRecItm.setExpDate(orderDetailSub.getOrdSubExpDate());
						float fac=orderDetail.getOrderFac().floatValue();
						inGdRecItm.setQty(orderDetailSub.getOrderSubQty()*fac);
						inGdRecItm.setRp(orderDetailSub.getOrderSubRp()/fac);
						HopInc hopInc=commonService.get(HopInc.class, orderDetail.getOrderHopIncId());
						inGdRecItm.setDesc(hopInc.getIncName());
						inGdRecItm.setUom(hopInc.getIncUomname());
						if(hopInc.getIncManfid()!=null){
							HopManf hopManf=commonService.get(HopManf.class, hopInc.getIncManfid());
							inGdRecItm.setManf(hopManf.getManfName());
						}
						Vendor vendor=commonService.get(Vendor.class, orderDetail.getOrderVenId());
						inGdRecItm.setVendor(vendor.getName());
						inGdRecItm.setScmid(barCode);
					}
				}else{
					inGdRecItm.setResultCode("-3");
					inGdRecItm.setResultMsg("该条码不能使用");
				}
			}
		}
		super.writeJSON(inGdRecItm);
	}
	
	
	/**
	 * 
	* @Title: saveBarCode 
	* @Description: TODO(药库pda确认收货) 
	* @param @param res
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年10月20日 下午4:11:48
	 */
	public void saveBarCode(BusinessRequest res) throws IOException{
		
		OperateResult operateResult=new OperateResult();
		JsonObject jsonObject = new JsonObject();
		try {
			String barCodeStr=super.getParameter("value");
			String userid=super.getParameter("userid");
			jsonObject.addProperty("resultCode", "-1");
			jsonObject.addProperty("value", barCodeStr);
			jsonObject.addProperty("userid", Long.valueOf(userid));
			mobileScmService.cmpInGdRec(jsonObject);
			operateResult.setResultCode(jsonObject.get("resultCode").toString());
			if(jsonObject.get("resultMsg")!=null){
				operateResult.setResultContent(jsonObject.get("resultMsg").toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			operateResult.setResultCode("-3");
			operateResult.setResultContent(e.getLocalizedMessage());
		}finally{
			super.writeJSON(operateResult);
		}
	}
}
