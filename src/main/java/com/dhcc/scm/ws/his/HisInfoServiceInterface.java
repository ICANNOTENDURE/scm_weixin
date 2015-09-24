package com.dhcc.scm.ws.his;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import com.dhcc.scm.entity.vo.ws.HisCmpRecWeb;
import com.dhcc.scm.entity.vo.ws.HisIncItmWeb;
import com.dhcc.scm.entity.vo.ws.HisIncLocQtyWeb;
import com.dhcc.scm.entity.vo.ws.HisIncWeb;
import com.dhcc.scm.entity.vo.ws.HisInvInfoWeb;
import com.dhcc.scm.entity.vo.ws.HisOrderWebVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;


@WebService
@SOAPBinding(style=SOAPBinding.Style.RPC)
public interface HisInfoServiceInterface {
		
	
		/**
		 * 
		* @Title: HisInfoServiceInterface.java
		* @Description: TODO(同步医院药品基本信息)
		* @param venIncWeb
		* @return
		* @return:OperateResult 
		* @author zhouxin  
		* @date 2014年7月24日 上午10:00:12
		* @version V1.0
		 */
	 	@WebMethod
	    @WebResult(name="operateResult")
	    public OperateResult getHopInc(@WebParam(name="hisIncWeb")HisIncWeb hisIncWeb);
		
	    /**
	     * 
	    * @Title: HisInfoServiceInterface.java
	    * @Description: TODO(供医院订单调用，上传订单)
	    * @param venIncWeb
	    * @return
	    * @return:OperateResult 
	    * @author zhouxin  
	    * @date 2014年7月24日 上午9:59:04
	    * @version V1.0
	     */
	    @WebMethod
	    @WebResult(name="operateResult")
	    public OperateResult getHisOrder(@WebParam(name="hisOrderWebVo")HisOrderWebVo hisOrderWebVo);
	    
	    
	    

	    
	    
	    /**
	     * 
	    * @Title: HisInfoServiceInterface.java
	    * @Description: TODO(his通过发票号返回入库明细)
	    * @param invNo
	    * @param hopName
	    * @param venName
	    * @return
	    * @return:OperateResult 
	    * @author zhouxin  
	    * @date 2014年7月30日 上午10:28:07
	    * @version V1.0
	     */
	    @WebMethod
	    @WebResult(name="hisInvInfoWeb")
	    public HisInvInfoWeb getRecItmByInv(@WebParam(name="invNo")String invNo,@WebParam(name="hopName")String hopName,@WebParam(name="venName")String venName);
	    
	    
	    
	    /**
	     * 
	    * @Title: HisInfoServiceInterface.java
	    * @Description: TODO(和his同步药品信息)
	    * @param hopInc
	    * @param hopname
	    * @return
	    * @return:OperateResult 
	    * @author zhouxin  
	    * @date 2014年7月31日 上午9:23:36
	    * @version V1.0
	     */
	    @WebMethod
	    @WebResult(name="operateResult")
	    public OperateResult saveHisInc(@WebParam(name="hisIncItmWeb")HisIncItmWeb hisIncItmWeb,@WebParam(name="hopname")String hopname);
	    
	    
	    /**
	     * 
	    * @Title: HisInfoServiceInterface.java
	    * @Description: TODO(确认发以入库)
	    * @param hisCmpRecWeb
	    * @return
	    * @return:OperateResult 
	    * @author zhouxin  
	    * @date 2014年8月1日 下午2:45:53
	    * @version V1.0
	     */
	    @WebMethod
	    @WebResult(name="operateResult")
	    public OperateResult cmpRec(@WebParam(name="hisCmpRecWeb")HisCmpRecWeb hisCmpRecWeb);
	    
	    
	    
	    /**
	     * 
	    * @Title: getHopLocIncQty 
	    * @Description: TODO(获取his科室库存信息) 
	    * @param @param hisIncWeb
	    * @param @return    设定文件 
	    * @return OperateResult    返回类型 
	    * @throws 
	    * @author zhouxin   
	    * @date 2015年4月15日 下午3:46:33
	     */
	    @WebMethod
	    @WebResult(name="operateResult")
	    public OperateResult getHopLocIncQty(@WebParam(name="hisIncLocQtyWeb")HisIncLocQtyWeb hisIncLocQtyWeb);
		
	    
}