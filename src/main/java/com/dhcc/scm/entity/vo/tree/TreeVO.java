/**  
* @Title: TreeVO.java
* @Package com.dhcc.pms.entity.vo.tree
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年6月12日 下午5:32:49
* @version V1.0  
*/
package com.dhcc.scm.entity.vo.tree;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 *
 */
public class TreeVO {

		// 树节点需要的属性
		@SuppressWarnings("unused")
		private String state;
		private String id;
		private String text;
		private boolean checked = false;
		
		// 存放子节点
		private List<TreeVO> children = new ArrayList<TreeVO>();

		/**
		 * @return the state
		 */
		public String getState() {
			return "open";
		}

		/**
		 * @param state the state to set
		 */
		public void setState(String state) {
			this.state = state;
		}

		/**
		 * @return the id
		 */
		public String getId() {
			return id;
		}

		/**
		 * @param id the id to set
		 */
		public void setId(String id) {
			this.id = id;
		}

		/**
		 * @return the text
		 */
		public String getText() {
			return text;
		}

		/**
		 * @param text the text to set
		 */
		public void setText(String text) {
			this.text = text;
		}

		/**
		 * @return the checked
		 */
		public boolean isChecked() {
			return checked;
		}

		/**
		 * @param checked the checked to set
		 */
		public void setChecked(boolean checked) {
			this.checked = checked;
		}

		/**
		 * @return the children
		 */
		public List<TreeVO> getChildren() {
			return children;
		}

		/**
		 * @param children the children to set
		 */
		public void setChildren(List<TreeVO> children) {
			this.children = children;
		}
		
		
}
