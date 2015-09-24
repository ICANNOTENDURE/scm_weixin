/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.nur;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.hop.HopCtlocDestinationDto;
import com.dhcc.scm.dto.hop.HopVendorDto;
import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.Group;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.hop.Evalute;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.cat.IncPropertyVO;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.nur.NurseIncDetailVo;
import com.dhcc.scm.entity.vo.nur.NurseIncVo;
import com.dhcc.scm.entity.vo.nur.OrderDetailGroupByVenVo;
import com.dhcc.scm.entity.vo.nur.OrderGrpByNo;
import com.dhcc.scm.ws.his.dhcclient.SCIInpoUmInfoRtMain;

public class NurseIncDto extends BaseDto {
	
	private static final long serialVersionUID = 1L;

	
	private String incName;
	
	private String incCode;
	
	private Long venId;
	
	private String alias;
	
	private Long incCatId;
	/*别名 名称 代码 模糊查询*/
	private String queryStr;
	/*主页查询页数*/
	private int pageCount;
	
	private NormalAccountDto normalAccountDto;
	
	private OrderStateDto orderStateDto;
	
	private OrderDto orderDto;
	/*收货地址*/
	private HopCtlocDestinationDto hopCtlocDestinationDto;
	
	private List<HopCtlocDestination> hopCtlocDestinations;
	
	private Long defaultDestion;
	
	private List<Evalute> evalutes;
	
	private Map<String, OrderDetailGroupByVenVo> venMap;
	
	private SCIInpoUmInfoRtMain sciInfoRtMain;
	
	private com.dhcc.scm.ws.his.dhcclient.OperateResult operateResultWs;
	
	
	private List<Group> groups;
	
	/*
	 * 
	 * 查询商品属性
	 */	
	private Map<String,List<IncPropertyVO>> propertyMap;
    
	private Map<String, IncPropertyVO> selectMap;
	
	private List<HopManf> incManfs;
	/*
	 *商品属性查询条件参数 
	 */
	private Long propertyId;
	
	private Long removePropertyId;
	/*
	 *商品属性id字符串 
	 */
	private String propertyIdStr;
	
	/*供应商资质*/
	private VendorDto vendorDto;
	
	/*订单按单号汇总*/
	private List<OrderGrpByNo> orderGrpByNos;
	
	private List<Vendor> vendors;
	
	private String orderIdStr;
	
	private String remark;
	
	private List<Hospital> hospital;
	
	private List<ComboxVo> comboxVos;
	
	private String showCommentFlag;
	
	private String manfname;
	
	private List<ChartVO> chartVOs;

	/**
	 * 医院商品id
	 */
	private Long hopIncId;
	
	private boolean success;

	private HopVendorDto hopVendorDto;
	
	private String type;
	
	
	
	
	
	
	
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getRemovePropertyId() {
		return removePropertyId;
	}

	public void setRemovePropertyId(Long removePropertyId) {
		this.removePropertyId = removePropertyId;
	}

	public Map<String, IncPropertyVO> getSelectMap() {
		return selectMap;
	}

	public void setSelectMap(Map<String, IncPropertyVO> selectMap) {
		this.selectMap = selectMap;
	}

	public String getPropertyIdStr() {
		return propertyIdStr;
	}

	public void setPropertyIdStr(String propertyIdStr) {
		this.propertyIdStr = propertyIdStr;
	}

	public List<ChartVO> getChartVOs() {
		return chartVOs;
	}

	public void setChartVOs(List<ChartVO> chartVOs) {
		this.chartVOs = chartVOs;
	}

	public String getManfname() {
		return manfname;
	}

	public void setManfname(String manfname) {
		this.manfname = manfname;
	}

	public String getShowCommentFlag() {
		return showCommentFlag;
	}

	public void setShowCommentFlag(String showCommentFlag) {
		this.showCommentFlag = showCommentFlag;
	}

	public List<ComboxVo> getComboxVos() {
		return comboxVos;
	}

	public void setComboxVos(List<ComboxVo> comboxVos) {
		this.comboxVos = comboxVos;
	}

	/**
	 * @return the hospital
	 */
	public List<Hospital> getHospital() {
		return hospital;
	}

	/**
	 * @param hospital the hospital to set
	 */
	public void setHospital(List<Hospital> hospital) {
		this.hospital = hospital;
	}



	

	

	
	/**
	 * @return the hopVendorDto
	 */
	public HopVendorDto getHopVendorDto() {
		return hopVendorDto;
	}

	/**
	 * @param hopVendorDto the hopVendorDto to set
	 */
	public void setHopVendorDto(HopVendorDto hopVendorDto) {
		this.hopVendorDto = hopVendorDto;
	}

	
	public Long getHopIncId() {
		return hopIncId;
	}

	public void setHopIncId(Long hopIncId) {
		this.hopIncId = hopIncId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOrderIdStr() {
		return orderIdStr;
	}

	public void setOrderIdStr(String orderIdStr) {
		this.orderIdStr = orderIdStr;
	}

	public List<Vendor> getVendors() {
		return vendors;
	}

	public void setVendors(List<Vendor> vendors) {
		this.vendors = vendors;
	}

	public List<OrderGrpByNo> getOrderGrpByNos() {
		return orderGrpByNos;
	}

	public void setOrderGrpByNos(List<OrderGrpByNo> orderGrpByNos) {
		this.orderGrpByNos = orderGrpByNos;
	}

	/**
	 * @return the vendorDto
	 */
	public VendorDto getVendorDto() {
		return vendorDto;
	}

	/**
	 * @param vendorDto the vendorDto to set
	 */
	public void setVendorDto(VendorDto vendorDto) {
		this.vendorDto = vendorDto;
	}

	

	
	
	
	/**
	 * @return the success
	 */
	public boolean isSuccess() {
		return success;
	}

	/**
	 * @param success the success to set
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Long getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}

	public List<HopManf> getIncManfs() {
		return incManfs;
	}

	public void setIncManfs(List<HopManf> incManfs) {
		this.incManfs = incManfs;
	}

	public Map<String, List<IncPropertyVO>> getPropertyMap() {
		return propertyMap;
	}

	public void setPropertyMap(Map<String, List<IncPropertyVO>> propertyMap) {
		this.propertyMap = propertyMap;
	}

	public List<Group> getGroups() {
		return groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public com.dhcc.scm.ws.his.dhcclient.OperateResult getOperateResultWs() {
		return operateResultWs;
	}

	public void setOperateResultWs(
			com.dhcc.scm.ws.his.dhcclient.OperateResult operateResultWs) {
		this.operateResultWs = operateResultWs;
	}

	public SCIInpoUmInfoRtMain getSciInfoRtMain() {
		return sciInfoRtMain;
	}

	public void setSciInfoRtMain(SCIInpoUmInfoRtMain sciInfoRtMain) {
		this.sciInfoRtMain = sciInfoRtMain;
	}

	public Map<String, OrderDetailGroupByVenVo> getVenMap() {
		return venMap;
	}

	public void setVenMap(Map<String, OrderDetailGroupByVenVo> venMap) {
		this.venMap = venMap;
	}

	public List<Evalute> getEvalutes() {
		return evalutes;
	}

	public void setEvalutes(List<Evalute> evalutes) {
		this.evalutes = evalutes;
	}

	public Long getDefaultDestion() {
		return defaultDestion;
	}

	public void setDefaultDestion(Long defaultDestion) {
		this.defaultDestion = defaultDestion;
	}

	public List<HopCtlocDestination> getHopCtlocDestinations() {
		return hopCtlocDestinations;
	}

	public void setHopCtlocDestinations(
			List<HopCtlocDestination> hopCtlocDestinations) {
		this.hopCtlocDestinations = hopCtlocDestinations;
	}

	/**
	 * @return the hopCtlocDestinationDto
	 */
	public HopCtlocDestinationDto getHopCtlocDestinationDto() {
		return hopCtlocDestinationDto;
	}

	/**
	 * @param hopCtlocDestinationDto the hopCtlocDestinationDto to set
	 */
	public void setHopCtlocDestinationDto(
			HopCtlocDestinationDto hopCtlocDestinationDto) {
		this.hopCtlocDestinationDto = hopCtlocDestinationDto;
	}

	/**
	 * @return the orderDto
	 */
	public OrderDto getOrderDto() {
		return orderDto;
	}

	/**
	 * @param orderDto the orderDto to set
	 */
	public void setOrderDto(OrderDto orderDto) {
		this.orderDto = orderDto;
	}

	/**
	 * @return the orderStateDto
	 */
	public OrderStateDto getOrderStateDto() {
		return orderStateDto;
	}

	/**
	 * @param orderStateDto the orderStateDto to set
	 */
	public void setOrderStateDto(OrderStateDto orderStateDto) {
		this.orderStateDto = orderStateDto;
	}

	/**
	 * @return the normalAccountDto
	 */
	public NormalAccountDto getNormalAccountDto() {
		return normalAccountDto;
	}

	/**
	 * @param normalAccountDto the normalAccountDto to set
	 */
	public void setNormalAccountDto(NormalAccountDto normalAccountDto) {
		this.normalAccountDto = normalAccountDto;
	}
	
	/**
	 * 订单状态
	 */
	private List<State> states;
	
	private List<NurseIncVo> nurseIncVos;
	
	private OrdShopping ordShopping;
    
    private NurseIncDetailVo nurseIncDetailVo;
    
	private List<VenIncPic> venIncPics;
	
	private CatGroup catGroup;
	
	private SubCatGroup subCatGroup;
    
	private List<OrdShopping> ordShoppings;
	
	private List<OrderDetail> orderDetails;
	
	/**
	 * 订单id串
	 */
	private String shopIdStr;
	
	/**
	 * 订单开始时间
	 */
	private Date starDate;
	/**
	 * 订单结束时间
	 */
	private Date endDate;
	/**
	 * 订单状态
	 */
	private Long ordState;
	/**
	 * 供应商Id
	 */
	private Long vendorId;
	
	private Integer smPageSize;
	
	
	
	public Integer getSmPageSize() {
		return smPageSize;
	}

	public void setSmPageSize(Integer smPageSize) {
		this.smPageSize = smPageSize;
	}

	public List<State> getStates() {
		return states;
	}

	public void setStates(List<State> states) {
		this.states = states;
	}

	/**
	 * @return the queryStr
	 */
	public String getQueryStr() {
		return queryStr;
	}

	/**
	 * @param queryStr the queryStr to set
	 */
	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	/**
	 * @return the pageCount
	 */
	public int getPageCount() {
		return pageCount;
	}

	/**
	 * @param pageCount the pageCount to set
	 */
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	/**
	 * @return the incCatId
	 */
	public Long getIncCatId() {
		return incCatId;
	}

	/**
	 * @param incCatId the incCatId to set
	 */
	public void setIncCatId(Long incCatId) {
		this.incCatId = incCatId;
	}

	
	public Date getStarDate() {
		return starDate;
	}

	public void setStarDate(Date starDate) {
		this.starDate = starDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	public Long getOrdState() {
		return ordState;
	}

	public void setOrdState(Long ordState) {
		this.ordState = ordState;
	}

	public Long getVendorId() {
		return vendorId;
	}

	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public String getShopIdStr() {
		return shopIdStr;
	}

	public void setShopIdStr(String shopIdStr) {
		this.shopIdStr = shopIdStr;
	}

	public List<OrdShopping> getOrdShoppings() {
		return ordShoppings;
	}

	public void setOrdShoppings(List<OrdShopping> ordShoppings) {
		this.ordShoppings = ordShoppings;
	}

	/**
	 * @return the subCatGroup
	 */
	public SubCatGroup getSubCatGroup() {
		return subCatGroup;
	}

	/**
	 * @param subCatGroup the subCatGroup to set
	 */
	public void setSubCatGroup(SubCatGroup subCatGroup) {
		this.subCatGroup = subCatGroup;
	}

	/**
	 * @return the catGroup
	 */
	public CatGroup getCatGroup() {
		return catGroup;
	}

	/**
	 * @param catGroup the catGroup to set
	 */
	public void setCatGroup(CatGroup catGroup) {
		this.catGroup = catGroup;
	}

	public List<VenIncPic> getVenIncPics() {
		return venIncPics;
	}

	public void setVenIncPics(List<VenIncPic> venIncPics) {
		this.venIncPics = venIncPics;
	}

	public NurseIncDetailVo getNurseIncDetailVo() {
		return nurseIncDetailVo;
	}

	public void setNurseIncDetailVo(NurseIncDetailVo nurseIncDetailVo) {
		this.nurseIncDetailVo = nurseIncDetailVo;
	}

	public OrdShopping getOrdShopping() {
		return ordShopping;
	}

	public void setOrdShopping(OrdShopping ordShopping) {
		this.ordShopping = ordShopping;
	}

	public List<NurseIncVo> getNurseIncVos() {
		return nurseIncVos;
	}

	public void setNurseIncVos(List<NurseIncVo> nurseIncVos) {
		this.nurseIncVos = nurseIncVos;
	}

	public String getIncName() {
		return incName;
	}

	public void setIncName(String incName) {
		this.incName = incName;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getIncCode() {
		return incCode;
	}

	public void setIncCode(String incCode) {
		this.incCode = incCode;
	}

	public Long getVenId() {
		return venId;
	}

	public void setVenId(Long venId) {
		this.venId = venId;
	}


	
	
	
	
}
