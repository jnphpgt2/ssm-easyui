package org.jnan.mapper;

import java.util.List;
import java.util.Map;

import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;
import org.jnan.po.StuCustom;

public interface StuMapper {

	List<Stu> getList(Map<String, Integer> fy);
	List<Stu> getStuAcou();
	int getListCount();
	List<Grade> getGrade();
	List<Course> getCourse();
	int add(Stu stu);
	Stu getStuByName(String name);
	int addCourse(Map<String, Integer> map);
	int delete(Integer id);
	int update(Stu stu);
	int deleteCourse(Integer id);
}
