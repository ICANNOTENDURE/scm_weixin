/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.ord.OrderDao;
import com.dhcc.scm.dao.ven.VenDeliverDao;
import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.dto.ven.VenDeliverDto;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.ven.VenDeliver;
import com.dhcc.scm.entity.vo.ord.ExportOrderVo;
import com.dhcc.scm.entity.vo.ord.ShopCartPicVo;
import com.dhcc.scm.entity.vo.ord.ShopCartVo;
import com.dhcc.scm.service.ord.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderDao orderDao;
	@Resource
	private CommonService commonService;
	@Resource
	private VenDeliverDao venDeliverDao;
	
	public void list(OrderDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		orderDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(OrderDto dto){
	
		orderDao.save(dto.getOrder());
	}
	
	public void delete(OrderDto dto){
	
		orderDao.delete(dto);
	}
	
	public void update(OrderDto dto){
	
		orderDao.update(dto.getOrder());
	}
	
	public Order findById(OrderDto dto){
	
		dto.setOrder(orderDao.findById(dto.getOrder()));
		return dto.getOrder();
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#saveShopCart(com.dhcc.pms.dto.ord.OrderDto)
	 */

	public void saveShopCart(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.saveShopCart(dto.getOrdShopping());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#listShopCart(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public List<ShopCartVo> listShopCart(OrderDto dto) {
		// TODO Auto-generated method stub
		return orderDao.listShopCart(dto.getOrdShopping());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#deleteShopCart(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void deleteShopCart(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.deleteShopCart(dto.getOrdShopping());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#listShopCartPic(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public List<ShopCartPicVo> listShopCartPic(OrderDto dto) {
		// TODO Auto-generated method stub
		return orderDao.listShopCartPic(dto.getOrdShopping());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#saveOrdInfo(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void saveOrdInfo(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.saveOrdInfo(dto.getOrdShop());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#findLocDesctionComboList(com.dhcc.pms.dto.hop.HopCtlocDestinationDto)
	 */
	@Override
	public List<HopCtlocDestination> findLocDesctionComboList(
			OrderDto dto) {
		// TODO Auto-generated method stub
		return orderDao.findLocDesctionComboList(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#saveOrUpdate(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void saveOrUpdate(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.saveOrUpdate(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#impOrder(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void impOrder(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.impOrder(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#saveOrditm(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void saveOrditm(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.saveOrditm(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#deleteOrditm(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void deleteOrditm(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.deleteOrditm(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#complete(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void complete(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.complete(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#cancleComplete(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void cancleComplete(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.cancleComplete(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#exeOrder(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public void exeOrder(OrderDto dto) {
		// TODO Auto-generated method stub
		orderDao.exeOrder(dto);
		VenDeliverDto venDeliverDto=new VenDeliverDto();
		VenDeliver VenDeliver=new VenDeliver();
		VenDeliver.setDeliverOrderid(dto.getOrder().getOrderId());
		venDeliverDto.setVenDeliver(VenDeliver);
		venDeliverDao.AccectOrder(venDeliverDto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#ExportOrder(com.dhcc.pms.dto.ord.OrderDto)
	 */
	@Override
	public List<ExportOrderVo> ExportOrder(String dto) {
		// TODO Auto-generated method stub
		List<ExportOrderVo> exportOrderVos=new ArrayList<ExportOrderVo>();
		Map<String, ExportOrderVo> map=new HashMap<String,ExportOrderVo>();
		for(ExportOrderVo exportOrderVo:orderDao.ExportOrder(dto)){
			if(exportOrderVo.getRecloc().contains("西院")){
				exportOrderVo.setHopname(exportOrderVo.getHopname()+"(西院)");
			}
			if(map.containsKey(exportOrderVo.getOrderitmid().toString())){
				ExportOrderVo exportOrderVo2=map.get(exportOrderVo.getOrderitmid().toString());
				map.get(exportOrderVo.getOrderitmid().toString()).setVeninccode(exportOrderVo2.getVeninccode()+","+exportOrderVo.getVeninccode());
			}else{
				map.put(exportOrderVo.getOrderitmid().toString(), exportOrderVo);
			}
		}
		for(Map.Entry<String, ExportOrderVo> entry: map.entrySet()) {
			exportOrderVos.add(entry.getValue());
		}

		map=null;
		return exportOrderVos;
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#ExportOrderByWS(com.dhcc.pms.entity.ord.Order, java.util.List)
	 */
	@Override
	public void ImportOrderByWS(Order order, List<OrderItm> itms) {
		// TODO Auto-generated method stub
		orderDao.importOrderByWS(order,itms);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderService#importOrderByExcel(java.util.Map)
	 */
	@Override
	public void importOrderByExcel(Map<String, Order> map) {
		// TODO Auto-generated method stub
		orderDao.importOrderByExcel(map);
	}

}
