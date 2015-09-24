/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.comment.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.scm.dao.comment.CommentDao;
import com.dhcc.scm.dto.comment.CommentDto;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.service.comment.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {


	@Resource
	private CommentDao commentDao;
	@Override
	public void listVenEval(CommentDto dto) {
		// TODO Auto-generated method stub
		commentDao.listVenEval(dto);
	}
	@Override
	public void listVenIncEval(CommentDto dto) {
		// TODO Auto-generated method stub
		commentDao.listVenIncEval(dto);
	}
	@Override
	public List<ChartVO> getIncTag(Long incid) {
		// TODO Auto-generated method stub
		return commentDao.getIncTag(incid);
	}
	
	
}
