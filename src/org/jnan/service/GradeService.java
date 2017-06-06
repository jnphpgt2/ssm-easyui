package org.jnan.service;

import java.util.List;

import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;

public interface GradeService {

	int getListCount();

	List<Stu> getList(int page, int rows);

	int add(Grade grade);

	int update(Grade grade);

	int delete(Integer cid);

	List<Grade> getGradeTypeList();
}
