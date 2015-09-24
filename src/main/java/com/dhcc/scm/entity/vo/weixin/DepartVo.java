package com.dhcc.scm.entity.vo.weixin;

import java.util.ArrayList;
import java.util.List;

public class DepartVo implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String text;
	private Integer parentId;
	private boolean checked=false;
	private List<DepartVo> children=new ArrayList<DepartVo>();
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<DepartVo> getChildren() {
		return children;
	}

	public void setChildren(List<DepartVo> children) {
		this.children = children;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}



}
