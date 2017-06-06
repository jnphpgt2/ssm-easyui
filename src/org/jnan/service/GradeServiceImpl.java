package org.jnan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jnan.mapper.CourseMapper;
import org.jnan.mapper.GradeMapper;
import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gradeService")
public class GradeServiceImpl implements GradeService {

	@Autowired
	private GradeMapper gradeMapper;

	@Override
	public List<Stu> getList(int page, int rows) {
		Map<String,Integer> fy=new HashMap<String,Integer>();
		fy.put("index",(page-1)*rows);
		fy.put("rows",rows);
		List<Stu> list = gradeMapper.getList(fy);
		return list;
	}
	
	@Override
	public int getListCount() {
		return gradeMapper.getListCount();
	}

	@Override
	public int add(Grade grade) {
		return gradeMapper.add(grade);
	}

	@Override
	public int update(Grade grade) {
		return gradeMapper.update(grade);
	}

	@Override
	public int delete(Integer gid) {
		return gradeMapper.delete(gid);
	}

	@Override
	public List<Grade> getGradeTypeList() {
		return gradeMapper.getGradeTypeList();
	}

	
}
