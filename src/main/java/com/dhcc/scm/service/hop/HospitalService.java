/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import java.util.List;

import com.dhcc.scm.dto.hop.HospitalDto;
import com.dhcc.scm.entity.hop.Hospital;

public interface HospitalService {

	public void list(HospitalDto dto);
	
	public void save(HospitalDto dto);
	
	public void delete(HospitalDto dto);
	
	public void update(HospitalDto dto);
	
	public Hospital findById(HospitalDto dto);
	
	public List<Hospital> getHospInfo(HospitalDto dto);
	
	/**
	 * 
	* @Title: HospitalService.java
	* @Description: TODO(查找医院)
	* @param name
	* @return
	* @return:Hospital 
	* @author zhouxin  
	* @date 2014年7月30日 上午11:10:15
	* @version V1.0
	 */
	public Hospital getHospitalByName(String name);
}
