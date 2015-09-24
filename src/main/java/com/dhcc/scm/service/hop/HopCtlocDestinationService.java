/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import com.dhcc.scm.dto.hop.HopCtlocDestinationDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;

public interface HopCtlocDestinationService {

	public void list(HopCtlocDestinationDto dto);
	
	public void save(HopCtlocDestinationDto dto);
	
	public void delete(HopCtlocDestinationDto dto);
	
	public void update(HopCtlocDestinationDto dto);
	
	public HopCtlocDestination findById(HopCtlocDestinationDto dto);

	public HopCtloc getCtloc(HopCtlocDestinationDto dto) throws Exception;

	public void getListInfo(HopCtlocDestinationDto dto);
	
	public HopCtlocDestination getDesctionByCode(String code,Long hopId);

}
