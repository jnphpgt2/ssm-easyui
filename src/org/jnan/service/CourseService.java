package org.jnan.service;

import java.util.List;

import org.jnan.po.Course;
import org.jnan.po.Stu;

public interface CourseService {

	int getListCount();

	List<Stu> getList(int page, int rows);

	int add(Course course);

	int update(Course course);

	int delete(Integer cid);

}
