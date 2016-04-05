/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.comment;

import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.hop.Evalute;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.comment.CommentVenVO;

public class CommentDto extends BaseDto {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Evalute evalute;
	
	/*选择标签串Id*/
	private String tagIdStr;
	
	/*自定义标签*/
	private String lastTag;
	
	private List<CatGroupProperty> catGroupProperties;
	
	
	private Date startDate;
	
	private Date endDate;
	
	/*
	 * 查询条件的值
	 */
	private String queryValue;

	private String queryType;
	
	private String queryCondition;
	
	private String queryResult;
	
	private Long vendorId;
	
	private Long hopVendorId;
	
	private List<ComboxVo> comboxVos;
	
	private CommentVenVO commentVenVO;
	
	private Long venIncId;
	
	private List<ChartVO> chartVOs;
	
	private String imgIdStr;
	
	
	

	


	public String getImgIdStr() {
		return imgIdStr;
	}


	public void setImgIdStr(String imgIdStr) {
		this.imgIdStr = imgIdStr;
	}


	public List<ChartVO> getChartVOs() {
		return chartVOs;
	}


	public void setChartVOs(List<ChartVO> chartVOs) {
		this.chartVOs = chartVOs;
	}


	public Long getVenIncId() {
		return venIncId;
	}


	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}


	public CommentVenVO getCommentVenVO() {
		return commentVenVO;
	}


	public void setCommentVenVO(CommentVenVO commentVenVO) {
		this.commentVenVO = commentVenVO;
	}


	public Long getHopVendorId() {
		return hopVendorId;
	}


	public void setHopVendorId(Long hopVendorId) {
		this.hopVendorId = hopVendorId;
	}


	public List<ComboxVo> getComboxVos() {
		return comboxVos;
	}


	public void setComboxVos(List<ComboxVo> comboxVos) {
		this.comboxVos = comboxVos;
	}


	public Long getVendorId() {
		return vendorId;
	}


	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}


	public String getQueryValue() {
		return queryValue;
	}


	public void setQueryValue(String queryValue) {
		this.queryValue = queryValue;
	}


	public String getQueryType() {
		return queryType;
	}


	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}


	public String getQueryCondition() {
		return queryCondition;
	}


	public void setQueryCondition(String queryCondition) {
		this.queryCondition = queryCondition;
	}


	public String getQueryResult() {
		return queryResult;
	}


	public void setQueryResult(String queryResult) {
		this.queryResult = queryResult;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public List<CatGroupProperty> getCatGroupProperties() {
		return catGroupProperties;
	}


	public void setCatGroupProperties(List<CatGroupProperty> catGroupProperties) {
		this.catGroupProperties = catGroupProperties;
	}


	public String getLastTag() {
		return lastTag;
	}


	public void setLastTag(String lastTag) {
		this.lastTag = lastTag;
	}


	public String getTagIdStr() {
		return tagIdStr;
	}


	public void setTagIdStr(String tagIdStr) {
		this.tagIdStr = tagIdStr;
	}


	public Evalute getEvalute() {
		return evalute;
	}


	public void setEvalute(Evalute evalute) {
		this.evalute = evalute;
	}
	

	
}
