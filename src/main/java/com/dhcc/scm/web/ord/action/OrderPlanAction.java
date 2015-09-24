/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ord.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.PingYinUtil;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.dto.ord.OrderPlanDto;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.vo.cat.IncPropertyVO;
import com.dhcc.scm.entity.vo.nur.NurseIncVo;
import com.dhcc.scm.service.nur.NurseService;
import com.dhcc.scm.service.ord.OrderPlanService;


@Namespace(value = "/ord")
@Scope("prototype")
@Action(value = "orderPlanCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/ord/OrderPlan.jsp"),
		@Result(name = "selectItm", location = "/WEB-INF/jsp/ord/selectItm.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/ord/OrderPlan.jsp")})
@Blh("orderPlanBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.orderPlan")})
public class OrderPlanAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private OrderPlanService orderPlanService;
	
	@Resource
	private NurseService nurseService;
	
	@Resource
	private CommonService commonService;
	
	private OrderPlanDto dto = new OrderPlanDto();
	
	@SuppressWarnings("unchecked")
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			orderPlanService.list(dto);
			return "listMain";
		}
		//选购医院商品一对多
		if("selectItm".equals(super.getBusinessFlow())){
			NurseIncDto nurseDto=new NurseIncDto();
			nurseDto.setHopIncId(dto.getHopIncId());
			nurseService.listNurseInc(nurseDto);
			dto.setNurseIncVos((List<NurseIncVo>)nurseDto.getPageModel().getPageData());
			//药品属性查询查询条件
			if(dto.getIncCatId()!=null){
				dto.setIncManfs(new ArrayList<HopManf>());
				List<CatGroupProperty> catGroupProperties=commonService.findByProperty(CatGroupProperty.class, "grpParrefId", dto.getIncCatId());
				
				
				Map<String,List<IncPropertyVO>> map = new HashMap<String,List<IncPropertyVO>>();
				for(CatGroupProperty catGroupProperty:catGroupProperties){
					CatProperty catProperty=commonService.get(CatProperty.class, catGroupProperty.getGrpProParrefId());
					
					if(catProperty.getProCode().equals("1")){
						HopManf hopManf=commonService.get(HopManf.class, Long.valueOf(catGroupProperty.getGrpProDesc()));
						hopManf.setFirst(PingYinUtil.getFirstSpell(hopManf.getManfName().substring(0, 1)));
						hopManf.setPropertyId(catGroupProperty.getGrpProId());
						dto.getIncManfs().add(hopManf);
					} else{
						IncPropertyVO incPropertyVO=new IncPropertyVO();
						incPropertyVO.setPropertyId(catGroupProperty.getGrpProId());
						incPropertyVO.setPropertyName(catGroupProperty.getGrpProDesc());

						if(map.containsKey(catProperty.getProName())){
							map.get(catProperty.getProName()).add(incPropertyVO);
						}else{
							List<IncPropertyVO> propertyVOs=new ArrayList<IncPropertyVO>();
							propertyVOs.add(incPropertyVO);
							map.put(catProperty.getProName(), propertyVOs);
						}
					}
				}
				dto.setPropertyMap(map);
			}
			return "selectItm";
		}
		return null;
	}
	
	@Override
	public BaseDto getBaseDto() {

		return dto;
	}
	
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {

		reqEvent.setDto(dto);
	}
	
	public OrderPlanDto getDto() {
		return dto ;
	}
	
	public void setDto(OrderPlanDto dto) {
		this.dto = dto;
	}

}
