/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;

/**
 * @author pzk
 * 供应商药品图片显示列表实体
 */
public class VenIncPicVo {
	//表id
	private Long venIncPicId;
	//指向父表药品表的id
	private Long venIncPicVenincid;
	//药品描述
	private String venIncName;
	//图片路径
	private String venIncPicPath;
	//图片顺序
	private Long venIncPicSeq;
	
	public VenIncPicVo(){
		
	}

	public VenIncPicVo(Long venIncPicId, Long venIncPicVenincid,
			String venIncName, String venIncPicPath, Long venIncPicSeq) {
		super();
		this.venIncPicId = venIncPicId;
		this.venIncPicVenincid = venIncPicVenincid;
		this.venIncName = venIncName;
		this.venIncPicPath = venIncPicPath;
		this.venIncPicSeq = venIncPicSeq;
	}

	public Long getVenIncPicId() {
		return venIncPicId;
	}

	public void setVenIncPicId(Long venIncPicId) {
		this.venIncPicId = venIncPicId;
	}

	public Long getVenIncPicVenincid() {
		return venIncPicVenincid;
	}

	public void setVenIncPicVenincid(Long venIncPicVenincid) {
		this.venIncPicVenincid = venIncPicVenincid;
	}

	public String getVenIncName() {
		return venIncName;
	}

	public void setVenIncName(String venIncName) {
		this.venIncName = venIncName;
	}

	public String getVenIncPicPath() {
		return venIncPicPath;
	}

	public void setVenIncPicPath(String venIncPicPath) {
		this.venIncPicPath = venIncPicPath;
	}

	public Long getVenIncPicSeq() {
		return venIncPicSeq;
	}

	public void setVenIncPicSeq(Long venIncPicSeq) {
		this.venIncPicSeq = venIncPicSeq;
	}
	
	
}
