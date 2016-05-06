/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.demo;

import com.dhcc.scm.dto.demo.StudentDto;
import com.dhcc.scm.entity.demo.Student;

public interface StudentService {

	public void list(StudentDto dto);
	
	public void save(StudentDto dto);
	
	public void delete(StudentDto dto);
	
	public void update(StudentDto dto);
	
	public Student findById(StudentDto dto);
	

}
