/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.demo;

import com.dhcc.scm.dto.demo.DemoDto;
import com.dhcc.scm.entity.demo.Student;

public interface DemoService {

	public void list(DemoDto dto);
	
	public void save(DemoDto dto);
	
	public void delete(DemoDto dto);
	
	public void update(DemoDto dto);
	
	public Student findById(DemoDto dto);
	

}
