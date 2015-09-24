/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.nur;

import java.util.List;

import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.cat.QueryIncPropertyVO;
import com.dhcc.scm.entity.vo.ord.OrderExeStateVo;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;

public interface NurseService {
	
	
	/**
	 * 
	* @Title: cmpOrderDetail 
	* @Description: TODO(护士确认订单完成) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月28日 下午4:34:24
	 */
	public void cmpOrderDetail(NurseIncDto dto);
	/**
	 * 
	* @Title: listVenIncComment 
	* @Description: TODO(查询评价结果) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月27日 上午10:39:02
	 */
	public void listVenIncComment(NurseIncDto dto);

	/**
	 * 
	* @Title: listNurseInc
	* @Description: TODO(查询供应商药品，供应商资质以审核，) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月18日 下午4:06:18
	 */
	public void listNurseInc(NurseIncDto dto);
	
	
	/**
	 * 
	* @Title: addShopCart 
	* @Description: TODO(保存到购物车) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月19日 下午5:47:18
	 */
	public void addShopCart(NurseIncDto dto);
	
	/**
	 * 
	* @Title: saveOrderDetail 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param orderDetails    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月23日 下午12:05:13
	 */
	public void saveOrderDetail(NurseIncDto dto);
	
	/**
	 * 
	* @Title: listNurseOrd 
	* @Description: TODO(我的订单查询，供应商待确认，护士待接收) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月23日 下午9:02:22
	 */
	public void listNurseOrd(NurseIncDto dto); 
	
	/**
	 * 
	* @Title: listNurseShop 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月24日 下午9:26:14
	 */
	public void listNurseShop(NurseIncDto dto);
	
	
	public void listCatGroup(NurseIncDto dto);
	
	public void getSubGroupByID(NurseIncDto dto); 
	
	public List<OrderExeStateVo> getOrderStateById(OrderStateDto dto);
	
	public List<HopCtlocDestination> findLocDesctionComboList(OrderDto dto);
	/**
	 * 保存收货地址
	 */
	public void saveDest(NurseIncDto dto);
	/**
	 * 删除收货地址
	 * @param dto
	 */
	public void deleteDest(NurseIncDto dto);
	/**
	 * 供应商注册
	 */
	public void saveOrUpdate(VendorDto dto);
	/**
	 * 供应商注册的同时保存保存用户
	 */
	public void saveNormalAccount(NormalAccount normalAccount) throws Exception;
	/**
	 * 供应商上传资质信息
	 */
	public void saveOrUpdatePic(VendorDto dto);
	/**
	 * 查看审核结果
	 */
	public List<VenQualifTypeVO> queryQualifyType(VendorDto dto) ;
	
	/**
	 * 
	* @Title: listOrdGrpByNo 
	* @Description: TODO(查看订单按单号汇总) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月13日 下午6:01:03
	 */
	public void listOrdGrpByNo(NurseIncDto dto);
	
	/**
	 * 
	* @Title: updateOrdDetail 
	* @Description: TODO(更新订单状态，增加订单执行日志) 
	* @param @param orderId
	* @param @param state    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月14日 下午4:05:32
	 */
	public void updateOrdDetail(Long orderId,Long state,String remark);
	
	
	/**\
	 * 
	* @Title: listNurseIncProperty 
	* @Description: TODO(查询商品属性) 
	* @param @param dto
	* @param @return    设定文件 
	* @return List<QueryIncPropertyVO>    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月15日 下午4:56:16
	 */
	public List<QueryIncPropertyVO> listNurseIncProperty(NurseIncDto dto);
}
