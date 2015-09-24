/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ven;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.ven.VenIncAdviceDto;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenIncAdvice;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.nur.NurPortalInfoVo;
import com.dhcc.scm.entity.vo.ven.ReplayVenIncVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.ven.VenIncAdviceService;


@Component
public class VenIncAdviceBlh extends AbstractBaseBlh {


	@Resource
	private VenIncAdviceService venIncAdviceService;
	
	@Resource
	private CommonService commonService;
	
	public VenIncAdviceBlh() {
		
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
	
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		
		//调用对应的service方法
		venIncAdviceService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			dto.getVenIncAdvice().setVenIncAdviceAskDate(new Date());
			dto.getVenIncAdvice().setVenIncAdviceAskUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
			commonService.saveOrUpdate(dto.getVenIncAdvice());
			dto.getOperateResult().setResultCode("1");
		} catch (NumberFormatException e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
		}finally{
			super.writeJSON(dto.getOperateResult());
		}
	
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		
		//调用对应的service方法
		venIncAdviceService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		
		//调用对应的service方法
		venIncAdviceService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		
		//调用对应的service方法
		venIncAdviceService.findById(dto);
		
	}
	
	
	/**
	 * 
	* @Title: listVenIncAdvice 
	* @Description: TODO(返回商品咨询信息json) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月5日 下午8:33:47
	 */
	public void listVenIncAdvice(BusinessRequest res) {
		
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		//调用对应的service方法
		venIncAdviceService.listVenIncAdvice(dto);
		
	}
	public void listNurIncAdvice(BusinessRequest res) {
		
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		dto.setAskUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
		//调用对应的service方法
		venIncAdviceService.listVenIncAdvice(dto);
		
	}
	/**
	 * 
	* @Title: listVenIncAdvice 
	* @Description: TODO(返回供应商待回复商品列表) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月5日 下午8:33:47
	 */
	public void getVenIncAdviceList(BusinessRequest res) {
		
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		dto.setVendorId(Long.valueOf(super.getLoginInfo().get("VENDOR").toString()));
		dto.setReplyFlag("1");
		//调用对应的service方法
		venIncAdviceService.getVenIncAdviceList(dto);
		
	}

	/**
	 * 
	* @Title: reply 
	* @Description: TODO(供应商回复商品咨询) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月6日 下午4:37:50
	 */
	public void reply(BusinessRequest res) {
			
			VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
			dto.setOperateResult(new OperateResult());
			try {
				VenIncAdvice venIncAdvice=commonService.get(VenIncAdvice.class, dto.getVenIncAdvice().getVenIncAdviceId());
				
				venIncAdvice.setVenIncAdviceReplay(dto.getVenIncAdvice().getVenIncAdviceReplay());
				venIncAdvice.setVenIncAdviceReplayDate(new Date());
				venIncAdvice.setVenIncAdviceReplayUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
				//调用对应的service方法
				commonService.saveOrUpdate(venIncAdvice);
				dto.getOperateResult().setResultCode("1");
			} catch (NumberFormatException e) {
				e.printStackTrace();
				dto.getOperateResult().setResultCode("-1");
				dto.getOperateResult().setResultContent(e.getMessage());
			} finally{
				super.writeJSON(dto.getOperateResult());
			}
		
	}
	
	/**
	 * 
	* @Title: getNurPortalInfo 
	* @Description: TODO(查询护士登录portal信息) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月7日 上午10:12:27
	 */
	@SuppressWarnings("unchecked")
	public void getNurPortalInfo(BusinessRequest res){
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		NurPortalInfoVo nurPortalInfoVo=new NurPortalInfoVo();
		
		//所有咨询问题
		
		nurPortalInfoVo.setAdviceReplyNum(venIncAdviceService.getNurIncAdviceNum(dto));
		//所有以回复的
		dto.setReplyFlag("1");
		nurPortalInfoVo.setAdviceAskNum(venIncAdviceService.getNurIncAdviceNum(dto));
		//待发货商品
		DetachedCriteria orderDetailCriteria = DetachedCriteria.forClass(OrderDetail.class);
		orderDetailCriteria.add(Restrictions.eq("orderUserId", Long.valueOf(super.getLoginInfo().get("USERID").toString())));
		orderDetailCriteria.add(Restrictions.eq("orderState", 2l));
		orderDetailCriteria.setProjection(Projections.rowCount());
		List<Long> forSendNums=commonService.findByDetachedCriteria(orderDetailCriteria);
		nurPortalInfoVo.setForSendNum(forSendNums.get(0).intValue());
		//新订单
		DetachedCriteria newOrderCriteria = DetachedCriteria.forClass(OrderDetail.class);
		newOrderCriteria.add(Restrictions.eq("orderUserId", Long.valueOf(super.getLoginInfo().get("USERID").toString())));
		newOrderCriteria.add(Restrictions.eq("orderState", 1l));
		newOrderCriteria.setProjection(Projections.rowCount());
		List<Long> newOrders=commonService.findByDetachedCriteria(newOrderCriteria);
		nurPortalInfoVo.setNewOrderNum(newOrders.get(0).intValue());
		//退货通过
		DetachedCriteria reqOrderCriteria = DetachedCriteria.forClass(OrderDetail.class);
		reqOrderCriteria.add(Restrictions.eq("orderUserId", Long.valueOf(super.getLoginInfo().get("USERID").toString())));
		reqOrderCriteria.add(Restrictions.eq("orderState", 7l));
		reqOrderCriteria.setProjection(Projections.rowCount());
		List<Long> reqOrderNum=commonService.findByDetachedCriteria(reqOrderCriteria);
		nurPortalInfoVo.setReqOrderNum(reqOrderNum.get(0).intValue());
		//退货不通过
		DetachedCriteria noRetOrderCriteria = DetachedCriteria.forClass(OrderDetail.class);
		noRetOrderCriteria.add(Restrictions.eq("orderUserId", Long.valueOf(super.getLoginInfo().get("USERID").toString())));
		noRetOrderCriteria.add(Restrictions.eq("orderState", 8l));
		noRetOrderCriteria.setProjection(Projections.rowCount());
		List<Long> noRetOrderNum=commonService.findByDetachedCriteria(noRetOrderCriteria);
		nurPortalInfoVo.setNoRetOrderNum(noRetOrderNum.get(0).intValue());
		
		//待收货
		DetachedCriteria recieveCriteria = DetachedCriteria.forClass(OrderDetail.class);
		recieveCriteria.add(Restrictions.eq("orderUserId", Long.valueOf(super.getLoginInfo().get("USERID").toString())));
		recieveCriteria.add(Restrictions.eq("orderState", 3l));
		recieveCriteria.setProjection(Projections.rowCount());
		List<Long> recieveNum=commonService.findByDetachedCriteria(recieveCriteria);
		nurPortalInfoVo.setRecieveNum(recieveNum.get(0).intValue());
		
		//待评价
		DetachedCriteria commentCriteria = DetachedCriteria.forClass(OrderDetail.class);
		commentCriteria.add(Restrictions.eq("orderUserId", Long.valueOf(super.getLoginInfo().get("USERID").toString())));
		commentCriteria.add(Restrictions.eq("orderState", 4l));
		commentCriteria.setProjection(Projections.rowCount());
		List<Long> commentNum=commonService.findByDetachedCriteria(commentCriteria);
		nurPortalInfoVo.setCommentNum(commentNum.get(0).intValue());
		super.writeJSON(nurPortalInfoVo);
	}
	
	/**
	 * 
	* @Title: listVenIncAdvice 
	* @Description: TODO(返回护士咨询商品历史列表) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月5日 下午8:33:47
	 */
	@SuppressWarnings("unchecked")
	public void getNurIncAdviceList(BusinessRequest res) {
		
		Long userId=Long.valueOf(super.getLoginInfo().get("USERID").toString());
		VenIncAdviceDto dto = super.getDto(VenIncAdviceDto.class, res);
		dto.setAskUserId(userId);
		//调用对应的service方法
		venIncAdviceService.getVenIncAdviceList(dto);
		for(Object o:dto.getPageModel().getPageData()){
			ReplayVenIncVo replayVenIncVo=(ReplayVenIncVo) o;
			DetachedCriteria criteria = DetachedCriteria.forClass(VenIncAdvice.class);
			if(StringUtils.isNotBlank(dto.getReplyFlag())){
				if(dto.getReplyFlag().equals("1")){
					criteria.add(Restrictions.isNotNull("venIncAdviceReplayUserId"));
				}
			}
			criteria.add(Restrictions.eq("venIncAdviceAskUserId", userId));
			criteria.add(Restrictions.eq("venIncAdviceIncId", replayVenIncVo.getInc()));
			replayVenIncVo.setVenIncAdvices(commonService.findByDetachedCriteria(criteria));
			VenInc venInc=commonService.get(VenInc.class, replayVenIncVo.getInc());
			Vendor vendor=commonService.get(Vendor.class, venInc.getVenIncVenid());
			replayVenIncVo.setVendorname(vendor.getName());
		}
		
	}
}
