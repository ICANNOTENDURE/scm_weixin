/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ven;

import java.util.List;
import java.util.Map;

import com.dhcc.scm.dto.ven.VenDeliverDto;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.vo.ws.HisInvInfoItmWeb;


public interface VenDeliverService {
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(根据订单生成发货单)
	* @param orderId
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月18日 下午4:26:10
	* @version V1.0
	 */
	public void AccectOrder(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(查询发货单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月19日 上午11:42:07
	* @version V1.0
	 */
	public void listDeliver(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(查询发货单明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月19日 下午4:16:27
	* @version V1.0
	 */
	public void listDeliverItm(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(保存发货明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月19日 下午5:02:30
	* @version V1.0
	 */
	public void saveDeliverItm(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(导入发票)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月20日 下午2:53:34
	* @version V1.0
	 */
	public void impInv(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(导入发票，按照订单号)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月23日 下午1:18:22
	* @version V1.0
	 */
	public void impByOrder(VenDeliverDto dto);
	
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(供应商发货)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月24日 上午11:43:13
	* @version V1.0
	 */
	public void deliver(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(删除发货单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月24日 下午4:51:00
	* @version V1.0
	 */
	public void delete(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(取消发货状态)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月24日 下午4:56:25
	* @version V1.0
	 */
	public void cancelComplete(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月27日 下午2:40:44
	* @version V1.0
	 */
	public List<VenDeliveritm> getDeliveritms(Long deliverId);
	
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param map
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月9日 下午3:40:47
	* @version V1.0
	 */
	public void deliver(Map<String, List<VenDeliveritm>> map);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(检查发票是否重复录入)
	* @param inv
	* @param orditmId
	* @return
	* @return:boolean 
	* @author zhouxin  
	* @date 2014年7月22日 下午3:37:32
	* @version V1.0
	 */
	public boolean checkInvExist(String inv,Long orditmId);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param hopId
	* @param venId
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年7月22日 下午5:53:19
	* @version V1.0
	 */
	public Float getFac(Long hopId,Long venId);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月22日 下午7:47:23
	* @version V1.0
	 */
	public void impByOrderItm(VenDeliverDto dto);
	
	/**
	 * 
	* @Title: VenDeliverService.java
	* @Description: TODO(发票号查找发货信息)
	* @param hopId
	* @param vendorId
	* @param inv
	* @return
	* @return:List<HisInvInfoWeb> 
	* @author zhouxin  
	* @date 2014年7月30日 下午2:31:35
	* @version V1.0
	 */
	public List<HisInvInfoItmWeb> getRecItmByInv(Long hopId,Long vendorId,String inv);
	
	/**
	 * 
	* @Title: listDeliverNew 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月26日 下午5:48:01
	 */
	public void listDeliverNew(VenDeliverDto dto);
	
	public void listDeliverItmNew(VenDeliverDto dto);
	
	public void impInvByOrd(VenDeliverDto dto);
}
