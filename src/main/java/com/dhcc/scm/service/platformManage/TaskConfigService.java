package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.dto.sys.TaskConfigDto;

public interface TaskConfigService {

	public void list(TaskConfigDto dto);
	
	public void save(TaskConfigDto dto);
	
	public void delete(TaskConfigDto dto);
	
	public void update(TaskConfigDto dto);
	
	public void findById(TaskConfigDto dto);

}
