package com.dhcc.scm.dto.sys;

import com.dhcc.scm.entity.sys.TaskConfig;
import com.dhcc.framework.transmission.dto.BaseDto;


public class TaskConfigDto extends BaseDto {

	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private TaskConfig taskConfig;
	
	private boolean success = false;
	
	private String message = "";
	
	public TaskConfig getTaskConfig() {
		return taskConfig;
	}

	public void setTaskConfig(TaskConfig taskConfig) {
		this.taskConfig = taskConfig;
	}

	/**  
	 * @return success 
	 */
	public boolean isSuccess() {
		return success;
	}

	/**  
	 * @param success success 
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}

	/**  
	 * @return message 
	 */
	public String getMessage() {
		return message;
	}

	/**  
	 * @param message message 
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
}