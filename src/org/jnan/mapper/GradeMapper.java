package org.jnan.mapper;

import java.util.List;
import java.util.Map;

import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;

public interface GradeMapper {

	List<Stu> getList(Map<String, Integer> fy);

	int getListCount();

	int add(Grade grade);

	int update(Grade grade);

	int delete(Integer gid);

	List<Grade> getGradeTypeList();
}
