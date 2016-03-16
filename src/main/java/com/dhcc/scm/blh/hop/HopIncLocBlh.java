/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.hop;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.blh.nur.NurseBlh;
import com.dhcc.scm.blh.ord.OrdBlh;
import com.dhcc.scm.dto.hop.HopIncLocDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopIncLoc;
import com.dhcc.scm.entity.ord.OrderPlan;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.ws.HisIncLocQtyItmWeb;
import com.dhcc.scm.entity.vo.ws.HisIncLocQtyWeb;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.hop.HopIncLocService;
import com.dhcc.scm.service.userManage.NormalAccountService;


@Component
public class HopIncLocBlh extends AbstractBaseBlh {


	@Resource
	private HopIncLocService hopIncLocService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private NormalAccountService normalAccountService;
	
	@Resource
	private NurseBlh nurseBlh;
	
	@Resource
	private OrdBlh ordBlh;
	
	public HopIncLocBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		HopIncLocDto dto = super.getDto(HopIncLocDto.class, res);
		
		//调用对应的service方法
		hopIncLocService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		HopIncLocDto dto = super.getDto(HopIncLocDto.class, res);
		
		//调用对应的service方法
		//hopIncLocService.save(dto);
		commonService.saveOrUpdate(dto.getHopIncLoc());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HopIncLocDto dto = super.getDto(HopIncLocDto.class, res);
		
		//调用对应的service方法
		hopIncLocService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HopIncLocDto dto = super.getDto(HopIncLocDto.class, res);
		
		//调用对应的service方法
		hopIncLocService.update(dto);
	}
	
	/**
	 * 
	* @Title: savePlanByLocQty 
	* @Description: TODO(根据科室库存生成计划) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月17日 下午2:41:28
	 */
	@SuppressWarnings("unchecked")
	public void savePlanByLocQty(BusinessRequest res) {
		HopIncLocDto dto = super.getDto(HopIncLocDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			Long userId=Long.valueOf(super.getLoginInfo().get("USERID").toString());
			Long ctlocId=Long.valueOf(super.getLoginInfo().get("LOCID").toString());
			DetachedCriteria criteria = DetachedCriteria.forClass(HopIncLoc.class);
			criteria.add(Restrictions.eq("incLocLocId", ctlocId));
			if(StringUtils.isNotBlank(dto.getMinFlag())){
				if(dto.getMinFlag().equals("on")){
					criteria.add(Restrictions.leProperty("incLocQty", "incLocMinQty"));
				}
			}
			if(StringUtils.isNotBlank(dto.getStandFlag())){
				if(dto.getStandFlag().equals("on")){
					criteria.add(Restrictions.leProperty("incLocQty", "incLocStandQty"));
				}
			}
			String planNo=nurseBlh.GetAppNo("PLAN");
			List<HopIncLoc> hopIncLocs=commonService.findByDetachedCriteria(criteria);
			for(HopIncLoc hopIncLoc:hopIncLocs){
				OrderPlan orderPlan=new OrderPlan();
				orderPlan.setPlanNo(planNo);
				orderPlan.setPlanDate(new Date());
				orderPlan.setPlanFlag("N");
				orderPlan.setPlanUserId(userId);
				orderPlan.setPlanCtloc(ctlocId);
				orderPlan.setPlanQty(hopIncLoc.getIncLocStandQty().floatValue()-hopIncLoc.getIncLocQty().floatValue());
				orderPlan.setPlanIncId(hopIncLoc.getIncLocParrefId());
				commonService.saveOrUpdate(orderPlan);
			}
			dto.getOperateResult().setResultContent(planNo);
			dto.getOperateResult().setResultCode("1");
			super.writeJSON(dto.getOperateResult());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
		
	}
	
	
	/**
	 * 
	* @Title: cmpRecWS 
	* @Description: TODO(webservice 调用同步his科室库存) 
	* @param @param operateResult
	* @param @param hisCmpRecWeb    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月15日 下午3:57:05
	 */
	public void saveHisLocQty(OperateResult operateResult,HisIncLocQtyWeb hisIncLocQtyWeb){
		this.saveHisLocQtySub(operateResult, hisIncLocQtyWeb);

	}
	public void saveHisLocQtySub(OperateResult operateResult,HisIncLocQtyWeb hisIncLocQtyWeb){
		
		
		NormalAccount normalAccount=ordBlh.checkWsParam(operateResult, hisIncLocQtyWeb.getUserName(), hisIncLocQtyWeb.getPassWord(), hisIncLocQtyWeb.getHisIncLocQtyItmWebs());
		if(normalAccount==null){
			return;
		}
		if (!normalAccount.getNormalUser().getType().toString().equals("1")) {
			operateResult.setResultCode("-5");
			operateResult.setResultContent("用户类型不对");
			return;
		}
		
		HopCtloc hopCtloc=commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
		StringBuffer errMessage=new StringBuffer();
		for(HisIncLocQtyItmWeb hisIncLocQtyItmWeb:hisIncLocQtyWeb.getHisIncLocQtyItmWebs()){
			String[] ctlocPropertyNames={"hospid","hisid"};
			Object[] ctlocValues={hopCtloc.getHospid(),Long.valueOf(hisIncLocQtyItmWeb.getLocCode())};
			List<HopCtloc> ctlocs=commonService.findByProperties(HopCtloc.class,ctlocPropertyNames,ctlocValues);
			if(ctlocs.size()==0){
				errMessage.append(hisIncLocQtyItmWeb.getLocCode()+"科室代码不匹配");
				continue;
			}
			String[] incPropertyNames={"incHospid","incBarCode"};
			Object[] incValues={hopCtloc.getHospid(),hisIncLocQtyItmWeb.getLocIncCode()};
			List<HopInc> hopIncs=commonService.findByProperties(HopInc.class,incPropertyNames,incValues);
			if(hopIncs.size()==0){
				errMessage.append(hisIncLocQtyItmWeb.getLocIncCode()+"商品代码不匹配");
				continue;
			}
			HopIncLoc hopIncLoc=new HopIncLoc();
			String[] incLocPropertyNames={"incLocLocId","incLocParrefId"};
			Object[] incLocValues={ctlocs.get(0).getHopCtlocId(),hopIncs.get(0).getIncId()};
			List<HopIncLoc> hopIncLocs=commonService.findByProperties(HopIncLoc.class,incLocPropertyNames,incLocValues);
			if(hopIncLocs.size()>0){
				hopIncLoc.setIncLocId(hopIncLocs.get(0).getIncLocId());
			}
			hopIncLoc.setIncLocLocId(ctlocs.get(0).getHopCtlocId());
			hopIncLoc.setIncLocParrefId(hopIncs.get(0).getIncId());
			hopIncLoc.setIncLocMaxQty(hisIncLocQtyItmWeb.getLocIncMaxQty());
			hopIncLoc.setIncLocMinQty(hisIncLocQtyItmWeb.getLocIncMinQty());
			hopIncLoc.setIncLocQty(hisIncLocQtyItmWeb.getLocIncQty());
			hopIncLoc.setIncLocStandQty(hisIncLocQtyItmWeb.getLocIncStandQty());
			commonService.saveOrUpdate(hopIncLoc);
		}
		
	}
}
