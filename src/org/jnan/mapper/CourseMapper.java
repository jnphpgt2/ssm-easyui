package org.jnan.mapper;

import java.util.List;
import java.util.Map;

import org.jnan.po.Course;
import org.jnan.po.Stu;

public interface CourseMapper {

	List<Stu> getList(Map<String, Integer> fy);

	int getListCount();

	int add(Course course);

	int update(Course course);

	int delete(Integer cid);

}
