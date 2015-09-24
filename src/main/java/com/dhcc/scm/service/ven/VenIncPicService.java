/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ven;

import java.util.List;

import com.dhcc.scm.dto.ven.VenIncPicDto;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.vo.ven.VenIncPicVo;

public interface VenIncPicService {

	public void list(VenIncPicDto dto);
	
	public void save(VenIncPicDto dto);
	
	public void delete(VenIncPicDto dto);
	
	public void update(VenIncPicDto dto);
	
	public VenIncPic findById(VenIncPicDto dto);

	public List<VenIncPicVo> getListInfo(VenIncPicDto dto);
	

}
