/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.hop;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.PingYinUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.ord.OrdBlh;
import com.dhcc.scm.dto.hop.HopIncDto;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopIncAlias;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.hop.HopIncVo;
import com.dhcc.scm.entity.vo.ws.HisIncItmWeb;
import com.dhcc.scm.entity.vo.ws.HisIncWeb;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.hop.HopIncService;
import com.dhcc.scm.service.manf.HopManfService;
import com.dhcc.scm.service.sys.SysImpModelService;

@Component
public class HopIncBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(HopIncBlh.class);

	@Resource
	private HopIncService hopIncService;

	@Resource
	private SysImpModelService sysImpModelService;

	@Resource
	private HopManfService hopManfService;

	@Resource
	private CommonService commonService;
	
	@Resource
	private OrdBlh ordBlh;
	
	public HopIncBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list(BusinessRequest res) {

		HopIncDto dto = super.getDto(HopIncDto.class, res);
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		// 调用对应的service方法
		hopIncService.list(dto);
	}

	// 保存
	public void save(BusinessRequest res) {

		HopIncDto dto = super.getDto(HopIncDto.class, res);
		if (dto.getHopInc().getIncId() == null) {
			dto.getHopInc().setIncHospid(Long.valueOf(super.getLoginInfo().get("HOSPID").toString()));
		} else {
			List<HopIncAlias> hopIncAlias = commonService.findByProperty(HopIncAlias.class, "incAliaIncId", dto.getHopInc().getIncId());
			if (hopIncAlias.size() > 0) {
				for (HopIncAlias hopIncAlias2 : hopIncAlias) {
					commonService.delete(hopIncAlias2);
				}
			}
		}
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getHopInc().getIncAliaS())) {
			String[] alias = dto.getHopInc().getIncAliaS().split(",");
			for (String alia : alias) {
				HopIncAlias hopIncAlias = new HopIncAlias();
				hopIncAlias.setIncAliasText(alia);
				hopIncAlias.setIncAliaIncId(dto.getHopInc().getIncId());
				commonService.saveOrUpdate(hopIncAlias);
			}
		} else {
			HopIncAlias hopIncAlias = new HopIncAlias();
			hopIncAlias.setIncAliasText(PingYinUtil.getFirstSpell(dto.getHopInc().getIncName()));
			hopIncAlias.setIncAliaIncId(dto.getHopInc().getIncId());
			commonService.saveOrUpdate(hopIncAlias);
		}
		commonService.saveOrUpdate(dto.getHopInc());
	}

	// 删除
	public void delete(BusinessRequest res) {

		HopIncDto dto = super.getDto(HopIncDto.class, res);

		// 调用对应的service方法
		hopIncService.delete(dto);
	}

	// 更新
	public void update(BusinessRequest res) {

		HopIncDto dto = super.getDto(HopIncDto.class, res);

		// 调用对应的service方法
		hopIncService.update(dto);
	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	@SuppressWarnings("unchecked")
	public void findById(BusinessRequest res) {

		HopIncDto dto = super.getDto(HopIncDto.class, res);

		// 调用对应的service方法

		hopIncService.findById(dto);
		DetachedCriteria criteria = DetachedCriteria.forClass(HopIncAlias.class);
		criteria.setProjection(Property.forName("incAliasText"));
		criteria.add(Restrictions.eq("incAliaIncId", dto.getHopInc().getIncId()));
		List<String> alias = commonService.findByDetachedCriteria(criteria);
		dto.getHopInc().setIncAliaS(org.apache.commons.lang.StringUtils.join(alias, ","));
	}

	public void getIncInfo(BusinessRequest res) throws Exception {

		HopIncDto dto = super.getDto(HopIncDto.class, res);

		List<HopIncVo> hopIncVos = new ArrayList<HopIncVo>();
		hopIncVos = hopIncService.getIncInfo(dto);
		WebContext webContext = WebContextHolder.getContext();
		webContext.getResponse().getWriter().write(JsonUtils.toJson(hopIncVos));

	}

	// 显示HopIncVo信息，即包括科室表中的指向医院Id对应的医院描述
	public void listInfo(BusinessRequest res) throws Exception {

		HopIncDto dto = super.getDto(HopIncDto.class, res);
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		// 调用对应的service方法
		hopIncService.getListInfo(dto);

	}

	/**
	 * 
	 * @Title: HopIncBlh.java
	 * @Description: TODO(导入药品)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月10日 下午2:37:46
	 * @version V1.0
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public void upload(BusinessRequest res) throws IOException {

		HopIncDto dto = super.getDto(HopIncDto.class, res);
		dto.setOpFlg("1");
		// 生成随机文件名
		String newFileName = UUID.randomUUID().toString();
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadtmps");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}

		File dstFile = new File(storageFileName, newFileName);
		com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);

		//
		SysImpModelDto SysImpModelDto = new SysImpModelDto();
		SysImpModelDto.setImpModel(new ImpModel());
		SysImpModelDto.getImpModel().setType("INC");
		List<ImpModel> listImpModels = sysImpModelService.getModelList(SysImpModelDto);
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getCode());
		}
		// 读取excel
		try {
			List<HopInc> hopIncs = new ArrayList<HopInc>();
			// 读取Excel文件
			Workbook workbook = null;
			Sheet sheet = null;
			Row row = null;
			Cell cell = null;

			String prefix = dto.getUploadFileName().substring(dto.getUploadFileName().lastIndexOf(".") + 1);
			if (prefix.equals("xls")) {
				workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			} else if (prefix.equals("xlsx")) {
				workbook = new XSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			} else {
				dto.setOpFlg("-1");
				dto.setMsg("<br>文件类型错误:");
				writeJSON(dto);
				return;
			}
			sheet = workbook.getSheetAt(0);

			// 明细
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {

				row = sheet.getRow(numRows);

				HopInc hopInc = new HopInc();
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					};
					switch (colNameString) {
					case "HOSPINC_CODE":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopInc.setIncCode(cell.toString());
						}
						break;
					case "HOSPINC_NAME":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopInc.setIncName(cell.toString());
						}
						break;
					case "HOSPINC_SPEC":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopInc.setIncSpec(cell.toString());
						}
						break;
					case "HOSPINC_PUOM":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopInc.setIncUomname(cell.toString());
						}
						break;
					case "HOSPINC_RP":
						if (cell != null) {
							cell.setCellType(Cell.CELL_TYPE_NUMERIC);
							hopInc.setIncRp((float) (cell.getNumericCellValue()));
						}
						break;
					case "HOSPINC_MANF":
						if (cell != null) {
							if (hopManfService.getIdByName(cell.toString()) == null) {
								HopManf manf = new HopManf();
								manf.setManfName(cell.toString());
								manf.setManfHisid(WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
								commonService.saveOrUpdate(manf);
								hopInc.setIncManfid(manf.getHopManfId());
							} else {
								hopInc.setIncManfid(hopManfService.getIdByName(cell.toString()));
							}
						}
						break;
					case "HOSPINC_CAT":
						if (cell != null) {
							hopInc.setIncCat(cell.toString());
						}
						break;
					case "HOSPINC_ALIAS":
						if (cell != null) {
							hopInc.setIncAliaS(cell.toString());
						}
						break;
					case "HOSPINC_PUOMCODE":
						if (cell != null) {
							hopInc.setIncUomcode(cell.toString());
						}
						break;
					case "HOSPINC_SP":
						if (cell != null) {
							cell.setCellType(Cell.CELL_TYPE_NUMERIC);
							hopInc.setIncSp((float) (cell.getNumericCellValue()));
						}
						break;
					case "HOSPINC_BARCODE":
						if (cell != null) {
							hopInc.setIncBarCode(cell.toString());
						}
						break;	
					}
				}
				// 验证数据的完整性
				if (org.apache.commons.lang.StringUtils.isBlank(hopInc.getIncCode())) {
					dto.setOpFlg("-1");
					dto.setMsg("<br>" + "第" + numRows + "行医院商品代码不能为空！");
					continue;
				} else {
					if (dto.getOpFlg().equals("1")) {
						DetachedCriteria criteria = DetachedCriteria.forClass(HopInc.class);
						criteria.add(Restrictions.eq("incCode", hopInc.getIncCode()));
						criteria.add(Restrictions.eq("incHospid", Long.valueOf(super.getLoginInfo().get("HOSPID").toString())));
						List<HopInc> hopIncsIds = commonService.findByDetachedCriteria(criteria);
						if (hopIncsIds.size() > 0) {
							hopInc.setIncHospid(hopIncsIds.get(0).getIncHospid());
							hopInc.setIncId(hopIncsIds.get(0).getIncId());
						}
					}

				}
				hopIncs.add(hopInc);
			}
			if (dto.getOpFlg().equals("1")) {
				dto.setHopIncs(hopIncs);
				hopIncService.saveInc(dto);
			}
			workbook = null;
		} catch (Exception e) {
			e.printStackTrace();
			dto.setOpFlg("-1");
			dto.setMsg("<br>" + dto.getMsg() + "<br>" + e.getMessage());
		} finally {
			super.writeJSON(dto);
			FileUtils.forceDelete(dstFile);
		}

	}

	/**
	 * 
	 * @Title: getSubCatInfo
	 * @Description: TODO(查询所有商品子分类)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月31日 下午3:08:05
	 */
	public void getSubCatInfo(BusinessRequest res) {
		HopIncDto dto = super.getDto(HopIncDto.class, res);
		super.writeJSON(hopIncService.getSubCatInfo(dto));
	}

	/**
	 * 
	 * @Title: findHopIncComboxVos
	 * @Description: TODO(查询医院商品下拉列表)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月25日 上午10:30:35
	 */
	public void findHopIncComboxVos(BusinessRequest res) {
		HopIncDto dto = super.getDto(HopIncDto.class, res);
		super.writeJSON(hopIncService.findHopIncComboxVos(dto));
	}

	/**
	 * 
	 * @Title: syncHisInc
	 * @Description: TODO(给his提供接口供his调用同步药品信息)
	 * @param @param hisIncWeb 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2016年3月11日 下午3:42:26
	 */
	public void syncHisInc(OperateResult operateResult, HisIncWeb hisIncWeb) {

		this.syncHisIncSub(operateResult, hisIncWeb);
		SysLog log = new SysLog();
		log.setOpArg(JsonUtils.toJson(hisIncWeb));
		log.setOpName("webservice同步医院商品信息");
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(operateResult));
		log.setOpType("webservice");
		log.setOpUser(hisIncWeb.getUserName());
		commonService.saveOrUpdate(log);

	}

	public void syncHisIncSub(OperateResult operateResult, HisIncWeb hisIncWeb) {

		NormalAccount normalAccount=ordBlh.checkWsParam(operateResult, hisIncWeb.getUserName(), hisIncWeb.getPassWord(), hisIncWeb.getIncItmWebs());
		if(normalAccount==null){
			return;
		}
		if (!normalAccount.getNormalUser().getType().toString().equals("1")) {
			operateResult.setResultCode("-5");
			operateResult.setResultContent("用户类型不对");
			return;
		}
		HopCtloc hopCtloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
		operateResult.setResultContent("success");
		for (HisIncItmWeb hisIncItmWeb : hisIncWeb.getIncItmWebs()) {
			
			if(StringUtils.isNullOrEmpty(hisIncItmWeb.getBarCode())){
				operateResult.setResultCode("-11");
				operateResult.setResultContent("有商品条码为空,");
				continue;
			}
			String[] incPropertyNames = { "incHospid", "incBarCode" };
			Object[] incValues = { hopCtloc.getHospid(), hisIncItmWeb.getBarCode() };
			List<HopInc> hopIncs = commonService.findByProperties(HopInc.class, incPropertyNames, incValues);
			HopInc hopInc = new HopInc();
			if (hopIncs.size() > 0) {
				hopInc.setIncId(hopIncs.get(0).getIncId());
			}
			hopInc.setIncHospid(hopCtloc.getHospid());
			hopInc.setIncCode(hisIncItmWeb.getVenIncCode());
			hopInc.setIncBarCode(hisIncItmWeb.getBarCode());
			hopInc.setIncUomname(hisIncItmWeb.getVenIncUom());
			hopInc.setIncCode(hisIncItmWeb.getVenIncCode());
			hopInc.setIncCat(hisIncItmWeb.getVenIncCat());
			hopInc.setIncName(hisIncItmWeb.getVenIncName());
			hopInc.setIncRp(hisIncItmWeb.getVenIncPrice());
			hopInc.setIncSp(hisIncItmWeb.getVenIncSp());
			hopInc.setIncSpec(hisIncItmWeb.getVenIncSpec());
			if (!StringUtils.isNullOrEmpty(hisIncItmWeb.getVenIncManf())) {
				Long manfIdLong = hopManfService.getIdByName(hisIncItmWeb.getVenIncManf());
				if (manfIdLong == null) {
					HopManf manf = new HopManf();
					manf.setManfName(hisIncItmWeb.getVenIncManf());
					commonService.saveOrUpdate(manf);
					hopInc.setIncManfid(manf.getHopManfId());
				} else {
					hopInc.setIncManfid(manfIdLong);
				}
			}
			commonService.saveOrUpdate(hopInc);
		}
	}
	
	
	
	
	
	public void listHopIncAudit(BusinessRequest res) {
		HopIncDto dto = super.getDto(HopIncDto.class, res);
		hopIncService.listHopIncAudit(dto);
	}
	
	
	/**
	 * 
	* @Title: autoConByIncCode 
	* @Description: TODO(按照商品代码自动对照) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年6月21日 下午4:42:56
	 */
	@Test
	public void autoConByIncCode(BusinessRequest res){
		
		HopIncDto dto = super.getDto(HopIncDto.class, res);
		Long hopId=8l;
		List<VenInc> venIncs=commonService.findByProperty(VenInc.class, "venIncVenid", dto.getVenId());
		int succ=0;
		for(VenInc venInc:venIncs){
			Long hopInc=hopIncService.getHopIncByCode(venInc.getVenIncCode(),hopId);
			if(hopInc!=null){
				String[] propertyNames={"hopIncId","venIncId"};
				Object[] values={hopInc,venInc.getVenIncId()};
				List<VenHopInc> hopIncs=commonService.findByProperties(VenHopInc.class, propertyNames, values);
				if(hopIncs.size()==0){
					VenHopInc venHopInc=new VenHopInc();
					venHopInc.setHopFac(1f);
					venHopInc.setHopIncId(hopInc);
					venHopInc.setVenFac(1f);
					venHopInc.setVenHopAuditflag("Y");
					venHopInc.setVenIncId(venInc.getVenIncId());
					commonService.saveOrUpdate(venHopInc);
					succ++;
				}
				venInc.setVenIncBarCode(venInc.getVenIncCode());
				commonService.saveOrUpdate(venInc);
				HopInc hopInc2=commonService.get(HopInc.class, hopInc);
				hopInc2.setIncBarCode(venInc.getVenIncCode());
				commonService.saveOrUpdate(hopInc2);
			}

		}
		super.writeJSON(succ);
	}
}
