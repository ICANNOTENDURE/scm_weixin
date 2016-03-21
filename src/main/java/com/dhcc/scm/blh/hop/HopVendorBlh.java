/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.hop;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.PingYinUtil;
import com.dhcc.framework.util.SendMailUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.ord.OrdBlh;
import com.dhcc.scm.dto.hop.HopVendorDto;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenAuditLog;
import com.dhcc.scm.entity.ven.VenReghop;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ws.HisVendorItmWeb;
import com.dhcc.scm.entity.vo.ws.HisVendorWeb;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.hop.HopVendorService;
import com.dhcc.scm.service.sys.SysImpModelService;
import com.dhcc.scm.service.ven.VendorService;
import com.dhcc.scm.ws.his.client.HisVendor;
import com.dhcc.scm.ws.his.client.HisVendorItm;
import com.dhcc.scm.ws.his.client.SCM;

@Component
public class HopVendorBlh extends AbstractBaseBlh {

	@Resource
	private HopVendorService hopVendorService;
	
	@Resource
	private VendorService vendorService;

	@Resource
	private CommonService commonService;

	@Resource
	private SysImpModelService sysImpModelService;
	
	@Resource
	private OrdBlh ordBlh;
	
	public HopVendorBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);

		// 调用对应的service方法
		hopVendorService.list(dto);
	}

	public void updateAuditFlag(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
		dto.setOperateResult(new OperateResult());
		if (dto.getHopVendor().getHopVendorId() != null) {
			HopVendor hopVendor = commonService.get(HopVendor.class, dto.getHopVendor().getHopVendorId());
			hopVendor.setHopAuditFlag(dto.getHopVendor().getHopAuditFlag());
			commonService.saveOrUpdate(hopVendor);
			dto.getOperateResult().setResultCode("1");
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: updateAuditFLag
	 * @Description: TODO(审核供应商资质)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月17日 下午3:37:11
	 */
	public void auditFLag(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
		try {
			String email="";
			String account="";
			if (dto.getHopVendor().getHopVendorId() != null) {
				HopVendor hopVendor = commonService.get(HopVendor.class, dto.getHopVendor().getHopVendorId());
				Vendor vendor = commonService.get(Vendor.class, hopVendor.getHopVenId());

				if (dto.getHopVendor().getHopAuditFlag().equals("Y")) {
					hopVendor.setHopAuditFlag("N");
					if (org.apache.commons.lang.StringUtils.isNotBlank(vendor.getAccount())) {
						List<NormalAccount> normalAccounts = commonService.findByProperty(NormalAccount.class, "accountAlias", vendor.getAccount());
						if (normalAccounts.size() > 0) {
							if (normalAccounts.get(0).getUseState().equals("1")) {
								normalAccounts.get(0).setUseState("3");
								normalAccounts.get(0).getNormalUser().setUseState("3");
								commonService.saveOrUpdate(normalAccounts.get(0));
								email=normalAccounts.get(0).getNormalUser().getEmail();
								account=normalAccounts.get(0).getAccountAlias();
							}
						}
					}
				} else {
					hopVendor.setHopAuditFlag("Y");
					if (org.apache.commons.lang.StringUtils.isNotBlank(vendor.getAccount())) {
						List<NormalAccount> normalAccounts = commonService.findByProperty(NormalAccount.class, "accountAlias", vendor.getAccount());
						if (normalAccounts.size() > 0) {
							if (normalAccounts.get(0).getUseState().equals("3")) {
								normalAccounts.get(0).setUseState("1");
								normalAccounts.get(0).getNormalUser().setUseState("1");
								commonService.saveOrUpdate(normalAccounts.get(0));
								email=normalAccounts.get(0).getNormalUser().getEmail();
								account=normalAccounts.get(0).getAccountAlias();
							}
						}
					}
				}

				commonService.saveOrUpdate(hopVendor);
				dto.setOpFlg("1");
				if(org.apache.commons.lang.StringUtils.isNotBlank(email)){
					String sub="系统通知";
					StringBuffer msg = new StringBuffer();
					

					Hospital hospital=commonService.get(Hospital.class, Long.valueOf(super.getLoginInfo().get("HOSPID").toString()));
					msg.append("<h1>"+hospital.getHospitalName()+" 通过了你的注册申请</h1>");
					msg.append("<br>登录用户名:"+account);
					msg.append("<br>初始密码:1");
					msg.append("<br>注意:如果以前其他医院注册过，密码还是是以前的,");
					msg.append("<br>赶快上传商品把。");
					SendMailUtil.sendEmail(sub, msg.toString(),email,60 * 1000);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			dto.setOpFlg("-1");
		}
		finally{
			//save T_VEN_AUDIT_LOG  hxy
			InetAddress addr = null;
			try {
				addr = InetAddress.getLocalHost();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}       
			String ip=addr.getHostAddress();//获得本机IP
			List<HopVendor> hopVendors=commonService.findByProperty(HopVendor.class, "hopVendorId", dto.getHopVendor().getHopVendorId());
			List<Vendor> vendors=commonService.findByProperty(Vendor.class, "taxation",hopVendors.get(0).gethBusinessRegNo());//由hopVendors工商执照号得到vendor，已得到主键venid
			
			VenAuditLog VALog=new VenAuditLog();
			VALog.setLogvenid(vendors.get(0).getVendorId());
			VALog.setLoguserid(Long.valueOf((String) getLoginInfo().get("USERID")));
			VALog.setLogdate(new Date());
			VALog.setLogresult("Y");//未做判断 欠妥！
			VALog.setLogcontent(null);
			VALog.setLogip(ip);
			VALog.setLogtype("I");
			commonService.saveOrUpdate(VALog);
			
			//update t_ven_vendor
			List<Vendor> Vendors=commonService.findByProperty(Vendor.class, "vendorId", vendors.get(0).getVendorId());
			if(Vendors.size()>0){
				Vendors.get(0).setAudit_flag("I");// I 平台通过/ IN
    			commonService.saveOrUpdate(Vendors.get(0));
    		   }
			//update T_VEN_REGHOP  
			List<VenReghop> venReghops=commonService.findByProperty(VenReghop.class, "venid", vendors.get(0).getVendorId());
			if(venReghops.size()>0){
				venReghops.get(0).setAduitflag("I");// I 平台通过/ IN
    			commonService.saveOrUpdate(venReghops.get(0));
    		   }
			
		}

	}

	// 保存
	public void save(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);

		if (StringUtils.isNullOrEmpty(dto.getHopVendor().getHopAlias())) {
			dto.getHopVendor().setHopAlias(PingYinUtil.getFirstSpell(dto.getHopVendor().getHopName()));
		}
		hopVendorService.save(dto);
	}

	// 删除
	public void delete(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);

		// 调用对应的service方法
		hopVendorService.delete(dto);
	}

	// 更新
	public void update(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);

		// 调用对应的service方法
		hopVendorService.update(dto);
	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	public void findById(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);

		// 调用对应的service方法
		hopVendorService.findById(dto);

	}
	

	/**
	 * 
	 * @Title: HopVendorBlh.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月11日 上午10:08:12
	 * @version V1.0
	 */
	public void listHopCon(BusinessRequest res) {

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);

		// 调用对应的service方法
		hopVendorService.listHopCon(dto);
	}
	

	/**
	 * 
	 * @Title: HopVendorBlh.java
	 * @Description: TODO(对照或者删除对照关系)
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月11日 上午10:55:26
	 * @version V1.0
	 */
	public void contranstVendor(BusinessRequest res) {
		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
		HopVendor hopVendor = new HopVendor();
		if (dto.getHopVendor().getHopVendorId() != null) {
			hopVendor = commonService.get(HopVendor.class, dto.getHopVendor().getHopVendorId());
		}
		if (dto.getHopVendor().getHopVenId() == null) {
			hopVendor.setHopVenId(null);
		} else {
			hopVendor.setHopVenId(dto.getHopVendor().getHopVenId());
		}
		commonService.saveOrUpdate(hopVendor);
		dto.setOpFlg("1");
	}

	/**
	 * 
	 * @Title: HopVendorBlh.java
	 * @Description: TODO(导入医院供应商)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月12日 上午11:48:03
	 * @version V1.0
	 * @throws IOException 
	 */
	@SuppressWarnings("unchecked")
	public void upload(BusinessRequest res){

		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
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
		SysImpModelDto.getImpModel().setType("HOPVENDOR");
		List<ImpModel> listImpModels = sysImpModelService.getModelList(SysImpModelDto);
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getCode());
		}
		// 读取excel
		try {
			List<HopVendor> hopVendors = new ArrayList<HopVendor>();
        	//读取Excel文件
        	Workbook workbook = null;
			Sheet sheet = null;
			Row row = null;
			Cell cell = null;
			
			String prefix=dto.getUploadFileName().substring(dto.getUploadFileName().lastIndexOf(".")+1);
			if(prefix.equals("xls")){
				workbook = new HSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			}else if(prefix.equals("xlsx"))  {
				workbook = new XSSFWorkbook(new FileInputStream(storageFileName + File.separator + newFileName));
			}else{
				dto.setOpFlg("-11");
				dto.setMsg("<br>文件类型错误:");
				WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
				return;
			}

			sheet = workbook.getSheetAt(0);

			// 明细
			for (int numRows = 1; numRows <= sheet.getLastRowNum(); numRows++) {

				row = sheet.getRow(numRows);

				HopVendor hopVendor = new HopVendor();
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					switch (colNameString) {
					case "HOPEVENDOR_CODE":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.setHopCode(cell.toString());
						}
						break;
					case "HOPEVENDOR_NAME":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.setHopName(cell.toString());
						}
						break;
					case "HOPEVENDOR_CAT":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.setHopType(cell.toString());
						}
						break;
					case "HOPEVENDOR_ALIAS":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.setHopAlias(cell.toString());
						}
						break;
					case "HOPEVENDOR_ADDRESS":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.setHopAddress(cell.toString());
						}
						break;
					case "HOPEVENDOR_TELPHONE":
						if (cell != null) {
							hopVendor.setHopTel(cell.toString());
						}
						break;
					case "HOPEVENDOR_EMALI":
						if (cell != null) {
							hopVendor.setHopEmail(cell.toString());
						}
						break;
					case "HOPEVENDOR_USERNAME":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.setHopContact(cell.toString());
						}
						break;
					case "HOPEVENDOR_SYNFLAG":
						if (cell != null) {
							hopVendor.setSynFlag(cell.toString());
						}
						break;
					case "HOPEVENDOR_BUSINESSREGNO":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopVendor.sethBusinessRegNo(cell.toString());
						}
						break;	
					}
				 }
				
				//验证数据的完整性
				if(org.apache.commons.lang3.StringUtils.isBlank(hopVendor.gethBusinessRegNo())){
					dto.setOpFlg("-1");
					dto.setMsg("<br>"+"第"+numRows+"行工商执照注册号/统一社会信用代码不能为空！");
					continue;
				}else{
						DetachedCriteria criteria = DetachedCriteria.forClass(HopVendor.class);
						criteria.add(Restrictions.eq("hBusinessRegNo", hopVendor.gethBusinessRegNo()));
						criteria.add(Restrictions.eq("hopHopId", Long.valueOf(super.getLoginInfo().get("HOSPID").toString())));
						List<HopVendor> hopVendorIds = commonService.findByDetachedCriteria(criteria);
						if(hopVendorIds.size()>0){
							hopVendor.setHopVendorId(hopVendorIds.get(0).getHopVendorId());
							hopVendor.setHopVenId(hopVendorIds.get(0).getHopVenId());
						}
				}
				
				if(!org.apache.commons.lang.StringUtils.isBlank(hopVendor.getSynFlag())){
					if((hopVendor.getSynFlag().equals("Y"))&&(org.apache.commons.lang.StringUtils.isBlank(hopVendor.getHopContact()))){
						dto.setOpFlg("-1");
						dto.setMsg("<br>"+"第"+numRows+"行登录帐号不能为空！");
					}
				}
				
				hopVendor.setHopHopId(WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
				hopVendors.add(hopVendor);
			}
			dto.setHopVendors(hopVendors);
			hopVendorService.exportVendor(dto);
			dto.setOpFlg("1");
			workbook = null;
			FileUtils.forceDelete(dstFile);
		} catch (Exception e) {
			e.printStackTrace();
			dto.setOpFlg("-1");
			dto.setMsg("<br>"+dto.getMsg()+"<br>"+e.getMessage());
		}finally{
			super.writeJSON(dto);
		}

	}

	/**
	 * 
	 * @Title: HopVendorBlh.java
	 * @Description: TODO(查找登录权限有的供应商)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月13日 上午11:37:57
	 * @version V1.0
	 * @throws IOException
	 */
	public void findHopVenComboxVos(BusinessRequest res) throws IOException {
		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
		WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(hopVendorService.findHopVenComboxVos(dto.getComgridparam())));
	}

	/**
	 * 
	 * @Title: getHopVenComboxVos
	 * @Description: TODO(不分权限)
	 * @param @param res
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月19日 下午5:30:18
	 */
	public void getHopVenComboxVos(BusinessRequest res) throws IOException {
		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
		super.writeJSON(hopVendorService.getHopVenComboxVos(dto.getComgridparam()));
	}

	/**
	 * 
	 * @Title: HopVendorBlh.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @return:void
	 * @author zhouxin
	 * @date 2014年8月7日 上午11:01:12
	 * @version V1.0
	 */
	@SuppressWarnings({ "unchecked" })
	public void GetHisVendorXHWS() {

		SysLog log = new SysLog();
		log.setOpDate(new Date());
		log.setOpType("webservice client");
		log.setOpName("同步his供应商信息列表");
		log.setOpUser(BaseConstants.BJXH_CODE);
		try {
			SCM scm = new SCM();
			HisVendor HisVendor = scm.getSCMSoap().getVendor("1");
			log.setOpArg(JsonUtils.toJson(HisVendor));
			DetachedCriteria criteria = DetachedCriteria.forClass(Hospital.class);
			criteria.add(Restrictions.eq("hospitalCode", BaseConstants.BJXH_CODE));
			List<Hospital> hospitals = commonService.findByDetachedCriteria(criteria);

			for (HisVendorItm hisVendorItm : HisVendor.getHisVendorItms()) {
				DetachedCriteria criteriaLoc = DetachedCriteria.forClass(HopVendor.class);
				criteriaLoc.add(Restrictions.eq("hopCode", hisVendorItm.getVenCode()));
				criteriaLoc.add(Restrictions.eq("hopHopId", hospitals.get(0).getHospitalId()));
				List<HopVendor> hopVendors = commonService.findByDetachedCriteria(criteriaLoc);
				HopVendor hopVendor = new HopVendor();
				if (hopVendors.size() > 0) {
					hopVendor = hopVendors.get(0);
				} else {
					hopVendor.setHopCode(hisVendorItm.getVenCode());
					hopVendor.setHopHopId(hospitals.get(0).getHospitalId());
					if (!StringUtils.isNullOrEmpty(hisVendorItm.getVenDesc())) {
						hopVendor.setHopAlias(PingYinUtil.getFirstSpell(hisVendorItm.getVenDesc()));
					}
				}
				hopVendor.setHopName(hisVendorItm.getVenDesc());
				hopVendor.setHopType(hisVendorItm.getVenType());
				commonService.saveOrUpdate(hopVendor);
				if (hopVendor.getHopVenId() == null) {

					DetachedCriteria criteria1 = DetachedCriteria.forClass(Vendor.class);
					criteria1.add(Restrictions.eq("code", hisVendorItm.getVenCode()));
					List<Vendor> vendors = commonService.findByDetachedCriteria(criteria1);
					if (vendors.size() > 0) {
						hopVendor.setHopVenId(vendors.get(0).getVendorId());
						commonService.saveOrUpdate(hopVendor);
					} else {
						Vendor vendor = new Vendor();
						if (!StringUtils.isNullOrEmpty(hisVendorItm.getVenDesc())) {
							vendor.setAlias(PingYinUtil.getFirstSpell(hisVendorItm.getVenDesc()));
						}

						vendor.setName(hisVendorItm.getVenDesc());
						vendor.setCode(hisVendorItm.getVenCode());
						commonService.saveOrUpdate(vendor);
						hopVendor.setHopVenId(vendor.getVendorId());
						commonService.saveOrUpdate(hopVendor);
					}

				}
			}

			log.setOpResult("success");

		} catch (Exception e) {
			log.setOpResult(e.getMessage());
			e.printStackTrace();
		} finally {
			commonService.saveOrUpdate(log);
		}

	}

	/**
	 * 
	 * @Title: HopVendorBlh.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param res
	 * @return:void
	 * @author zhouxin
	 * @date 2014年8月12日 下午2:39:29
	 * @version V1.0
	 */
	public void listVendorDetail(BusinessRequest res) {
		HopVendorDto dto = super.getDto(HopVendorDto.class, res);
		hopVendorService.listVenDetail(dto);
	}
	
	
	
	public void syncHisVendor(OperateResult operateResult, HisVendorWeb hisVendorWeb) {

		NormalAccount normalAccount=ordBlh.checkWsParam(operateResult, hisVendorWeb.getUserName(), hisVendorWeb.getPassWord(), hisVendorWeb.getHisVendorItmWebs());
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
		for (HisVendorItmWeb hisVendorItmWeb : hisVendorWeb.getHisVendorItmWebs()) {
			
			if(StringUtils.isNullOrEmpty(hisVendorItmWeb.getBusinessRegNo())){
				operateResult.setResultCode("-11");
				operateResult.setResultContent("工商执照注册号/统一社会信用代码为空,");
				continue;
			}
			String[] incPropertyNames = { "hopHopId", "hBusinessRegNo" };
			Object[] incValues = { hopCtloc.getHospid(), hisVendorItmWeb.getBusinessRegNo()};
			List<HopVendor> hopVendors = commonService.findByProperties(HopVendor.class, incPropertyNames, incValues);
		
			if (hopVendors.size() > 0) {
				
				hopVendors.get(0).sethBusinessRegNo(hisVendorItmWeb.getBusinessRegNo());
				hopVendors.get(0).setHopName(hisVendorItmWeb.getName());
				hopVendors.get(0).setHopCode(hisVendorItmWeb.getCode());
				commonService.saveOrUpdate(hopVendors.get(0));
			}else{
				HopVendor hopVendor = new HopVendor();
				hopVendor.setHopHopId(hopCtloc.getHospid());
				hopVendor.sethBusinessRegNo(hisVendorItmWeb.getBusinessRegNo());
				hopVendor.setHopName(hisVendorItmWeb.getName());
				hopVendor.setHopCode(hisVendorItmWeb.getCode());
				commonService.saveOrUpdate(hopVendor);
			}
			
		}
	}
	
}
