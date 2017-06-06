package org.jnan.service;

import java.util.List;

import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;
import org.jnan.po.StuCustom;

public interface StuService {

	List<Stu> getList(int page, int rows);

	int getListCount();

	List<Grade> getGrade();

	List<Course> getCourse();

	int add(Stu stu, Integer[] cid);

	int delete(Integer id);

	int update(Stu stu, Integer[] cid);

}
