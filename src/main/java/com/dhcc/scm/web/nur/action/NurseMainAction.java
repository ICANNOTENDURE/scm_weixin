package com.dhcc.scm.web.nur.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.PingYinUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.dto.hop.HopVendorDto;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.entity.cat.Group;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.cat.IncPropertyVO;
import com.dhcc.scm.entity.vo.cat.QueryIncPropertyVO;
import com.dhcc.scm.entity.vo.nur.NurseIncDetailVo;
import com.dhcc.scm.entity.vo.nur.NurseIncVo;
import com.dhcc.scm.service.cat.CatGroupService;
import com.dhcc.scm.service.comment.CommentService;
import com.dhcc.scm.service.hop.HopVendorService;
import com.dhcc.scm.service.nur.NurseService;
import com.dhcc.scm.service.ven.VendorService;

@Namespace(value = "/nur")
@Scope("prototype")
@Action(value = "nurseCtrl", results = { @Result(name = "auditOrd", location = "/WEB-INF/jsp/nur/auditOrd.jsp"), @Result(name = "nurOrdImp", location = "/WEB-INF/jsp/nur/NurOrdImp.jsp"), @Result(name = "nurseDestination", location = "/WEB-INF/jsp/nur/nurDestination.jsp"), @Result(name = "nurseManageMain", location = "/WEB-INF/jsp/nur/nurseMain.jsp"), @Result(name = "nurseIncDetail", location = "/WEB-INF/jsp/nur/nurIncDetail.jsp"), @Result(name = "catGroupList", location = "/WEB-INF/jsp/nur/nurseMain.jsp"), @Result(name = "getSubGroupByID", location = "/WEB-INF/jsp/nur/nurseMain.jsp"), @Result(name = "nurseOrder", location = "/WEB-INF/jsp/nur/nurseOrder.jsp"), @Result(name = "nursePay", location = "/WEB-INF/jsp/nur/nursePay.jsp"), @Result(name = "nurseInfomation", location = "/WEB-INF/jsp/nur/nurInfomation.jsp"), @Result(name = "getOrderStateById", location = "/WEB-INF/jsp/nur/nurseOrder.jsp"), @Result(name = "nurDestination", location = "/WEB-INF/jsp/nur/nurDestination.jsp"),
		@Result(name = "saveInfo", location = "/WEB-INF/jsp/nur/nurInfomation.jsp"), @Result(name = "findLocDesctionComboList", location = "/WEB-INF/jsp/nur/nurDestination.jsp"), @Result(name = "setDefault", location = "/WEB-INF/jsp/nur/nurDestination.jsp"), @Result(name = "saveDest", location = "/WEB-INF/jsp/nur/nurDestination.jsp"), @Result(name = "deleteDest", location = "/WEB-INF/jsp/nur/nurDestination.jsp"), @Result(name = "vendorRegist", location = "/WEB-INF/jsp/nur/vendorRegistInfo.jsp"), @Result(name = "registSucess", location = "/WEB-INF/jsp/nur/registSuccess.jsp"), @Result(name = "upload", location = "/WEB-INF/jsp/nur/vendorRegistInfo.jsp"), @Result(name = "auditResult", location = "/WEB-INF/jsp/nur/vendorRegistResult.jsp"), @Result(name = "queryAudit", location = "/WEB-INF/jsp/nur/queryVenAuditResult.jsp"), @Result(name = "noResult", location = "/WEB-INF/jsp/nur/noResults.jsp"), @Result(name = "checkVenUnique", location = "/WEB-INF/jsp/nur/vendorRegistInfo.jsp"),
		@Result(name = "checkVenAudit", location = "/WEB-INF/jsp/nur/vendorRegistResult.jsp"),
		@Result(name = "nurPrint", location = "/WEB-INF/jsp/nur/NurPrint.jsp")})
@Blh("nurseBlh")
public class NurseMainAction extends BaseAction {

	/**
	 * 字段: 序列化id
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private NurseService nurseService;

	@Resource
	private VendorService vendorService;

	@Resource
	private HopVendorService hopVendorService;

	@Resource
	private CommonService commonService;

	@Resource
	private CatGroupService catGroupService;

	@Resource
	private CommentService commentService;

	private NurseIncDto dto = new NurseIncDto();

	@Override
	public BaseDto getBaseDto() {
		return dto;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(dto);
	}

	/**
	 * 有时候不走后台，只要页面跳成时，复写这个父类方法， super.getBusinessFlow() 能得调用的方法，也就是URL中!后的方法名
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String directlyJump() {
		if ("nurseManageMain".equals(super.getBusinessFlow())) {

			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getQueryStr())) {
				try {
					dto.setQueryStr(java.net.URLDecoder.decode(dto.getQueryStr(), "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			// 已选条件
			List<String> propertyList = new LinkedList<String>();
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getPropertyIdStr())) {
				String[] strs = dto.getPropertyIdStr().split(BaseConstants.COMMA);
				for (String str : strs) {
					if (!propertyList.contains(str)) {
						propertyList.add(str);
					}
				}
			}
			// 新增查询商品属性活删除商品属性
			if ((dto.getPropertyId() != null) || (dto.getRemovePropertyId() != null)) {
				if (dto.getPropertyId() != null) {
					if (!propertyList.contains(dto.getPropertyId().toString())) {

						CatGroupProperty catGroupProperty = commonService.get(CatGroupProperty.class, dto.getPropertyId());
						CatProperty catProperty = commonService.get(CatProperty.class, catGroupProperty.getGrpProParrefId());
						String removeStr = "";
						for (String ss : propertyList) {
							CatGroupProperty catGroupPropertyTmp = commonService.get(CatGroupProperty.class, Long.valueOf(ss));
							CatProperty catPropertyTmp = commonService.get(CatProperty.class, catGroupPropertyTmp.getGrpProParrefId());
							if (catProperty.getProCode().equals(catPropertyTmp.getProCode())) {
								removeStr = ss;
							}
						}
						if (org.apache.commons.lang.StringUtils.isNotBlank(removeStr)) {
							propertyList.remove(removeStr);
						}
						propertyList.add(dto.getPropertyId().toString());
					}
				}
				if (dto.getRemovePropertyId() != null) {
					if (propertyList.contains(dto.getRemovePropertyId().toString())) {
						propertyList.remove(dto.getRemovePropertyId().toString());
					}
				}

				dto.setPropertyIdStr(org.apache.commons.lang.StringUtils.join(propertyList, BaseConstants.COMMA));
				dto.setPropertyId(null);
				dto.setRemovePropertyId(null);
			}
			// 购物车
			nurseService.listNurseShop(dto);
			// 商品信息
			nurseService.listNurseInc(dto);
			dto.setNurseIncVos((List<NurseIncVo>) dto.getPageModel().getPageData());
			// 三级商品分类菜单
			CatGroupDto groupdto = new CatGroupDto();
			catGroupService.listGroupComb(groupdto);
			for (Group group : groupdto.getGroups()) {
				List<CatGroup> catGroups = commonService.findByProperty(CatGroup.class, "parrefId", group.getSgId());
				for (CatGroup catGroup : catGroups) {
					List<SubCatGroup> subCatGroups = commonService.findByProperty(SubCatGroup.class, "subParrefGroupID", catGroup.getGroupID());
					catGroup.setSubCatGroups(subCatGroups);
				}
				group.setCatGroups(catGroups);
			}
			dto.setGroups(groupdto.getGroups());

			// 药品属性查询查询条件
			Map<String, List<IncPropertyVO>> map = new HashMap<String, List<IncPropertyVO>>();
			dto.setIncManfs(new ArrayList<HopManf>());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getQueryStr()) || org.apache.commons.lang.StringUtils.isNotBlank(dto.getPropertyIdStr()) || dto.getIncCatId() != null) {
				List<QueryIncPropertyVO> queryIncPropertyVOs = nurseService.listNurseIncProperty(dto);
				if (queryIncPropertyVOs.size() > 0) {
					for (QueryIncPropertyVO queryIncPropertyVO : queryIncPropertyVOs) {
						if (queryIncPropertyVO.getProcode().equals(BaseConstants.PROPERTY_MANF_CODE)) {
							if (org.apache.commons.lang.StringUtils.isNumeric(queryIncPropertyVO.getGrpprodesc())) {
								HopManf hopManf = commonService.get(HopManf.class, Long.valueOf(queryIncPropertyVO.getGrpprodesc()));
								if (hopManf != null) {
									hopManf.setFirst(PingYinUtil.getFirstSpell(hopManf.getManfName().substring(0, 1)).toLowerCase());
									hopManf.setPropertyId(queryIncPropertyVO.getIncprocatproid());
									dto.getIncManfs().add(hopManf);
								}
							}
						} else {
							IncPropertyVO incPropertyVO = new IncPropertyVO();
							incPropertyVO.setPropertyId(queryIncPropertyVO.getIncprocatproid());
							incPropertyVO.setPropertyName(queryIncPropertyVO.getGrpprodesc());
							if (map.containsKey(queryIncPropertyVO.getProname())) {
								map.get(queryIncPropertyVO.getProname()).add(incPropertyVO);
							} else {
								List<IncPropertyVO> incPropertyVOs = new ArrayList<IncPropertyVO>();
								incPropertyVOs.add(incPropertyVO);
								map.put(queryIncPropertyVO.getProname(), incPropertyVOs);
							}
						}
					}
				}
				dto.setPropertyMap(map);
			}
			// 商品查询已选条件
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getPropertyIdStr())) {
				Map<String, IncPropertyVO> selectMap = new HashMap<String, IncPropertyVO>();
				for (String str : dto.getPropertyIdStr().split(BaseConstants.COMMA)) {
					CatGroupProperty catGroupProperty = commonService.get(CatGroupProperty.class, Long.valueOf(str.trim()));
					if (catGroupProperty != null) {
						CatProperty catProperty = commonService.get(CatProperty.class, catGroupProperty.getGrpProParrefId());
						if (catProperty.getProCode().equals("1")) {
							HopManf hopManf = commonService.get(HopManf.class, Long.valueOf(catGroupProperty.getGrpProDesc()));
							if (hopManf != null) {
								IncPropertyVO incPropertyVO = new IncPropertyVO();
								incPropertyVO.setPropertyId(Long.valueOf(str.trim()));
								incPropertyVO.setPropertyName(hopManf.getManfName());
								selectMap.put(catProperty.getProName(), incPropertyVO);
							}
						} else {
							IncPropertyVO incPropertyVO = new IncPropertyVO();
							incPropertyVO.setPropertyId(Long.valueOf(str.trim()));
							incPropertyVO.setPropertyName(catGroupProperty.getGrpProDesc());
							selectMap.put(catProperty.getProName(), incPropertyVO);
						}
					}
				}
				dto.setSelectMap(selectMap);
			}
			return "nurseManageMain";
		}

		// 显示商品明细信息
		if ("nurseIncDetail".equals(super.getBusinessFlow())) {

			dto.setNurseIncDetailVo(new NurseIncDetailVo());
			HopInc hopInc = commonService.get(HopInc.class, dto.getOrdShopping().getShopIncid());
			VenInc venInc = commonService.get(VenInc.class, dto.getOrdShopping().getShopVenIncid());
			List<VenIncPic> incPics = commonService.findByProperty(VenIncPic.class, "venIncPicVenincid", dto.getOrdShopping().getShopVenIncid());
			Vendor vendor = commonService.get(Vendor.class, venInc.getVenIncVenid());
			dto.setVenIncPics((incPics));
			dto.getNurseIncDetailVo().setInccode(venInc.getVenIncCode());
			dto.getNurseIncDetailVo().setIncname(venInc.getVenIncName());
			dto.getNurseIncDetailVo().setSpec(venInc.getVenIncSpec());

			dto.getNurseIncDetailVo().setIncuom(hopInc.getIncUomname());
			dto.getNurseIncDetailVo().setIncid(dto.getOrdShopping().getShopIncid());
			dto.getNurseIncDetailVo().setVenincid(dto.getOrdShopping().getShopVenIncid());
			dto.getNurseIncDetailVo().setRp(venInc.getVenIncPrice());
			dto.getNurseIncDetailVo().setVenname(vendor.getName());
			if (venInc.getVenIncManfid() != null) {
				HopManf hopManf = commonService.get(HopManf.class, venInc.getVenIncManfid());
				dto.getNurseIncDetailVo().setManf(hopManf.getManfName());
			}
			List<CatProperty> catPropertys = commonService.findByProperty(CatProperty.class, "proCode", "1000");
			if (catPropertys.size() > 0) {
				String[] propertyNames = { "grpParrefId", "grpProParrefId" };
				Object[] values = { venInc.getVenIncCatId(), catPropertys.get(0).getProId() };
				List<CatGroupProperty> catGroupPropertys = commonService.findByProperties(CatGroupProperty.class, propertyNames, values);
				if (catGroupPropertys.size() > 0) {
					dto.getNurseIncDetailVo().setSpec(catGroupPropertys.get(0).getGrpProDesc());
				}

			}
			// 商品标签
			dto.setChartVOs(commentService.getIncTag(dto.getOrdShopping().getShopVenIncid()));

			dto.setNurseIncVos(new ArrayList<NurseIncVo>());
			nurseService.listNurseInc(dto);
			dto.setNurseIncVos((List<NurseIncVo>) dto.getPageModel().getPageData());
			// 评论
			// nurseService.listVenIncComment(dto);
			// 显示三级菜单
			CatGroupDto groupdto = new CatGroupDto();
			catGroupService.listGroupComb(groupdto);
			for (Group group : groupdto.getGroups()) {
				List<CatGroup> catGroups = commonService.findByProperty(CatGroup.class, "parrefId", group.getSgId());
				for (CatGroup catGroup : catGroups) {
					List<SubCatGroup> subCatGroups = commonService.findByProperty(SubCatGroup.class, "subParrefGroupID", catGroup.getGroupID());
					catGroup.setSubCatGroups(subCatGroups);
				}
				group.setCatGroups(catGroups);
			}
			dto.setGroups(groupdto.getGroups());
			return "nurseIncDetail";
		}
		if ("nursePay".equals(super.getBusinessFlow())) {
			nurseService.listNurseShop(dto);

			Long locId = Long.valueOf(WebContextHolder.getContext().getUserInfo().getLocId());
			List<HopCtlocDestination> hopCtlocDestinations = commonService.findByProperty(HopCtlocDestination.class, "ctlocDr", locId);
			HopCtloc hopCtloc = commonService.get(HopCtloc.class, locId);
			for (HopCtlocDestination hopCtlocDestination : hopCtlocDestinations) {
				if (hopCtloc.getCtlocDest() != null) {
					if (hopCtlocDestination.getHopCtlocDestinationId().toString().equals(hopCtloc.getCtlocDest().toString())) {
						hopCtlocDestination.setIsDefault("Y");
					}
				}
			}
			dto.setHopCtlocDestinations(hopCtlocDestinations);

			return "nursePay";
		}
		if ("nurseOrder".equals(super.getBusinessFlow())) {
			List<State> states = commonService.getAll(State.class, "stateSeq", true);
			if (dto.getOrdState() != null) {
				for (State state : states) {
					if (dto.getOrdState().toString().equals(state.getStateSeq().toString())) {
						state.setCheckFlag("1");
					}
				}
			}
			dto.setStates(states);
			nurseService.listOrdGrpByNo(dto);
			dto.setComboxVos(hopVendorService.getHopVenComboxVos(dto.getComgridparam()));
			return "nurseOrder";
		}
		if ("nurseInfomation".equals(super.getBusinessFlow())) {
			return "nurseInfomation";
		}
		if ("nurDestination".equals(super.getBusinessFlow())) {
			return "nurDestination";
		}
		/* 供应商注册资质加载 */
		if ("vendorRegist".equals(super.getBusinessFlow())) {
			dto.setVendorDto(new VendorDto());
			dto.getVendorDto().setVenQualifTypeList(commonService.getAll(VenQualifType.class, "seq", true));
			//获取到hospitalName
			List<Hospital> hospital = commonService.getAll(Hospital.class, "hospitalName", true);
			dto.setHospital(hospital);
			return "vendorRegist";
		}
		if ("registSucess".equals(super.getBusinessFlow())) {
			return "registSucess";
		}
		if ("auditResult".equals(super.getBusinessFlow())) {
			if (dto.getVendorDto() == null) {
				dto.setVendorDto(new VendorDto());
			}
			if (WebContextHolder.getContext().getVisit() != null) {
				if (WebContextHolder.getContext().getVisit().getUserInfo().getHopId() != null) {
					dto.setHopVendorDto(new HopVendorDto());
					dto.getHopVendorDto().setHopVendor(new HopVendor());
					dto.getHopVendorDto().getHopVendor().setHopHopId(WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
				}
			}
			DetachedCriteria criteria = DetachedCriteria.forClass(Vendor.class);
			if (!StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getName())) {
				criteria.add(Restrictions.eq("name", dto.getVendorDto().getVendor().getName()));
			}
			if (!StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getAccount())) {
				criteria.add(Restrictions.eq("account", dto.getVendorDto().getVendor().getAccount()));
			}
			if (!StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getTaxation())) {
				criteria.add(Restrictions.eq("taxation", dto.getVendorDto().getVendor().getTaxation()));
			}
			if (dto.getVendorDto().getVendor().getVendorId() != null) {
				criteria.add(Restrictions.eq("vendorId", dto.getVendorDto().getVendor().getVendorId()));
			}
			List<Vendor> listVendorId = commonService.findByDetachedCriteria(criteria);

			if (listVendorId.size() > 0) {
				Long venid = listVendorId.get(0).getVendorId();
				dto.getVendorDto().setVendor(commonService.get(Vendor.class, venid));
				dto.getVendorDto().setVenQualifTypeVOList(nurseService.queryQualifyType(dto.getVendorDto()));
				// 查询审核结果
				Object[] valuesStrings = { venid, dto.getHopVendorDto().getHopVendor().getHopHopId() };
				String[] stringProperties = { "hopVenId", "hopHopId" };
				List<HopVendor> hopVendor = commonService.findByProperties(HopVendor.class, stringProperties, valuesStrings);
				if (hopVendor.size() > 0) {
					if (hopVendor.get(0).getHopAuditFlag() == null) {
						dto.setSuccess(true);
					} else {
						if ((hopVendor.get(0).getHopAuditFlag()).equals("Y")) {
							dto.setSuccess(true);
						}
					}
				}
				return "auditResult";
			} else {
				return "noResult";
			}

		}
		if ("queryAudit".equals(super.getBusinessFlow())) {
			//获取 hospitalName
			List<Hospital> hospital = commonService.getAll(Hospital.class, "hospitalName", true);
			dto.setHospital(hospital);
			return "queryAudit";
		}
		// 收货地址
		if ("nurseDestination".equals(super.getBusinessFlow())) {
			return "nurseDestination";
		}
		// 导入订单
		if ("nurOrdImp".equals(super.getBusinessFlow())) {
			return "nurOrdImp";
		}
		// 审批订单
		if ("auditOrd".equals(super.getBusinessFlow())) {
			return "auditOrd";
		}
		// 打印条码
		if ("nurPrint".equals(super.getBusinessFlow())) {
			return "nurPrint";
		}
		return null; // 返回null时不会跳转
	}

	public NurseIncDto getDto() {
		return dto;
	}

	public void setDto(NurseIncDto dto) {
		this.dto = dto;
	}

}
