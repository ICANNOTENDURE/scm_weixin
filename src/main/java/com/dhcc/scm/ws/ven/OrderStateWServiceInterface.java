package com.dhcc.scm.ws.ven;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import com.dhcc.scm.entity.vo.ws.DeliverWeb;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.vo.ws.OrdWebVo;
import com.dhcc.scm.entity.vo.ws.VenIncWeb;


@WebService
@SOAPBinding(style=SOAPBinding.Style.RPC)
public interface OrderStateWServiceInterface {

   /**
    * 方法名:                recievedMsg
    * 方法功能描述：                                          供应商确认收到订单
    * @param  order.orderId 订单ID
    * @return com.dhcc.pms.entity.vo.ws.OperateResult   术语类型是{@linkplain java.lang.Long}  值域类型是{@linkplain java.lang.Long}
    * @see java.lang.Long
    * @see java.lang.Long
    * @since JDK1.7
    * @Create Date:        2014-07-10 09:36:34.205
    */
    @WebMethod
    public com.dhcc.scm.entity.vo.ws.OperateResult recievedMsg(@WebParam(name="orderId")String orderId,@WebParam(name="passWord")String passWord, @WebParam(name="userName")String userName) ;


   /**
    * 方法名:                deliver
    * 方法功能描述：                                          回传发票
    * @param  deliveritms 订单明细
    * @return com.dhcc.pms.entity.vo.ws.OperateResult   术语类型是{@linkplain java.util.List<com.dhcc.pms.entity.ven.VenDeliveritm>}  值域类型是{@linkplain java.util.List<com.dhcc.pms.entity.ven.VenDeliveritm>}
    * @see java.util.List<com.dhcc.pms.entity.ven.VenDeliveritm>
    * @see java.util.List<com.dhcc.pms.entity.ven.VenDeliveritm>
    * @since JDK1.7
    * @Create Date:        2014-07-10 09:36:34.206
    */
    @WebMethod
    @WebResult(name="operateResult")
    public OperateResult deliver(@WebParam(name="deliverWeb")DeliverWeb deliverWeb) ;


   /**
    * 方法名:                listOrderWS
    * 方法功能描述：                                          查询订单
    * @param  passWord,  用户名,必填  类型是{@linkplain java.lang.String}
    * @param  passWord,  密码,必填  类型是{@linkplain java.lang.String}
    * @return java.util.List<com.dhcc.pms.entity.vo.ord.OrderWSVo>   术语类型是{@linkplain java.lang.String}  值域类型是{@linkplain java.lang.String}
    * @see java.lang.String
    * @see java.lang.String
    * @since JDK1.7
    * @Create Date:        2014-07-10 09:36:34.206
    */
    @WebMethod
    @WebResult(name="orderWebVos")
    public OrdWebVo listOrderWS(@WebParam(name="passWord")String passWord, @WebParam(name="userName")String userName) ;

    
    
    /**
     * 
    * @Title: OrderStateWServiceInterface.java
    * @Description: TODO(同步供应商药品信息)
    * @param venIncs
    * @return
    * @return:OperateResult 
    * @author zhouxin  
    * @date 2014年7月11日 下午3:38:49
    * @version V1.0
     */
    @WebMethod
    @WebResult(name="operateResult")
    public OperateResult getVenInc(@WebParam(name="venIncWeb")VenIncWeb venIncWeb);
}