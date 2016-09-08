/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.hop;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

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
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.ord.OrdBlh;
import com.dhcc.scm.dto.hop.HopCtlocDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.hop.HopCtlocVo;
import com.dhcc.scm.entity.vo.ws.HisLocItmWeb;
import com.dhcc.scm.entity.vo.ws.HisLocWeb;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.hop.HopCtlocService;
import com.dhcc.scm.ws.his.client.HisCtlocList;
import com.dhcc.scm.ws.his.client.HisLocItm;
import com.dhcc.scm.ws.his.client.SCM;


@Component
public class HopCtlocBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(HopCtlocBlh.class);

	@Resource
	private HopCtlocService hopCtlocService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private OrdBlh ordBlh;
	
	public HopCtlocBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);

		if(dto.getPageModel() == null){
			dto.setPageModel(new PagerModel());
		}	
		//调用对应的service方法
		hopCtlocService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		if(dto.getHopCtloc().getHopCtlocId()==null||
				(dto.getHopCtloc().getHopCtlocId()).equals("")){
			dto.getHopCtloc().setHopCtlocId(null);
			hopCtlocService.save(dto);		
		}else {
			HopCtloc hopCtloc=commonService.get(HopCtloc.class, dto.getHopCtloc().getHopCtlocId());
			dto.getHopCtloc().setCtlocDest(hopCtloc.getCtlocDest());
			hopCtlocService.update(dto);
		}	
			
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		
		//调用对应的service方法
		hopCtlocService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		//调用对应的service方法
		hopCtlocService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		
		//调用对应的service方法
		hopCtlocService.findById(dto);
		
	}
	
	public void findHopId(BusinessRequest res) {
		
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		
		//调用对应的service方法
		hopCtlocService.findById(dto);
		
	}
	
	//显示科室的部分信息，以json传给浏览器
	public void getCtlocList(BusinessRequest res) throws Exception {
		
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		
		List<HopCtloc> hopCtlocs=new ArrayList<HopCtloc>();
		hopCtlocs=hopCtlocService.getCtlocInfo(dto);
		WebContext webContext = WebContextHolder.getContext();
		webContext.getResponse().getWriter().write(JsonUtils.toJson(hopCtlocs));
			
	}
	
	//显示HopCtlocVo信息，即包括科室表中的指向医院Id对应的医院描述
	public void listInfo(BusinessRequest res) throws Exception {
		
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);		
		List<HopCtlocVo> hopCtlocVos=new ArrayList<HopCtlocVo>();		
		hopCtlocVos=hopCtlocService.getListInfo(dto);
		WebContext webContext = WebContextHolder.getContext();
		//webContext.getResponse().getWriter().write(JsonUtils.toJson(hopCtlocVos));
		webContext.getResponse().getWriter().write(
				"{\"total\":"
						+ dto.getPageModel()
								.getTotals()
						+ ",\"rows\":"
						+ JsonUtils.toJson(hopCtlocVos)
						+ "}");
			
	}
	
	
	/**
	 * 
	* @Title: HopCtlocBlh.java
	* @Description: TODO(按登录人权限和科室类型查看权限下科室)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月13日 下午1:05:15
	* @version V1.0
	 */
	public void findHopLocComboxVos(BusinessRequest res) throws IOException{
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(hopCtlocService.findHopLocComboxVos(dto)));
	}
	
	/**
	 * 
	 * @param res
	 * @throws IOException
	 * @author penzi
	 * @Description:供PDA调用
	 */
	public void findHopLocAndroid(BusinessRequest res) throws IOException{
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
		WebContextHolder.getContext().getResponse().getWriter();
		WebContextHolder.getContext().getResponse().getWriter()
		.write(
				"{\"rows\":"
				+
				JsonUtils.toJson(hopCtlocService.findHopLocAndroid(dto))
				+"}");
		WebContextHolder.getContext().getResponse().getWriter().flush();
	}
	
	
	/**
	 * 
	* @Title: HopCtlocBlh.java
	* @Description: TODO(修改科室默认收货地址)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月16日 下午5:39:26
	* @version V1.0
	 */
	public void setDefaut(BusinessRequest res){
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
		HopCtloc hopCtloc=commonService.get(HopCtloc.class,Long.valueOf(Math.round(dto.getId())));
		hopCtloc.setCtlocDest(dto.getDestionId());
		commonService.saveOrUpdate(hopCtloc);
		dto.setOpFlg("1");
	}
	
	
	
	/**
	 * 
	* @Title: HopCtlocBlh.java
	* @Description: TODO(任务调用医院webservice同步更新科室信息)
	* @param hisCtlocList
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月7日 上午9:18:29
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void GetHisLocXHWS(){
		
		SysLog log=new SysLog();
		log.setOpDate(new Date());
		log.setOpType("webservice client");
		log.setOpName("同步his科室信息列表");
		log.setOpUser(BaseConstants.BJXH_CODE);
		try {
			SCM scm=new SCM();
			HisCtlocList hisCtlocList=scm.getSCMSoap().getLoc();
			log.setOpArg(JsonUtils.toJson(hisCtlocList));
			DetachedCriteria criteria = DetachedCriteria.forClass(Hospital.class);
			criteria.add(Restrictions.eq("hospitalCode", BaseConstants.BJXH_CODE));
			List<Hospital> hospitals=commonService.findByDetachedCriteria(criteria);
			for(HisLocItm hisLocItm:hisCtlocList.getHisLocItms()){
				DetachedCriteria criteriaLoc = DetachedCriteria.forClass(HopCtloc.class);
				criteriaLoc.add(Restrictions.eq("code", hisLocItm.getLocCode()));
				criteriaLoc.add(Restrictions.eq("hospid", hospitals.get(0).getHospitalId()));
				List<HopCtloc> hopCtlocs=commonService.findByDetachedCriteria(criteriaLoc);
				HopCtloc hopLocCtloc=new HopCtloc();
				if(hopCtlocs.size()>0){
					hopLocCtloc=hopCtlocs.get(0);
				}else{
					hopLocCtloc.setCode(hisLocItm.getLocCode());
					hopLocCtloc.setHospid(hospitals.get(0).getHospitalId());
				}
				hopLocCtloc.setName(hisLocItm.getLocDesc());
				hopLocCtloc.setType("3");
				commonService.saveOrUpdate(hopLocCtloc);
			}
			
			
			
			log.setOpResult("success");

		} catch (Exception e) {
			log.setOpResult(e.getMessage());
			e.printStackTrace();
		}finally{
			commonService.saveOrUpdate(log);
		}

	}
	
	
	public void getLoc2(){
		try {
			URL url = new URL("http://10.160.17.11:57772/dthealth/web/web.DHCST.SoapService.SCMDataExchange.cls?soap_method=GetLoc2");//要调用的url
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setRequestMethod("GET");//设置get方式获取数据
			
			if (conn.getResponseCode() == 200) {//如果连接成功
				
				
				String newFileName =UUID.randomUUID().toString()+".xml";
				File document = new File("d:/wsXML/");
				if (!document.exists()) {
					document.mkdir();
				}

				File xmlFIle = new File("d:/wsXML/",newFileName);
				OutputStream outStream=new FileOutputStream(xmlFIle);
				byte[] buffer = new byte[BaseConstants.BUFFER_SIZE];
				int len = 0;
			    while( (len = conn.getInputStream().read(buffer)) !=-1 ){
			            outStream.write(buffer, 0, len);
			    }
			    outStream.close();
			    
			    DocumentBuilderFactory      dbf=DocumentBuilderFactory.newInstance(); 
			    DocumentBuilder builder=dbf.newDocumentBuilder();
			    Document doc=builder.parse("d:/wsXML/"+newFileName);
			    Element root = doc.getDocumentElement();
			    NodeList nl=doc.getElementsByTagName("GetLoc2Result");
			    
			    for (int i=0;i<nl.getLength();i++)     {      
			    	Element node=(Element)nl.item(i);
			    	//󱕫󰟫󳸼󰐁󲱘󲆣󰏔󰏾Node󱇍󴈵󰇄      System.out.println(node.getElementsByTagName("userid").item(0).getFirstChild().getNodeValue()); 
			    }
			}
			conn.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	public void syncHisLoc(OperateResult operateResult, HisLocWeb hisLocWeb) {
		
		this.syncHisLocSub(operateResult, hisLocWeb);
		SysLog log = new SysLog();
		log.setOpArg(JsonUtils.toJson(hisLocWeb));
		log.setOpName("webservice同步医院科室信息");
		log.setOpDate(new Date());
		log.setOpResult(JsonUtils.toJson(operateResult));
		log.setOpType("webservice");
		log.setOpUser(hisLocWeb.getUserName());
		commonService.saveOrUpdate(log);

	}
	
	public void syncHisLocSub(OperateResult operateResult, HisLocWeb hisIncWeb) {


		NormalAccount normalAccount=ordBlh.checkWsParam(operateResult, hisIncWeb.getUserName(), hisIncWeb.getPassWord(), hisIncWeb.getHisLocItmWebs());
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
		for (HisLocItmWeb hisLocItmWeb : hisIncWeb.getHisLocItmWebs()) {
			
			if(StringUtils.isNullOrEmpty(hisLocItmWeb.getId())){
				operateResult.setResultCode("-11");
				operateResult.setResultContent("有商品条码为空,");
				continue;
			}
			String[] incPropertyNames = { "hospid", "hisid" };
			Object[] incValues = { hopCtloc.getHospid(), hisLocItmWeb.getId()};
			List<HopCtloc> hopCtlocs = commonService.findByProperties(HopCtloc.class, incPropertyNames, incValues);
			HopCtloc ctloc = new HopCtloc();
			if (hopCtlocs.size() > 0) {
				ctloc.setHopCtlocId(hopCtlocs.get(0).getHopCtlocId());
			}
			ctloc.setCode(hisLocItmWeb.getCode());
			ctloc.setName(hisLocItmWeb.getName());
			ctloc.setHospid(hopCtloc.getHospid());
			ctloc.setHisid(hisLocItmWeb.getId());
			commonService.saveOrUpdate(ctloc);
		}
	}
	
	public void upload(BusinessRequest res){
		HopCtlocDto dto = super.getDto(HopCtlocDto.class, res);
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

		List<ImpModel> listImpModels =commonService.findByProperty(ImpModel.class, "type", "HOPCTLOC");
		Map<Integer, String> modelMap = new HashMap<Integer, String>();
		for (int i = 0; i < listImpModels.size(); i++) {
			modelMap.put(Integer.valueOf(listImpModels.get(i).getSeq().toString()), listImpModels.get(i).getCode());
		}
		// 读取excel
		try {
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
				HopCtloc hopCtloc = new HopCtloc();
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					switch (colNameString) {
					case "HOPCTLOC_CODE":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopCtloc.setCode(cell.toString());
						}
						break;
					case "HOPCTLOC_NAME":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopCtloc.setName(cell.toString());
						}
						break;
					case "HOPCTLOC_TYPE":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopCtloc.setType(cell.toString());
						}
						break;
					case "HOPCTLOC_HISID":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							hopCtloc.setHisid(cell.toString());
						}
						break;
					}
				 }
				
				//验证数据的完整性
				if(org.apache.commons.lang3.StringUtils.isBlank(hopCtloc.getHisid())){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>"+"第"+numRows+"行his标识不能为空！");
					continue;
				}else{
						DetachedCriteria criteria = DetachedCriteria.forClass(HopCtloc.class);
						criteria.add(Restrictions.eq("hisid", hopCtloc.getHisid()));
						criteria.add(Restrictions.eq("hospid", Long.valueOf(super.getLoginInfo().get("HOSPID").toString())));
						@SuppressWarnings("unchecked")
						List<HopCtloc>  hopCtlocs= commonService.findByDetachedCriteria(criteria);
						if(hopCtlocs.size()>0){
							hopCtloc.setHopCtlocId(hopCtlocs.get(0).getHopCtlocId());
						}
				}
				hopCtloc.setHospid(Long.valueOf(super.getLoginInfo().get("HOSPID").toString()));
				commonService.saveOrUpdate(hopCtloc);
			}
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
}	
