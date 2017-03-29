/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ord;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.vo.ws.OrdWebVo;
import com.dhcc.scm.entity.vo.ws.OrderWebVo;
import com.dhcc.scm.service.ord.OrderStateService;
import com.dhcc.scm.service.userManage.NormalAccountService;
import com.dhcc.scm.service.ven.VenDeliverService;
import com.dhcc.scm.service.ven.VenQualifTypeService;
import com.fasterxml.jackson.core.type.TypeReference;


@Component
public class OrderStateBlh extends AbstractBaseBlh {
	
	private static Log logger = LogFactory.getLog(OrderStateBlh.class);

	@Resource
	private OrderStateService ordertateService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private NormalAccountService normalAccountService;
	
	@Resource
	private VenDeliverService venDeliverService;
	
	@Resource
	private VenQualifTypeService venQualifTypeService;
	
	public OrderStateBlh() {
		
	}
	
	/**
	 * 
	* @Title: deleteOrdSub 
	* @Description: TODO(删除发货信息) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月28日 下午3:43:25
	 */
	public void deleteOrdSub(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			if(dto.getOrderDetailSub()!=null){
				if(org.apache.commons.lang.StringUtils.isNotEmpty(dto.getOrderDetailSub().getOrdSubId())){
						OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class,dto.getOrderDetailSub().getOrdSubId());
						if(orderDetailSub.getOrdSubStatus()==null){
							commonService.delete(orderDetailSub);
							dto.getOperateResult().setResultCode("1");
						}else{
							dto.getOperateResult().setResultContent("以发货,不能删除");
						}
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	/**
	 * 
	* @Title: checkSendQty 
	* @Description: TODO(检查供应商发货数量) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月26日 上午11:35:53
	 */
	public void checkSendQty(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			List<OrderDetailSub> orderDetailSubs=commonService.findByProperty(OrderDetailSub.class, "ordSubDetailId", dto.getOrderDetailSub().getOrdSubDetailId());
			OrderDetail orderDetail=commonService.get(OrderDetail.class, dto.getOrderDetailSub().getOrdSubDetailId());
			Long state=orderDetail.getOrderState();
			//一个订单可以发多次货，保证发货数不大于订单数就可以继续发货
			//2:确认订单/下载订单
			//10:部分发货
			//5:评价
			//4:收货
			if((state.longValue()!=2l)&&(state.longValue()!=10l)&&(state.longValue()!=4l)&&(state.longValue()!=5l)){
				dto.getOperateResult().setResultCode("-1");
				dto.getOperateResult().setResultContent("已发货完成，不能增加批次");
				super.writeJSON(dto.getOperateResult());
				return;
			}
			float devlQty=0;
			for(OrderDetailSub detailSub:orderDetailSubs){
				if(detailSub.getOrdSubId().toString().equals(dto.getOrderDetailSub().getOrdSubDetailId().toString())){
					
				}else{
					devlQty=devlQty+detailSub.getOrderSubQty().floatValue();
				}
			}
			float diffQty=orderDetail.getOrderVenQty()-devlQty;
			if(diffQty>0){
				dto.getOperateResult().setResultCode("1");
				dto.getOperateResult().setResultContent(String.valueOf(diffQty));
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	/*
	@BlhParameters(dtoCls=OrderStateDto.class,parameter={
		@BlhParameter(parameterExpress="emflag",testvalues={("emflag=1")},desc="是否加急")
	})
	@Descript("查询订单")
	@OutPut(ognlExpress="dto.pageModel")
	*/
	public void list(BusinessRequest res) {
	
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		
		//调用对应的service方法
		ordertateService.listOrderState(dto);
	}
	
	
	public void accpOrder(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			ordertateService.accpOrder(dto);
			dto.getOperateResult().setResultCode("1");
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	/**
	 * 
	* @Title: listVenOrd 
	* @Description: TODO(这里不用订单主子表的情况用,供应商确认订单使用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 上午9:52:03
	 */
	public void listVenOrd(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		//调用对应的service方法
		ordertateService.listVenOrd(dto);
	}
	
	/**
	 * 
	* @Title: listVenSend 
	* @Description: TODO(供应商录入发票使用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 下午2:17:44
	 */
	public void listVenSend(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		ordertateService.listVenSend(dto);

	}
	
	/**
	 * 
	* @Title: updInv 
	* @Description: TODO(发货后可以修改发票) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年8月6日 下午4:32:30
	 */
	public void updInv(BusinessRequest res){
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getOrderIdStr())){
			List<OrderDetailSub> orderDetailSubs=JsonUtils.toObject(dto.getOrderIdStr(), new TypeReference<List<OrderDetailSub>>() { });
			for(OrderDetailSub orderDetailSub:orderDetailSubs){
				if(org.apache.commons.lang3.StringUtils.isNotBlank(orderDetailSub.getOrdSubId())){
					OrderDetailSub tmpOrderDetailSub=commonService.get(OrderDetailSub.class, orderDetailSub.getOrdSubId());
					tmpOrderDetailSub.setOrdSubInvNo(orderDetailSub.getOrdSubInvNo());
					tmpOrderDetailSub.setOrdSubInvDate(orderDetailSub.getOrdSubInvDate());
					commonService.saveOrUpdate(tmpOrderDetailSub);
				}
			}
			dto.getOperateResult().setResultCode("1");
		}
		super.writeJSON(dto.getOperateResult());
	}
	
	/**
	 * 
	* @Title: saveOrd 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月4日 上午10:40:46
	 */
	public void saveOrd(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		//调用对应的service方法
		dto.getOperateResult().setResultCode("1");
		try {
			List<OrderDetailSub> orderDetailSubs=JsonUtils.toObject(dto.getOrderIdStr(), new TypeReference<List<OrderDetailSub>>() { });
			for(OrderDetailSub orderDetailSub:orderDetailSubs){
				OrderDetail orderDetail=commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
				float ordqty=orderDetail.getOrderVenQty().floatValue();
				ordqty=ordqty-orderDetailSub.getOrderSubQty().floatValue();
				if((!orderDetail.getOrderState().toString().equals("2"))&&(!orderDetail.getOrderState().toString().equals("10"))){
					dto.getOperateResult().setResultCode("-1");
					dto.getOperateResult().setResultContent("有明细以发货,不能修改!<br>");
					continue;
				}
				List<OrderDetailSub> orderDetailSubs2=commonService.findByProperty(OrderDetailSub.class, "ordSubDetailId", orderDetailSub.getOrdSubDetailId());
				for(OrderDetailSub orderDetailSub2:orderDetailSubs2){
					if((orderDetailSub.getOrdSubId()!=null)&&(orderDetailSub.getOrdSubId().toString().equals(orderDetailSub2.getOrdSubId().toString()))){
						
					}else{
						ordqty=ordqty-orderDetailSub2.getOrderSubQty().floatValue();
					}
				}
				if(ordqty<0){
					dto.getOperateResult().setResultCode("-1");
					dto.getOperateResult().setResultContent("单号:"+orderDetail.getOrderNo()+",订单数大于发货数!<br>");
				}
			}
			if(dto.getOperateResult().getResultCode().equals("1")){
				for(OrderDetailSub orderDetailSub:orderDetailSubs){
					orderDetailSub.setOrdSubDate(new Date());
					orderDetailSub.setOrdSubUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
					commonService.saveOrUpdate(orderDetailSub);
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			e.printStackTrace();
			super.writeJSON(dto.getOperateResult());
		}
	}
	public void saveOrdSub(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		//调用对应的service方法
		try {
			
			List<OrderDetailSub> orderDetailSubs=commonService.findByProperty(OrderDetailSub.class, "ordSubDetailId", dto.getOrderDetailSub().getOrdSubDetailId());
			OrderDetail orderDetail=commonService.get(OrderDetail.class, dto.getOrderDetailSub().getOrdSubDetailId());
			float devQty=0;
			if(org.apache.commons.lang.StringUtils.isEmpty(dto.getOrderDetailSub().getOrdSubId())){
				dto.getOrderDetailSub().setOrdSubId(null);
			}else{
				OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class, dto.getOrderDetailSub().getOrdSubId());
				dto.getOrderDetailSub().setOrderSubImpId(orderDetailSub.getOrderSubImpId());
			}
			for(OrderDetailSub orderDetailSub:orderDetailSubs){
				if((dto.getOrderDetailSub().getOrdSubId()!=null)&&(dto.getOrderDetailSub().getOrdSubId().equals(orderDetailSub.getOrdSubId()))) continue;
				devQty=devQty+orderDetailSub.getOrderSubQty().floatValue();
			}
			float enableQty=orderDetail.getOrderVenQty().floatValue()-devQty;
			if(enableQty>=dto.getOrderDetailSub().getOrderSubQty()){
				dto.getOrderDetailSub().setOrdSubDate(new Date());
				dto.getOrderDetailSub().setOrdSubUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
				commonService.saveOrUpdate(dto.getOrderDetailSub());
				dto.getOperateResult().setResultCode("1");
				dto.getOperateResult().setResultContent(dto.getOrderDetailSub().getOrdSubId());
			}else{
				dto.getOperateResult().setResultCode("-1");
				dto.getOperateResult().setResultContent(" 发货数不能大于订单数");
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			dto.getOperateResult().setResultContent(e.getMessage());
			e.printStackTrace();
			super.writeJSON(dto.getOperateResult());
		}
	}
	
	/**
	 * 供应商发送订单
	* @Title: sendOrd 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 下午6:26:39
	 */
	public void sendOrd(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		dto.setOperateResult(new OperateResult());
		Long vendorId=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		StringBuffer sb=new StringBuffer();
		String[] idArr=dto.getOrderIdStr().split("\\^");
		try {
			//接收医院id
			Long hopId=0l;
			for(String id:idArr){
				if(org.apache.commons.lang3.StringUtils.isBlank(id)) continue;
				OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class,id);
				if(orderDetailSub!=null){
					OrderDetail orderDetail=commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
					hopId=orderDetail.getOrderHopId();
				}
			}
			//判断接收医院是否需要判断供应商资质过期
			SysAppParam appParam=commonService.getSysAppParam(BaseConstants.CHECK_QUALIFY, hopId);
			if("1".equals(appParam.getAppValue())){
				//判断供应商资质是否过期
				String checkString=venQualifTypeService.checkVenQualify(vendorId);
				if(org.apache.commons.lang3.StringUtils.isNotBlank(checkString)){
					sb.append(checkString+"<br>");
				}
				
				for(String id:idArr){
					OrderDetailSub orderDetailSub=commonService.get(OrderDetailSub.class,id);
					if(orderDetailSub!=null){
						if(org.apache.commons.lang3.StringUtils.isNotBlank((orderDetailSub.getOrdSubStatus()))) {continue;}
						OrderDetail orderDetail=commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
						
						//判断商品资质是否过期
						checkString=venQualifTypeService.checkVenIncQualify(orderDetail.getOrderVenIncId());
						if(org.apache.commons.lang3.StringUtils.isNotBlank(checkString)){
							VenInc inc=commonService.get(VenInc.class, orderDetail.getOrderVenIncId());
							sb.append("("+inc.getVenIncName()+")"+checkString+"<br>");
						}
					}
				}
			}
			if(org.apache.commons.lang3.StringUtils.isNotBlank(sb.toString())){
				dto.getOperateResult().setResultContent(sb.toString());;
			}else{
				ordertateService.saveOrderSubCmp(dto);
				dto.getOperateResult().setResultCode("1");
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getLocalizedMessage());
			super.writeJSON(dto.getOperateResult());
		}

	}
	/**
	 * 
	* @Title: OrderStateBlh.java
	* @Description: TODO(查询一个订单的执行历史)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月28日 下午5:34:11
	* @version V1.0
	 * @throws IOException 
	 */
	public void listExeState(BusinessRequest res) throws IOException{
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		writeJSON(ordertateService.listOrderExeState(dto));
		dto.setOpFlg("1");
	}
	
	/**
	 * 
	* @Title: OrderStateBlh.java
	* @Description: TODO(查询订单明细)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月29日 上午9:21:21
	* @version V1.0
	 */
	/*
	@BlhParameters(dtoCls=OrderStateDto.class,parameter={
		@BlhParameter(parameterExpress="exeState.ordId",testvalues={("exeState.ordId=1000")},desc="订单ID"),
		@BlhParameter(parameterExpress="pageModel.pageSize",testvalues={("pageModel.pageSize=10")},desc="每页条数"),
		@BlhParameter(parameterExpress="pageModel.pageNo",testvalues={("pageModel.pageNo=1")},desc="当前页数")
	})
	@Descript("订单明细")
	@OutPut(ognlExpress="dto.pageModel")
	*/
	public void listOrdItm(BusinessRequest res){
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		ordertateService.listOrderItm(dto);
		dto.setOpFlg("1");
	}
	
	/**
	 * 
	* @Title: OrderStateBlh.java
	* @Description: TODO(查询订单状态列表)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月29日 下午2:43:23
	* @version V1.0
	 * @throws IOException 
	 */
	public void getComboList(BusinessRequest res) throws IOException{
		WebContextHolder
		.getContext()
		.getResponse()
		.getWriter()
		.write(JsonUtils.toJson(ordertateService.getComboList()));
	}
	/**
	 * 
	 * @param res
	 * @throws IOException
	 * 1024
	 */
	public void OrderAndroid(BusinessRequest res) throws IOException{
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		
		//调用对应的service方法
		ordertateService.listOrderState(dto);
		//调用对应的service方法
		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
		WebContextHolder.getContext().getResponse().getWriter()
		.write("{\"total\":"
				+ dto.getPageModel().getTotals()
				+ ",\"rows\":"
				+ JsonUtils.toJson(dto.getPageModel().getPageData())
				+ "}");
		WebContextHolder.getContext().getResponse().getWriter().flush();
	}
	
	
	
	
	
	
	//////////////////////////////////////////////////////webservice gener///////////////////////////////////////////////////
	/**
	 * 
	* @Title: OrderStateBlh.java
	* @Description: TODO(给供应商查询订单接口)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月2日 上午11:09:16
	* @version V1.0
	 */
	/*
	@BlhParameters(dtoCls=OrderStateDto.class,parameter={
		//@BlhParameter(parameterExpress="dto.sendFlag",testvalues={("dto.sendFlag=1")},desc="是否发送过,1，未发送过,2，发送过,必填"),
		//@BlhParameter(parameterExpress="dto.reqStDate",testvalues={("dto.reqStDate=2014-01-01")},desc="开始日期,可为空"),
		//@BlhParameter(parameterExpress="dto.reqEdDate",testvalues={("dto.reqEdDate=2014-09-01")},desc="结束日期,可为空"),
		@BlhParameter(parameterExpress="dto.userName",testvalues={("dto.userName=1000")},desc="用户名,必填"),
		@BlhParameter(parameterExpress="dto.passWord",testvalues={("dto.passWord=1000")},desc="密码,必填")
	})
	@Descript("查询订单")
	@OutPut(ognlExpress="dto.orderWSVos")
	*/
	public void listOrderWS(BusinessRequest res) {
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		SysLog log=new SysLog();
		log.setOpName("供应商查询医院订单信息订单");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		dto.setOrdWebVo(new OrdWebVo());
		dto.getOrdWebVo().setOperateResult(new OperateResult());
		 dto.getOrdWebVo().setOrderWebVos(new ArrayList<OrderWebVo>());
		try{
			this.listOrderWSSub(res);
			dto.getOrdWebVo().getOperateResult().setResultContent("0");
			log.setOpUser(dto.getUserName());
			log.setOpArg("userName:"+dto.getUserName()+";passWord:"+dto.getPassWord());
			log.setOpResult(JsonUtils.toJson(dto.getOrderWSVos()));
		}catch(Exception e){
			dto.getOrdWebVo().getOperateResult().setResultContent("-1");
			dto.getOrdWebVo().getOperateResult().setResultContent(e.getLocalizedMessage());
			log.setOpResult("falie:exception_"+JsonUtils.toJson(e.getLocalizedMessage()));
		}finally{
			commonService.saveOrUpdate(log);
		}
		
		
	}
	public void listOrderWSSub(BusinessRequest res) {
		
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		if(StringUtils.isNullOrEmpty(dto.getUserName())){
	        dto.getOrdWebVo().getOperateResult().setResultCode("-1");
	        dto.getOrdWebVo().getOperateResult().setResultContent("用户名不能为空");
			return;
		}
		if(StringUtils.isNullOrEmpty(dto.getPassWord())){
	        dto.getOrdWebVo().getOperateResult().setResultCode("-2");
	        dto.getOrdWebVo().getOperateResult().setResultContent("密码不能为空");
			return;
		}
		NormalAccount normalAccount=normalAccountService.getNormalAccountByAccount(dto.getUserName());
		if(normalAccount==null){
	        dto.getOrdWebVo().getOperateResult().setResultCode("-3");
	        dto.getOrdWebVo().getOperateResult().setResultContent("用户名不存在");
			return;
		}
		if(!normalAccount.getPassword().equals(dto.getPassWord())){
	        dto.getOrdWebVo().getOperateResult().setResultCode("-4");
	        dto.getOrdWebVo().getOperateResult().setResultContent("密码不对");
			return;
		}
		if(!normalAccount.getNormalUser().getType().toString().equals("2")){
	        dto.getOrdWebVo().getOperateResult().setResultCode("-5");
	        dto.getOrdWebVo().getOperateResult().setResultContent("用户名类型不对");
			return;
		}
		dto.setVendor(normalAccount.getNormalUser().getVendorId());
		dto.setSendFlag("0");
		//调用对应的service方法
		ordertateService.listOrderWS(dto);
	}
	
	
	/**
	 * 
	* @Title: OrderStateBlh.java
	* @Description: TODO(供应商确认收到订单信息)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月9日 上午9:30:28
	* @version V1.0
	 */
	/*
	@BlhParameters(dtoCls=OrderStateDto.class,parameter={
		@BlhParameter(parameterExpress="order.orderId",testvalues={("order.orderId=1000")},desc="订单ID")
	})
	@Descript("供应商确认收到订单")
	@OutPut(ognlExpress="dto.operateResult")
	*/
	public void recievedMsg(BusinessRequest res){
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
       
		this.recievedMsgSub(res);
		
		SysLog log=new SysLog();
		log.setOpArg(JsonUtils.toJson(StringUtils.convertList(dto.getOrderIdStr(), BaseConstants.COMMA))+"userNmae:"+dto.getUserName()+"password："+dto.getPassWord());
		log.setOpName("webservice供应商确认收到订单");
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(dto.getOperateResult()));
		log.setOpType("webservice");
		log.setOpUser(dto.getUserName());
		commonService.saveOrUpdate(log);
	}
	public void recievedMsgSub(BusinessRequest res){
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
        OperateResult operateResult=new OperateResult();
        operateResult.setResultCode("-11");
        operateResult.setResultContent("falie");
        dto.setOperateResult(operateResult);
        
        if(StringUtils.isNullOrEmpty(dto.getUserName())){
	        dto.getOperateResult().setResultCode("-1");
	        dto.getOperateResult().setResultContent("用户名不能为空");
			return;
		}
		if(StringUtils.isNullOrEmpty(dto.getPassWord())){
			dto.getOperateResult().setResultCode("-1");
	        dto.getOperateResult().setResultContent("密码不能为空");
			return;
		}
		NormalAccount normalAccount=normalAccountService.getNormalAccountByAccount(dto.getUserName());
		if(normalAccount==null){
			dto.getOperateResult().setResultCode("-1");
	        dto.getOperateResult().setResultContent("用户名或密码错误");
			return;
		}
		if(!normalAccount.getPassword().equals(dto.getPassWord())){
			dto.getOperateResult().setResultCode("-1");
	        dto.getOperateResult().setResultContent("用户名或密码错误");
			return;
		}
		if(!normalAccount.getNormalUser().getType().toString().equals("2")){
			dto.getOperateResult().setResultCode("-1");
	        dto.getOperateResult().setResultContent("用户名或密码错误");
			return;
		}

		if (StringUtils.isNullOrEmpty(dto.getOrderIdStr())){
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent("入参为空");
			return;
		}
		String[] strs=dto.getOrderIdStr().split(BaseConstants.COMMA);
		for(String id:strs){
			OrderDetail order=commonService.get(OrderDetail.class, Long.valueOf(id));
			if (order==null){
				dto.getOperateResult().setResultCode("-2");
				dto.getOperateResult().setResultContent("入参无效");
				continue;
			}
			if(order.getOrderVenId().longValue()!=normalAccount.getNormalUser().getVendorId()){
				dto.getOperateResult().setResultCode("-3");
				dto.getOperateResult().setResultContent("入参无效");
				continue;
			}
			if(order.getOrderState().longValue()!=1){
				dto.getOperateResult().setResultCode("-4");
				dto.getOperateResult().setResultContent("订单状态不对");
				continue;
			}
			order.setOrderSendFlag("1");
			order.setOrderState(2l);
			commonService.saveOrUpdate(order);
			ExeState exeState = new ExeState();
			exeState.setStateId(Long.valueOf(2));
			exeState.setOrdId(order.getOrderId());
			exeState.setRemark("webservice 确认订单");
			exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
			commonService.saveOrUpdate(exeState);
		}
		if(!dto.getOperateResult().getResultCode().equals("-11")){
			return;
		}
		dto.getOperateResult().setResultCode("0");
		dto.getOperateResult().setResultContent("success");
	}
	
	/**
	 * 
	* @Title: OrderStateBlh.java
	* @Description: TODO(供应商发货调用)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月9日 上午9:36:29
	* @version V1.0
	 * @throws IOException 
	 */
	/*
	@BlhParameters(dtoCls=OrderStateDto.class,parameter={
		@BlhParameter(parameterExpress="deliveritms",testvalues={("deliveritms=1000")},desc="订单明细")
	})
	@Descript("供应商确认收到订单")
	@OutPut(ognlExpress="dto.operateResult")
	*/
	public void deliver(OrderStateDto dto) {

		SysLog log=new SysLog();
		log.setOpArg(JsonUtils.toJson(dto.getDeliveritms()));
		log.setOpName("供应商回传发票");
		log.setOpDate(new Date());
		log.setOpType("webservice");
		dto.getOperateResult().setResultCode("0");
		dto.getOperateResult().setResultContent("success");
		try{
			this.deliverSub(dto);
			log.setOpResult(JsonUtils.toJson(dto.getOperateResult()));
		} catch(Exception e) {
	        	dto.getOperateResult().setResultCode("-111");
	        	dto.getOperateResult().setResultContent("Exception:"+e.getLocalizedMessage()+" msg:faile "+dto.getMsg());
	        	logger.info(e.getMessage(), e);
	        	log.setOpResult("exception:"+e.getMessage()+" msg:falie "+dto.getMsg());
	    }finally{
	    	commonService.saveOrUpdate(log);
	    }
		
		
		
		
	}
	public void deliverSub(OrderStateDto dto) {
		
		if(dto.getDeliveritms()==null){
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent("入参为空");
			return;
		}
		if(dto.getDeliveritms().size()==0){
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent("入参为空");
			return;
		}
		
		List<OrderDetailSub> detailSubs=new ArrayList<OrderDetailSub>();
		int num=0;
		//按订单拆分发货单 
		for(VenDeliveritm tmpVenDeliveritm:dto.getDeliveritms()){
			num++;
			if(StringUtils.isNullOrEmpty(tmpVenDeliveritm.getDeliveritmInvnoe())){
				dto.getOperateResult().setResultCode("-2");
				dto.getOperateResult().setResultContent("第"+num+"行发票号不能为空");
				continue;
			}
			if(tmpVenDeliveritm.getDeliveritmQty()==null){
				dto.getOperateResult().setResultCode("-3");
				dto.getOperateResult().setResultContent(tmpVenDeliveritm.getDeliveritmInvnoe()+"发票号,发货数量不能为空");
				continue;
			}
			if(tmpVenDeliveritm.getDeliveritmRp()==null){
				dto.getOperateResult().setResultCode("-4");
				dto.getOperateResult().setResultContent(tmpVenDeliveritm.getDeliveritmInvnoe()+"发票号,进价不能为空");
				continue;
			}
			if(tmpVenDeliveritm.getDeliveritmOrderitmid()==null){
				dto.getOperateResult().setResultCode("-5");
				dto.getOperateResult().setResultContent(tmpVenDeliveritm.getDeliveritmInvnoe()+"发票号,没有订单明细ID");
				continue;
			}
			
			OrderDetail orderItm=commonService.get(OrderDetail.class, tmpVenDeliveritm.getDeliveritmOrderitmid());
			if(orderItm==null){
				dto.getOperateResult().setResultCode("-6");
				dto.getOperateResult().setResultContent(tmpVenDeliveritm.getDeliveritmInvnoe()+"发票号,订单明细ID错误");
				continue;
			}
			if(orderItm.getOrderState().longValue()!=2){
				dto.getOperateResult().setResultCode("-7");
				dto.getOperateResult().setResultContent(tmpVenDeliveritm.getDeliveritmInvnoe()+"发票号,订单状态错误");
				continue;
			}
			OrderDetailSub orderDetailSub=new OrderDetailSub();
			orderDetailSub.setOrderSubQty(tmpVenDeliveritm.getDeliveritmQty());
			orderDetailSub.setOrderSubRp(tmpVenDeliveritm.getDeliveritmRp());
			orderDetailSub.setOrderSubRpAmt(tmpVenDeliveritm.getDeliveritmRpamt());
			orderDetailSub.setOrdSubBatNo(tmpVenDeliveritm.getDeliveritmBatno());
			orderDetailSub.setOrdSubDate(new Date());
			orderDetailSub.setOrdSubDetailId(tmpVenDeliveritm.getDeliveritmOrderitmid());
			orderDetailSub.setOrdSubInvNo(tmpVenDeliveritm.getDeliveritmInvnoe());
			orderDetailSub.setOrdSubExpDate(tmpVenDeliveritm.getDeliveritmExpdate());
			detailSubs.add(orderDetailSub);
		}
		
		//明细有错吴
		if(!dto.getOperateResult().getResultCode().equals("0")){
			return;
		}
		for(OrderDetailSub orderDetailSub:detailSubs){
			OrderDetail orderDetail=commonService.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
			orderDetail.setOrderState(3l);
			commonService.saveOrUpdate(orderDetail);
			commonService.saveOrUpdate(orderDetailSub);
			ExeState exeState = new ExeState();
			exeState.setStateId(Long.valueOf(2));
			exeState.setOrdId(orderDetailSub.getOrdSubDetailId());
			exeState.setRemark("webservice 回传发票");
			exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
			commonService.saveOrUpdate(exeState);
		}
		
	}

	/**
	 * 
	 * @param res
	 * @throws IOException
	 * @author penzi
	 * @description 获取当前状态的订单以及其之前所有已经操作的状态订单信息
	 */
	public void OrderDetailAndroid(BusinessRequest res) throws IOException{
//		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		//List<OrderStateAndroidVo> androidVos=ordertateService.listOrderStateAndroid(dto);
		//调用对应的service方法
		//ordertateService.listOrderState(dto);
		//调用对应的service方法
//		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
//		WebContextHolder.getContext().getResponse().getWriter()
//		.write("{\"total\":"
//				+ dto.getPageModel().getTotals()
//				+",\"rows\":"
//				+ JsonUtils.toJson(androidVos)
//				+ "}");
//		WebContextHolder.getContext().getResponse().getWriter().flush();
	}
	
	/**
	 * 
	 * @param res
	 * @throws IOException
	 * @author penzi
	 * @description:PDA调用，查询各订单的执行状态
	 */
	public void OrderStateAndroid(BusinessRequest res) throws IOException{
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		
		//调用对应的service方法
		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
		WebContextHolder.getContext().getResponse().getWriter()
		.write("{\"orderId\":"
				+dto.getExeState().getOrdId()
				+ ",\"rows\":"
				+ JsonUtils.toJson(ordertateService.listOrderExeState(dto))
				+ "}");
		WebContextHolder.getContext().getResponse().getWriter().flush();
	}
	
	
	public void listOrdGrpNo(BusinessRequest res){
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		ordertateService.listOrdGrpNo(dto);
	}
	
	public void listOrdList(BusinessRequest res){
		OrderStateDto dto = super.getDto(OrderStateDto.class, res);
		ordertateService.listVenOrd(dto);
	}
}
