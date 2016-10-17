
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 
 * @author Administrator
 *
 */
public class VenQualifyWebItm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String venCode;
	
	private String text;
	
	private Date exp;
	
	private List<HisPicWeb> pics;
	
	/*
	G：工商执照号
	S：税务执照
	Q：器械经营许可证
	P：器械生成许可证
	T：器械注册证
	J：进口注册登
	*/
	private String type;
	
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getVenCode() {
		return venCode;
	}

	public void setVenCode(String venCode) {
		this.venCode = venCode;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getExp() {
		return exp;
	}

	public void setExp(Date exp) {
		this.exp = exp;
	}

	public List<HisPicWeb> getPics() {
		return pics;
	}

	public void setPics(List<HisPicWeb> pics) {
		this.pics = pics;
	}
	
	
	
	
	
	
}
