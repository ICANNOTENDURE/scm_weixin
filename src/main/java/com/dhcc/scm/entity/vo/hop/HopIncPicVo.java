/**
 * 
 */
package com.dhcc.scm.entity.vo.hop;


/**
 * @author pzk
 * function 自制医院药品图片列表实体
 */
public class HopIncPicVo {
	//表id
	private Long hopIncPicId;
	//药品ID
	private Long incPicIncid;
	//药品描述
	private String incName;
	//图片路径
	private String incPicPath;
	//图片显示顺序
	private Long incPicSeq;
	
	public HopIncPicVo(){
		
	}

	public HopIncPicVo(Long hopIncPicId, Long incPicIncid,
			String incName, String incPicPath, Long incPicSeq) {
		super();
		this.hopIncPicId = hopIncPicId;
		this.incPicIncid = incPicIncid;
		this.incName = incName;
		this.incPicPath = incPicPath;
		this.incPicSeq = incPicSeq;
	}

	public Long getHopIncPicId() {
		return hopIncPicId;
	}

	public void setHopIncPicId(Long hopIncPicId) {
		this.hopIncPicId = hopIncPicId;
	}

	public Long getIncPicIncid() {
		return incPicIncid;
	}

	public void setIncPicIncid(Long incPicIncid) {
		this.incPicIncid = incPicIncid;
	}

	public String getIncName() {
		return incName;
	}

	public void setIncName(String incName) {
		this.incName = incName;
	}

	public String getIncPicPath() {
		return incPicPath;
	}

	public void setIncPicPath(String incPicPath) {
		this.incPicPath = incPicPath;
	}

	public Long getIncPicSeq() {
		return incPicSeq;
	}

	public void setIncPicSeq(Long incPicSeq) {
		this.incPicSeq = incPicSeq;
	}
	
	
}
