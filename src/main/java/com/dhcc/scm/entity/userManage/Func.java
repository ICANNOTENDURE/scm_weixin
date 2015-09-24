package com.dhcc.scm.entity.userManage;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@Entity
@Table(name = "t_Sys_Func")
@XmlRootElement
@JsonInclude(Include.NON_NULL)
public class Func implements java.io.Serializable {

	/**
	 * 字段: 序列化id
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	

	private Long funcId;


	private String funcName;
	private String parentId;
	private String isLeaf;
	private String menuSeq;
	private String url;
	private String imgUrl;
	private String secutiryUrl;
	private String useState;
	private String backColor;
	/**
	 * @return the backColor
	 */
	@Column(name="BACKCOLOR")
	public String getBackColor() {
		return backColor;
	}

	/**
	 * @param backColor the backColor to set
	 */
	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}

	/**
	 * @return funcId
	 */

	// @GeneratedValue(strategy=GenerationType.AUTO)
	

	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="Seq_SYS_FUNC")})
	@GeneratedValue(generator="idGenerator")
	@Column(name = "FUNC_ID")
	public Long getFuncId() {
		return funcId;
	}

	public void setFuncId(Long funcId) {
		this.funcId = funcId;
	}
	/**
	 * @return menuSeq
	 */
	@Column(name = "seq")
	public String getMenuSeq() {
		return menuSeq;
	}

	/**
	 * @param menuSeq
	 *            menuSeq
	 */
	public void setMenuSeq(String menuSeq) {
		this.menuSeq = menuSeq;
	}

	/**
	 * @return imgUrl
	 */
	@Column(name = "imgUrl")
	public String getImgUrl() {
		return imgUrl;
	}

	/**
	 * @param imgUrl
	 *            imgUrl
	 */
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	/**
	 * @return funcName
	 */
	@Column(name = "name")
	public String getFuncName() {
		return funcName;
	}

	/**
	 * @param funcName
	 *            funcName
	 */
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}

	/**
	 * @return parentId
	 */
	@Column(name = "parentId")
	public String getParentId() {
		return parentId;
	}

	/**
	 * @param parentId
	 *            parentId
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	/**
	 * @return isLeaf
	 */
	@Column(name = "leaf")
	public String getIsLeaf() {
		return isLeaf;
	}

	/**
	 * @param isLeaf
	 *            isLeaf
	 */
	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	/**
	 * @return url
	 */
	@Column(name = "func")
	public String getUrl() {
		return url;
	}

	/**
	 * @param url
	 *            url
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return secutiryUrl
	 */
	@Column(name = "url")
	public String getSecutiryUrl() {
		return secutiryUrl;
	}

	/**
	 * @param secutiryUrl
	 *            secutiryUrl
	 */
	public void setSecutiryUrl(String secutiryUrl) {
		this.secutiryUrl = secutiryUrl;
	}

	/**
	 * @return useState
	 */
	@Column(name = "useState")
	public String getUseState() {
		return useState;
	}

	/**
	 * @param useState
	 *            useState
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}

	// 与角色映射多对多关系
	private Set<Role> roles;

	/**
	 * @return roles
	 */
	@JsonIgnore
	@ManyToMany(mappedBy = "funcs", targetEntity = Role.class)
	public Set<Role> getRoles() {
		return roles;
	}

	/**
	 * @param roles
	 *            roles
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	// 树节点需要的属性
	private String state;
	private String id;
	private String text;
	private boolean checked = false;

	/**
	 * @return state
	 */
	@Transient
	public String getState() {
		return "open";
	}

	/**
	 * @param state
	 *            state
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return id
	 */
	@Transient
	public Long getId() {
		return this.funcId;
	}

	/**
	 * @param id
	 *            id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return text
	 */
	@Transient
	public String getText() {
		return this.funcName;
	}

	/**
	 * @param text
	 *            text
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @return checked
	 */
	@Transient
	public boolean isChecked() {
		return checked;
	}

	/**
	 * @param checked
	 *            checked
	 */
	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	// 存放子节点
	private List<Func> children = new ArrayList<Func>();

	/**
	 * @return children
	 */
	@Transient
	public List<Func> getChildren() {
		return children;
	}

	/**
	 * @param children
	 *            children
	 */
	public void setChildren(List<Func> children) {
		this.children = children;
	}

	/**
	 * Title: Description:
	 * 
	 * @param funcId
	 * @param funcName
	 * @param parentId
	 * @param isLeaf
	 * @param menuSeq
	 * @param url
	 * @param imgUrl
	 * @param secutiryUrl
	 * @param useState
	 */
	public Func(Long funcId, String funcName, String parentId, String isLeaf,
			String menuSeq, String url, String imgUrl, String secutiryUrl,
			String useState, String backColor) {
		super();
		this.funcId = funcId;
		this.funcName = funcName;
		this.parentId = parentId;
		this.isLeaf = isLeaf;
		this.menuSeq = menuSeq;
		this.url = url;
		this.imgUrl = imgUrl;
		this.secutiryUrl = secutiryUrl;
		this.useState = useState;
		this.backColor=backColor;
	}

	/**
	 * Title: Description:
	 * 
	 * @param funcId
	 * @param funcName
	 * @param parentId
	 */
	public Func(Long funcId, String funcName, String parentId) {
		super();
		this.funcId = funcId;
		this.funcName = funcName;
		this.parentId = parentId;
	}

	/**
	 * Title: Description:
	 */
	public Func() {
		super();
	}

	/**
	 * Title: Description:
	 * 
	 * @param secutiryUrl
	 */
	public Func(String secutiryUrl) {
		super();
		this.secutiryUrl = secutiryUrl;
	}

	/**
	 * Title: Description:
	 * 
	 * @param funcId
	 * @param funcName
	 * @param parentId
	 * @param isLeaf
	 * @param menuSeq
	 * @param url
	 * @param imgUrl
	 * @param secutiryUrl
	 */
	public Func(Long funcId, String funcName, String parentId, String isLeaf,
			String menuSeq, String url, String imgUrl, String secutiryUrl, String backColor) {
		super();
		this.funcId = funcId;
		this.funcName = funcName;
		this.parentId = parentId;
		this.isLeaf = isLeaf;
		this.menuSeq = menuSeq;
		this.url = url;
		this.imgUrl = imgUrl;
		this.secutiryUrl = secutiryUrl;
		this.backColor=backColor;
	}

}
