/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ord;

import java.util.List;

import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.vo.ord.OrderExeStateVo;

public interface OrderStateService {
	
	
	/**
	 * 
	* @Title: saveOrderSubCmp 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 下午6:25:42
	 */
	public void saveOrderSubCmp(OrderStateDto dto);
	
	/**
	 * 
	* @Title: listVenSend 
	* @Description: TODO(供应商录入发票号和效期使用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 下午2:15:57
	 */
	public void listVenSend(OrderStateDto dto);
	/**
	 * 
	* @Title: accpOrder 
	* @Description: TODO(供应商确认订单，订单不是父子表) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 上午11:39:38
	 */
	public void accpOrder(OrderStateDto dto);
	/**
	 * 
	* @Title: listVenOrd 
	* @Description: TODO(供应商查询订单，不用订单主子表的情况) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 上午9:50:25
	 */
	public void listVenOrd(OrderStateDto dto);
	/**
	 * 
	* @Title: OrderStateService.java
	* @Description: TODO(查询订单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月28日 上午9:51:51
	* @version V1.0
	 */
	public void listOrderState(OrderStateDto dto);
	

	/**
	 * 
	* @Title: OrderStateService.java
	* @Description: TODO(查询订单历史状态)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月28日 下午5:54:09
	* @version V1.0
	 */
	public List<OrderExeStateVo> listOrderExeState(OrderStateDto dto);
	
	
	/**
	 * 
	* @Title: OrderStateService.java
	* @Description: TODO(查询订单明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月29日 上午9:35:01
	* @version V1.0
	 */
	public void listOrderItm(OrderStateDto dto);
	
	/**
	 * 
	* @Title: OrderStateService.java
	* @Description: TODO(返回状态列表)
	* @return
	* @return:List<State> 
	* @author zhouxin  
	* @date 2014年5月29日 下午2:42:12
	* @version V1.0
	 */
	public  List<State> getComboList();

	
	
	/**
	 * 
	* @Title: OrderStateService.java
	* @Description: TODO(webservice 查询订单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月2日 下午1:44:51
	* @version V1.0
	 */
	public  void listOrderWS(OrderStateDto dto);



	/**
	 * @param dto
	 * @return
	 */
	//public List<OrderStateAndroidVo> listOrderStateAndroid(OrderStateDto dto);
}
