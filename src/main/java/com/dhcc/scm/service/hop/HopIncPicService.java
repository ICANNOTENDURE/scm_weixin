/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import java.util.List;

import com.dhcc.scm.dto.hop.HopIncPicDto;
import com.dhcc.scm.entity.hop.HopIncPic;
import com.dhcc.scm.entity.vo.hop.HopIncPicVo;

public interface HopIncPicService {

	public void list(HopIncPicDto dto);
	
	public void save(HopIncPicDto dto);
	
	public void delete(HopIncPicDto dto);
	
	public void update(HopIncPicDto dto);
	
	public HopIncPic findById(HopIncPicDto dto);

	public List<HopIncPicVo> getListInfo(HopIncPicDto dto);



}
