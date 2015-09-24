/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.demo.impl;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.dao.demo.StudentDao;
import com.dhcc.scm.dto.demo.StudentDto;
import com.dhcc.scm.entity.demo.Student;
import com.dhcc.scm.service.demo.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Resource
	private StudentDao studentDao;
	@Resource
	private CommonService commonService;

	public void list(StudentDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		studentDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(StudentDto dto){
	
		studentDao.save(dto.getStudent());
	}
	
	public void delete(StudentDto dto){
	
		studentDao.delete(dto.getStudent());
	}
	
	public void update(StudentDto dto){
	
		studentDao.update(dto.getStudent());
	}
	
	public Student findById(StudentDto dto){
	
		dto.setStudent(studentDao.findById(dto.getStudent()));
		return dto.getStudent();
	}

}
