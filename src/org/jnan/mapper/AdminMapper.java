package org.jnan.mapper;

import java.util.List;
import java.util.Map;

import org.jnan.po.Admin;
import org.jnan.po.Course;
import org.jnan.po.Grade;
import org.jnan.po.Stu;
import org.jnan.po.StuCustom;

public interface AdminMapper {

	Admin checkLogin(Admin admin);
}
