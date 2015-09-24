/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.demo;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.demo.StudentDto;
import com.dhcc.scm.entity.demo.Student;
import com.dhcc.scm.service.demo.StudentService;


@Component
public class StudentBlh extends AbstractBaseBlh {


	@Resource
	private StudentService studentService;
	
	@Resource
	private CommonService commonService;
	
	public StudentBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		StudentDto dto = super.getDto(StudentDto.class, res);
		
		//调用对应的service方法
		studentService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		StudentDto dto = super.getDto(StudentDto.class, res);
		
		//调用对应的service方法
		if(StringUtils.isEmpty(dto.getStudent().getStudentId())){
			dto.getStudent().setStudentId(null);
		}
		commonService.saveOrUpdate(dto.getStudent());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		StudentDto dto = super.getDto(StudentDto.class, res);
		
		//调用对应的service方法
		commonService.delete(Student.class, dto.getStudent().getStudentId());
	}

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		StudentDto dto = super.getDto(StudentDto.class, res);
		
		//调用对应的service方法
		studentService.findById(dto);
		
	}
	
}
