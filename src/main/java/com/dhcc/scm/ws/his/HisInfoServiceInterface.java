package com.dhcc.scm.ws.his;

import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import org.apache.cxf.annotations.WSDLDocumentation;

import com.dhcc.scm.entity.vo.ws.FileWrapper;
import com.dhcc.scm.entity.vo.ws.HisCmpRecWeb;
import com.dhcc.scm.entity.vo.ws.HisInGdRec;
import com.dhcc.scm.entity.vo.ws.HisIncLocQtyWeb;
import com.dhcc.scm.entity.vo.ws.HisIncWeb;
import com.dhcc.scm.entity.vo.ws.HisInvInfoWeb;
import com.dhcc.scm.entity.vo.ws.HisLocWeb;
import com.dhcc.scm.entity.vo.ws.HisOrderWeb;
import com.dhcc.scm.entity.vo.ws.HisOrderWebVo;
import com.dhcc.scm.entity.vo.ws.HisVendorWeb;
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
		
	    
	    
	    @WebMethod
	    @WebResult(name="operateResult")
	    public OperateResult getHopLoc(@WebParam(name="hisLocWeb")HisLocWeb hisLocWeb);
	    
	    
	    @WebMethod
	    @WebResult(name="operateResult")
	    @WSDLDocumentation("同步医院供应商")
	    public OperateResult getHopVendor(@WebParam(name="hisVendorWeb")HisVendorWeb hisVendorWeb);
	    
	    
	    @WebMethod
	    @WebResult(name="operateResult")
	    @WSDLDocumentation("同步医院订单")
	    public OperateResult getHopOrder(@WebParam(name="hisOrderWeb")HisOrderWeb hisOrderWeb);
	    
	    @WebMethod
	    @WebResult(name="hisInGdRec")
	    @WSDLDocumentation("查询入库单信息")
	    public HisInGdRec listInGdRec(@WebParam(name="usename")String usename,@WebParam(name="password")String password);

	    @WebMethod
	    @WebResult(name="operateResult")
	    @WSDLDocumentation("确认入库成功")
	    public OperateResult cmpInGdRec(@WebParam(name="usename")String usename,@WebParam(name="password")String password,@WebParam(name="ingdrecId")Long ingdrecId);

	    @WebMethod
	    @WebResult(name="operateResult")
	    @WSDLDocumentation("获取发票号,通过入库子表id")
	    public OperateResult getInvByRec(@WebParam(name="usename")String usename,@WebParam(name="password")String password,@WebParam(name="ingdrecId")Long ingdrecId);

	    @WebMethod
	    @WebResult(name="operateResult")
	    @WSDLDocumentation("更新平台发票号")
	    public OperateResult syncInvByRec(@WebParam(name="usename")String usename,@WebParam(name="password")String password,@WebParam(name="ingdrecId")Long ingdrecId,@WebParam(name="invno")String invno);
	    
	    
	    @WebMethod
	    @WSDLDocumentation("下载图片")
	    @WebResult(name="fileWrapper")
	    public FileWrapper downLoadPic(@WebParam(name="type")String type,@WebParam(name="path")String path);
	    
	    @WebMethod
	    @WebResult(name="hisInGdRec")
	    @WSDLDocumentation("根据订单号,查入库明细,库房电脑扫码入库返回的信息")
	    public HisInGdRec getOrderDetail(@WebParam(name="orderno")String orderno);
	    
	    @WebMethod
	    @WebResult(name="operateResult")
	    @WSDLDocumentation("库房扫码确认完成")
	    public OperateResult cmpOrder(@WebParam(name="usename")String usename,@WebParam(name="password")String password,@WebParam(name="ordsubs")List<String> ordsubs);
}