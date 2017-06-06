package org.jnan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jnan.mapper.CourseMapper;
import org.jnan.mapper.StuMapper;
import org.jnan.po.Course;
import org.jnan.po.Stu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseMapper courseMapper;

	@Override
	public List<Stu> getList(int page, int rows) {
		Map<String,Integer> fy=new HashMap<String,Integer>();
		fy.put("index",(page-1)*rows);
		fy.put("rows",rows);
		List<Stu> list = courseMapper.getList(fy);
		return list;
	}
	
	@Override
	public int getListCount() {
		return courseMapper.getListCount();
	}

	@Override
	public int add(Course course) {
		return courseMapper.add(course);
	}

	@Override
	public int update(Course course) {
		return courseMapper.update(course);
	}

	@Override
	public int delete(Integer cid) {
		return courseMapper.delete(cid);
	}

	

}
