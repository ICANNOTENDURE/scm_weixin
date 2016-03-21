/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.hop;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopCtlocDestinationDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.sys.ImpModel;
import com.dhcc.scm.service.hop.HopCtlocDestinationService;


@Component
public class HopCtlocDestinationBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(HopCtlocDestinationBlh.class);

	@Resource
	private HopCtlocDestinationService hopCtlocDestinationService;
	
	@Resource
	private CommonService commonService;

	
	public HopCtlocDestinationBlh() {
		
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
	
		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
		
		if(dto.getPageModel() == null){
			dto.setPageModel(new PagerModel());
		}			
		//调用对应的service方法
		hopCtlocDestinationService.list(dto);
	}
	
	
	//保存
	public void save(BusinessRequest res) {
	
		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
		
		if(dto.getHopCtlocDestination().getHopCtlocDestinationId()==null||
				(dto.getHopCtlocDestination().getHopCtlocDestinationId()).equals("")){
			dto.getHopCtlocDestination().setHopCtlocDestinationId(null);
			//dto.getHopCtlocDestination().setCtlocDr(dto.getHopCtlocDr().toString());
			hopCtlocDestinationService.save(dto);			
		}else {
			hopCtlocDestinationService.update(dto);
		}
		if((!StringUtils.isNullOrEmpty(dto.getDefautFlag()))&&(dto.getDefautFlag().equals("1"))){
			HopCtloc HopCtloc=commonService.get(HopCtloc.class, Long.valueOf(dto.getHopCtlocDestination().getCtlocDr()));
			HopCtloc.setCtlocDest(dto.getHopCtlocDestination().getHopCtlocDestinationId());
			commonService.saveOrUpdate(HopCtloc);
		}
		dto.setOpFlg("1");
		
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
		
		//调用对应的service方法
		hopCtlocDestinationService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
		
		//调用对应的service方法
		hopCtlocDestinationService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
		
		//调用对应的service方法
		hopCtlocDestinationService.findById(dto);
		
	}
	
	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    通过hopCtlocDestination 的hopCtlocDr获取HopCtloc
	* @param:         
	* @return:        
	* @Author:        
	* @Create Date:   
	 */
	public HopCtloc getHopCtloc(BusinessRequest res){
		try {
			HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
			HopCtloc hopCtloc=this.hopCtlocDestinationService.getCtloc(dto);	
			return hopCtloc;
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	//显示HopDestinationVo信息，即包括收货信息表中科室的id和描述
	public void listInfo(BusinessRequest res) throws Exception {
			
		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);		
//		List<HopDestinationVo> hopDestinationVos=new ArrayList<HopDestinationVo>();		
		hopCtlocDestinationService.getListInfo(dto);
//		WebContext webContext = WebContextHolder.getContext();
//		//webContext.getResponse().getWriter().write(JsonUtils.toJson(hopDestinationVos));
//		webContext.getResponse().getWriter().write(
//				"{\"total\":"
//						+ dto.getPageModel()
//								.getTotals()
//						+ ",\"rows\":"
//						+ JsonUtils.toJson(hopDestinationVos)
//						+ "}");
			
	}
	
	
	/**
	 * 
	* @Title: HopCtlocDestinationBlh.java
	* @Description: TODO(查询默认收货科室和地址)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月17日 上午9:57:21
	* @version V1.0
	 */
	public void getDefaultDes(BusinessRequest res) throws IOException{
		Long locId=WebContextHolder.getContext().getVisit().getUserInfo().getLocId();
		HopCtloc hopCtloc=commonService.get(HopCtloc.class, locId);
		WebContextHolder.getContext().getResponse().getWriter().write(
				"{\"locId\":"
						+ locId
						+ ",\"destionId\":"
						+ hopCtloc.getCtlocDest()
						+ "}");
	}
	
	
	public void upload(BusinessRequest res){

		HopCtlocDestinationDto dto = super.getDto(HopCtlocDestinationDto.class, res);
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

		List<ImpModel> listImpModels =commonService.findByProperty(ImpModel.class, "type", "HOPCTLOCDESC");
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
				HopCtlocDestination ctlocDestination = new HopCtlocDestination();
				String ctlochisId="";
				for (int numCells = 0; numCells <= row.getLastCellNum(); numCells++) {
					cell = row.getCell(numCells);
					String colNameString = modelMap.get(numCells);
					if (StringUtils.isNullOrEmpty(colNameString)) {
						colNameString = " ";
					}
					switch (colNameString) {
					case "HOPCTLOCDES_CODE":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							ctlocDestination.setCode(cell.toString());
						}
						break;
					case "HOPCTLOCDES_NAME":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							ctlocDestination.setDestination(cell.toString());
						}
						break;
					case "HOPCTLOCDES_CTLOCID":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							ctlochisId=cell.toString();
						}
					case "HOPCTLOCDES_CONT":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							ctlocDestination.setContact(cell.toString());
						}
						break;	
					case "HOPCTLOCDES_TEL":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							ctlocDestination.setTel(cell.toString());
						}
						break;
					case "HOPCTLOCDES_MAIL":
						if (cell != null) {
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							ctlocDestination.setMail(cell.toString());
						}
						break;
						
					}
				 }
				
				//验证数据的完整性
				if(org.apache.commons.lang3.StringUtils.isBlank(ctlochisId)){
					dto.setOpFlg("-1");
					dto.setMsg(dto.getMsg()+"<br>"+"第"+numRows+"行科室his标识不能为空！");
					continue;
				}else{
						DetachedCriteria criteria = DetachedCriteria.forClass(HopCtloc.class);
						criteria.add(Restrictions.eq("hisid", ctlochisId));
						criteria.add(Restrictions.eq("hospid", Long.valueOf(super.getLoginInfo().get("HOSPID").toString())));
						@SuppressWarnings("unchecked")
						List<HopCtloc> hopCtlocs= commonService.findByDetachedCriteria(criteria);
						if(hopCtlocs.size()>0){
							ctlocDestination.setCtlocDr(hopCtlocs.get(0).getHopCtlocId());
						}
				}
				commonService.saveOrUpdate(ctlocDestination);
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
