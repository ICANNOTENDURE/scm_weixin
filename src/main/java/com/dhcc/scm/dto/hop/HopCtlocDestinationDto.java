/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.util.List;

import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.vo.hop.HopDestinationVo;
import com.dhcc.framework.transmission.dto.BaseDto;

public class HopCtlocDestinationDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private HopCtlocDestination hopCtlocDestination;

	private Long hopCtlocDr;
	
	private String defautFlag;
	
	
	//显示收货信息
	private List<HopDestinationVo> hopDestinationVos;
	
	public Long getHopCtlocDr() {
		return hopCtlocDr;
	}


	public void setHopCtlocDr(Long hopCtlocDr) {
		this.hopCtlocDr = hopCtlocDr;
	}
	
	

	/**
	 * @return the defautFlag
	 */
	public String getDefautFlag() {
		return defautFlag;
	}


	/**
	 * @param defautFlag the defautFlag to set
	 */
	public void setDefautFlag(String defautFlag) {
		this.defautFlag = defautFlag;
	}


	public HopCtlocDestination getHopCtlocDestination() {
		return hopCtlocDestination;
	}

	
	public void setHopCtlocDestination(HopCtlocDestination hopCtlocDestination) {
		this.hopCtlocDestination = hopCtlocDestination;
	}


	/**
	 * @return the hopDestinationVos
	 */
	public List<HopDestinationVo> getHopDestinationVos() {
		return hopDestinationVos;
	}


	/**
	 * @param hopDestinationVos the hopDestinationVos to set
	 */
	public void setHopDestinationVos(List<HopDestinationVo> hopDestinationVos) {
		this.hopDestinationVos = hopDestinationVos;
	}
	
}
