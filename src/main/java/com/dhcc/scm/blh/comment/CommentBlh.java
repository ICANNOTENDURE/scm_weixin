/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.comment;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dao.comment.CommentDao;
import com.dhcc.scm.dto.comment.CommentDto;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.entity.hop.Evalute;
import com.dhcc.scm.entity.hop.EvaluteSub;
import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenIncProperty;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.comment.CommentVenVO;
import com.dhcc.scm.service.nur.NurseService;

/**
 * 
* @ClassName: CommentBlh 
* @Description: TODO(评价结果操作) 
* @author zhouxin
* @date 2015年2月3日 下午4:09:05 
*
 */
@Component
public class CommentBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(CommentBlh.class);

	@Resource
	private CommentDao commentDao;
	
	@Resource
	private CommonService commonService;
	
	
	@Resource
	private NurseService nurseService;
	
	public CommentBlh() {
		
	}
	
	
	
	/**
	 * 
	* @Title: saveComment 
	* @Description: TODO(保存评价结果) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	 * @throws IOException 
	* @throws 
	* @author zhouxin   
	* @date 2015年2月3日 下午4:11:10
	 */
	@SuppressWarnings("unchecked")
	public void saveComment(BusinessRequest res) throws IOException {
		
			CommentDto dto=super.getDto(CommentDto.class, res);
		
			try {
				List<CatProperty> catPropertys=commonService.findByProperty(CatProperty.class, "proCode", "999");
				dto.getEvalute().setEleDate(new Date());
				dto.getEvalute().setEleUserId(Long.valueOf(WebContextHolder.getContext().getUserInfo().getId()));
				if(dto.getEvalute().getOrderId()!=null){
					OrderDetail order=commonService.get(OrderDetail.class, dto.getEvalute().getOrderId());

					dto.getEvalute().setEleVendorId(order.getOrderVenId());
					dto.getEvalute().setEleVenIncId(order.getOrderVenIncId());
					order.setOrderState(5l);
					commonService.saveOrUpdate(order);
					VenInc venInc=commonService.get(VenInc.class, order.getOrderVenIncId());
					if(venInc.getVenIncCommentNum()==null){
						venInc.setVenIncCommentNum(0l);
					}
					venInc.setVenIncCommentNum(venInc.getVenIncCommentNum()+1);
					commonService.saveOrUpdate(venInc);
				}
				if(StringUtils.isNotBlank(dto.getTagIdStr())){
					for(String tagId:dto.getTagIdStr().split(",")){
						if(StringUtils.isNotBlank(tagId)){
							EvaluteSub evaluteSub=new EvaluteSub();
							evaluteSub.setEleOrdId(dto.getEvalute().getOrderId());
							evaluteSub.setElePropertyId(Long.valueOf(tagId.trim()));
							commonService.saveOrUpdate(evaluteSub);
							
							
							//商品属性关联表
							DetachedCriteria criteria = DetachedCriteria.forClass(VenIncProperty.class);
							criteria.add(Restrictions.eq("incProIncId", dto.getEvalute().getEleVenIncId()));
							criteria.add(Restrictions.eq("incProCatProId",Long.valueOf(tagId.trim())));
							List<VenIncProperty> venIncProperties=commonService.findByDetachedCriteria(criteria);
							if(venIncProperties.size()==0){
								VenIncProperty venIncProperty=new VenIncProperty();
								venIncProperty.setIncProCatProId(Long.valueOf(tagId.trim()));
								venIncProperty.setIncProIncId(dto.getEvalute().getEleVenIncId());
								commonService.saveOrUpdate(venIncProperty);
							}
						}
					}
				}
				if(StringUtils.isNotBlank(dto.getLastTag())){
					
					VenInc venInc=commonService.get(VenInc.class, dto.getEvalute().getEleVenIncId());
					//商品属性表,这里和小类表关联
					CatGroupProperty catGroupProperty=new CatGroupProperty();
					catGroupProperty.setGrpProDesc(dto.getLastTag().trim());
					catGroupProperty.setGrpParrefId(venInc.getVenIncCatId());
					catGroupProperty.setGrpProParrefId(catPropertys.get(0).getProId());
					commonService.saveOrUpdate(catGroupProperty);
					
					//评价子表
					EvaluteSub evaluteSub=new EvaluteSub();
					evaluteSub.setEleOrdId(dto.getEvalute().getOrderId());
					evaluteSub.setElePropertyId(catGroupProperty.getGrpProId());
					commonService.saveOrUpdate(evaluteSub);
					
					
					//商品属性关联表
					VenIncProperty venIncProperty=new VenIncProperty();
					venIncProperty.setIncProCatProId(catGroupProperty.getGrpProId());
					venIncProperty.setIncProIncId(dto.getEvalute().getEleVenIncId());
					commonService.saveOrUpdate(venIncProperty);
				}
				commonService.saveOrUpdate(dto.getEvalute());
				dto.setOpFlg("1");
			} catch (Exception e) {
				dto.setOpFlg("0");
				dto.setMsg(e.getMessage());
				e.printStackTrace();
			}finally{
				super.writeJSON(dto);
			}
	}
	
	
	
	/**
	 * 
	* @Title: ListVenEval 
	* @Description: TODO(查询供应商评价) 
	* @param @param res
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月15日 上午10:35:05
	 */
	public void ListVenEval(BusinessRequest res) throws IOException {
		
		CommentDto dto=super.getDto(CommentDto.class, res);
		commentDao.listVenEval(dto);
	}
	
	/**
	 * 
	* @Title: ListVenIncEval 
	* @Description: TODO(查询商品评价) 
	* @param @param res
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月19日 下午12:11:49
	 */
	public void ListVenIncEval(BusinessRequest res) throws IOException {
		
		CommentDto dto=super.getDto(CommentDto.class, res);
		commentDao.listVenIncEval(dto);
	}
	
	/**
	 * 
	* @Title: ListVenIncEvalByIncId 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param res
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 下午6:15:34
	 */
	public void ListVenIncEvalByIncId(BusinessRequest res) throws IOException {
		
		CommentDto dto=super.getDto(CommentDto.class, res);
		commentDao.ListVenIncEvalByIncId(dto);
		if(dto.getCommentVenVO()==null){
			
			CommentVenVO commentVenVO=new CommentVenVO();
			VenInc venInc=commonService.get(VenInc.class, dto.getVenIncId());
			Vendor vendor=commonService.get(Vendor.class, venInc.getVenIncVenid());
			commentVenVO.setName(vendor.getName());
			commentVenVO.setAvgresult(0);
			commentVenVO.setAvgdescription(0);
			commentVenVO.setAvgservice(0);
			commentVenVO.setAvgspeed(0);
			dto.setCommentVenVO(commentVenVO);
		}
		super.writeJSON(dto.getCommentVenVO());
	}
	
	/**
	 * 
	* @Title: getIncComment 
	* @Description: TODO(查找商品的评价明细) 
	* @param @param res
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月21日 上午9:58:03
	 */
	public void getIncComment(BusinessRequest res) throws IOException {
		CommentDto dto=super.getDto(CommentDto.class, res);
		NurseIncDto nurseIncDto=new NurseIncDto();
		OrdShopping ordShopping=new OrdShopping();
		ordShopping.setShopVenIncid(dto.getVenIncId());
		nurseIncDto.setOrdShopping(ordShopping);
		nurseService.listVenIncComment(nurseIncDto);
		super.writeJSON(nurseIncDto.getEvalutes());
	}
	
	/**
	 * 
	* @Title: listMain 
	* @Description: TODO(查看评价) 
	* @param @param res
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月27日 下午4:43:44
	 */
	public String listMain(BusinessRequest res){
		CommentDto dto=super.getDto(CommentDto.class, res);
		List<Evalute> evalute=commonService.findByProperty(Evalute.class, "orderId", dto.getEvalute().getOrderId());
		if (evalute.size()>0){
			dto.setEvalute(evalute.get(0));
		}
		OrderDetail orderDetail=commonService.get(OrderDetail.class, dto.getEvalute().getOrderId());
		VenInc venInc=commonService.get(VenInc.class, orderDetail.getOrderVenIncId());
		List<CatProperty> catPropertys=commonService.findByProperty(CatProperty.class, "proCode", "999");
		String[] propertyNames={"grpProParrefId","grpParrefId"};
		Object[] values={catPropertys.get(0).getProId(),venInc.getVenIncCatId()};
		List<CatGroupProperty> catGroupProperties=commonService.findByProperties(CatGroupProperty.class, propertyNames, values);
		for(CatGroupProperty catGroupProperty:catGroupProperties){
			String[] eleSubpropertyNames={"elePropertyId","eleOrdId"};
			Object[] eleValues={catGroupProperty.getGrpProId(),dto.getEvalute().getOrderId()};
			List<EvaluteSub> evaluteSubs=commonService.findByProperties(EvaluteSub.class, eleSubpropertyNames, eleValues);
			if(evaluteSubs.size()>0){
				catGroupProperty.setIsCheck("Y");
			}
		}
		dto.setCatGroupProperties(catGroupProperties);
		return "listMain";
	}
}	
