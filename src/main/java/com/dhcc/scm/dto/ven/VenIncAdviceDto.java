/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ven;

import java.util.List;

import com.dhcc.scm.entity.ven.VenIncAdvice;
import com.dhcc.scm.entity.vo.ven.ReplayVenIncVo;
import com.dhcc.framework.transmission.dto.BaseDto;

public class VenIncAdviceDto extends BaseDto {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VenIncAdvice venIncAdvice;

	private List<ReplayVenIncVo> replayVenIncVos;
	
	private Long askUserId;
	
	private String replyFlag;
	
	private String readFlag;
	
	private Long vendorId;
	
	private Long venIncId;
	
	
	



	public Long getVenIncId() {
		return venIncId;
	}


	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}


	public Long getVendorId() {
		return vendorId;
	}


	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}


	public String getReadFlag() {
		return readFlag;
	}


	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}


	public String getReplyFlag() {
		return replyFlag;
	}


	public void setReplyFlag(String replyFlag) {
		this.replyFlag = replyFlag;
	}


	public Long getAskUserId() {
		return askUserId;
	}


	public void setAskUserId(Long askUserId) {
		this.askUserId = askUserId;
	}


	public List<ReplayVenIncVo> getReplayVenIncVos() {
		return replayVenIncVos;
	}


	public void setReplayVenIncVos(List<ReplayVenIncVo> replayVenIncVos) {
		this.replayVenIncVos = replayVenIncVos;
	}


	public VenIncAdvice getVenIncAdvice() {
		return venIncAdvice;
	}

	
	public void setVenIncAdvice(VenIncAdvice venIncAdvice) {
		this.venIncAdvice = venIncAdvice;
	}
	
}
