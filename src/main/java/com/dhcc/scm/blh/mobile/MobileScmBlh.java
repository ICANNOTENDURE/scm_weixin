/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.mobile;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
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

@Component
public class MobileScmBlh extends AbstractBaseBlh {



	@Resource
	private CommonService commonService;



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
			OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class, barCode);
			if(orderDetailSub!=null){
				inGdRecItm.setBatno(orderDetailSub.getOrdSubBatNo());
				inGdRecItm.setExpDate(orderDetailSub.getOrdSubExpDate());
				inGdRecItm.setResult("0");
				OrderDetail orderDetail=commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
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
		}
		super.writeJSON(inGdRecItm);
	}
}
