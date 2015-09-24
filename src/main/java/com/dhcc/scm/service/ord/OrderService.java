/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ord;

import java.util.List;
import java.util.Map;

import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.vo.ord.ExportOrderVo;
import com.dhcc.scm.entity.vo.ord.ShopCartPicVo;
import com.dhcc.scm.entity.vo.ord.ShopCartVo;

public interface OrderService {

	public void list(OrderDto dto);
	
	public void save(OrderDto dto);
	
	public void delete(OrderDto dto);
	
	public void update(OrderDto dto);
	
	public Order findById(OrderDto dto);
	
	public void saveShopCart(OrderDto dto);
	
	public List<ShopCartVo> listShopCart(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(删除购物车的一个药)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月23日 上午11:34:44
	* @version V1.0
	 */
	public void deleteShopCart(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(查询登录人购物车，带图片)
	* @param dto
	* @return
	* @return:List<ShopCartPicVo> 
	* @author zhouxin  
	* @date 2014年5月23日 下午3:01:20
	* @version V1.0
	 */
	public List<ShopCartPicVo> listShopCartPic(OrderDto dto);
	
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(确认购物车选择的药品)
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月27日 上午10:09:18
	* @version V1.0
	 */
	public void saveOrdInfo(OrderDto dto);

	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(更具科室查询收货地址)
	* @param dto
	* @return
	* @return:List<HopCtlocDestination> 
	* @author zhouxin  
	* @date 2014年5月27日 下午2:59:55
	* @version V1.0
	 */
	public List<HopCtlocDestination> findLocDesctionComboList(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(生成订单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月28日 上午8:33:27
	* @version V1.0
	 */
	public void saveOrUpdate(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(导入订单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月4日 上午10:06:31
	* @version V1.0
	 */
	public void impOrder(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(修改订单明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月5日 上午9:38:34
	* @version V1.0
	 */
	public void saveOrditm(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(删除订单明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月5日 上午9:38:34
	* @version V1.0
	 */
	public void deleteOrditm(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(确认订单完成)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月5日 下午8:46:21
	* @version V1.0
	 */
	public void complete(OrderDto dto);
	
	/**
	 * 
	* @Title: OrderService.java
	* @Description: TODO(取消完成状态)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月17日 下午2:03:18
	* @version V1.0
	 */
	 public void cancleComplete(OrderDto dto);

	 /**
	  * 
	 * @Title: OrderService.java
	 * @Description: TODO(执行订单状态)
	 * @param dto
	 * @return:void 
	 * @author zhouxin  
	 * @date 2014年6月17日 下午8:44:28
	 * @version V1.0
	  */
	 public void exeOrder(OrderDto dto);
	 
	 /**
	  * 
	 * @Title: OrderService.java
	 * @Description: TODO(导出订单)
	 * @param dto
	 * @return
	 * @return:List<ExportOrderVo> 
	 * @author zhouxin  
	 * @date 2014年6月18日 下午2:05:50
	 * @version V1.0
	  */
	 public List<ExportOrderVo> ExportOrder(String dto);
	 
	 
	 /**
	  * 
	 * @Title: OrderService.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param order
	 * @param itms
	 * @return:void 
	 * @author zhouxin  
	 * @date 2014年7月28日 下午5:17:31
	 * @version V1.0
	  */
	 public void ImportOrderByWS(Order order,List<OrderItm> itms);
	 
	 /**
	  * 
	 * @Title: OrderService.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param map
	 * @return:void 
	 * @author zhouxin  
	 * @date 2014年8月5日 下午8:13:23
	 * @version V1.0
	  */
	 public void importOrderByExcel(Map<String, Order> map);
}	
